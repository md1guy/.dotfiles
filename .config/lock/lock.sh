#!/bin/sh

B='#00000000'  # blank
C='#51359177'  # clear ish
D='#513591bb'  # default
T='#ffffffff'  # text
W='#A14E61bb'  # wrong
V='#484BC2bb'  # verifying
TY='#484BC2bb' # typing

# Automatically set US keyboard layout before locking.
# Requires 'xkblayout-state-git' AUR package to work
xkblayout-state set 0;

i3lock \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$C      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$T        \
--wrongcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$TY       \
--bshlcolor=$W        \
\
--screen 1            \
--blur 6              \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %d/%m" \
--radius 100 \

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
