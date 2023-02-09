LIRC_PLUGINS_DIR = $(shell pkgconf lirc-driver --variable=plugindir)
PLUGIN_SO = tiqlibusb.so

${PLUGIN_SO}: tiqiaa.c
	gcc -shared -fPIC $^ -lusb-1.0 -llirc -llirc_driver -o $@

install:
	install -t ${LIRC_PLUGINS_DIR} ${PLUGIN_SO}

clean:
	rm ${PLUGIN_SO}

.PHONY: install clean
