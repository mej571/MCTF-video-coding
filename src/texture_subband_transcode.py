#!/usr/bin/env python3
# -*- coding: iso-8859-15 -*-

#  Transcode a texture (temporal) subband.

import shutil
import subprocess as sub
import sys
import math
import struct
import os
from subprocess import check_call
from subprocess import CalledProcessError
from arguments_parser import arguments_parser

parser = arguments_parser(description="Transcode a texture (temporal) subband.")
parser.add_argument("--pictures",
                    help="Number of pictures to transcode.",
                    default=1)
parser.pixels_in_x()
parser.pixels_in_y()
parser.add_argument("--subband",
                    help="Subband to decompress.",
                    default=0)

args = parser.parse_known_args()[0]
pictures = int(args.pictures)
pixels_in_x = int(args.pixels_in_x)
pixels_in_y = int(args.pixels_in_y)
subband = int(args.subband)

def Transcode(subband, component, picture_number, number_of_quality_layers) :

    try:
        picture_filename = subband + "_" + str(component) + "_" + str('%04d' % picture_number)

        f = open(picture_filename + ".j2c", "rb")
        f.close()

        # Decode.
        try:
            check_call("trace kdu_transcode"
                       + " -i " + picture_filename + ".j2c"
                       + " -o " + picture_filename + ".j2c"
                       + " Clayers=" + number_of_quality_layers
                       , shell=True)
        except CalledProcessError :
            sys.exit(-1)

    except:
        # If there is no file textures of the current iteration, is
        # created with a neutral texture.

        f = open(picture_filename + ".rawl", "wb")
        for a in xrange(pixels_in_x * pixels_in_y) :
            f.write('%c' % 128)  # BYTES_PER_COMPONENT = 1   # 1 byte for components used unweighted.
            #f.write('%c' % 128) # BYTES_PER_COMPONENT = 2   # 2 bytes for weighted or components that are used weighted.
        f.close()

    # MUX
    try:
        check_call("trace cat " + picture_filename + ".rawl >> " + file, shell=True)
    except CalledProcessError:
        sys.exit(-1)

picture_number = 0
while picture_number < pictures :

    decode ('Y', picture_number)
    decode ('U', picture_number)
    decode ('V', picture_number)

    picture_number += 1
