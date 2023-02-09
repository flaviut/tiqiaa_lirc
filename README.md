LIRC userspace driver for Tiqiaa TView IR transceiver
=====================================================

Big thanks to XenRE for doing most of the reverse engineering work on the transceiver.
XenRE's Windows driver (https://gitlab.com/XenRE/tiqiaa-usb-ir) was very helpful.

The code is a mess, and only sending works for now.

To install prerequisites:

```bash
apt-get install liblirc-dev libusb-1.0-0-dev
```

To install:

```bash
make
sudo make install
```

---

Manual build process
--------------------

To manually build and install:

```bash
gcc -shared -fPIC tiqiaa.c -lusb-1.0 -llirc -llirc_driver -o tiqlibusb.so

cp tiqlibusb.so (/path/to/lib)/lirc/plugins/
```


