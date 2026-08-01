# Plymouth — Animated Splash

Custom 12-frame animated Plymouth splash screen.

## Installation

Copy the theme into Plymouth's theme directory:

```bash
sudo cp -r splash-plymouth /usr/share/plymouth/themes/
```

Set it as the default Plymouth theme:

```bash
sudo plymouth-set-default-theme splash-plymouth
```

Rebuild the initramfs:

```bash
sudo dracut -f
```

Reboot to see the animation.
