# Remove local_manifests

rm -rf .repo/local_manifests; \

# Repo init

#repo init -u https://github.com/PixelOS-AOSP/manifest.git -b sixteen --git-lfs; \
#repo init -u https://github.com/LineageOS/android.git -b lineage-23.0 --git-lfs; \
#repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.0 --git-lfs; \
#repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs; \
repo init -u https://github.com/yaap/manifest.git -b sixteen --git-lfs; \

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

git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_munch.git -b yaap-16 device/xiaomi/munch; \

# Vendor Tree
git clone https://github.com/munch-devs/android_vendor_xiaomi_munch.git -b 16 vendor/xiaomi/munch; \

# Kernel Tree (MagicTime)

git clone https://github.com/Olzhas-Kdyr/kernel_xiaomi_sm8250 kernel/xiaomi/munch; \

# Hardware Xiaomi
git clone https://github.com/Olzhas-Kdyr/android_hardware_xiaomi.git -b 16 hardware/xiaomi; \

# Hardware Dolby Atmos
git clone https://github.com/munch-devs/android_hardware_dolby.git hardware/dolby; \

# DeviceSettings
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \

# MIUI Camera
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

# ViPER4AndroidFX
git clone https://github.com/Olzhas-Kdyr/ViPER4AndroidFX.git packages/apps/ViPER4AndroidFX; \

# Build
#rm -rf packages/apps/ColumbusService; \
#git clone https://github.com/Olzhas-Kdyr/packages_apps_ColumbusService.git -b sixteen packages/apps/ColumbusService; \

#rm -rf packages/services/Telecomm; \
#git clone https://github.com/Olzhas-Kdyr/packages_services_Telecomm.git -b sixteen packages/services/Telecomm; \

#rm -rf bionic; \
#git clone https://github.com/Olzhas-Kdyr/bionic.git bionic; \

source build/envsetup.sh
lunch yaap_munch-user && m yaap
