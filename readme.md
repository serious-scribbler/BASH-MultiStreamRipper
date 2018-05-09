# BASH-MultiStreamRipper README
## Description

multistream.sh is a bash-script that allows you to start multiple instances of streamripper at once.
The script generates a logfile for each of the streamripper instances.

## Requirements

This script requires streamripper and bash to work!

If you are using debian type

`sudo apt-get install streamripper`

For other operating systems use the specific command for your system

## Installation

*This instructions are for debian only!*

1. Install all requirements
2. Download multistream.sh using `wget https://raw.githubusercontent.com/serious-scribbler/BASH-MultiStreamRipper/master/multistream.sh`
3. Make your script executable using `chmod +x multistream.sh`
4. Finnished!

## How to use multistream.sh
### Prepare a streamlist

1. Use your favorite editor to create a text file ( *with any name you like* )
2. Insert URLs to mp3/ogg-webradio streams into the file ( *One URL per line! You can find stream-URL's at http://vtuner.com/ - just open the .m3u files with a text editor to get the url* )
3. Create an output directory where you want to safe your songs at
4. Save your textfile and copy/move it into your output directory
5. Type ./multistream.sh -t <recording duration in seconds> -d <path to your output directory> -sl <full path of the streamlist-file>
6. If you experience any errors check the log files in your output folder ( *the log files names start with stream and the line number of the corresponding URL in your streamfile* )
7. To stop all running instances of streamripper (*just in case you want to stop em before the time runs out*) type `./multistream.sh -k`
