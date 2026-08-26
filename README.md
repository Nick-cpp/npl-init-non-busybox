# npl-init

A simple and lightweight init system for **any Linux distribution**. 

While specifically designed for NoPersonalLife Linux, **npl-init-non-busybox** can be installed and run on any Linux distribution, even if it does not have BusyBox pre-installed.

---

## Building and Installation

### 1. Clone the repository

```bash
git clone https://github.com/Nick-cpp/npl-init-non-busybox
cd npl-init
```

### 2. Download and extract BusyBox

Before building, download and extract the required BusyBox source:

```bash
wget https://busybox.net/downloads/busybox-1.36.1.tar.bz2
tar -xf busybox-1.36.1.tar.bz2
```

### 3. Build BusyBox

Compile BusyBox:

```bash
make
```

### 4. Install

#### Direct System Installation

To install directly into the running root system (`/`):

> Don't worry coreutils won't be overtired by busybox. It will install only acpid and getty

```bash
make install
```

#### Installation via `DESTDIR` (Chroot / Staging Target)

If you are bootstrapping a new system or deploying to a mounted filesystem (e.g., `/mnt`):

```bash
make DESTDIR=/path/to/target install
```

---

## Uninstallation

> **Warning:** Uninstalling from the running system can render it unbootable by removing the init system. Proceed with caution.

### Direct System Uninstallation

To remove directly from the running root system (`/`):

```bash
make uninstall
```

### Uninstallation via `DESTDIR` (Chroot / Staging Target)

To remove from a mounted target system or staging environment (e.g., `/mnt`):

```bash
make DESTDIR=/path/to/target uninstall
```

---

Thanks to [LINUXHUNTERREDHAT](https://github.com/LINUXHUNTERREDHAT) for providing the Makefile.
