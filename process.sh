file_name=$(basename {})
base_name=${file_name%.apk}

if [ ! -f "apks/$file_name" ] && [ ! -d "analysis/$base_name" ]; then
    echo "Downloading $file_name..."
    curl -o "apks/$file_name" "https://f-droid.org/repo/{}" -L
else
    echo "Skipping $file_name (already exists or analysis present)"
fi

