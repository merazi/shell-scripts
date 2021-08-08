# opusify.sh - convert all MP3's to Opus. Original script by muto:
# https://muto.ca/posts/opus-obsession.html

# edited by merazi, added more bloat :P

function convert_to_opus () {
    ffmpeg -i "$1" -ab 96k "$1.opus"
}

function confirm_deletion () {
    printf "\e[92mThe converted files:\e[00m\n"
    ls *.opus
    printf "\e[91mI'm about to delete these files:\e[00m\n"
    ls *.mp3
    read -p "Should I proceed? " yn
    case $yn in
	[Yy]* ) delete_mp3_files;;
	[Nn]* ) echo "Ok, bye :P"; exit;;
    esac
}

function delete_mp3_files () {
    rm -v *.mp3
}

function rename_files() {
    rename 's/.mp3.opus/.opus/' *.mp3.opus
}

for i in *.mp3; do
    convert_to_opus "$i"
done
confirm_deletion
rename_files
