@echo off

echo:
echo: 2019-Present A-Team Digital Solutions

echo ==========================================
echo ------------------------------------------
echo -                                        -  
echo -                A-Team                  -  
echo -           Digital Solutions            -  
echo -                                        -  
echo -          PROUDLY PRESENTS....          -  
echo -                                        - 
echo ------------------------------------------
echo ========== A-Team Rom Flasher ============
echo ------------------------------------------
echo -                                        - 
echo -           Built By: PizzaG             -  
echo -        Installer Version: 0.15         - 
echo -                                        -  
echo ------------------------------------------
echo -                                        -  
echo * Put Device In Fastboot/Bootloader Mode *
echo -                                        -  
echo ------------------------------------------
echo ==========================================
echo:
echo:
echo PRESS ENTER TO CONTINUE
set /p input=

cls

fastboot set_active a

cls

echo:
echo ========= Your Current Slot ========
echo:
echo:
echo ------------------------------------
fastboot getvar current-slot
echo ------------------------------------
echo:
echo:
echo PRESS ENTER TO CONTINUE
set /p input=

cls

echo:
echo ========= Recovery Selection ========
echo -------------------------------------
echo 1 ^=^> OrangeFox                      -
echo 2 ^=^> PicthBlack                     -
echo 3 ^=^> SkyHawk                        -
echo 4 ^=^> TWRP                           -   
echo 5 ^=^> Rom Built Recovery             -                   
echo -------------------------------------
echo Select Your Option ^& PRESS ENTER    -
echo -------------------------------------
set /p recovery=

IF  %recovery% == 1  (
  cls
  set OFRP=TRUE
  set RECOVERY=OrangeFox
)

IF  %recovery% == 2  (
  cls
  set PBRP=TRUE
  set RECOVERY=PitchBlack
)

IF  %recovery% == 3  (
  cls
  set SHRP=TRUE
  set RECOVERY=SkyHawk
)

IF  %recovery% == 4  (
  cls
  set TWRP=TRUE
  set RECOVERY=TWRP
)

IF  %recovery% == 5  (
  cls
  set ROM_RECOVERY=TRUE
  set RECOVERY=Rom_Built_Recovery
)

echo:
echo =========== Root Selection ==========
echo -------------------------------------
echo 1 ^=^> KernelSU                      -
echo 2 ^=^> Magisk                     -
echo 3 ^=^> No Root                        -
echo -------------------------------------
echo Select Your Option ^& PRESS ENTER    -
echo -------------------------------------
set /p root=

IF  %root% == 1  (
  cls
  set ROOT=KSU
)

IF  %root% == 2  (
  cls
  set ROOT=MAGISK
)

IF  %root% == 3  (
  cls
  set ROOT=NONE
)

echo:
echo ======== Encryption Selection =======
echo -------------------------------------
echo 1 ^=^> Keep Encryption                -
echo 2 ^=^> Disable Encryption             -
echo -------------------------------------
echo Select Your Option ^& PRESS ENTER    -
echo -------------------------------------
set /p crypto=

IF  %crypto% == 1  (
  cls
  echo: 
  echo Recovery Selected ^=^> %RECOVERY%
  echo: 
  echo: 
  echo Encryption ^=^> Enabled
  echo: 
  echo: 
  ping 127.0.0.1 -n 7 -w 1000 > nul
) ELSE (
  IF  %crypto% == 2  (
    cls
    echo: 
    echo Recovery Selected ^=^> %RECOVERY%
    echo: 
    echo: 
    echo Encryption ^=^> Disabled
    echo: 
    echo: 
    set CRYPTO=FALSE
    ping 127.0.0.1 -n 7 -w 1000 > nul
  )
)

IF  %OFRP% == TRUE  (
  echo Flashing OrangeFox Recovery...
  echo: 
  fastboot flash recovery OFRP.img
  echo: 
  echo: 
)

IF  %PBRP% == TRUE  (
  echo Flashing PitchBlack Recovery...
  echo: 
  fastboot flash recovery PBRP.img
  echo: 
  echo: 
)

IF  %SHRP% == TRUE  (
  echo Flashing SkyHawk Recovery...
  echo: 
  fastboot flash recovery SHRP.img
  echo: 
  echo: 
)

IF  %TWRP% == TRUE  (
  echo Flashing TWRP Recovery...
  echo: 
  fastboot flash recovery TWRP.img
  echo: 
  echo: 
)

IF  %ROM_RECOVERY% == TRUE  (
  echo Flashing Rom Built Recovery...
  echo: 
  fastboot flash recovery recovery.img
  echo: 
  echo: 
)

echo Flashing Dtbo...
echo: 
fastboot flash dtbo dtbo.img
echo: 
echo: 

echo Flashing Vbmeta...
echo: 
fastboot flash --disable-verity --disable-verification vbmeta vbmeta.img
echo: 
echo: 

echo Flashing Vbmeta_System...
echo: 
fastboot flash --disable-verity --disable-verification vbmeta_system vbmeta_system.img
echo: 
echo: 

echo Flashing Empty Super...
echo: 
fastboot wipe-super super_empty.img
echo: 
echo: 

echo Flashing Vendor_Boot...
echo: 
fastboot flash vendor_boot vendor_boot.img
echo: 
echo: 

echo Flashing Boot...
echo: 
fastboot flash boot boot.img
echo: 
echo: 

echo Formatting Data And Metadata...
ping 127.0.0.1 -n 7 -w 1000 > nul
echo: 
fastboot -w
echo: 
echo:

fastboot reboot fastboot
echo: 
echo:

IF  %ROOT% == KSU  (
  echo Flashing KernelSU Root...
  echo: 
  fastboot flash boot KSU.img
  echo: 
  echo: 
)

IF  %ROOT% == MAGISK  (
  echo Flashing Magisk Root...
  echo: 
  fastboot flash boot Magisk.img
  echo: 
  echo: 
)

IF  %ROOT% == NONE  (
  echo Not Rooting Device...
  echo: 
  fastboot flash boot boot.img
  echo: 
  echo: 
)

echo Flashing Product...
echo: 
fastboot flash product_a product.img
echo: 
echo: 

echo Flashing System...
echo: 
fastboot flash system_a system.img
echo: 
echo: 

echo Flashing System_Ext...
echo: 
fastboot flash system_ext_a system_ext.img
echo: 
echo: 

IF  %CRYPTO% == FALSE  (
  echo Flashing Encryption Disabled Vendor...
  echo: 
  fastboot flash vendor_a NoEncrypt-vendor.img 
  echo: 
  echo:
) ELSE (
    echo Flashing Encryption Enabled Vendor...
    echo: 
	fastboot flash vendor_a vendor.img
    echo: 
    echo:
  )	
)

echo Flashing Vendor_Dlkm...
echo: 
fastboot flash vendor_dlkm_a vendor_dlkm.img
echo: 
echo: 

fastboot reboot
echo: 
echo: 

ping 127.0.0.1 -n 3 -w 1000 > nul

echo: 
echo:
echo === THANK YOU ===== PLEASE ENJOY ===
echo ------------------------------------
echo ======= PRESS ENTER TO EXIT ========
set /p input=
