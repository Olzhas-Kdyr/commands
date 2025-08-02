rm -rf .repo/local_manifests

# repo init
repo init -u https://github.com/peternmuller/manifest -b vauxite

rm -rf prebuilts/clang/host/linux-x86

# repo sync script
/opt/crave/resync.sh

# Remove old device specific repos
mf=(
device/xiaomi
kernel/msm-4.19
vendor/xiaomi
hardware/xiaomi
)

rm -rf "${mf[@]}"

# Deivce Tree
git clone https://github.com/Olzhas-Kdyr/aospa_device_xiaomi_munch -b vauxite device/xiaomi/munch

# Kernel Tree
git clone https://github.com/PocoF4Trees/kernel_xiaomi_munch -b aospa-munch kernel/xiaomi/munch

# Build
rm -rf vendor/qcom/common
git clone https://github.com/Olzhas-Kdyr/proprietary_vendor_qcom_common vendor/qcom/common
bash rom-build.sh munch
