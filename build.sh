LINUXDIR="./linux"
CFG="./linux/.config"
RAMDIR="./ramfs"

if [ ! -d $LINUXDIR ]; then
	echo Linux Dir not found, please run \'git submodule init\'
	exit 1
fi

if [ ! -f $CFG ]; then
	echo Config file not found, please run the configure file
	exit 1
fi

mkdir -p out
echo Building for arm64

cd $LINUXDIR

ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make all -j 4

cp arch/arm64/boot/Image.gz ../out/zImage

echo Done.

cd ..
