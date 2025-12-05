# OrangeFox device tree for Xiaomi Snapdragon 685 (SM6225-AD) devices
## 1. Xiaomi Redmi Note _12_ 4G (codenamed _topaz_ / _tapas_)
## 2. Xiaomi Redmi Note _13_ 4G (codenamed _sapphire_ / _sapphiren_)
## 3. Xiaomi Redmi 15 4G/POCO M7 4G (codenamed _creek_)

## Device specifications

Device                  | Xiaomi Redmi Note 12 4G / Redmi Note 13 4G / Redmi 15 4G /POCO M7 4G
-----------------------:|:-------------------------------------
SoC                     | Qualcomm Snapdragon® 685 (SM6225)
CPU                     | Octa-core (4x2.8 GHz Cortex-A73 & 4x1.9 GHz Cortex-A53)
GPU                     | Adreno 610
Memory                  | 4/6/8 GB RAM
Shipped Android Version | 13.0 / Android 15, HyperOS 2
Storage                 | 64/128/256 GB (UFS 2.2)
MicroSD                 | Up to 1024 GB (1TB)
Battery                 | Non-removable Li-Po 5000 mAh
Dimensions              | 165.7 x 76 x 7.9 mm
Display                 | 1080 x 2400 pixels, 6.67 inches (~395 ppi density), AMOLED, 120Hz, Dolby Vision

## Device pictures

![ Redmi Note 12 4G ](https://i02.appmifile.com/224_operator_sg/10/03/2023/cdf4a7f40a92668d1c8fe2fcc5045ea8.png "Redmi Note 12 4G")
![ Redmi Note 13 4G ](https://i02.appmifile.com/mi-com-product/fly-birds/redmi-note-13/PC/bac9e4d29124ae838486e7f567d14361.jpg?f=webp "Redmi Note 13 4G")
![ Redmi 15 4G/POCO M7 4G ](https://fdn2.gsmarena.com/vv/pics/xiaomi/xiaomi-poco-m7-4g-2.jpg?f=webp "Redmi 15 4G/POCO M7 4G")

## Features

Works:

- [X] ADB
- [X] Decryption
- [X] Display
- [X] Fastbootd
- [X] Flashing
- [X] MTP
- [X] Sideload
- [X] USB OTG
- [X] MicroSD Card
- [X] Vibrator
- [X] Touchscreen
- [X] Flashlight (except for _creek_)

## Building

You can find a full compile guide for OrangeFox [Here](https://wiki.orangefox.tech/en/dev/building)

_Lunch_ command :

```
lunch twrp_topaz-eng && mka adbd recoveryimage
```

## Credits
- [Original tapas tree by chickendrop89](https://github.com/chickendrop89/orangefox_device_xiaomi_tapas.git)

