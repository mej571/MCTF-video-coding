#!/bin/bash

video_dir=~/Videos
video=container_352x288x30x420x300.avi
# ffmpeg -t 10 -s 352x288 -f rawvideo -pix_fmt rgb24 -r 30 -i /dev/zero ~/Videos/zero_352x288x30x420x300.avi
#video=~/Videos/zero_352x288x30x420x300.avi
GOPs=2
TRLs=5
y_dim=288
x_dim=352
FPS=30


__debug__=0
BPP=8
MCTF_QUANTIZER=automatic

usage() {
    echo $0
    echo "  [-v video file name ($video)]"
    echo "  [-g GOPs ($GOPs)]"
    echo "  [-x X dimension ($x_dim)]"
    echo "  [-y Y dimension ($y_dim)]"
    echo "  [-f frames/second ($FPS)]"
    echo "  [-t TRLs ($TRLs)]"
    echo "  [-l layers ($layers)"
    echo "  [-s slope ($slope)]"
    echo "  [-? (help)]"
}

while getopts "v:p:x:y:f:t:g:?" opt; do
    case ${opt} in
        v)
            video="${OPTARG}"
	    echo video=$video
            ;;
        x)
            x_dim="${OPTARG}"
	    echo x_dim=$x_dim
            ;;
        y)
            y_dim="${OPTARG}"
	    echo y_dim=$y_dim
            ;;
        f)
            FPS="${OPTARG}"
	    echo FPS=$FPS
            ;;
        t)
            TRLs="${OPTARG}"
	    echo TRLs=$TRLs
            ;;
    	g)
            GOPs="${OPTARG}"
	    echo GOPs=$GOPs
            ;;
        ?)
            usage
            exit 0
            ;;
        \?)
            echo "Invalid option: -${OPTARG}" >&2
            usage
            exit 1
            ;;
        :)
            echo "Option -${OPTARG} requires an argument." >&2
            usage
            exit 1
            ;;
    esac
done

if [ $BPP -eq 16 ]; then

    RAWTOPGM () {
	local input_image=$1
	local x_dim=$2
	local y_dim=$3
	local output_image=$4
	(uchar2ushort < $input_image > tmp_1) 2> /dev/null
	rawtopgm -bpp 2 $x_dim $y_dim < tmp_1 > $output_image
	rm tmp_1
    }

    PGMTORAW () {
	local input_image=$1
	local output_image=$2
	convert -endian MSB $input_image tmp_1.gray
	(ushort2uchar < tmp_1.gray > $output_image) 2> /dev/null
	rm tmp_1.gray
    }
    
else

    RAWTOPGM () {
	local input_image=$1
	local x_dim=$2
	local y_dim=$3
	local output_image=$4
	rawtopgm $x_dim $y_dim < $input_image > $output_image
    }

    PGMTORAW () {
	local input_image=$1
	local output_image=$2
	convert $input_image tmp_1.gray
	mv tmp_1.gray $output_image
    }
    
fi

if [ $__debug__ -eq 1 ]; then
    set -x
fi

# ----------------------------------------------

number_of_images=`echo "2^($TRLs-1)*($GOPs-1)+1" | bc`
(ffmpeg -i $video_dir/$video -c:v rawvideo -pix_fmt yuv420p -vframes $number_of_images L_0/%4d.Y) > /dev/null 2> /dev/null
x_dim_2=`echo $x_dim/2 | bc`
y_dim_2=`echo $y_dim/2 | bc`
img=1
while [ $img -le $number_of_images ]; do
    _img=$(printf "%04d" $img)
    let img_1=img-1
    _img_1=$(printf "%04d" $img_1)

    input=L_0/$_img.Y
    output=L_0/${_img_1}_0.pgm
    RAWTOPGM $input $x_dim $y_dim $output

    input=L_0/$_img.U
    output=L_0/${_img_1}_1.pgm
    RAWTOPGM $input $x_dim_2 $y_dim_2 $output    
    
    input=L_0/$_img.V
    output=L_0/${_img_1}_2.pgm
    RAWTOPGM $input $x_dim_2 $y_dim_2 $output
    let img=img+1 
done

if [ $__debug__ -eq 1 ]; then
    set +x
fi
