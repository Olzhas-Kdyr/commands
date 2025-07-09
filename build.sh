# Remove local_manifests

rm -rf .repo/local_manifests; \

# Repo init

#repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 15 -g default,-mips,-darwin,-notdefault; \
repo init -u https://github.com/alphadroid-project/manifest -b alpha-15.2 --git-lfs; \

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

# Clone new device specific repos

# Deivce Tree

git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_munch.git device/xiaomi/munch; \

# Vendor Tree
git clone https://github.com/munch-devs/android_vendor_xiaomi_munch.git vendor/xiaomi/munch; \

# Kernel Tree (MagicTime)

git clone https://github.com/Olzhas-Kdyr/kernel_xiaomi_sm8250 kernel/xiaomi/munch; \

# Hardware Xiaomi
git clone https://github.com/Olzhas-Kdyr/android_hardware_xiaomi.git hardware/xiaomi; \

# Hardware Dolby Atmos
git clone https://github.com/munch-devs/android_hardware_dolby.git hardware/dolby; \

# DeviceSettings
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \

# MIUI Camera
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

# ViPER4AndroidFX
git clone https://github.com/Olzhas-Kdyr/ViPER4AndroidFX.git packages/apps/ViPER4AndroidFX; \

# Build

. build/envsetup.sh; \
lunch alpha_munch-user && make bacon

#rm -rf out/target/product/vanilla out/target/product/gapps out/target/product/full_gapps; \
#cd out/target/product && mv munch vanilla && cd ../../..; \
#cd device/xiaomi/munch && rm -rf lineage_munch.mk && mv gapps.txt lineage_munch.mk && cd ../../..; \

#. build/envsetup.sh; \
