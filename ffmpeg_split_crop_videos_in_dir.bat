for %%f in (*.mp4) do (
    echo %%~nf
    ffmpeg -i "%%~nf.mp4" -filter:v "crop=1920:1440:0:0" "%%~nf-1.mp4"
    ffmpeg -i "%%~nf.mp4" -filter:v "crop=1920:1440:0:1440" "%%~nf-2.mp4"
)

pause
