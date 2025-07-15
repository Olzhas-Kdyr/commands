# Remove local_manifests

rm -rf .repo/local_manifests; \

# repo init

#repo init -u https://github.com/PixelOS-AOSP/manifest.git -b sixteen --git-lfs; \
#repo init -u https://github.com/LineageOS/android.git -b lineage-23.0 --git-lfs; \
#repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.0 --git-lfs; \
#repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs; \
#repo init -u https://github.com/yaap/manifest.git -b sixteen --git-lfs; \
repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault; \

# Fix clang error
rm -rf prebuilts/clang/host/linux-x86; \

# repo sync script
/opt/crave/resync.sh; \

# Remove old device specific repos
rm -rf out/target/product/munch; \
rm -rf device/xiaomi/munch; \
rm -rf kernel/xiaomi/munch; \
rm -rf vendor/xiaomi/munch; \
rm -rf vendor/xiaomi/munch-firmware; \
rm -rf hardware/xiaomi; \
rm -rf hardware/dolby; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \
rm -rf packages/apps/ViPER4AndroidFX; \
rm -rf packages/apps/FastCharge; \

# Clone new device specific repos

# Deivce Tree
git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_munch.git -b infinity device/xiaomi/munch; \

# Vendor Tree
git clone https://github.com/Olzhas-Kdyr/android_vendor_xiaomi_munch -b 16 vendor/xiaomi/munch; \

# Munch FW
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware; \

# Kernel Tree (N0Kernel)
git clone https://github.com/munch-devs/kernel_xiaomi_munch.git -b 16-ksu kernel/xiaomi/munch; \

# Hardware Xiaomi
git clone https://github.com/Olzhas-Kdyr/android_hardware_xiaomi.git -b 16 hardware/xiaomi; \

# Hardware Dolby Atmos
git clone https://github.com/Olzhas-Kdyr/android_hardware_dolby hardware/dolby; \

# DeviceSettings
git clone https://github.com/Olzhas-Kdyr/android_packages_resources_devicesettings.git packages/resources/devicesettings; \

# MIUI Camera
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

# FastCharge
git clone https://github.com/cyberknight777/android_packages_apps_FastCharge packages/apps/FastCharge; \

# Build
#rm -rf frameworks/base; \
#git clone https://github.com/Olzhas-Kdyr/frameworks_base.git -b 16 frameworks/base; \

. build/envsetup.sh; \
lunch infinity_munch-user && m bacon
