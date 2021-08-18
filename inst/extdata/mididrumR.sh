#!/bin/bash
#
# This script converts selected inputs from a MIDI source to keyboard shortcuts.
# Inspired by https://superuser.com/a/1170232
# by https://superuser.com/users/157027/cl
# Author Florian Mayer https://github.com/florianm
#
# Setup -----------------------------------------------------------------------
# 1. Connect desired MIDI source (keyboard, e-drums, etc.) to computer.
#    Here, we connect a Yamaha DTExplorer e-drumkit via a Roland UM-ONE
#    MIDI-to-USB cable.
# 2. Run "aseqdump -l" to list your MIDI devices, then insert your MIDI source
#    into the next line.
#    We choose "UM-ONE" to select the Roland UM-ONE MIDI-to-USB cable.
aseqdump -p "UM-ONE" | \
while IFS=" ," read src e1 e2 e3 e4 e5 rest; do

# 3. Inspect MIDI signal format
#    Enable next line, hit one or each controller and inspect the output.
#    Find which components distinguish the individual MIDI channels.
#    The MIDI message is split by whitespace into different components,
#    which we here name "e1..5" and "rest".
#    If your MIDI device sends more components per message, add more
#    variables (e6 and so on).
# echo src $src e1 $e1 e2 $e2 e3 $e3 e4 $e4 e5 $e5 rest $rest

# Mind that MIDI sends Note "on" and Note "off" events, so trigger only on
# Note "on".
# The Yamaha DTXplorer (via te Roland UM-ONE) sends the important bits in
# e1, e2, and e5.
# Other MIDI devices or interfaces might send the improtant bits in other
# parts of the MIDI message.
case "$e1 $e2 $e5" in

# MIDI mapping for Yamaha DTXplorer -------------------------------------
# Source https://gist.github.com/Linux-cpp-lisp/0d56704764b95424bf7e by
# Author https://github.com/Linux-cpp-lisp (Albert Musaelian)

# Shortcuts -------------------------------------------------------------
# Kick 1/2 33

# Snare 31: Knit current document
"Note on 31" ) xdotool key ctrl+shift+k ;;

# HiHat Open 46, Closed 42, Loose 46

# HiHat Controller 44

# Tom High 48: Document
"Note on 48" ) xdotool key ctrl+shift+d ;;

# Tom Mid 47: Test
"Note on 47" ) xdotool key ctrl+shift+t ;;

# Tom Low 43: Install and restart
"Note on 43" ) xdotool key ctrl+shift+b ;;

# Crash Cymbal 49: Load all
"Note on 49" ) xdotool key ctrl+shift+l ;;

# Ride Cymbal 51: Check
"Note on 51" ) xdotool key ctrl+shift+e ;;

esac
done

