#!/bin/bash

# vip-build.sh shell script to build a VIP
#
# Copyright (c) 2018-2019 Wind River Systems, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Modification history
# --------------------
# 12apr19,akh  modified
# 12jul18,rcw  created

set -x 

LOCAL_DIR=$(dirname $(readlink -f $0))
if [ ! -f "${LOCAL_DIR}/common.inc" ]; then
    echo "Cannot found ${LOCAL_DIR}/common.inc"
    exit 1
fi
cd ${LOCAL_DIR}
source common.inc

setup_env

check_vars WORKSPACE VIP_NAME
cd_dir ${WORKSPACE}/${VIP_NAME}

echo "Building the VIP ${VIP_NAME}"
vxprj build
if [ $? -ne 0 ]; then
	echo "Could not build VIP successfully."
	exit 1
fi
