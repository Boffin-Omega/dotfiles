# Fedora Dotfiles

My personal Fedora KDE setup and configuration.

This repository contains configuration files, themes, scripts, and setup instructions for recreating my desktop environment from a fresh Fedora installation.

## 1. Clone the repository

Clone the repository and enter it:

```bash
git clone https://github.com/Boffin-Omega/dotfiles.git

cd dotfiles
```

---

## 2. Install basic packages

Install the packages used by the configuration:

```bash
sudo dnf install git eza fzf
```

---

## 3. KDE configuration

The `kde/` directory contains my KDE configuration:

* `kdeglobals` — KDE appearance settings
* `kglobalshortcutsrc` — custom keyboard shortcuts
* `konsolerc` — Konsole configuration
* `kwinrc` — KWin configuration

Copy them into the KDE configuration directory:

```bash
mkdir -p ~/.config

cp kde/kdeglobals ~/.config/kdeglobals
cp kde/kglobalshortcutsrc ~/.config/kglobalshortcutsrc
cp kde/konsolerc ~/.config/konsolerc
cp kde/kwinrc ~/.config/kwinrc
```

Log out and back in after applying the KDE configuration if some settings do not immediately appear.

---

## 4. Konsole

The `konsole/` directory contains my Konsole profile and Catppuccin Mocha color scheme.

Copy them:

```bash
mkdir -p ~/.local/share/konsole

cp konsole/* ~/.local/share/konsole/
```

Select the `Profile 2` profile in Konsole if it is not already selected.

---

## 5. Papirus icons

The `themes/papirus/` directory contains the setup instructions for my Papirus icon configuration.

Follow:

```text
themes/papirus/README.md
```

---

## 6. Bibata cursor

The `themes/Bibata-Modern-Ice-Right/` directory contains my cursor theme.

Follow:

```text
themes/Bibata-Modern-Ice-Right/README.md
```

This installs/configures the **Bibata Modern Ice Right** cursor theme.

---

## 7. Bash, Starship, fzf and Docker

The `bash/` directory contains my Bash configuration.

It includes:

* `eza` aliases for `ls`, `ll`, `la`, and `tree`
* `fzf` integration
* `fuzzy` for selecting a file and passing it to a command
* `fuzzycd` for navigating through directories with `fzf`
* lazy-starting Docker service
* Starship prompt
* `mise`
* Spicetify's command-line path
* GIMP AppImage alias

Copy the Bash configuration:

```bash
cp bash/.bashrc ~/.bashrc
```

### Starship

Install Starship and make sure it is available:

```bash
curl -sS https://starship.rs/install.sh | sh
```

The Bash configuration initializes Starship automatically.

### fzf and eza

These are required by the aliases and functions in `.bashrc`:

```bash
sudo dnf install eza fzf
```

### Docker

Follow the README in `bash/` directory contains the Docker setup.


## 8. VS Code

The `vscode/` directory contains my VS Code settings.

Follow:

```text
vscode/README.md
```

This installs the tracked `settings.json` and my VS Code extensions.

---

## 9. Brave Browser

The `brave/` directory contains the setup information for my Brave configuration.

Follow:

```text
brave/README.md
```

My Brave setup includes:

* Catppuccin Chrome theme
* Dark Brave browser UI
* Stylus
* Catppuccin userstyles through the customizer

---

## 10. Spotify

The `spotify/` directory contains the Spotify installation and Spicetify setup instructions.

Follow:

```text
spotify/README.md
```

This installs Spotify, sets up Spicetify, and applies my customized Spotify setup.

---

## 11. Plymouth

The `plymouth/splash-plymouth/` directory contains my custom animated boot splash.

Follow:

```text
plymouth/splash-plymouth/README.md
```

This sets up the custom Plymouth boot animation.

---

## 12. Wallpapers

The `wallpapers/` directory contains my desktop wallpapers:

* `home-screen.png`
* `login-screen.png`

Set them manually through KDE System Settings and the SDDM/login-screen settings.

---

## Final setup

After completing the steps above, the repository should provide the main parts of my Fedora KDE setup:

* KDE configuration
* Konsole + Catppuccin Mocha
* Papirus icons
* Bibata cursor
* Bash configuration
* eza + fzf utilities
* Starship prompt
* mise
* Docker lazy-start setup
* VS Code configuration and extensions
* Brave + Catppuccin customization
* Spotify + Spicetify customization
* Custom animated Plymouth boot splash
* Desktop and login wallpapers

> **Note:** If a website does not appear to use the Catppuccin theme even though it is installed and enabled in **Stylus Manager** of the Stylus browser extension, another stylesheet may be overriding it.
>
> This can happen because of:
>
> * **Dark Reader** or another extension injecting its own CSS
> * A website's built-in accessibility/theme settings, for example, github.com's High Contrast setting

> Solution: Try disabling the conflicting CSS/theme setting and reload the page. The Catppuccin Stylus theme should then apply correctly.
