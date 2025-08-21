#/bin/bash

# $Id: pretty_print.sh,v 1.2 2025/08/04 19:04:03 scott Exp scott $

# pretty_print -- print syntax-hightlighted code

# some a2ps options I use
#  --prologue=color
#  -P HP_Color_LaserJet_Pro_MFP_3301
#  --columns=NUM
#  --portrait

a2ps --prologue=color --line-numbers=5 --highlight-level=heavy --output=- --sides=2 $* | lpr -l 
