# DR_CURVE.SH
#//////////////

				
salta(){
	cd /home/cmaturana/scratch
	rm -rf $1
	mkdir $1
	cd $1
}
#/- sun ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

### 1 ##########################################################################
salta sun_1TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh  -v  sun_4096x4096x0.027x420x129.avi        -l  8  -b  128  -m  128  -g  129  -t  1  -y  4096  -x  4096  -f  0.027

salta zero_sun_1TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh   -v  zero.yuv.avi                          -l  8  -b  128  -m  128  -g  129  -t  1  -y  4096  -x  4096  -f  0.027

exit 0

### 2 ##########################################################################
salta sun_2TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh  -v  sun_4096x4096x0.027x420x129.avi        -l  8  -b  128  -m  128  -g  65  -t  2  -y  4096  -x  4096  -f  0.027

salta zero_sun_2TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh   -v  zero.yuv.avi                          -l  8  -b  128  -m  128  -g  65  -t  2  -y  4096  -x  4096  -f  0.027

### 3 ##########################################################################
salta sun_3TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh  -v  sun_4096x4096x0.027x420x129.avi        -l  8  -b  128  -m  128  -g  33  -t  3  -y  4096  -x  4096  -f  0.027

salta zero_sun_3TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh   -v  zero.yuv.avi                          -l  8  -b  128  -m  128  -g  33  -t  3  -y  4096  -x  4096  -f  0.027

### 4 ##########################################################################
salta sun_4TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh  -v  sun_4096x4096x0.027x420x129.avi        -l  8  -b  128  -m  128  -g  17  -t  4  -y  4096  -x  4096  -f  0.027

salta zero_sun_4TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh   -v  zero.yuv.avi                          -l  8  -b  128  -m  128  -g  17  -t  4  -y  4096  -x  4096  -f  0.027

### 5 ##########################################################################
salta sun_5TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh  -v  sun_4096x4096x0.027x420x129.avi       -l  8  -b  128  -m  128  -g  9  -t  5  -y  4096  -x  4096  -f  0.027

salta zero_sun_5TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh   -v  zero.yuv.avi                         -l  8  -b  128  -m  128  -g  9  -t  5  -y  4096  -x  4096  -f  0.027

<<comment

### 6 ##########################################################################
salta sun_6TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh  -v  sun_4096x4096x0.027x420x129.avi        -l  8  -b  128  -m  128  -g  5  -t  6  -y  4096  -x  4096  -f  0.027

salta zero_sun_6TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh   -v  zero.yuv.avi                          -l  8  -b  128  -m  128  -g  5  -t  6  -y  4096  -x  4096  -f  0.027

### 7 ##########################################################################
salta sun_7TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh  -v  sun_4096x4096x0.027x420x129.avi        -l  8  -b  128  -m  128  -g  3  -t  7  -y  4096  -x  4096  -f  0.027

salta zero_sun_7TRL
srun -N 1 -n 1 -p iball ../DRcurve.sh   -v  zero.yuv.avi                          -l  8  -b  128  -m  128  -g  3  -t  7  -y  4096  -x  4096  -f  0.027


   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### 
   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #

### 1 ##########################################################################
salta sun_5TRL_1L
srun -N 1 -n 1 -p iball ../DRcurve.sh   -v  sun_4096x4096x0.027x420x129.avi       -l  1  -b  128  -m  128  -g  9  -t  5  -y  4096  -x  4096  -f  0.027

salta zero_sun_5TRL_1L
srun -N 1 -n 1 -p iball ../DRcurve.sh   -v  zero.yuv.avi                          -l  1  -b  128  -m  128  -g  9  -t  5  -y  4096  -x  4096  -f  0.027

### 4 ##########################################################################
salta sun_5TRL_4L
srun -N 1 -n 1 -p iball ../DRcurve.sh   -v  sun_4096x4096x0.027x420x129.avi       -l  4  -b  128  -m  128  -g  9  -t  5  -y  4096  -x  4096  -f  0.027

salta zero_sun_5TRL_4L
srun -N 1 -n 1 -p iball ../DRcurve.sh   -v  zero.yuv.avi                          -l  4  -b  128  -m  128  -g  9  -t  5  -y  4096  -x  4096  -f  0.027

comment

exit 0
