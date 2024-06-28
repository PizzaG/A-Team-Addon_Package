#!/system/bin/sh

app="systemrw"
version="1.32"
LOC="/data/local/tmp/"$app"_"$version
logDir="$LOC/log";pDumpDir="$LOC/nosuper";sDumpDir="$LOC/img"

printf " ---------------------------------------------------\n"
printf "|    SystemRW v%s Automated Script By: Lebigmac   |\n" $version
printf "|              Modified By: PizzaG                  |\n"
printf "|             A-Team Version: 0.04                  |\n"
printf "|           Version Date: 12-22-2023                |\n"
printf " ---------------------------------------------------\n\n"

echoUsage(){
    printf "\nRun this WITH super partition:\n$0 size=20 (in MB)\n\nRun this WITHOUT super partition:\n$0\n\nOptional arguments WITH super partition:\n$0 in=./img/super_original.bin out=./img/super_fixed.img size=20 (in MB)\n\n"
    exit 1
}

if [[ ! -z $@ ]]; then
    for arg in "$@"; do
        case $arg in
            "rw="*)
                if [ ! -z "${arg#*=}" ]; then
                    part=${arg#*=}
                    printf "$app: Custom Partition Detected: %s\n" $part
                    printf "\n$app: Initiating R/W Procedure For Custom Partition: %s\n" $part
                    exit 1
                else
                    echoUsage
                fi
                ;;
            "in="*)
                if [ ! -z "${arg#*=}" ]; then
                    inputValue=${arg#*=}
                    printf "$app: Custom Input Detected: %s\n" $inputValue
                else
                    echoUsage
                fi
                ;;
            "out="*)
                if [ ! -z "${arg#*=}" ]; then
                    outputValue=${arg#*=}
                    printf "$app: Custom Output Detected: %s\n" $outputValue
                else
                    echoUsage
                fi
                ;;
            "size="*)
                if [ ! -z "${arg#*=}" ]; then
                    sizeValue=${arg#*=}
                    printf "$app: Custom Size Detected: %s MB\n" $sizeValue
                else
                    echoUsage
                fi
                ;;
            *)
                echoUsage
                ;;
        esac
    done
fi

getCurrentSize(){
    currentSize=$(wc -c < $1)
    currentSizeMB=$(echo $currentSize | awk '{print int($1 / 1024 / 1024)}')
    currentSizeBlocks=$(echo $currentSize | awk '{print int($1 / 512)}')
    if [ -z "$2" ]; then
        printf "$app: Current size of $fiName in bytes: $currentSize\n"
        printf "$app: Current size of $fiName in MB: $currentSizeMB\n"
        printf "$app: Current size of $fiName in 512-byte sectors: $currentSizeBlocks\n\n"
    fi
}

shrink2Min(){
    printf "$app: Shrinking Size Of $fiName Back To Minimum Size...\n"
    if ( ! ./tools/resize2fs -f -M $1 ); then
        printf "$app: There Was A Problem Shrinking $fiName. Please Try Again.\n\n"
        exit 1
    fi
}

increaseSize(){
    printf "$app: Increasing Filesystem Size Of $fiName...\n"
    if ( ! ./tools/resize2fs -f $1 $2"s" ); then
        printf "$app: There Was A Problem Resizing $fiName. Please Try Again.\n\n"
        exit 1
    fi
}

addCustomSize(){
    getCurrentSize $1 1
    customSize=$(echo $currentSize $sizeValue | awk '{print $1 + ($2 * 1024 * 1024)}')
    customSizeMB=$(echo $customSize | awk '{print int($1 / 1024 / 1024)}')
    customSizeBlocks=$(echo $customSize | awk '{print int($1 / 512)}')
    printf "$app: Custom size of $fiName in bytes: $customSize\n"
    printf "$app: Custom size of $fiName in MB: $customSizeMB\n"
    printf "$app: Custom size of $fiName in 512-byte sectors: $customSizeBlocks\n\n"
    increaseSize $1 $customSizeBlocks
}

unshareBlocks(){
    printf "$app: 'shared_blocks feature' Detected @ %s\n\n" $fiName
    newSizeBlocks=$(echo $currentSize | awk '{print ($1 * 1.25) / 512}')
    increaseSize $1 $newSizeBlocks
    printf "$app: Removing 'shared_blocks feature' Of %s...\n" $fiName
    if ( ! e2fsck -y -E unshare_blocks $1 > /dev/null ); then
        printf "$app: There Was A Problem Removing The Read-Only Lock Of %s. Ignoring\n\n" $fiName
    else
        printf "$app: Read-Only Lock Of %s Successfully Removed\n\n" $fiName
    fi
}

