#!/bin/bash
# voor display error
export DISPLAY=:0

# --kiosk ----> volledig scherm
# --noerrdialogs ----> verbergt alle error dialogs
# --password-store=basic ----> voor ambetante keyring
# chromium --kiosk --noerrdialogs --password-store=basic http://localhost:3003
chromium --password-store=basic http://localhost:3003
