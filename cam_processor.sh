#!/bin/bash

BASE=led_dimmer
OUTDIR=cam
OUTPUT="--format gerber --output-dir=$OUTDIR --use-auxiliary-axis-as-origin --exclude-edge-from-other-layers"
SRC=$BASE.kicad_pcb

###########################
###########################

kicad_plot.py $OUTPUT --layers F.Cu $SRC
mv cam/$BASE-F_Cu.pho cam/$BASE.GTL

kicad_plot.py $OUTPUT --layers F.Mask $SRC
mv cam/$BASE-F_Mask.pho cam/$BASE.GTS

kicad_plot.py $OUTPUT --layers F.SilkS --plot-in-silk module-reference --subtract-soldermask-from-silk $SRC
mv cam/$BASE-F_SilkS.pho cam/$BASE.GTO

###########################

kicad_plot.py $OUTPUT --layers B.Cu $SRC
mv cam/$BASE-B_Cu.pho cam/$BASE.GBL

kicad_plot.py $OUTPUT --layers B.Mask $SRC
mv cam/$BASE-B_Mask.pho cam/$BASE.GBS

kicad_plot.py $OUTPUT --layers B.SilkS --plot-in-silk module-reference --subtract-soldermask-from-silk $SRC
mv cam/$BASE-B_SilkS.pho cam/$BASE.GBO

###########################

kicad_plot.py $OUTPUT --layers Edge.Cuts $SRC
mv cam/$BASE-Edge_Cuts.pho cam/$BASE.GKO

###########################
###########################

#kicad_drill.py $OUTDIR
#mv cam/$BASE-drill.exc cam/pth.exc
