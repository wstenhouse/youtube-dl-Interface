#!/bin/sh
#
#Created by Will Stenhouse

#Set Colour
textreset=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
black=$(tput setaf 0)
bold=$(tput bold)

clear
echo "${white}>${textreset} This script requires: ${green}Youtube-dl"
echo "${white}>${textreset} Created by ${green}Will Stenhouse"
echo ""
echo "${white}>${textreset}"
echo "${white}>${textreset} Youtube Downloader ${green}v3.0 ${textreset}"
echo "${white}>${textreset}"
echo ""
echo "${white}>${textreset} ${bold}Type Youtube Username${textreset}"

read user


echo
echo "${white}>${textreset} ${bold}Type Start Number${textreset} [1 = 1st Video, 30 = 30th Video etc...]"

read startvid

echo
echo "${white}>${textreset} ${bold}Type Max Downloads${textreset} [Leave blank to download all]"

read max
case "$max" in

#Default option.
* )
echo
echo "${white}>${textreset} Username  [${green}${user}${textreset}]"
echo "${white}>${textreset} Start     [${green}${startvid}${textreset}]"
echo "${white}>${textreset} Downloads [${green}${max}${textreset}]"
;;

esac

tput sgr0

echo
echo "${white}>${textreset} Downloading"
echo
mkdir -p $user
cd $user
youtube-dl -f 140 --max-downloads $max --playlist-start $startvid "http://www.youtube.com/user/$user"

echo
echo "${white}>${textreset} [${green}Download Complete${textreset}]"
echo
echo "${white}>${textreset} [${green}Checking Data${textreset}]"
echo

oIFS=$IFS
IFS=$'\n'

array=$(find . -iregex '.*\(m4a\)' -print)
for file in ${array[@]}; do
PART_ONE=`echo $file | sed "s/^\.\/\([^-]*\) - .*$/\1/"`
PART_TWO=`echo $file | sed "s/^[^_]* - \(.*\)-.*$/\1/"`
echo "[$PART_ONE] [$PART_TWO]"
done

IFS=$oIFS

echo
echo "${white}>${textreset} Press enter to add data."
read add

#Add Data
oIFS=$IFS
IFS=$'\n'

mkdir "Metadata-Added"

array=$(find . -maxdepth 1 -iregex '.*\(m4a\)' -print)
for file in ${array[@]}; do
ARTIST=`echo $file | sed "s/^\.\/\([^-]*\) - .*$/\1/"`
TRACK=`echo $file | sed "s/^[^_]* - \(.*\)-.*$/\1/"`
echo "[$ARTIST] [$TRACK]"
ffmpeg -i "$file" -acodec copy -metadata title="$TRACK" -metadata artist="$ARTIST" -metadata album_artist="$ARTIST" -metadata album="$TRACK" -metadata encoder="" "Metadata-Added/$file"
done

IFS=$oIFS

clear
echo
echo "${white}>${textreset} [${green}Data Added${textreset}]"
echo
echo "${white}>${textreset} [${green}Process Complete${textreset}]"
echo
open .

exit 0
