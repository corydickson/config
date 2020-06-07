#!/bin/sh

status=$(sysctl -n hw.acpi.battery.life)

echo " $status%"
