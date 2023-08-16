#!/bin/bash

sudo apt install make  build-essential

# needs SGX SDK (/opt/intel/sgxsdk/buildenv.mk)

# Folders
# QuoteGeneration
# --> various packages in installer/linux/deb/
#   - 

# tools/PCKCertSelection
# tools/PCKRetrievalTool
# tools/SGXPlatformRegistration

# QuoteVerification --> N/A for TDX enablement
# tools/PccsAdminTool/ -> N/A for TDX enablement


cd QuoteGeneration
sudo apt-get install build-essential wget python-is-python3 debhelper zip libcurl4-openssl-dev pkgconf libboost-dev libboost-system-dev libboost-thread-dev protobuf-c-compiler libprotobuf-c-dev protobuf-compiler libssl-dev

if [ ! -f sgx_linux_x64_sdk_2.21.100.1.bin ]; then
		wget https://download.01.org/intel-sgx/latest/dcap-latest/linux/distro/ubuntu22.04-server/sgx_linux_x64_sdk_2.21.100.1.bin
		chmod a+x ./sgx_linux_x64_sdk_2.21.100.1.bin && ./sgx_linux_x64_sdk_2.21.100.1.bin
fi
# INSTALL IN /home/ubuntu/attestation/SGXDataCenterAttestationPrimitives/QuoteGeneration/sgxsdk
source ${PWD}/sgxsdk/environment
make
