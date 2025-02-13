# Map Tiles Downloader

**A super easy to use GUI for downloading map tiles**

<p align="center">
  <img src="gif/map-tiles-downloader.gif">
</p>

## So what does it do?

This tiny python based script allows you to download map tiles from Google, Bing, Open Street Maps, ESRI, NASA, and other providers. This script comes with an easy to use web based map UI for selecting the area and previewing tiles.

## Installation on Raspberry Pi for use with chasemapper
```sh
sudo apt-get install python3-pip libopenjp2-7-dev libtiff5
pip3 install pillow
cd /home/pi
git clone https://github.com/Moll1989/MapTilesDownloader
sudo mv MapTilesDownloader/maptilesdownloader.service /etc/systemd/system/maptilesdownloader.service
sudo chmod 644 /etc/systemd/system/maptilesdownloader.service
sudo systemctl daemon-reload
sudo systemctl enable maptilesdownloader
sudo systemctl start maptilesdownloader
ln -s /home/$(whoami)/MapTilesDownloader/src/output /home/$(whoami)/Maps
```

Then open up the device you use for viewing chasemapper and navigate to port 5002 instead of 5001.

The output map tiles will be in the `~/MapTilesDownloader/src/output` directory.  However, we have created a symbolic link to `~/Maps` which is the default map tile location for chasemapper.  When configuring chasemapper.cfg, ensure that `tile_server_path` is set to `/home/USER/Maps`, where USER is your username (eg. pi).

## Requirements

Needs **Python 3.0+**, [Pillow](https://pypi.org/project/Pillow/) library, libopenjp2-7-dev, libtiff5 and a modern web browser. 

## Purpose

This fork has been customised to be suitable for running alongside chasemapper on a Raspberry Pi.  This makes it really easy to jump on and download maps before going on a balloon chase.

for more information on chasemapper visit https://github.com/projecthorus/chasemapper

## Features

- Super easy to use map UI to select region and options
- Multi-threading to download tiles in parallel
- Cross platform, use any OS as long as it has Python and a browser
- Supports 2x/Hi-Res/Retina/512x512 tiles my merging multiple tiles
- Supports downloading to file as well as mbtile format
- Select multiple zoom levels in one go
- Ability to ignore tiles already downloaded
- Specify any custom file name format
- Supports ANY tile provider as long as the url has `x`, `y`, `z`, or `quad` in it
- Built using MapBox :heart:

## Important Disclaimer

Downloading map tiles is subject to the terms and conditions of the tile provider. Some providers such as Google Maps have restrictions in place to avoid abuse, therefore before downloading any tiles make sure you understand their TOCs. I recommend not using Google, Bing, and ESRI tiles in any commercial application without their consent.

## Stay In Touch

For latest releases and announcements, check out the original author's site: [aliashraf.net](http://aliashraf.net)

## License

This software is released under the [MIT License](LICENSE). Please read LICENSE for information on the
software availability and distribution.

Copyright (c) 2020 [Ali Ashraf](http://aliashraf.net)
