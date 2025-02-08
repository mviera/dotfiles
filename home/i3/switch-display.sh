#!/bin/bash
#
# Set HDMI monitor to the left of the laptop and primary.

# Private variables
XRANDR=$(which xrandr)
GREP=$(which grep)
WC=$(which wc)

function check() {

    if [ -z "${XRANDR}" ]
    then
        echo -e "xrandr is not installed or in your path. Please, consider to install it in order to use this script"
        echo
        exit 2
    fi

    if [ -z "${GREP}" ]
    then
        echo -e "grep is not installed or in your path. Please, consider to install it in order to use this script"
        echo
        exit 2
    fi

    if [ -z "${WC}" ]
    then
        echo -e "wc is not installed or in your path. Please, consider to install it in order to use this script"
        echo
        exit 2
    fi
}

function switch() {

    NUM_DISPLAYS=$(${XRANDR} | ${GREP} " connected " | ${WC} -l)

    if [ $NUM_DISPLAYS -eq 2 ]
    then
        ${XRANDR} --output eDP-1 --off
        ${XRANDR} --output HDMI-1 --mode 2560x1440 --rate 74.97
    else
        ${XRANDR} --output HDMI-1 --off
        ${XRANDR} --output eDP-1 --auto
    fi
}

check
switch
