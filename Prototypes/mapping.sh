#!/data/data/com.termux/files/usr/bin/bash

# Paths
zroot="/data/data/com.termux/files/home/labmusic/Zeromusic"
zfiles="$zroot/zfiles"
zmap="$zroot/zmap"
index_file="$zmap/index.txt"

# Prep
mkdir -p "$zmap"
rm -f "$zmap/"*     # Clear old symlinks
: > "$index_file"   # Clear index file

echo " Mapping audio files from: $zfiles"
count=1

# Loop through audio files
find "$zfiles" -type f -iname "*.mp3" -o -iname "*.m4a" | sort | while read -r file; do
    name=$(basename "$file")
    link="$zmap/$count"
    ln -s "$file" "$link"
    echo "$count -> $name" >> "$index_file"
    echo "[$count] $name"
    count=$((count + 1))
done

echo " Done mapping $((count - 1)) files."
