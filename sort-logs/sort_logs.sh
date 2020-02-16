#!/bin/bash

LOG_FILE=apache_logs
JPG=".jpg"
PNG=".png"
ICO=".ico"

jpg_num=$(grep -o -i $JPG $LOG_FILE | wc -l)
ico_num=$(grep -o -i $ICO $LOG_FILE | wc -l)
png_num=$(grep -o -i $PNG $LOG_FILE | wc -l)

echo ""
echo "number of $JPG files in file $LOG_FILE is $jpg_num"
echo ""
echo "number of $PNG files in file $LOG_FILE is $png_num" 
echo ""
echo "number of $ICO files in file $LOG_FILE is $ico_num" 
echo ""
