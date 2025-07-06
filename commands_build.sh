#rm -rf .repo/local_manifests; \

#repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 15 -g default,-mips,-darwin,-notdefault; \
#repo init -u https://github.com/PixelOS-AOSP/manifest.git -b sixteen --git-lfs; \

#rm -rf prebuilts/clang/host/linux-x86; \

#/opt/crave/resync.sh; \

rm -rf out/target/product/munch; \
#rm -rf device/xiaomi/munch; \
#rm -rf kernel/xiaomi/munch; \
#rm -rf vendor/xiaomi/munch; \
#rm -rf vendor/xiaomi/munch-firmware; \
rm -rf hardware/xiaomi; \
#rm -rf hardware/dolby; \
#rm -rf vendor/xiaomi/miuicamera; \
#rm -rf packages/resources/devicesettings; \
#rm -rf packages/apps/ViPER4AndroidFX; \

#git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_munch.git -b aosp device/xiaomi/munch; \
#git clone https://github.com/munch-devs/android_vendor_xiaomi_munch.git -b 16 vendor/xiaomi/munch; \
#git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware.git vendor/xiaomi/munch-firmware; \
#git clone https://github.com/Olzhas-Kdyr/kernel_xiaomi_sm8250.git kernel/xiaomi/munch; \
git clone https://github.com/Olzhas-Kdyr/android_hardware_xiaomi.git hardware/xiaomi; \
#git clone https://github.com/munch-devs/android_hardware_dolby.git hardware/dolby; \
#git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \
#git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \
#git clone https://github.com/Olzhas-Kdyr/ViPER4AndroidFX.git packages/apps/ViPER4AndroidFX; \

. build/envsetup.sh; \
lunch aosp_munch-bp2a-user && mka bacon; \

#rm -rf out/target/product/vanilla out/target/product/gapps out/target/product/full_gapps; \
#cd out/target/product && mv munch vanilla && cd ../../..; \
#cd device/xiaomi/munch && rm -rf infinity_munch.mk && mv gapps.txt infinity_munch.mk && cd ../../..; \

#. build/envsetup.sh; \
#lunch infinity_munch-user && mka bacon
