#!/bin/fish

while true
    echo "Type YES (uppercase) if you want to sync external 'Media' into the current local drive: "
    set user_input (read)
    if test "$user_input" = "YES"
        break
    else
        exit 1
    end
end

echo "Continuing..."

if test -z "$argv[1]"
    echo "No arguments provided"
    exit 1
else
    rsync -avH --progress --delete --exclude ISO --exclude WIKIs $argv[1] ~/Media/
    rsync -av ~/Media/Code/Configs/config/ ~/.config/
    rsync -av ~/Media/Code/Configs/local/ ~/.local/
    rsync -av ~/Media/Code/Configs/home/ ~/
          # NO "--delete"! DON'T OVERWRITE EVERYTHING!  
end
