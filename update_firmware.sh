cd ~/klipper
sudo service klipper stop
make clean
make -j4 KCONFIG_CONFIG=config.skr3
python3 ~/katapult/scripts/flashtool.py -i can0 -u 547e86a8dba9 -r
sleep 3
python3 ~/katapult/scripts/flashtool.py -d /dev/serial/by-path/platform-fd500000.pcie-pci-0000:01:00.0-usb-0:1.1.1:1.0 -f ~/klipper/out/klipper.bin
make clean
make -j4 KCONFIG_CONFIG=config.stmb0g1
python3 ~/katapult/scripts/flashtool.py -i can0 -u eea1ccfaf75a -f ~/klipper/out/klipper.bin
python3 ~/katapult/scripts/flashtool.py -i can0 -u 6cef20b88a6e -f ~/klipper/out/klipper.bin
make clean
make -j4 KCONFIG_CONFIG=config.rpi
make flash KCONFIG_CONFIG=config.rpi
cd ~
sudo service klipper start
