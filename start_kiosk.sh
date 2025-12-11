#!/bin/bash

#Geen zwart scherm
xset s noblank
xset s off
xset -dpms

#Muis verbergen -> unclutter installeren!
unclutter -idle 0.1 -root &

# 3. Wacht even op netwerk/Next.js
sleep 15

#Restore pages-> uitschekelen
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences

#Skip alle popups, incognito tab, fullscreen, keypass
chromium --noerrdialogs \
  --disable-infobars \
  --kiosk \
  --incognito \
  --check-for-update-interval=31536000 \
  --disable-translate \
  --disable-features=TranslateUI \
  --no-first-run \
  --fast \
  --fast-start \
  http://localhost:3000
