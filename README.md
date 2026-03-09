

# Brief

This project is the complete version of my NixOS configs that works. I decided to implement version control for two purposes. One being to be able to keep track of changes and deploy my nix setup anywhere, Second being for people to be able to utilize and learn from what I have learnt in the last year (at least as of writing this).

> [!IMPORTANT]
> This is designed for the thinkpad t480 although can be adjusted for other computers aswell.

## Features

Main features of this setup are:

- SecureBoot
- Zram support
- Clean directory management
- VFIO support with gvt-g
- partial tpm support
- Interesting security features
- Hyprland, regreet and plymouth support
- tlp and throtlled for performance and undervolting
- and more

## Installation

This will be updated in the future, Although I assume that you know how to use Nix and NixOs.
(AND PLEASE READ THE ENTIRE THING BEFORE STARTING TO FOLLOW THIS.)

#### To install follow these steps:

- Follow the regular installation instructions given by the NixOs documentation
- Setup secureBoot with lanzaboote
- OPTIONAL: setup tpm
- change the disk configuration files to your disks at pluto/disks.nix
- add a user.secret having your user description in a string format within users/
- Configure or fully disable throttled and TLP
- Depending if you use Nvidia or any other card, setup hardware.nix accordingly as well (cannot do that for you)
- Add or Remove programs to your liking in common/programs.nix

## What now

I will maintain this repository and add more user friendly functionality from now on. Because my main host uses this config.

Will maybe have a release for server instances too, which applies to more than just personal usage.
