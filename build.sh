rm -rf .repo/local_manifests

# repo init
repo init -u https://github.com/AOSPA/manifest -b vauxite

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
git clone device/xiaomi/munch

# Kernel Tree
git clone https://github.com/PocoF4Trees/kernel_xiaomi_munch -b yaap-munch kernel/xiaomi/munch

# Build
