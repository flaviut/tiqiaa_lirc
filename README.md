LIRC userspace driver for Tiqiaa TView IR transceiver
=====================================================

Big thanks to XenRE for doing most of the reverse engineering work on the transceiver.
XenRE's Windows driver (https://gitlab.com/XenRE/tiqiaa-usb-ir) was very helpful.

The code is a mess, and only sending works for now.


Installing
----------

To install prerequisites:

```bash
apt-get install liblirc-dev libusb-1.0-0-dev
```

To build and install:

```bash
make
sudo make install
```


Usage
-----

Update the `driver` setting in your `lirc_options.conf` to use `tiqlibusb`. For example:

```
[lircd]
driver          = tiqlibusb
device          = auto
```

After setting up your remote and starting `lircd`, you can then send commands using your configured remote:

```bash
irsend SEND_ONCE YOUR_REMOTE_NAME KEY_POWER
```

---

Manual build process
--------------------

To manually build and install:

```bash
gcc -shared -fPIC tiqiaa.c -lusb-1.0 -llirc -llirc_driver -o tiqlibusb.so

cp tiqlibusb.so (/path/to/lib)/lirc/plugins/
```
