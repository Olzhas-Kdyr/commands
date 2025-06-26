# Remove local manifests

rm -rf .repo/local_manifests; \

# Repo Init

repo init -u https://github.com/RisingOS-Revived/android -b qpr2 --git-lfs; \

# repo sync

/opt/crave/resync.sh; \

# Remove Device,Vendor,Kernel,Hardware,Dolby,MiuiCamera trees

rm -rf out/target/product/munch; \
rm -rf device/xiaomi/munch; \
rm -rf kernel/xiaomi/munch; \
rm -rf vendor/xiaomi/munch; \
rm -rf hardware/xiaomi; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \

# Device Tree

git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_munch.git device/xiaomi/munch; \

# Vendor Tree

git clone https://github.com/munch-devs/android_vendor_xiaomi_munch.git vendor/xiaomi/munch; \

# Kernel Tree

git clone https://github.com/munch-devs/kernel_xiaomi_munch.git -b munch-ksu-susfs kernel/xiaomi/munch; \

# Hardware Xiaomi

git clone https://github.com/Olzhas-Kdyr/android_hardware_xiaomi.git hardware/xiaomi; \

# Hardware Dolby

git clone https://github.com/munch-devs/android_hardware_dolby.git hardware/dolby; \

# Device Settings

git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \

# MIUI Camera

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

# Build

. build/envsetup.sh; \
riseup munch user && rise b
# End
