#!/bin/sh

mkdir /tmp/metaclyde
cd /tmp/metaclyde

git clone https://github.com/clydeconfigs/rofi
git clone https://github.com/clydeconfigs/scripts
git clone https://github.com/clydeconfigs/Configs

MC="$HOME/Media/Code"
mkdir -p $MC

rsync -av Configs/config/ $HOME/.config

mv rofi $MC
mv scripts $MC
mv Configs $MC
