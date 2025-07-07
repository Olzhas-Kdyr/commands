rm -rf .repo/local_manifests; \

#repo init -u https://github.com/Black-Iron-Project/manifest -b v15_QPR2 --git-lfs; \
repo init -u https://git.libremobileos.com/LMODroid/manifest.git -b fifteen --git-lfs; \

rm -rf prebuilts/clang/host/linux-x86; \

/opt/crave/resync.sh; \

rm -rf out/target/product/munch; \
rm -rf device/xiaomi/munch; \
rm -rf kernel/xiaomi/munch; \
rm -rf vendor/xiaomi/munch; \
rm -rf hardware/xiaomi; \
rm -rf hardware/dolby; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \
rm -rf packages/apps/ViPER4AndroidFX; \

git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_munch.git device/xiaomi/munch; \
git clone https://github.com/munch-devs/android_vendor_xiaomi_munch.git vendor/xiaomi/munch; \
git clone https://github.com/munch-devs/kernel_xiaomi_munch.git -b munch-ksu kernel/xiaomi/munch; \
git clone https://github.com/Olzhas-Kdyr/android_hardware_xiaomi.git hardware/xiaomi; \
git clone https://github.com/munch-devs/android_hardware_dolby.git hardware/dolby; \
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

. build/envsetup.sh; \
lunch lineage_munch-bp1a-user && mka bacon; \

#rm -rf out/target/product/vanilla out/target/product/gapps out/target/product/full_gapps; \
#cd out/target/product && mv munch vanilla && cd ../../..; \
#cd device/xiaomi/munch && rm -rf lineage_munch.mk && mv gapps.txt lineage_munch.mk && cd ../../..; \

#. build/envsetup.sh; \
#blkilunch munch user && blki b
