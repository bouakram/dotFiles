#!/bin/sh

BLANK='#00000000'
CLEAR='#6c708622'         # Overlay0 with some transparency
DEFAULT='#313244'         # Surface0
TEXT='#cdd6f4'            # Text
WRONG='#ff6e5e'           # Red
VERIFYING='#5eff6c'       # Teal

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--time-font="Sans"           \
--date-font="Sans"           \
--layout-font="Sans"         \
--verif-font="Sans"          \
--wrong-font="Sans"          \
--time-size=64               \
--date-size=24               \
--layout-size=20             \
--verif-size=24              \
--wrong-size=24              \
\
--radius=150                 \
--ring-width=8               \
\
--screen 1                   \
--blur 9                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"    \
--keylayout 1                \


