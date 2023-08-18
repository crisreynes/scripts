#!/bin/bash
if ! pgrep -f "kitty --class pulsemixer" >/dev/null
then
  kitty --class pulsemixer pulsemixer
  exit 0
fi

if ! pgrep -f "kitty --class floating" >/dev/null
then
  kitty --class floating
  exit 0
fi

if ! pgrep -f "kitty --class ncspot" >/dev/null
then
  kitty --class ncspot ncspot
  exit 0
fi
exit 0
