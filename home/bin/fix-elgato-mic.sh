#!/bin/bash

# This will set the Elgato Wave:3 profile to 'Mono' and then back to 'Digital
# Stereo (IEC958) Output + Mono Input' to get it working again.

CARD_INDEX=$(pacmd list-cards |grep -iE "name:.*elgato.*" -B1 | grep index |awk -F":" '{ print $2}' |sed 's/ //g')
pacmd set-card-profile $CARD_INDEX input:mono-fallback
pacmd set-card-profile $CARD_INDEX output:iec958-stereo+input:mono-fallback
#pacmd set-card-profile $CARD_INDEX output:analog-stereo+input:mono-fallback
