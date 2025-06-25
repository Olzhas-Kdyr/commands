# rm -rf local manifests

rm -rf .repo/local_manifests; \

# Repo Init

#repo init -u https://github.com/RisingOS-Revived/android -b qpr2 --git-lfs; \
#repo init -u https://github.com/ProjectMatrixx/android.git -b 15.0 --git-lfs; \
#repo init -u https://github.com/PixelOS-AOSP/manifest.git -b sixteen --git-lfs; \
#repo init -u https://github.com/aosp-mirror/platform_manifest.git -b android-latest-release; \
repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs; \

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

git clone https://github.com/Olzhas-Kdyr/los_device_xiaomi_munch device/xiaomi/munch; \
git clone https://github.com/Olzhas-Kdyr/los_device_xiaomi_sm8250-common.git device/xiaomi/sm8250-common; \

# Vendor Trees

git clone https://gitlab.com/rik-x777/vendor_xiaomi_munch vendor/xiaomi/munch; \
git clone https://gitlab.com/rik-x777/vendor_xiaomi_sm8250-common vendor/xiaomi/sm8250-common; \

# Kernel Tree

git clone https://github.com/Olzhas-Kdyr/xiaomi_kernel_sm8250.git -b bpf kernel/xiaomi/sm8250; \

# KernelSU-Next

cd kernel/xiaomi/sm8250 && git submodule init && git submodule update && rm -rf KernelSU-Next/userspace/su && cd ../../..; \

# Hardware

git clone https://github.com/Olzhas-Kdyr/los_android_hardware_xiaomi.git hardware/xiaomi; \

# DeviceSettings

git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \

# ViPER4AndroidFX

git clone https://gitlab.com/rik-x777/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX; \

# MIUI Camera

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

# YAAP stuffs

rm -rf device/qcom/common; \
git clone https://github.com/Olzhas-Kdyr/device_qcom_common.git -b fifteen device/qcom/common; \
rm -rf vendor/yaap; \
git clone https://github.com/Olzhas-Kdyr/vendor_yaap.git -b fifteen vendor/yaap; \

# Build 

. build/envsetup.sh; \
lunch yaap_munch-userdebug && m yaap
