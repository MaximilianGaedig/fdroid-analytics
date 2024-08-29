mkdir -p apks/
awk '{print $2}' newest.csv | \
    xargs -n 1 -P 8 -I {} bash -c "$(cat process.sh)"
