# rm -rf local manifests
rm -rf .repo/local_manifests; \

# Repo Init
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs; \

# repo sync
/opt/crave/resync.sh; \

# rm -rf old repos
rm -rf out/target/product/munch; \
rm -rf device/xiaomi/munch; \
rm -rf kernel/xiaomi/munch; \
rm -rf vendor/xiaomi/munch; \
rm -rf hardware/xiaomi; \
rm -rf hardware/dolby; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \
rm -rf packages/apps/ViPER4AndroidFX; \

# Device Tree
git clone https://github.com/olzhas0986dev/android_device_xiaomi_munch.git device/xiaomi/munch; \

# Vendor Tree
git clone https://github.com/olzhas0986dev/android_vendor_xiaomi_munch.git vendor/xiaomi/munch; \

# Kernel Tree
git clone https://github.com/Olzhas-Kdyr/xiaomi_kernel_sm8250.git -b bpf kernel/xiaomi/munch; \

# Hardware Xiaomi
git clone https://github.com/Olzhas-Kdyr/android_hardware_xiaomi.git hardware/xiaomi; \

# Hardware Dolby
git clone https://github.com/munch-devs/android_hardware_dolby.git hardware/dolby; \

# DeviceSettings
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \

# ViPER4AndroidFX
git clone https://github.com/olzhas0986dev/ViPER4AndroidFX.git packages/apps/ViPER4AndroidFX; \

# MIUI Camera
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

# Evox stuffs
rm -rf hardware/google/pixel; \
git clone https://github.com/olzhas0986dev/android_hardware_google_pixel hardware/google/pixel; \

rm -rf vendor/qcom/opensource/dataservices; \
git clone https://github.com/Evolution-X/vendor_qcom_opensource_dataservices vendor/qcom/opensource/dataservices; \

# Build
. build/envsetup.sh; \
lunch lineage_munch-bp2a-user && m evolution; \ 
