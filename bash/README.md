# Bash

This directory contains my `.bashrc` and the setup needed for the commands, aliases, and tools configured in it.

## `.bashrc`

Copy `.bashrc` to:

```bash
~/.bashrc
```

Then restart the terminal or run:

```bash
source ~/.bashrc
```

The `.bashrc` contains:

* `eza` aliases for `ls`, `ll`, `la`, and `tree`
* `fzf` keybindings and helper functions
* Lazy-starting Docker function
* Starship prompt
* GIMP AppImage alias
* mise activation
* Spicetify PATH

---

## eza

Install:

```bash
sudo dnf install eza
```

Used for the enhanced `ls` commands:

```bash
ls
ll
la
tree
```

---

## fzf

Install:

```bash
sudo dnf install fzf
```

The `.bashrc` configures fzf keybindings and provides the following helper functions:

```bash
fuzzy
fuzzycd
```
## fzf Usage

### `fuzzy`

For commands that take a single file argument, instead of manually typing a long path:

```bash
nano /long/nested/path/to/file
```

use:

```bash
fuzzy nano
```

This opens an fzf selector. Choose the file, and it will be passed to `nano` automatically.

The same works with other commands that take a single file argument.

### `fuzzycd`

For changing into a deeply nested directory, instead of manually typing the entire path:

```bash
cd /some/long/nested/path/
```

use:

```bash
fuzzycd
```

This opens an fzf selector containing directories under the current directory. Select the directory you want, and `fuzzycd` changes into it.


---

## Starship

Install Starship using the official installer:

```bash
curl -sS https://starship.rs/install.sh | sh
```

Verify:

```bash
starship --version
```

The `.bashrc` initializes Starship automatically:

```bash
eval "$(starship init bash)"
```

The Starship configuration is stored separately in:

```text
../starship/starship.toml
```

---

## mise

Install mise according to its official installation instructions.

The `.bashrc` automatically activates it with:

```bash
eval "$(mise activate bash)"
```

---

## Docker

Docker was installed on Fedora using the official Docker installation instructions:

https://docs.docker.com/engine/install/fedora/

The `.bashrc` contains a custom Docker function:

```bash
docker() {
    if ! systemctl --quiet is-active docker.service; then
        sudo systemctl start docker.service >/dev/null 2>&1
    fi
    command docker "$@"
}
```

This means the Docker service is started automatically when a Docker command is first used, instead of having Docker run continuously from boot.

### Allow the Docker service to start without a sudo password

Because the function uses:

```bash
sudo systemctl start docker.service
```

a `sudoers` rule is required.

Open sudoers with:

```bash
sudo visudo
```

Add at end of the opened file:

```text
YOUR_USERNAME ALL=(root) NOPASSWD: /usr/bin/systemctl start docker.service
```

Replace `YOUR_USERNAME` with your Linux username.

For example:

```text
gagangowda ALL=(root) NOPASSWD: /usr/bin/systemctl start docker.service
```

**Always use `visudo` when editing sudoers. Do not edit `/etc/sudoers` directly with a normal text editor.**

### Test Docker

After setting everything up, test the complete setup with:

```bash
docker run hello-world
```

This should work **without using `sudo docker`**.

The command verifies that:

* the `docker` function from `.bashrc` is being used,
* the Docker service can be started automatically,
* the `sudoers` rule allows the service to be started without a password,
* Docker commands can be used normally without prefixing them with `sudo`.

Other commands should likewise work normally:

```bash
docker ps
docker images
docker version
```

---

## Spicetify

The `.bashrc` adds Spicetify to `PATH`:

```bash
export PATH=$PATH:$HOME/.spicetify
```

This assumes Spicetify is installed at:

```text
~/.spicetify
```

---

## GIMP

The `.bashrc` contains:

```bash
alias gimp=~/Documents/GIMP-3.2.4-x86_64.appimage
```

Therefore the GIMP AppImage must exist at:

```text
~/Documents/GIMP-3.2.4-x86_64.appimage
```

If the AppImage is moved or renamed, update the alias accordingly.
