BUSYBOX_BUILD_DIR = $(CURDIR)/busybox-1.36.1
NPLI_DIR = $(DESTDIR)/etc/npl-init

all:
	cp .config "$(BUSYBOX_BUILD_DIR)/.config"
	$(MAKE) -C "$(BUSYBOX_BUILD_DIR)"

install:
	mkdir -p "$(DESTDIR)/sbin" "$(DESTDIR)/usr/bin" "$(DESTDIR)/etc"

	cp init "$(DESTDIR)/sbin/"
	cp npli "$(DESTDIR)/usr/bin/"
	cp -rf npl-init "$(DESTDIR)/etc/"
	cp -rf acpi "$(DESTDIR)/etc/"

	ln -sf /etc/npl-init/npl-halt "$(DESTDIR)/sbin/reboot"
	ln -sf /etc/npl-init/npl-halt "$(DESTDIR)/sbin/poweroff"
	ln -sf /etc/npl-init/npl-halt "$(DESTDIR)/sbin/halt"
	ln -sf /etc/npl-init/npl-halt "$(DESTDIR)/sbin/shutdown"

	chmod +x "$(DESTDIR)/sbin/init"
	chmod +x "$(DESTDIR)/usr/bin/npli"
	chmod +x "$(NPLI_DIR)/lib"
	chmod +x "$(NPLI_DIR)/npl-halt"

	chmod +x "$(NPLI_DIR)/sv/"*

	chmod +x "$(DESTDIR)/etc/acpi/PWRB/00000080"
	chmod +x "$(DESTDIR)/etc/acpi/PWRF/00000080"

	cp "$(BUSYBOX_BUILD_DIR)/busybox" "$(DESTDIR)/usr/bin/"
	chmod +x "$(DESTDIR)/usr/bin/busybox"
	ln -sf busybox "$(DESTDIR)/usr/bin/getty"
	ln -sf busybox "$(DESTDIR)/usr/bin/acpid"

uninstall:
	rm -rf "$(NPLI_DIR)"
	rm -rf "$(DESTDIR)/etc/acpi"
	rm -f "$(DESTDIR)/sbin/init"
	rm -f "$(DESTDIR)/usr/bin/npli"
	rm -f "$(DESTDIR)/sbin/reboot"
	rm -f "$(DESTDIR)/sbin/poweroff"
	rm -f "$(DESTDIR)/sbin/halt"
	rm -f "$(DESTDIR)/sbin/shutdown"

	rm -f "$(DESTDIR)/usr/bin/busybox"
	rm -f "$(DESTDIR)/usr/bin/getty"
	rm -f "$(DESTDIR)/usr/bin/acpid"

.PHONY: all install uninstall
