LINUXDIR="./linux"

if [ ! -d $LINUXDIR ]; then
	echo Linux Dir not found, please run \'git submodule init\'
	exit 1
fi

cd $DIR

echo Configuring for arm64

make distclean
make ARCH=arm64 defconfig

cd ..
