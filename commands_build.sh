#! /bin/bash

rm -rf .repo/local_manifests; \

#repo init -u https://github.com/crdroidandroid/android -b 15.0 --git-lfs; \
#repo init -u https://github.com/RisingOS-Revived/android -b qpr2 --git-lfs; \
#repo init -u https://github.com/ProjectInfinity-X/manifest -b 15 --git-lfs; \
#repo init -u https://github.com/ProjectMatrixx/android -b 15.0 --git-lfs; \
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs; \

/opt/crave/resync.sh; \

rm -rf out/target/product/munch && rm -rf device/xiaomi/munch && rm -rf device/xiaomi/sm8250-common && rm -rf kernel/xiaomi/sm8250; \
rm -rf vendor/xiaomi/munch && rm -rf vendor/xiaomi/sm8250-common && rm -rf hardware/xiaomi && rm -rf vendor/xiaomi/munch-firmware; \
rm -rf vendor/xiaomi/miuicamera && rm -rf packages/resources/devicesettings && rm -rf packages/apps/ViPER4AndroidFX; \

git clone https://gitlab.com/rik-x777/device_xiaomi_munch device/xiaomi/munch; \
git clone https://gitlab.com/rik-x777/device_xiaomi_sm8250-common device/xiaomi/sm8250-common; \
git clone https://gitlab.com/rik-x777/vendor_xiaomi_munch vendor/xiaomi/munch; \
git clone https://gitlab.com/rik-x777/vendor_xiaomi_sm8250-common vendor/xiaomi/sm8250-common; \
git clone https://gitlab.com/rik-x777/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware; \

#git clone https://gitlab.com/rik-x777/kernel_xiaomi_sm8250 kernel/xiaomi/sm8250; \
git clone https://github.com/SenseiiX/fusionX_sm8250 -b stable-nxt kernel/xiaomi/sm8250; \
cd kernel/xiaomi/sm8250 && git submodule init && git submodule update && rm -rf KernelSU-Next/userspace/su && cd ../../..; \

#git clone https://github.com/LineageOS/android_hardware_xiaomi hardware/xiaomi; \
git clone https://github.com/Evolution-X-Devices/hardware_xiaomi hardware/xiaomi; \

git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \
git clone https://gitlab.com/rik-x777/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX; \
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

#rm -rf device/lineage/sepolicy; \
#git clone https://github.com/rik-x777/android_device_lineage_sepolicy -b qpr2 device/lineage/sepolicy; \

rm -rf vendor/lineage-priv/keys && rm -rf vendor/infinity-priv/keys; \

#git clone https://gitlab.com/rik-x777/keys.git vendor/lineage-priv/keys; \
#git clone https://gitlab.com/rik-x777/keys.git -b inf vendor/infinity-priv/keys; \
#git clone https://gitlab.com/rik-x777/keys.git -b ros vendor/lineage-priv/keys; \

. build/envsetup.sh; \

#brunch munch; \
#riseup munch user && rise b; \
#lunch infinity_munch-user && mka bacon; \
lunch lineage_munch-bp2a-user && m evolution; \

#rm -rf out/target/product/vanilla && rm -rf out/target/product/gapps; \
#cd out/target/product && mv munch vanilla && cd ../../..; \
#cd device/xiaomi/munch && rm infinity_munch.mk && mv gapps.txt infinity_munch.mk && cd ../../..; \
#cd device/xiaomi/munch && rm lineage_munch.mk && mv gapps.txt lineage_munch.mk && cd ../../..; \
#. build/envsetup.sh; \
#lunch infinity_munch-user && mka bacon; \
#riseup munch user && rise b; \
#cd out/target/product && mv munch gapps && cd ../../..; \
