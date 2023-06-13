#!/bin/bash

set -e

CRUST_INJECT_DIR="${BINARIES_DIR}/crust-inject"
GENIMAGE_CFG="../resources/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

mkdir -p "${CRUST_INJECT_DIR}"
cp "../resources/cmdline.txt" "${CRUST_INJECT_DIR}/cmdline.txt"

trap 'rm -rf "${ROOTPATH_TMP}"' EXIT
ROOTPATH_TMP="$(mktemp -d)"

rm -rf "${GENIMAGE_TMP}"

genimage \
	--rootpath "${ROOTPATH_TMP}"   \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

exit $?
