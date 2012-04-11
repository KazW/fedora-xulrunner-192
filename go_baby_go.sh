echo -e "Installing build dependencies (your password may be required)...\n"
sleep 2
sudo yum groupinstall 'Development Tools' 'Development Libraries' 'GNOME Software Development'
sudo yum install autoconf213 glibc-static libstdc++-static yasm wireless-tools-devel mesa-libGL-devel alsa-lib-devel libXt-devel libjpeg-devel libevent-devel nspr-devel nss-devel hunspell-devel zlib-devel sqlite-devel
echo -e "\nGreat, all the build dependencies should be installed now, extracting mozilla source...\n"
sleep 2
tar xf firefox-3.6.28.source.tar.bz2
echo -e "\nSource extracted, time to patch it up and configure the build...\n"
sleep 2
cd mozilla-1.9.2
patch -Np1 -i ../offsetof.patch
patch -Np1 -i ../mozilla-pkgconfig.patch
patch -Np1 -i ../xulrunner-version.patch
patch -Np0 -i ../python2.7.patch
cp ../mozconfig .mozconfig
echo -e "\nEverything looks good, time to build (this will take a while)...\n"
sleep 5
make -f client.mk build
echo -e "\nEverything should be built now, time to \"install\" it...\n"
sleep 2
cd ..
mkdir mozilla-build
MOZILLA_INSTALL_PATH=`pwd`/mozilla-build
cd mozilla-1.9.2
make DESTDIR="${MOZSILLA_INSTALL_PATH}" install
cd ..
cp -r mozilla-build/usr/lib/xulrunner-1.9.2 fedora-xulrunner-192
unset MOZILLA_INSTALL_PATH
echo -e "\nYou now have a xulrunner library in \"fedora-xulrunner-192\" copy this directory to where ever you need it.\n"
sleep 1