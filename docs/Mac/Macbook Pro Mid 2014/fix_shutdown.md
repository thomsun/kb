# How to fix the random shutdown

## Overview
Macbook Pro mid 2014 (or similar) has a well-known problem that the system is randomly shut itself down. 
The guess is when the system heats up and access GPU, the faulty hardware will crashes the system.
The system won't crash if external screen is connected. Another hack is to run a Python forever loop.

The solution is to disable `AppleThunderbolthNHI.kext` kernal extension, which causes the system to crash.

## Big Sur
In Mohave and older, one can just rename or remove this folder under `/System/Library/Extension`. 
This must be done in every system upgrade.

However, in Catalina and Big Sur, macOS has protection such that the kernal extension is locked and cached so 
one can't just modify any of the system.

The following is the step to overcome that

- Reboot in Rescue Mode by pressing `CMD-R`
- Open terminal and run the following command
  ```shell
  csrutil disable
  csrutil authenticated-root disable
  ```
- Reboot again in Rescue Mode
- Open terminal and run the following command. Note that in the example the main drive is `macOs`
  ```shell
  mount -uw /Volumes/macOS`
  cd /Volumes/macOS/System/Library/Extensions/
  mv AppleThunderboltNHI.kext AppleThunderboltNHI.kext.bak
  rm -rf /Volumes/macOS/System/Library/Caches/*
  kmutil install -u --force --volume-root /Volumes/macOS
  bless --folder /Volumes/macOS/System/Library/CoreServices --bootefi --create-snapshot
  ```
- Reboot to normal mode without enable SIP

## Reference
- https://forums.developer.apple.com/forums/thread/666567
- https://forums.macrumors.com/threads/big-sur-and-applethunderboltnhi-kext.2267818/