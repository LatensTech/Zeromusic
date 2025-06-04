if command -v mpv >/dev/null 2>&1; then
    mpv --no-video ~/labmusic/drake.mp3 >/dev/null 2>&1 &
else
    echo "[!] mpv not found. Install it with: pkg install mpv"
fi
