# Remove local_manifests

rm -rf .repo/local_manifests; \

# repo init

#repo init -u https://github.com/PixelOS-AOSP/manifest.git -b sixteen --git-lfs; \
#repo init -u https://github.com/LineageOS/android.git -b lineage-23.0 --git-lfs; \
#repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.0 --git-lfs; \
#repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs; \
#repo init -u https://github.com/yaap/manifest.git -b sixteen --git-lfs; \
#repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault; \
repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs; \

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

# Clone new device specific repos

# Deivce Tree
git clone https://github.com/PocoF4Trees/device_xiaomi_munch.git -b 16 device/xiaomi/munch; \

# Vendor Tree
git clone https://github.com/PocoF4Trees/vendor_xiaomi_munch -b 16 vendor/xiaomi/munch; \

# Munch FW
git clone https://github.com/PocoF4Trees/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware; \

# Kernel Tree (N0Kernel)
git clone https://github.com/PocoF4Trees/kernel_xiaomi_munch kernel/xiaomi/munch; \

# Hardware Xiaomi
git clone https://github.com/PocoF4Trees/hardware_xiaomi -b 16 hardware/xiaomi; \

# Hardware Dolby Atmos
git clone https://github.com/PocoF4Trees/hardware_dolby hardware/dolby; \

# DeviceSettings
git clone https://github.com/PocoF4Trees/packages_resources_devicesettings packages/resources/devicesettings; \

# MIUI Camera
git clone https://github.com/PocoF4Trees/vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

# ViPER4AndroidFX
git clone https://github.com/PocoF4Trees/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX; \

# Build
#rm -rf frameworks/base; \
#git clone https://github.com/Olzhas-Kdyr/fb -b 16 frameworks/base; \
#rm -rf packages/modules/Connectivity; \
#git clone https://github.com/Olzhas-Kdyr/packages_modules_Connectivity.git -b 16 packages/modules/Connectivity; \

#rm -rf vendor/qcom/opensource/vibrator; \
#git clone https://github.com/Olzhas-Kdyr/vendor_qcom_opensource_vibrator.git -b lineage-23.0 vendor/qcom/opensource/vibrator; \

. build/envsetup.sh; \
lunch lineage_munch-bp2a-user && m lunaris
