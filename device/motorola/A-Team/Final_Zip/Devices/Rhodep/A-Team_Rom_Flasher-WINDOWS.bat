@echo off

echo:
echo: 2019-Present A-Team Digital Solutions
echo:

%~d0
cd %~dp0\A-Team

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
echo -        Installer Version: 0.10         - 
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

echo ========= Recovery Selection ========
echo -------------------------------------
echo 1 ^=^> OrangeFox                    -
echo 2 ^=^> TWRP                         -
echo -------------------------------------
echo Select Your Option ^& PRESS ENTER   -
echo -------------------------------------
set /p recovery=

IF  %recovery% == 1  (
  cls
  echo Recovery Selected ^=^> OrangeFox
  ping 127.0.0.1 -n 7 -w 1000 > nul
  echo:
  echo:
  echo Flashing Recovery...
  ping 127.0.0.1 -n 3 -w 1000 > nul
  echo:
  echo:
  fastboot flash boot OFRP.img

  ) ELSE (
    IF  %recovery% == 2  (
      cls
      echo Recovery Selected ^=^> TWRP
      ping 127.0.0.1 -n 7 -w 1000 > nul
      echo: 
      echo: 
      echo Flashing Recovery...
      ping 127.0.0.1 -n 3 -w 1000 > nul
      echo: 
      echo: 
      fastboot flash boot TWRP.img
    )
  )
)

ping 127.0.0.1 -n 7 -w 1000 > nul

cls

echo ======== Encryption Selection =======
echo -------------------------------------
echo 1 ^=^> Keep Encryption              -
echo 2 ^=^> Disable Encryption           -
echo -------------------------------------
echo Select Your Option ^& PRESS ENTER   -
echo -------------------------------------
set /p encryption=

IF  %encryption% == 1  (
  cls
  echo Encryption ^=^> Enabled
  ping 127.0.0.1 -n 7 -w 1000 > nul
  echo: 
  echo:
  echo Flashing Rom...
  ping 127.0.0.1 -n 3 -w 1000 > nul
  echo: 
  echo: 
  fastboot flash dtbo dtbo.img
  echo: 
  echo: 
  fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
  echo: 
  echo: 
  fastboot --disable-verity --disable-verification flash vbmeta_system vbmeta_system.img
  echo: 
  echo: 
  fastboot flash vendor_boot vendor_boot.img
  echo: 
  echo: 
  fastboot flash super super.img

  ping 127.0.0.1 -n 7 -w 1000 > nul

  cls

  echo Formatting Data And Metadata...
  ping 127.0.0.1 -n 7 -w 1000 > nul
  echo: 
  echo: 
  fastboot -w

  ping 127.0.0.1 -n 7 -w 1000 > nul

  cls

) ELSE (
  IF  %encryption% == 2  (
    cls
    echo Encryption ^=^> Disabled
    ping 127.0.0.1 -n 7 -w 1000 > nul
    echo: 
    echo:
    echo Flashing Rom...
    ping 127.0.0.1 -n 3 -w 1000 > nul
    echo: 
    echo: 
    fastboot flash dtbo dtbo.img
    echo: 
    echo: 
    fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
    echo: 
    echo: 
    fastboot --disable-verity --disable-verification flash vbmeta_system vbmeta_system.img
    echo: 
    echo: 
    fastboot flash vendor_boot vendor_boot.img
    echo: 
    echo: 
    fastboot flash super super.img

    ping 127.0.0.1 -n 7 -w 1000 > nul

    cls

    echo Formatting Data And Metadata...
    ping 127.0.0.1 -n 7 -w 1000 > nul
    echo: 
    echo: 
    fastboot -w

    ping 127.0.0.1 -n 7 -w 1000 > nul

    cls

    fastboot reboot fastboot

    ping 127.0.0.1 -n 7 -w 1000 > nul

    cls

    echo Flashing Un-Encrypted Patched Vendor...
    echo: 
    echo:
    fastboot flash vendor_a NoEncrypt-vendor.img

    ping 127.0.0.1 -n 7 -w 1000 > nul

    cls
  )
)
 
fastboot reboot

ping 127.0.0.1 -n 30 -w 1000 > nul
 
cls

echo === THANK YOU ===== PLEASE ENJOY ===
echo ------------------------------------
echo ======= PRESS ENTER TO EXIT ========
set /p input=
