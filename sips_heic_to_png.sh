#!/bin/bash

# for each *.HEIC file run sips and output a png with the same name
for img in *.HEIC; do sips -s format png "$img" --out "${img%.*}.png"; done
