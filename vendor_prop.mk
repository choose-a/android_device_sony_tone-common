#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1 \
    vendor.audio_hal.period_size=192 \
    ro.vendor.audio.sdk.fluencetype=none \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicerec=false \
    persist.vendor.audio.fluence.speaker=true \
    vendor.audio.tunnel.encode=false \
    vendor.audio.offload.buffer.size.kb=64 \
    audio.offload.video=false \
    vendor.audio.offload.track.enable=true \
    audio.deep_buffer.media=true \
    vendor.voice.path.for.pcm.voip=true \
    vendor.audio.offload.multiaac.enable=true \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.offload.multiple.enabled=true \
    vendor.audio.offload.passthrough=false \
    ro.vendor.audio.sdk.ssr=false \
    vendor.audio.offload.gapless.enabled=true \
    vendor.audio.safx.pbe.enabled=true \
    vendor.audio.parser.ip.buffer.size=262144 \
    vendor.audio.hw.aac.encoder=true \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true \
    vendor.audio.flac.sw.decoder.24bit=true \
    persist.vendor.bt.enable.splita2dp=false \
    qcom.bluetooth.soc=rome \
    ro.bluetooth.emb_wp_mode=true \
    ro.bluetooth.wipower=true \
    camera.disable_zsl_mode=1 \
    Camera.no_navigation_bar=true \
    vendor.media.vpp.enable=true \
    vendor.vidc.enc.disable.pq=true \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-scan=true \
    mmp.enable.3g2=true \
    media.aac_51_output_enabled=true \
    mm.enable.smoothstreaming=true \
    vidc.enc.dcvs.extra-buff-count=2 \
    vendor.vidc.enc.disable.pq=true \
    mm.enable.qcom_parser=760765 \
    persist.mm.enable.prefetch=true \
    ro.vendor.qti.config.zram=true \
    persist.cne.rat.wlan.chip.oem=nqc \
    persist.cne.feature=1 \
    sdm.debug.disable_rotator_split=1 \
    ro.opengles.version=196610 \
    debug.sf.enable_hwc_vds=1 \
    debug.sf.hw=1 \
    debug.sf.latch_unsignaled=1 \
    debug.egl.hw=1 \
    debug.gralloc.enable_fb_ubwc=1 \
    ro.hwui.texture_cache_flushrate=0.5 \
    ro.sf.lcd_density=480 \
    ro.vendor.extension_library=libqti-perfd-client.so \
    ro.vendor.gt_library=libqti-gt.so \
    ro.vendor.at_library=libqti-at.so \
    sys.games.gt.prof=1 \
    ro.com.google.clientidbase=android-sonymobile  \
    ro.com.google.clientidbase.ms=android-sonymobile \
    persist.vendor.ims.vcel_rtcp_report=5 \
    persist.ims.disableUserAgent=1 \
    persist.vendor.radio.add_power_save=1 \
    persist.vendor.radio.block_allow_data=1 \
    persist.vendor.radio.wait_for_pbm=1 \
    persist.vendor.radio.mt_sms_ack=19 \
    persist.vendor.radio.oem_socket=true \
    rild.libpath=vendorlib64libril-qc-qmi-1.so \
    persist.rild.nitz_plmn="" \
    persist.rild.nitz_long_ons_0=""\
    persist.rild.nitz_long_ons_1="" \
    persist.rild.nitz_long_ons_2="" \
    persist.rild.nitz_long_ons_3="" \
    persist.rild.nitz_short_ons_0="" \
    persist.rild.nitz_short_ons_1="" \
    persist.rild.nitz_short_ons_2="" \
    persist.rild.nitz_short_ons_3="" \
    ril.subscription.types=NV,RUIM \
    DEVICE_PROVISIONED=1 \
    ro.nfc.port=I2C \
    ro.qti.sensors.dev_ori=false \
    ro.qti.sensors.pmd=false \
    ro.qti.sensors.sta_detect=false \
    ro.qti.sensors.mot_detect=false \
    ro.use_data_netmgrd=true \
    persist.data.netmgrd.qos.enable=true \
    persist.data.mode=concurrent \
    persist.rmnet.data.enable=true \
    persist.data.wda.enable=true \
    persist.data.df.dl_mode=5 \
    persist.data.df.ul_mode=5 \
    persist.data.df.agg.dl_pkt=10 \
    persist.data.df.agg.dl_size=4096 \
    persist.data.df.mux_count=8 \
    persist.data.df.iwlan_mux=9 \
    persist.data.df.dev_name=rmnet_usb0 \
    ro.control_privapp_permissions=enforce \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=4m \
    dalvik.vm.heapmaxfree=16m \
    dalvik.vm.dex2oat-threads=2 \
    dalvik.vm.image-dex2oat-threads=4 \
    persist.timed.enable=true

