echo "Setting up ClimateMeter device..."
echo "Please type the device name and press [Enter]:"
read DEVICE_DeviceName
echo "Please type the device description and press [Enter]:"
read DEVICE_DeviceDescription
sed -i 's|{name}|'"${DEVICE_DeviceName}"'|g' ./config/device_info.sh
sed -i 's|{description}|'"${DEVICE_DeviceDescription}"'|g' ./config/device_info.sh
echo "Wrote name and description values into config/device_info.sh"