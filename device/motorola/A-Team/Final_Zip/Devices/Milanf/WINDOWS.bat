@echo off

REM Set Variables
set "INSTALLER_VERSION=0.16"
set "APP_NAME=A-Team Custom Rom Installer - Version: %INSTALLER_VERSION%"

REM Print App Name To Terminal
title %APP_NAME%

REM Main Menu
echo: 
echo:  2019-Present A-Team Digital Solutions
echo:
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
echo -       Installer Version: %INSTALLER_VERSION%          -
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

REM Set Slot
call :ClearScreen  

fastboot set_active a  

call :ClearScreen

REM Show Active Slot
echo:
echo ========= Your Current Slot ========
echo -                                  -
echo ------------------------------------
fastboot getvar current-slot
echo ------------------------------------
echo -                                  -
echo ------------------------------------
echo ====================================
echo:
echo:
echo PRESS ENTER TO CONTINUE
set /p input=

call :ClearScreen

REM Recovery Menu
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

REM Process Recovery Choice
if "%recovery%"=="1" (
    call :ClearScreen
    set "OFRP=TRUE"
    set "RECOVERY=OrangeFox"
)

if "%recovery%"=="2" (
    call :ClearScreen
    set "PBRP=TRUE"
    set "RECOVERY=PitchBlack"
)

if "%recovery%"=="3" (
    call :ClearScreen
    set "SHRP=TRUE"
    set "RECOVERY=SkyHawk"
)

if "%recovery%"=="4" (
    call :ClearScreen
    set "TWRP=TRUE"
    set "RECOVERY=TWRP"
)

if "%recovery%"=="5" (
    call :ClearScreen
    set "ROM_RECOVERY=TRUE"
    set "RECOVERY=Rom_Built_Recovery"
)

REM Root Menu
echo:
echo =========== Root Selection ==========
echo -------------------------------------
echo 1 ^=^> KernelSU                       -
echo 2 ^=^> Magisk                         -
echo 3 ^=^> No Root                        -
echo -------------------------------------
echo Select Your Option ^& PRESS ENTER    -
echo -------------------------------------
set /p root=

REM Process Root Choice
if "%root%"=="1" (
    call :ClearScreen
    set "ROOT=KSU"
)

if "%root%"=="2" (
    call :ClearScreen
    set "ROOT=MAGISK"
)

if "%root%"=="3" (
    call :ClearScreen
    set "ROOT=NONE"
)

REM Encryption Menu
echo:
echo ======== Encryption Selection =======
echo -------------------------------------
echo 1 ^=^> Keep Encryption                -
echo 2 ^=^> Disable Encryption             -
echo -------------------------------------
echo Select Your Option ^& PRESS ENTER    -
echo -------------------------------------
set /p crypto=

REM Process Encryption choice
if "%crypto%"=="1" (
    call :ClearScreen
    echo:
    echo Recovery Selected => %RECOVERY%
    echo:
    echo:
    echo Root Option Selected => %ROOT%
    echo:
    echo:
    echo Encryption => Enabled
    echo:
    echo:
    ping 127.0.0.1 -n 7 -w 1000 > nul
)

if "%crypto%"=="2" (
    call :ClearScreen
    echo:
    echo Recovery Selected => %RECOVERY%
    echo:
    echo:
    echo Root Option Selected => %ROOT%
    echo:
    echo:
    echo Encryption => Disabled
    echo:
    echo:
    set "CRYPTO=FALSE"
    ping 127.0.0.1 -n 7 -w 1000 > nul
)

REM Flash Dtbo
echo Flashing Dtbo... && echo: && fastboot flash dtbo dtbo.img && echo: && echo:

REM Flash Vbmeta
echo Flashing Vbmeta... && echo: && fastboot flash --disable-verity --disable-verification vbmeta vbmeta.img && echo: && echo:

REM Flash Vbmeta_System
echo Flashing Vbmeta_System... && echo: && fastboot flash --disable-verity --disable-verification vbmeta_system vbmeta_system.img && echo: && echo:

REM Flash Empty Super
echo Flashing Empty Super... && echo: && fastboot wipe-super super_empty.img && echo: && echo:

REM Flash Vendor_Boot
echo Flashing Vendor_Boot... && echo: && fastboot flash vendor_boot vendor_boot.img && echo: && echo:

REM Flash Boot
echo Flashing Boot... && echo: && fastboot flash boot boot.img && echo: && echo:

REM Format Data & Metadata
echo Formatting Data ^& Metadata... && ping 127.0.0.1 -n 7 -w 1000 > nul && echo: && fastboot -w && echo: && echo:

