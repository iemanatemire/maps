#!/bin/bash
#
# Basic map of Colorado
#

PS=colorado.ps

TITLE='Colorado'

# set bounding box with extents
W=-109.5
E=-101.5
S=36.5
N=41.25
BOUNDS=-R${W}/${E}/${S}/${N}

# projection scale along parallel (1:xxx)
SCALAR=2
PROJECTION=-Jm${SCALAR}

# map grid tick spacing 
BIG_TICK_DEG=2
GRID_TICK_DEG=0
STYLE=-B${BIG_TICK_DEG}g${GRID_TICK_DEG}:."${TITLE}":

# misc arguments
ARGS='-X2.0 -Y2.0 -K'

# generate basemap
gmt psbasemap ${PROJECTION} ${BOUNDS} ${STYLE} ${ARGS} -P > $PS

# add water features and state outlines
gmt pscoast -Df -S -Ia -Glightgray ${PROJECTION} -Na/1p -W1p,white ${BOUNDS} ${STYLE} -K -O -P >> $PS
