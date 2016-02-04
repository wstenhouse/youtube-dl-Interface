# youtube-dl-Interface
Little shell script that allows you to download an entire youtube user's page.

###You'll need youtube-dl to run the script

You can use CURL to install it on UNIX (Linux, OS X, etc.), type:
```
sudo curl https://yt-dl.org/downloads/2016.02.01/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

You can also use pip:
```
sudo pip install --upgrade youtube_dl
```

Or Homebrew if you have it:
```
brew install youtube-dl
```

##How to use

Start the script and you'll see:
```
> Type Youtube Username
```
Here you can type the username of the YouTube channel you wish to download from.

Then:
```
> Type Starting Number [1 = 1st Video, 30 = 30th Video etc...]
```
This the the starting video you wish to download.
Lastly
```
> Type Max Downloads [Leave blank to download all]
```
This is the maximum number of videos you wish to download.

**That's it! The script should start the download and then add all the metadata to the tracks, the files in the 'Metadata Added' folder are the ones you should use. The others can be deleted.'**	