REM Reboot Device To FastbootD
fastboot reboot fastboot && echo: && echo:

REM Flash Root / Recovery Choice
if "%ROOT%"=="KSU" (
    if "%RECOVERY%"=="OrangeFox" (
        echo Flashing KernelSU Root ^& OrangeFox Recovery...
        echo:
        fastboot flash boot KSU-OFRP.img
    ) else if "%RECOVERY%"=="PitchBlack" (
        echo Flashing KernelSU Root ^& PitchBlack Recovery...
        echo:
        fastboot flash boot KSU-PBRP.img
    ) else if "%RECOVERY%"=="SkyHawk" (
        echo Flashing KernelSU Root ^& SkyHawk Recovery...
        echo:
        fastboot flash boot KSU-SHRP.img
    ) else if "%RECOVERY%"=="TWRP" (
        echo Flashing KernelSU Root ^& TWRP Recovery...
        echo:
        fastboot flash boot KSU-TWRP.img
    ) else if "%RECOVERY%"=="Rom_Built_Recovery" (
        echo Flashing KernelSU Root ^& Rom Built Recovery...
        echo:
        fastboot flash boot KSU.img
    )
)

if "%ROOT%"=="MAGISK" (
    if "%RECOVERY%"=="OrangeFox" (
        echo Flashing Magisk Root ^& OrangeFox Recovery...
        echo:
        fastboot flash boot Magisk-OFRP.img
    ) else if "%RECOVERY%"=="PitchBlack" (
        echo Flashing Magisk Root ^& PitchBlack Recovery...
        echo:
        fastboot flash boot Magisk-PBRP.img
    ) else if "%RECOVERY%"=="SkyHawk" (
        echo Flashing Magisk Root ^& SkyHawk Recovery...
        echo:
        fastboot flash boot Magisk-SHRP.img
    ) else if "%RECOVERY%"=="TWRP" (
        echo Flashing Magisk Root ^& TWRP Recovery...
        echo:
        fastboot flash boot Magisk-TWRP.img
    ) else if "%RECOVERY%"=="Rom_Built_Recovery" (
        echo Flashing Magisk Root ^& Rom Built Recovery...
        echo:
        fastboot flash boot Magisk.img
    )   
)

if "%ROOT%"=="NONE" (
    if "%RECOVERY%"=="OrangeFox" (
        echo Flashing Unrooted Boot Image ^& OrangeFox Recovery...
        echo:
        fastboot flash boot Boot-OFRP.img
    ) else if "%RECOVERY%"=="PitchBlack" (
        echo Flashing Unrooted Boot Image ^& PitchBlack Recovery...
        echo:
        fastboot flash boot Boot-PBRP.img
    ) else if "%RECOVERY%"=="SkyHawk" (
        echo Flashing Unrooted Boot Image ^& SkyHawk Recovery...
        echo:
        fastboot flash boot Boot-SHRP.img
    ) else if "%RECOVERY%"=="TWRP" (
        echo Flashing Unrooted Boot Image ^& TWRP Recovery...
        echo:
        fastboot flash boot Boot-TWRP.img
    ) else if "%RECOVERY%"=="Rom_Built_Recovery" (
        echo Flashing Unrooted Boot Image ^& Rom Built Recovery...
        echo:
        fastboot flash boot boot.img
    )
)

REM Flash Product
echo: && echo: && echo Flashing Product... && echo: && fastboot flash product_a product.img && echo: && echo:

REM Flash System
echo Flashing System... && echo: && fastboot flash system_a system.img && echo: && echo:

REM Flash System_Ext
echo Flashing System_Ext... && echo: && fastboot flash system_ext_a system_ext.img && echo: && echo:

REM Flash Vendor Encryption Choice
if "%CRYPTO%"=="FALSE" (
    echo Flashing Encryption Disabled Vendor...
    echo:
    fastboot flash vendor_a NoEncrypt-vendor.img
    echo:
    echo:
) else (
    echo Flashing Encryption Enabled Vendor...
    echo:
    fastboot flash vendor_a vendor.img
    echo:
    echo:
)

REM Reboot Device
fastboot reboot && echo: && echo: && ping 127.0.0.1 -n 3 -w 1000 > nul && echo: && echo:

echo === THANK YOU ===== PLEASE ENJOY ===
echo ------------------------------------
echo ======= PRESS ENTER TO EXIT ========
set /p input=

:ClearScreen
REM This function clears the screen
echo.
for /L %%i in (1,1,50) do echo.
goto :eof
