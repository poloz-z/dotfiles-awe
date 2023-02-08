#!/bin/bash

title=$(playerctl metadata title)

artist=$(playerctl metadata artist)

echo " $artist - $title "
 
