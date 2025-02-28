#!/bin/bash

../../../prebuilts/jdk/jdk21/linux-x86/bin/java \
  -jar ../../../prebuilts/extract-tools/common/apktool/apktool.jar b MiuiCameraExtracted

# ../../../prebuilts/jdk/jdk21/linux-x86/bin/java \
#  -Djava.library.path=../../../out/host/linux-x86/lib64 \
#  -jar ../../../out/host/linux-x86/framework/signapk.jar \
#  -w ~/.android-certs/platform.x509.pem ~/.android-certs/platform.pk8 \
#  MiuiCameraExtracted/dist/MiuiCamera.apk MiuiCameraExtracted/dist/MiuiCamera-signed.apk

~/mist/prebuilts/sdk/tools/linux/bin/zipalign -p -f 4 MiuiCameraExtracted/dist/MiuiCamera{,.aligned}.apk

~/mist/prebuilts/sdk/tools/linux/bin/apksigner sign \
 --key ~/.android-certs/platform.pk8 --cert ~/.android-certs/platform.x509.pem \
 MiuiCameraExtracted/dist/MiuiCamera.aligned.apk
