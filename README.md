![Banner](https://github.com/UnluckyTech/raspi-sb/blob/main/image/banner.png)

:warning: LOOK OVER CODE BEFORE USING. BREAKING CHANGES OCCUR DAILY :warning:

## Contents
- [About](#about)
- [Prerequisites](#prerequisites)
- [Containers](#containers)


### About
Custom Bash Script for configuring a Raspberry Pi into a AIO-IOT Device. 
The idea is to incorporate various solutions for day to day problems for the general user without the headache of doing any sort of maintenance.
Everything will be ran in Docker to further delegate if any issues were to occur.

Installation is being tested on a Raspberry Pi 4.

### Prerequisites
- Debian based distribution (Raspberry Pi OS Lite)
- git

### Installation
```
git clone https://github.com/UnluckyTech/raspi-sb
cd raspi-sb
chmod +x ./main.sh
./main.sh
```

### Containers
- WatchTower (Automate Updates)
- PiHole (Block Ads/Malicious Sites)
- Portainer (Monitor Active Containers)
- WireGuard (Utilize Benefits outside of home network)

