# Remove local manifests

rm -rf .repo/local_manifests; \

# Repo Init

#repo init -u https://github.com/RisingOS-Revived/android -b qpr2 --git-lfs; \
repo init -u https://github.com/Black-Iron-Project/manifest -b v15_QPR2 --git-lfs; \
#repo init -u https://github.com/LineageOS/android.git -b lineage-23.0 --git-lfs; \

# repo sync

rm -rf prebuilts/clang/host/linux-x86; \

/opt/crave/resync.sh; \

# Remove Device,Vendor,Kernel,Hardware,Dolby,MiuiCamera trees

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

# Viperfx

#git clone https://github.com/Olzhas-Kdyr/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX; \

# Build

. build/envsetup.sh; \
#riseup munch user && rise b
blkilunch munch user && blki b; \

rm -rf out/target/product/vanilla out/target/product/gapps out/target/product/full_gapps; \
cd out/target/product && mv munch vanilla && cd ../../..; \
cd device/xiaomi/munch && rm -rf lineage_munch.mk && mv gapps.txt lineage_munch.mk && cd ../../..; \
. build/envsetup.sh; \
blkilunch munch user && blki b
# End
