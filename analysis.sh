#!/bin/bash

# Create the analysis directory
mkdir -p analysis

# Function to analyze a single APK
analyze_apk() {
    apk="$1"
    apk_name=$(basename "$apk" .apk)
    analysis_dir="analysis/$apk_name"

    # Skip if already analyzed
    if [ -d "$analysis_dir" ]; then
        echo "Skipping $apk_name (already analyzed)"
        return
    fi

    mkdir -p $analysis_dir

    # Extract libraries information
    echo "[libs] $apk_name"
    unzip -l "$apk" 2>/dev/null | awk '{print $4}'  > "$analysis_dir/files.txt"

    if [ $? -eq 0 ]; then
        echo "<libs> $apk_name"
    else
        rm -rf $analysis_dir
    fi

}

export -f analyze_apk

# Find all APK files and process them concurrently using GNU Parallel
find apks/ -name "*.apk" | nix run nixpkgs#parallel -- -j 8 analyze_apk {}
