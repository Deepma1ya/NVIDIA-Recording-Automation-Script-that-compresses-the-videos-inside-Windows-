@echo off
setlocal enabledelayedexpansion

:: ------------------ Configuration ------------------
set "ROOT_FOLDER=D:\Nvidia video rec"
set "HANDBRAKE_PATH=C:\Handbrake\HandBrakeCLI.exe"
set "SUFFIX=_compressed"
set "ICON_PATH=C:\Handbrake\miscellaneous\encoding 3.png"
:: ---------------------------------------------------

:: Detect GPU Encoder
set "ENCODER="
set "QUALITY=23"

for /f "delims=" %%E in ('"%HANDBRAKE_PATH%" --help 2^>nul') do (
    echo %%E | findstr /i "nvenc_hevc" >nul && set "ENCODER=nvenc_hevc"
    if not defined ENCODER (
        echo %%E | findstr /i "nvenc_h264" >nul && set "ENCODER=nvenc_h264"
    )
    if not defined ENCODER (
        echo %%E | findstr /i "qsv_hevc" >nul && set "ENCODER=qsv_hevc"
    )
    if not defined ENCODER (
        echo %%E | findstr /i "qsv_h264" >nul && set "ENCODER=qsv_h264"
    )
    if not defined ENCODER (
        echo %%E | findstr /i "amf" >nul && set "ENCODER=amf"
    )
)

if not defined ENCODER (
    set "ENCODER=x265"
    set "QUALITY=18"
    echo No GPU encoder found. Using CPU encoder: x265
) else (
    echo Using GPU encoder: %ENCODER%
)

echo.
echo Searching for video files in %ROOT_FOLDER% ...
echo.

:: Process video files
for /r "%ROOT_FOLDER%" %%F in (*.*) do (
    set "full=%%~fF"
    set "name=%%~nF"
    set "ext=%%~xF"
    set "base=%%~dpnF"

    :: Only handle common video extensions
    echo .avi .mpg .mpeg .mp4 .mkv .ts .webm .mov .flv .wmv | find /i "%%~xF" >nul
    if !errorlevel! == 0 (
        echo !name! | find "%SUFFIX%" >nul
        if !errorlevel! == 1 (
            set "output=!base!!SUFFIX!.mp4"
            echo Re-encoding: !full!
            
            "%HANDBRAKE_PATH%" -i "!full!" -o "!output!" ^
                -e !ENCODER! -q !QUALITY! --preset="Fast 1080p30" ^
                --rate 60 --pfr ^
                --width 1920 --height 1080 ^
                --optimize ^
                --audio 1 --aencoder copy --ab 160

            if exist "!output!" (
                echo ✓ Success: !output!
                del /f /q "!full!"
            ) else (
                echo ✗ Failed: !full!
            )
            echo.
        )
    )
)

:: Final bell and toast notification
echo ^G
powershell -NoProfile -Command "Import-Module BurntToast; New-BurntToastNotification -Text 'Compression Complete', 'All video files were encoded and deleted.' -AppLogo 'C:\Handbrake\miscellaneous\encoding 3.png' -Sound 'Default'" 2>nul

endlocal
pause
