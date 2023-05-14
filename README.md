# rg351v-usb-audio
Bash scripts to switch between the internal speaker and USB audio on an Anbernic rg351v. 

![Picture of the Anbernic rg351v with a USB bluetooth receiver, connected to the USB-C port](https://github.com/carloslmar/rg351v-usb-audio/assets/34244849/c51aaed5-afad-41e2-af08-95aba55634fa)

I made these 2 small scripts in order to make it easier to switch between speaker audio and USB audio. It's only been tested with an Anbernic rg351v, since that's the only device I have. The scripts may not be perfect, audio can be crackly (at least over Bluetooth). 

# Before using these, make sure to follow these steps first. Otherwise, these scripts will not work! Thank you, [mars0124](https://www.reddit.com/user/mars0124/) for writing these instructions.

- Connect to wifi

- Enable remote services

- SSH into device

`sudo passwd root`

`sudo cp ~/.asoundrc /etc/asound.conf`

`sudo nano /etc/asound.conf` -  replace hw:0,0 with hw:1,0 for USB audio. Reverse for speaker/headphones.

- At this point, make 2 copies of asound.conf, One will be called sp.conf and will contain hw:0,0, the second file will be named usb.conf and will contain hw:1,0. Both files will be saved in a new folder called "adio" (Not "audio"). These filenames are all case sensitive. Here's how.

`sudo mkdir /etc/adio`

`sudo cp /etc/asound.conf /etc/adio/sp.conf`

`sudo nano /etc/adio/sp.conf` - Change hw:1,0 to hw:0,0

`sudo cp /etc/asound.conf /etc/adio/usb.conf` - This one should already have hw:1,0

`sudo chmod 000 ~/.asoundrc` - this file resets and will override /etc/asound.conf, above

- `run alsamixer` to change volume. Hit F6 to select audio card.

- Not sure if this is needed, but I have also run:

`sudo apt install alsa-base pulseaudio`

- If this doesn't work, reboot and try again.

You'll need to relaunch your emulator after plugging/unplugging/updating /etc/asound.conf. Oh, and alsamixer doesn't save your volume selection by default. run "sudo alsactl store" to do this.

After all the steps are completed, you may copy UsbAudio.sh and SpeakerAudio.sh to roms/Tools. If your audio does not work, restart the audio service by running `systemctl --user restart pulseaudio` or set your device to sleep, then wake it back up by tapping the power button. 
