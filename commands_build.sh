# rm -rf local manifests
rm -rf .repo/local_manifests; \

# Repo Init
repo init -u https://github.com/SuperiorOS/manifest.git -b fifteen-los -m stable/latest.xml --git-lfs; \

# repo sync
/opt/crave/resync.sh; \

# rm -rf old repos
rm -rf out/target/product/munch; \
rm -rf device/xiaomi/munch; \
rm -rf device/xiaomi/sm8250-common; \
rm -rf kernel/xiaomi/sm8250; \
rm -rf vendor/xiaomi/munch; \
rm -rf vendor/xiaomi/sm8250-common; \
rm -rf hardware/xiaomi; \
rm -rf vendor/xiaomi/munch-firmware; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \
rm -rf packages/apps/ViPER4AndroidFX; \

# Device Trees
git clone https://github.com/olzhas0986dev/device_xiaomi_munch.git device/xiaomi/munch; \
git clone https://github.com/olzhas0986dev/device_xiaomi_sm8250-common.git device/xiaomi/sm8250-common; \

# Vendor Trees
git clone https://github.com/olzhas0986dev/vendor_xiaomi_munch.git vendor/xiaomi/munch; \
git clone https://github.com/olzhas0986dev/vendor_xiaomi_sm8250-common.git vendor/xiaomi/sm8250-common; \

# Munch Firmware
git clone https://github.com/olzhas0986dev/vendor_xiaomi_munch-firmware.git vendor/xiaomi/munch-firmware; \

# Kernel Tree
git clone https://github.com/olzhas0986dev/kernel_xiaomi_sm8250.git kernel/xiaomi/sm8250; \

# KernelSU-Next
cd kernel/xiaomi/sm8250 && git submodule init && git submodule update && rm -rf KernelSU-Next/userspace/su && cd ../../..; \

# Hardware
git clone https://github.com/LineageOS/android_hardware_xiaomi.git hardware/xiaomi; \

# DeviceSettings
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \

# ViPER4AndroidFX
#git clone https://gitlab.com/rik-x777/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX; \

# MIUI Camera
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

# EvoX moment
#rm -rf vendor/lineage-priv/keys && rm -rf vendor/infinity-priv/keys; \
#rm -rf vendor/qcom/opensource/dataservices; \
#git clone https://github.com/olzhas0986dev/vendor_qcom_opensource_dataservices.git vendor/qcom/opensource/dataservices; \
#rm -rf hardware/google/pixel; \
#git clone https://github.com/olzhas0986dev/android_hardware_google_pixel.git hardware/google/pixel; \

# Build
. build/envsetup.sh; \
breakfast munch; \
m superior
