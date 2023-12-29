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
echo -        Installer Version: 0.14         - 
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
  echo Encryption ^=^> Enabled
  echo: 
  echo: 
  ping 127.0.0.1 -n 7 -w 1000 > nul
) ELSE (
  IF  %crypto% == 2  (
    cls
    echo: 
    echo Encryption ^=^> Disabled
    echo: 
    echo: 
    set CRYPTO=FALSE
    ping 127.0.0.1 -n 7 -w 1000 > nul
  )
)

echo Flashing Boot...
echo: 
fastboot flash boot Magisk.img
echo: 
echo:

echo Flashing Dtbo...
echo: 
fastboot flash dtbo dtbo.img
echo: 
echo: 

echo Flashing Recovery...
echo: 
fastboot flash recovery recovery.img
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

echo Formatting Data And Metadata...
ping 127.0.0.1 -n 7 -w 1000 > nul
echo: 
fastboot -w
echo: 
echo:

fastboot reboot fastboot
echo: 
echo:

echo Deleting Logical Super Partitions...
echo: 
fastboot delete-logical-partition product_a
fastboot delete-logical-partition system_a
fastboot delete-logical-partition vendor_a
fastboot delete-logical-partition product_b
fastboot delete-logical-partition system_b
fastboot delete-logical-partition vendor_b
echo: 
echo:

echo Creating New Logical Super Partitions...
echo: 
fastboot create-logical-partition product_a 2500314624
fastboot create-logical-partition system_a 2500314624
fastboot create-logical-partition vendor_a 975491072
echo: 
echo:

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

IF  %CRYPTO% == FALSE  (
  echo Flashing Encryption Patched Vendor...
  echo: 
  fastboot flash vendor_a NoEncrypt-vendor.img 
  echo: 
  echo:
) ELSE (
    echo Flashing Encryption UnPatched Vendor...
    echo: 
	fastboot flash vendor_a vendor.img
    echo: 
    echo:
  )	
)

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