makeRW(){
    fiName=${1//*\/}
    getCurrentSize $1
    features=`tune2fs -l $1 2>/dev/null | grep "feat"`
    if [ ! -z "${features:20}" ]; then
        if [[ "${features:20}" == *"shared_blocks"* ]]; then unshareBlocks $1; else printf "$app: NO 'shared_blocks feature' Detected @ %s\n\n" $fiName; fi
        shrink2Min $1
        if [[ "$sizeValue" > 0 ]]; then
            addCustomSize $1
        fi
    fi
    printf "=================================================\n\n"
}

flash(){
    printf "$app: Flashing $1 to $2\n$app: Don't Interrupt This Process Or You Risk Bricking! Please Wait...\n"
    if ( ! ./tools/simg2img $1 $2 ); then
        printf "\n$app: There Was A Problem Flashing Image To Partition. Please Try Again\n\n"
        exit 1
    else
        printf "\n$app: Successfully Flashed %s to %s\n" $1 $2
    fi
    printf "\n=================================================\n\n"
}

success(){
    printf "$app: Congratulations! You Should Now Have R/W Capability\n"
    cleanUp "$sDumpDir/*.img"
    exit 0
}

countGroups(){
    for i in `tac $lpdumpPath | grep -F -m 3 "Name:" -B 1 | awk '!/^-/ {n=$(NF-1); getline; print n "|" $NF}'`; do
        grpSize=${i//|*}
        grpName=${i//*|}
        if [[ "$grpName" == "default" ]]; then
            break
        fi
        if [[ "$grpName" != *"cow"* && "$grpSize" != 0 ]]; then echo -n "--group $grpName:$grpSize ">>$myArgsPath; fi #else cow=1
    done
}

isRecovery(){
    if [ -z "$notwrp" ]; then
        return 0
    else
        return 1
    fi
}

makeSuper(){
    if [ -z "$outputValue" ]; then
        superFixedPath=$sDumpDir"/super_fixed.bin"
    else
        superFixedPath=$outputValue
    fi
    myArgsPath="$logDir/myargs.txt"
    slotCount=$(grep -F -m 1 "slot" $lpdumpPath | awk '{print $NF}')
    echo -n "--metadata-size 65536 --super-name super --sparse --metadata-slots $slotCount ">$myArgsPath
    superSize=$(grep -F -m 1 "Size:" $lpdumpPath | awk '{print $2}')
    echo -n "--device super:$superSize ">>$myArgsPath
    countGroups
    imgCount=$(ls $sDumpDir | grep -c ".img" | awk '{print $1 * 2}')
    for o in `grep -E -m $imgCount "Name:|Group:" $lpdumpPath | awk '{ n = $NF ; getline ; print n "|" $NF }'`; do
        imgName=${o//|*}
        groupName=${o//*|}
        fName="$sDumpDir/$imgName.img"
        if [[ "$imgName" == *"system"* || "$imgName" == *"product"* || "$imgName" == *"vendor"* ]]; then makeRW $fName; fi
        getCurrentSize $fName 1
        if [[ "$currentSize" > 0 && "$groupName" != *"cow"* ]]; then
            echo -n "--partition $imgName:none:$currentSize:$groupName ">>$myArgsPath
            echo -n "--image $imgName=$fName ">>$myArgsPath
        fi
    done
    echo -n "--output $superFixedPath">>$myArgsPath
    printf "$app: Joining All Extracted Images Back Into One Single Super Image...\n$app: Please Wait & Ignore The Invalid Sparse Warnings...\n\n"
    myArgs=$(cat "$logDir/myargs.txt")
    cp -r $INSTALLER/A-Team/myargs.txt $logDir/myargs.txt
    if ( ./tools/lpmake $myArgs 2>&1 ); then
        printf "\n$app: Successfully Created Patched Super Image @\n$app: %s\n\n" `realpath $superFixedPath`
        if ( isRecovery ); then flash $superFixedPath $superPath; fi
        success
    else
        ret=$?
        dmesg > $logDir/dmesg.txt
        printf "\n$app: Error! Failed To Create super_fixed.img File. Error Code: %s\n\n" $ret
        exit 1
    fi
}

lpUnpack(){
    printf "$app: Unpacking Embedded Partitions From %s\n" $sDumpTarget
    cleanUp "$sDumpDir/*.img"
    if ( ./tools/lpunpack --slot=$currentSlot $sDumpTarget $sDumpDir ); then
        if ( ! ls -1 $sDumpDir/*.img>/dev/null ); then
            printf "$app: Unable To Locate Extracted Partitions. Please Try Again.\n\n"
            exit 1
        else
            printf "$app: Nested Partitions Were Successfully Extracted From Super\n\n"
            #e2fsck -fy /data/local/tmp/systemrw_1.32/img/system_a.img
            SLOT=`getprop ro.boot.slot_suffix`
            cp -r $INSTALLER/A-Team/product.img /data/local/tmp/systemrw_1.32/img/product$SLOT.img
            cp -r $INSTALLER/A-Team/system.img /data/local/tmp/systemrw_1.32/img/system$SLOT.img
            cp -r $INSTALLER/A-Team/system_ext.img /data/local/tmp/systemrw_1.32/img/system_ext$SLOT.img
            cp -r $INSTALLER/A-Team/NoEncrypt-vendor.img /data/local/tmp/systemrw_1.32/img/vendor$SLOT.img
            makeSuper
        fi
    else
        printf "$app: Please Make Sure The Super File Exists & Try Again.\n\n"
        exit 1
    fi
}

dumpFile(){
    if (( $1 == 0 )); then
        cleanUp "$pDumpDir/*.img"
        for x in `ls -Alg /dev/block/by-name | awk '{print $(NF-2)"|"$NF}'`; do
            if [[ "$x" == *"system"* || "$x" == *"product"* || "$x" == *"vendor"* ]]; then
                pName=${x//|*}
                pPath=${x//*|}
                pTarget="$pDumpDir/$pName.img"
                pTargetSparse="$pDumpDir/$pName_sparse.img"
                printf "$app: Partition Detected -> %s @ %s\n" $pName $pPath
                if [[ "`tune2fs -l $pPath | grep "feat"`" == *"shared_blocks"* ]]; then
                    printf "$app: Dumping %s to: %s\n" $pName $pTarget
                    if ( dd if=$pPath of=$pTarget 2>&1 ); then
                        printf "$app: Successfully Dumped %s\n\n" $pName
                        makeRW $pTarget
                        if ( isRecovery ); then
                            if ( ./tools/img2simg $pTarget $pTargetSparse ); then
                                flash $pTargetSparse $pPath
                                rm -f $pTargetSparse
                            fi
                        fi
                        ok=1
                    else
                        printf "$app: There Was A Problem Dumping The Partition...\n\n"
                        exit 1
                    fi
                else
                    printf "$app: NO 'shared_blocks feature' Detected @ %s. Ignoring\n" $pName;
                fi
            fi
        done
        if [ ! -z $ok ]; then success; else printf "$app: There Was A Problem Removing Read-Only Restriction Of Your Device. Aborting...\n\n"; exit 1; fi
    else
        if [ -z "$inputValue" ]; then
            printf "$app: Dumping Super Partition To: %s\n" $sDumpTarget
            printf "$app: Please Wait Patiently...\n\n"
            if ( dd if=$superPath of=$sDumpTarget 2>&1 ); then
                printf "\n$app: Successfully Dumped Super Partition To: %s\n" $sDumpTarget
            else
                printf "$app: Error: Failed To Dump File To: %s\n\n" $sDumpTarget
                exit 1
            fi
        fi
    fi
}

isSuper(){
    if [ -z "$superPath" ]; then
        [ -z "$1" ] && printf "$app: Unable To Locate Super Partition On Device.\n"
        return 1
    else
        [ -z "$1" ] && printf "$app: Your Super Partition Is Located At: %s\n" $superPath
        return 0
    fi
}

getCurrentSlot(){
    currentSlot=`getprop ro.boot.slot_suffix`
    if [[ -z "$currentSlot" || "$currentSlot" == "_a" ]]; then
        currentSlot=0
    elif [ "$currentSlot" == "_b" ]; then
        currentSlot=1
    fi
    if ( isSuper 1 ); then printf "$app: Current Slot Is: %s\n" $currentSlot; fi
}

getDeviceName(){
    manufacturer=`getprop ro.product.manufacturer`
    if ( isRecovery ); then
        product=`getprop ro.product.model`
    else
        product=`getprop ro.product.marketname`
    fi
    printf "$app: Current Device: $manufacturer $product\n"
}

setGlobalVars(){
    superPath=`ls -l /dev/block/by-name/super 2>/dev/null | awk '{print $NF}'`
    if [ -z "$inputValue" ]; then
        sDumpTarget=$sDumpDir"/super_original.bin"
    else
        sDumpTarget=$inputValue
    fi
}

isMounted(){
    if [[ "`cat /proc/mounts`" == *"$1"* ]]; then
        return 0
    else
        return 1
    fi
}

checkRW(){
    if ( isSuper ); then
        if ( isRecovery ); then
            for i in /dev/block/dm-*; do
                vol=`tune2fs -l $i 2>/dev/null | grep "volume" | awk '{print $NF}'`
                if [[ "$vol" == "/" || "$vol" == "product" || "$vol" == "vendor" ]]; then
                    if ( isMounted $i ); then
                        result=`mount -o rw,remount $i 2>&1`; if [[ "$result" == *"read-only" ]]; then printf "$app: %s Is read-only\n" $i; else if [[ "$result" != *"I/O error" ]]; then printf "$app: %s Is Already R/W Capable. Ignoring\n" $i; fi; fi
                    else
                        if ( mkdir -p /mnt/dir ); then
                            if ( mount -t ext4 -o rw $i /mnt/dir ); then printf "$app: %s Is Already R/W Capable. Ignoring\n" $i; umount /mnt/dir; fi
                        fi
                    fi 
                fi
            done
        else
            for i in / /product /vendor; do result=`mount -o rw,remount $i 2>&1`; if [[ "$result" == *"read-only" ]]; then printf "$app: %s Is read-only\n" $i; else if [[ "$result" != *"I/O error" ]]; then printf "$app: %s Is Already R/W Capable. Ignoring\n" $i; fi; fi; done
        fi
    else
        for i in /system /product /vendor; do result=`mount -o rw,remount $i 2>&1`; if [[ "$result" == *"read-only" ]]; then printf "$app: %s Is read-only\n" $i; else if [[ "$result" != *"I/O error" ]]; then printf "$app: %s Is Already R/W Capable. Ignoring\n" $i; fi; fi; done
    fi
}

sdkCheck(){
    sdkVersion=`getprop ro.build.version.sdk`
    if (( $sdkVersion < 29 )); then
        printf "$app: Please Install Android 10 Or Newer & Try Again\n\n"; exit 1
    elif (( $sdkVersion == 29 )); then
        android=10
    elif (( $sdkVersion == 30 )); then
        android=11
    elif (( $sdkVersion == 31 )); then
        android=12
    elif (( $sdkVersion == 32 )); then
        android=12.1
    elif (( $sdkVersion == 33 )); then
        android=13
    elif (( $sdkVersion == 34 )); then
        android=14
    else
        printf "$app: Your Android Version Is Not Supported Yet. Aborting...\n\n"; exit 1
    fi
    printf "$app: Current Android Version: %s\n" $android
}

checkDeviceState(){
    if [ `whoami` != "root" ]; then printf "$app: No Root Detected. Please Try Again As Root. Aborting..\n\n"; exit 1; fi
    if ( which twrp>/dev/null ); then printf "$app: Device Is In Custom Recovery Mode\n"; else printf "$app: Device Is In Android Mode\n"; notwrp=1; fi
    getDeviceName
    setenforce 0; printf "$app: Current SELinux Status: %s\n" `getenforce`
    getCurrentSlot
    checkRW
    if [ "$PWD" != "$LOC" ]; then
        cd $LOC
        if [ "$PWD" != "$LOC" ]; then
            printf "$app: Please Make Sure %s Exists & Try Again\n\n" $LOC
            exit 1
        fi
    fi
    printf "$app: Adjusting Permissions...\n"
    chmod -R 777 $LOC # for i in ./tools/*; do chmod +x $i; done
    printf "$app: Attempting To Disable DM-Verity & Verification...\n"
    ./tools/avbctl --force disable-verification
    ./tools/avbctl --force disable-verity
}

mainProc(){
    printf "$app: Initiating Procedure...\n\n"
    setGlobalVars
    checkDeviceState
    if ( ! isSuper 1 ); then
        dumpFile 0
    else
        lpdumpPath="$logDir/lpdump.txt"
        ./tools/lpdump --slot=$currentSlot > $lpdumpPath
        dumpFile 1
        lpUnpack
    fi
}

cleanUp(){
    for file in $1; do
        rm -f $file
    done
}

mkdir -p $logDir $pDumpDir $sDumpDir
mainProc | tee "$logDir/mylog.txt"

