# ROM Build commands for POCO F4 munch

# Remove local_manifests

rm -rf .repo/local_manifests; \

# Repo init

#repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 15 -g default,-mips,-darwin,-notdefault; \
#repo init -u https://github.com/alphadroid-project/manifest -b alpha-15.2 --git-lfs; \
#repo init -u https://github.com/RisingOS-Revived/android -b qpr2 --git-lfs; \
repo init -u https://github.com/crdroidandroid/android.git -b 15.0 --git-lfs; \

# Fix clang error
rm -rf prebuilts/clang/host/linux-x86; \

# Repo sync
/opt/crave/resync.sh; \

# Remove old device specific repos
rm -rf out/target/product/munch; \
rm -rf device/xiaomi/munch; \
rm -rf kernel/xiaomi/munch; \
rm -rf vendor/xiaomi/munch; \
rm -rf hardware/xiaomi; \
rm -rf hardware/dolby; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \
rm -rf packages/apps/ViPER4AndroidFX; \
rm -rf packages/apps/FastCharge; \

# Clone new device specific repos

# Deivce Tree

git clone https://github.com/PocoF4Trees/device_xiaomi_munch device/xiaomi/munch; \

# Vendor Tree
git clone https://github.com/PocoF4Trees/vendor_xiaomi_munch vendor/xiaomi/munch; \

# Firmware
git clone https://github.com/PocoF4Trees/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware; \

# Kernel Tree (N0Kernel)

git clone https://github.com/PocoF4Trees/kernel_xiaomi_munch kernel/xiaomi/munch; \

# Hardware Xiaomi
git clone https://github.com/PocoF4Trees/hardware_xiaomi -b bk hardware/xiaomi; \

# Hardware Dolby
git clone https://github.com/PocoF4Trees/hardware_dolby hardware/dolby; \

# DeviceSettings
git clone https://github.com/PocoF4Trees/packages_resources_devicesettings packages/resources/devicesettings; \

# MIUI Camera
git clone https://github.com/PocoF4Trees/vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

# ViPER4AndroidFX
git clone https://github.com/PocoF4Trees/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX; \

. build/envsetup.sh; \
lunch lineage_munch-bp1a-user && mka bacon
