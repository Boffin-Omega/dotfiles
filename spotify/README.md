# Spotify + Spicetify Setup

## 1. Install Spotify on Fedora

Enable the RPM Fusion Nonfree repository:

```bash
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Add your user to the `pkg-build` group:

```bash
sudo usermod -a -G pkg-build $USER
```

Approve and build the Spotify package with LPF:

```bash
lpf approve spotify-client
sudo -u pkg-build lpf build spotify-client
```

Install the resulting package:

```bash
sudo dnf install /var/lib/lpf/rpms/spotify-client/spotify-client-*.rpm
```

Log in to Spotify.

## 2. Install Spicetify

Install the Spicetify CLI:

```bash
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
```

Restart the terminal.

Verify that Spicetify is installed:

```bash
spicetify --version
```

Then run:

```bash
spicetify backup apply
```

## 3. Install the Theme

Open Spotify.

You should see **Marketplace** in the sidebar.

Open Marketplace and install the **StarryNight** theme.