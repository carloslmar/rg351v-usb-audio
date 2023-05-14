# rg351v-usb-audio
Bash scripts to switch between the internal speaker and USB audio on an Anbernic rg351v

![Picture of the Anbernic rg351v with a USB bluetooth receiver, connected to the USB-C port](https://github.com/carloslmar/rg351v-usb-audio/assets/34244849/c51aaed5-afad-41e2-af08-95aba55634fa)

I made these 2 small scripts in order to make it easier to switch between speaker audio and USB audio. It's only been tested with an Anbernic rg351v, since that's the only device I have. The scripts may not be perfect, audio can be crackly (at least over Bluetooth). 

# Before using these, make sure to follow these steps first. Otherwise, these scripts will not work! Thank you, [mars0124](https://www.reddit.com/user/mars0124/) for writing these instructions.

- Connect to wifi

- Enable remote services

- SSH into device

`sudo passwd root`

`sudo cp ~/.asoundrc /etc/asound.conf`

`sudo nano /etc/asound.conf` -  replace hw:0,0 with hw:1,0 for USB audio. Reverse for speaker/headphones.

`sudo chmod 000 ~/.asoundrc` - this file resets and will override /etc/asound.conf, above

- run alsamixer to change volume. Hit F6 to select audio card.

- Not sure if this is needed, but I have also run:

`sudo apt install alsa-base pulseaudio`

- If this doesn't work, reboot and try again.

You'll need to relaunch your emulator after plugging/unplugging/updating /etc/asound.conf

edit: oh, and alsamixer doesn't save your volume selection by default. run "sudo alsactl store" to do this.
