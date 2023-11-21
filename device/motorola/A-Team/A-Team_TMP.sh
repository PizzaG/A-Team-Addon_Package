#!/system/bin/sh

#
# Copyright 2019-Present A-Team Digital Solutions
#

# A-Team Post-Setup Auto Detection
if [ -f /data/cache/Lock.a-team ]; then 

# A-Team Start Notification
su -lp 2000 -c "cmd notification post -S bigtext -t 'A-Team Notification - Start' 'Tag' 'A-Team Setup Started, Please Be Patient...'"

sleep 25

# A-Team App Installation
pm install -r "/product/A-Team_TMP/Apps/Cricket-VVM.apk"
sleep 1
pm install -r "/product/A-Team_TMP/Apps/MyCricket.apk"
sleep 1
pm install -r "/product/A-Team_TMP/Apps/OpenCamera.apk"
sleep 1
pm install -r "/product/A-Team_TMP/Apps/X-Plore.apk"

sleep 1

# A-Team App Internet Patch
su -c settings put global restricted_networking_mode 0

sleep 1

# A-Team Custom Device Settings
cmd uimode night yes
sleep 1
su -c settings put global mobile_data_always_on 1
sleep 1
su -c settings put global transition_animation_scale 0
sleep 1
su -c settings put global window_animation_scale 0
sleep 1
su -c settings put global animator_duration_scale 0
sleep 1
su -c settings put global force_gpu_rendering 1
sleep 1
su -c settings put global bluetooth_on 0 
sleep 1
su -c settings put global zram_enabled 1  
sleep 1                                                                                                                                        
su -c settings put global package_verifier_enable 0 
sleep 1                                                                                                                              
su -c settings put global package_verifier_user_consent 1 
sleep 1                                                                                                                    
su -c settings put global show_zen_settings_suggestion 0 
sleep 1
su -c settings put global audio_safe_volume_state 0 
sleep 1
su -c settings put global set_install_location 1
sleep 1
su -c settings put global usb_mass_storage_enabled 1
sleep 1
su -c settings put global ambient_enabled 0
sleep 1
su -c settings put global ambient_tilt_to_wake 0
sleep 1
su -c settings put global ambient_touch_to_wake 0
sleep 1
su -c settings put system lift_to_wake 0
sleep 1
su -c settings put secure doze_quick_pickup_gesture 0
sleep 1
su -c settings put global wifi_scan_always_enabled 0
sleep 1
su -c settings put global wifi_networks_available_notification_on 0
sleep 1
su -c settings put global camera_double_tap_power_gesture_disabled 1
sleep 1
su -c settings put global wifi_on 0
sleep 1
su -c settings put secure dialer_default_application com.google.android.dialer
sleep 1
su -c settings put secure volume_hush_gesture 0 
sleep 1
su -c settings put system sound_effects_enabled 0
sleep 1
su -c settings put system rotation 0
sleep 1
su -c settings put system vibrate_when_ringing 1
sleep 1
su -c settings put secure doze_enabled 0

sleep 1

# A-Team Tether Hack
su -c settings put global tether_dun_required 0

sleep 1

# A-Team Custom Wallpapers
su -c cp -r /product/A-Team_TMP/Wallpapers /storage/emulated/0/Pictures

sleep 1

# A-Team X-Plore File Manager Settings
am start -a android.intent.action.MAIN -n com.lonelycatgames.Xplore/com.lonelycatgames.Xplore.Browser
sleep 3
am force-stop com.lonelycatgames.Xplore
sleep 2
su -c cp -r /product/A-Team_TMP/config.xml /data/data/com.lonelycatgames.Xplore/shared_prefs/config.xml
su -c cp -r /product/A-Team_TMP/prefs.xml /data/data/com.lonelycatgames.Xplore/shared_prefs/prefs.xml

sleep 1

# Remove A-Team Lock
su -c rm -rf /data/cache/Lock.a-team

sleep 1

# A-Team End Notification
su -lp 2000 -c "cmd notification post -S bigtext -t 'A-Team Notification - End' 'Tag' 'A-Team Setup Complete! Please Open Magisk Manager, Select Install Magisk, Select Direct Install Option & Reboot When Install Finishes ...'"

exit
else
exit
fi
