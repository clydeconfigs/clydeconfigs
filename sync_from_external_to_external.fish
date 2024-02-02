#!/bin/fish

while true
    echo -n "Type YES (uppercase) if you want to sync external 'Media' into the current local drive: "
    set user_input (read)
    if test "$user_input" = "YES"
        break
    else
        echo "Please type YES in uppercase."
    end
end

echo "Continuing..."

if test -z "$argv[1]"
    echo "No arguments provided"
    exit 1
else
    rsync -av --delete --exclude ISO --exclude WIKIs $argv[1] ~/Media/ && \
    rsync -av ~/Media/Code/Configs/config/ ~/.config/ && \
    rsync -av ~/Media/Code/Configs/home/ ~/
          # NO "--delete"! DON'T OVERWRITE EVERYTHING!  
end

