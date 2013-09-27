#!/bin/bash
clear
echo "jRecoder"
echo "Version 1.0.1"
echo "==========="
echo -n -e "\033]0;jRecoder\007"
echo "This script will change the MKV container to MP4."
echo ""
confirm () {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [Y/n]} " response
    case $response in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}
doRecodeStuff () {
	# MKV files
	for i in *.mkv
	do
		new_name=$(echo "$i" | sed 's/.\{4\}$//')
		ffmpeg -i "$i" -vcodec copy -acodec copy "$new_name.mp4"
		sleep 10
	done
	printf "\a"
	echo ""
	echo "Done Encoding!"
}

confirm "Are you sure you want to continue? [y/N]" && doRecodeStuff
