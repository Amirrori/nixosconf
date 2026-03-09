#! /run/current-system/sw/bin/nix-shell
#! nix-shell -i python3 -I nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos -p python3

import os
import sys
import subprocess

GVT_PCI = "0000:00:02.0"
GVT_GUID = "6061de44-9cf6-47f6-856e-3a3200e20791"
MDEV_TYPE= "i915-GVTg_V5_2"
vmState = sys.argv[2]

match vmstate:
    case "prepare":
        os.system("echo \"" + GVT_GUID + "\" > \"/sys/devices/pci0000:00/" + GVT_PCI + "/mdev_supported_types/" + MDEV_TYPE + "/create\"")
    case  "release":
        os.system("echo 1 > \"/sys/devices/pci0000:00/" + GVT_PCI + "/" + GVT_GUID + "/remove\"")
