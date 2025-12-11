#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' 

echo "=========================================="
echo "      RASPBERRY PI 5       "
echo "=========================================="
date
echo "------------------------------------------"

# Temperatuur
temp=$(vcgencmd measure_temp | cut -d= -f2)
echo -e "Temperatuur : $temp"

# Voltage 
volts=$(vcgencmd measure_volts | cut -d= -f2)
echo -e "Voltage     : $volts"

# Kloksnelheid
clock_raw=$(vcgencmd measure_clock arm | awk -F= '{print $2}')
clock_mhz=$(awk "BEGIN {printf \"%.0f\", $clock_raw/1000000}")
echo -e "Kloksnelheid: ${clock_mhz} MHz"

# Throtteling
throttled_raw=$(vcgencmd get_throttled | cut -d= -f2)

if [ "$throttled_raw" == "0x0" ]; then
    echo -e "Voeding     : ${GREEN}OK (Geen problemen)${NC}"
else
    echo -e "Voeding     : ${RED}LET OP! Code $throttled_raw${NC}"
    echo "              (Mogelijk onderspanning of hitteprobleem)"
fi

echo "------------------------------------------"

free -h | grep Mem | awk '{print "Geheugen    : " $3 " gebruikt van " $2}'
echo "=========================================="