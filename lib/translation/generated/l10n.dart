// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `RWS App`
  String get appName {
    return Intl.message(
      'RWS App',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get greeting {
    return Intl.message(
      'Hello',
      name: 'greeting',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get button_yes {
    return Intl.message(
      'Yes',
      name: 'button_yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get button_no {
    return Intl.message(
      'No',
      name: 'button_no',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get button_ok {
    return Intl.message(
      'Ok',
      name: 'button_ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get button_cancel {
    return Intl.message(
      'Cancel',
      name: 'button_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get button_close {
    return Intl.message(
      'Close',
      name: 'button_close',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get button_retry {
    return Intl.message(
      'Retry',
      name: 'button_retry',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get button_settings {
    return Intl.message(
      'Settings',
      name: 'button_settings',
      desc: '',
      args: [],
    );
  }

  /// `No, thanks!`
  String get button_no_thanks {
    return Intl.message(
      'No, thanks!',
      name: 'button_no_thanks',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get button_update {
    return Intl.message(
      'Update',
      name: 'button_update',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get button_done {
    return Intl.message(
      'Done',
      name: 'button_done',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get button_submit {
    return Intl.message(
      'Submit',
      name: 'button_submit',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get button_create {
    return Intl.message(
      'Create',
      name: 'button_create',
      desc: '',
      args: [],
    );
  }

  /// `Enable`
  String get button_enable {
    return Intl.message(
      'Enable',
      name: 'button_enable',
      desc: '',
      args: [],
    );
  }

  /// `Leave`
  String get button_leave {
    return Intl.message(
      'Leave',
      name: 'button_leave',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get button_save {
    return Intl.message(
      'Save',
      name: 'button_save',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get button_edit {
    return Intl.message(
      'Edit',
      name: 'button_edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get button_delete {
    return Intl.message(
      'Delete',
      name: 'button_delete',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get button_add {
    return Intl.message(
      'Add',
      name: 'button_add',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get button_draft {
    return Intl.message(
      'Draft',
      name: 'button_draft',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get button_submit_request {
    return Intl.message(
      'Submit',
      name: 'button_submit_request',
      desc: '',
      args: [],
    );
  }

  /// `Upload Logo`
  String get button_upload_logo {
    return Intl.message(
      'Upload Logo',
      name: 'button_upload_logo',
      desc: '',
      args: [],
    );
  }

  /// `Remove Logo`
  String get button_remove_logo {
    return Intl.message(
      'Remove Logo',
      name: 'button_remove_logo',
      desc: '',
      args: [],
    );
  }

  /// `Choose File`
  String get button_choose_file {
    return Intl.message(
      'Choose File',
      name: 'button_choose_file',
      desc: '',
      args: [],
    );
  }

  /// `Choose Image`
  String get button_choose_image {
    return Intl.message(
      'Choose Image',
      name: 'button_choose_image',
      desc: '',
      args: [],
    );
  }

  /// `Upload Profile`
  String get button_upload_profile {
    return Intl.message(
      'Upload Profile',
      name: 'button_upload_profile',
      desc: '',
      args: [],
    );
  }

  /// `Remove Profile`
  String get button_remove_profile {
    return Intl.message(
      'Remove Profile',
      name: 'button_remove_profile',
      desc: '',
      args: [],
    );
  }

  /// `Khmer`
  String get lang_khmer {
    return Intl.message(
      'Khmer',
      name: 'lang_khmer',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get lang_english {
    return Intl.message(
      'English',
      name: 'lang_english',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get gender_female {
    return Intl.message(
      'Female',
      name: 'gender_female',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get gender_male {
    return Intl.message(
      'Male',
      name: 'gender_male',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get gender_other {
    return Intl.message(
      'Other',
      name: 'gender_other',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `EEEE, MMMM dd, yyyy | hh:mm:ss a`
  String get real_time_date_format {
    return Intl.message(
      'EEEE, MMMM dd, yyyy | hh:mm:ss a',
      name: 'real_time_date_format',
      desc: '',
      args: [],
    );
  }

  /// `Server`
  String get server {
    return Intl.message(
      'Server',
      name: 'server',
      desc: '',
      args: [],
    );
  }

  /// `Biometric Enabled`
  String get biometric_enabled {
    return Intl.message(
      'Biometric Enabled',
      name: 'biometric_enabled',
      desc: '',
      args: [],
    );
  }

  /// `Biometric Enabling`
  String get biometric_enabling {
    return Intl.message(
      'Biometric Enabling',
      name: 'biometric_enabling',
      desc: '',
      args: [],
    );
  }

  /// `To login and access any sensitive functions.`
  String get biometric_enabled_desc {
    return Intl.message(
      'To login and access any sensitive functions.',
      name: 'biometric_enabled_desc',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure this device uses only your fingerprint/face.\n\nIf you use this device with others, we suggest you to use the PIN to login. Anyway, you can change this option later in settings.`
  String get enable_biometric_tips {
    return Intl.message(
      'Please make sure this device uses only your fingerprint/face.\n\nIf you use this device with others, we suggest you to use the PIN to login. Anyway, you can change this option later in settings.',
      name: 'enable_biometric_tips',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your biometric to continue`
  String get scan_to_authenticate {
    return Intl.message(
      'Please verify your biometric to continue',
      name: 'scan_to_authenticate',
      desc: '',
      args: [],
    );
  }

  /// `Biometric authentication has been disabled. Please lock and unlock your device again.`
  String get msg_reenable_biometric {
    return Intl.message(
      'Biometric authentication has been disabled. Please lock and unlock your device again.',
      name: 'msg_reenable_biometric',
      desc: '',
      args: [],
    );
  }

  /// `Biometric authentication is not setup on your device. Please either enable Fingerprint or Face ID.`
  String get please_setup_biometric {
    return Intl.message(
      'Biometric authentication is not setup on your device. Please either enable Fingerprint or Face ID.',
      name: 'please_setup_biometric',
      desc: '',
      args: [],
    );
  }

  /// `Biometric authentication enabled!`
  String get enable_biometric_success {
    return Intl.message(
      'Biometric authentication enabled!',
      name: 'enable_biometric_success',
      desc: '',
      args: [],
    );
  }

  /// `The biometric authentication is disabled due to device's setting changes.`
  String get msg_biometric_disabled_by_system {
    return Intl.message(
      'The biometric authentication is disabled due to device\'s setting changes.',
      name: 'msg_biometric_disabled_by_system',
      desc: '',
      args: [],
    );
  }

  /// `Biometric Authentication Disabled`
  String get title_biometric_auth_disabled {
    return Intl.message(
      'Biometric Authentication Disabled',
      name: 'title_biometric_auth_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to disable the biometric authentication?`
  String get msg_confirm_disable_biometric {
    return Intl.message(
      'Do you want to disable the biometric authentication?',
      name: 'msg_confirm_disable_biometric',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Access`
  String get title_no_internet_access {
    return Intl.message(
      'No Internet Access',
      name: 'title_no_internet_access',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection and try again.`
  String get msg_check_your_internet_connection {
    return Intl.message(
      'Please check your internet connection and try again.',
      name: 'msg_check_your_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized users - system will be automatically logout! Please try again.`
  String get error_unauthorized {
    return Intl.message(
      'Unauthorized users - system will be automatically logout! Please try again.',
      name: 'error_unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get success {
    return Intl.message(
      'Success!',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Password mismatch`
  String get password_mismatch {
    return Intl.message(
      'Password mismatch',
      name: 'password_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `AM`
  String get time_am {
    return Intl.message(
      'AM',
      name: 'time_am',
      desc: '',
      args: [],
    );
  }

  /// `PM`
  String get time_pm {
    return Intl.message(
      'PM',
      name: 'time_pm',
      desc: '',
      args: [],
    );
  }

  /// `Update Available`
  String get title_version_update {
    return Intl.message(
      'Update Available',
      name: 'title_version_update',
      desc: '',
      args: [],
    );
  }

  /// `Dear valued user, please update to the latest version to benefit from it most and continue using the app.`
  String get msg_version_force_update {
    return Intl.message(
      'Dear valued user, please update to the latest version to benefit from it most and continue using the app.',
      name: 'msg_version_force_update',
      desc: '',
      args: [],
    );
  }

  /// `Dear valued user, please update to the latest version to benefit from it most.`
  String get msg_version_update {
    return Intl.message(
      'Dear valued user, please update to the latest version to benefit from it most.',
      name: 'msg_version_update',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deactivate_account {
    return Intl.message(
      'Delete Account',
      name: 'deactivate_account',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete the account "{name}"?\n\n- All your linked accounts will be deleted.\n- You will no longer receive notifications about your electricity bill, latest news from EAC and many more good benefits from EAC App.`
  String msg_confirm_deactivate_account_(Object name) {
    return Intl.message(
      'Are you sure to delete the account "$name"?\n\n- All your linked accounts will be deleted.\n- You will no longer receive notifications about your electricity bill, latest news from EAC and many more good benefits from EAC App.',
      name: 'msg_confirm_deactivate_account_',
      desc: '',
      args: [name],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Save profile failed!`
  String get save_profile_failed {
    return Intl.message(
      'Save profile failed!',
      name: 'save_profile_failed',
      desc: '',
      args: [],
    );
  }

  /// `Your profile has been updated!`
  String get your_profile_has_been_updated {
    return Intl.message(
      'Your profile has been updated!',
      name: 'your_profile_has_been_updated',
      desc: '',
      args: [],
    );
  }

  /// `Grant Photo Access`
  String get photo_permission {
    return Intl.message(
      'Grant Photo Access',
      name: 'photo_permission',
      desc: '',
      args: [],
    );
  }

  /// `Allow the app to access your device photos in app setting.`
  String get msg_allow_photo_permission {
    return Intl.message(
      'Allow the app to access your device photos in app setting.',
      name: 'msg_allow_photo_permission',
      desc: '',
      args: [],
    );
  }

  /// `Grant Storage Access`
  String get storage_permission {
    return Intl.message(
      'Grant Storage Access',
      name: 'storage_permission',
      desc: '',
      args: [],
    );
  }

  /// `Allow the app to access your device storage in app setting.`
  String get msg_allow_storage_permission {
    return Intl.message(
      'Allow the app to access your device storage in app setting.',
      name: 'msg_allow_storage_permission',
      desc: '',
      args: [],
    );
  }

  /// `Grant Camera Access`
  String get camera_permission {
    return Intl.message(
      'Grant Camera Access',
      name: 'camera_permission',
      desc: '',
      args: [],
    );
  }

  /// `Allow the app to access your camera in app setting.`
  String get msg_allow_camera_permission {
    return Intl.message(
      'Allow the app to access your camera in app setting.',
      name: 'msg_allow_camera_permission',
      desc: '',
      args: [],
    );
  }

  /// `Image uploading failed!`
  String get upload_image_failure {
    return Intl.message(
      'Image uploading failed!',
      name: 'upload_image_failure',
      desc: '',
      args: [],
    );
  }

  /// `expired today`
  String get expired_today {
    return Intl.message(
      'expired today',
      name: 'expired_today',
      desc: '',
      args: [],
    );
  }

  /// `Just now`
  String get just_now {
    return Intl.message(
      'Just now',
      name: 'just_now',
      desc: '',
      args: [],
    );
  }

  /// `{year} year ago`
  String single_year_ago_(Object year) {
    return Intl.message(
      '$year year ago',
      name: 'single_year_ago_',
      desc: '',
      args: [year],
    );
  }

  /// `{year} years ago`
  String plural_year_ago_(Object year) {
    return Intl.message(
      '$year years ago',
      name: 'plural_year_ago_',
      desc: '',
      args: [year],
    );
  }

  /// `{month} month ago`
  String single_month_ago_(Object month) {
    return Intl.message(
      '$month month ago',
      name: 'single_month_ago_',
      desc: '',
      args: [month],
    );
  }

  /// `{month} months ago`
  String plural_month_ago_(Object month) {
    return Intl.message(
      '$month months ago',
      name: 'plural_month_ago_',
      desc: '',
      args: [month],
    );
  }

  /// `{week} week ago`
  String single_week_ago_(Object week) {
    return Intl.message(
      '$week week ago',
      name: 'single_week_ago_',
      desc: '',
      args: [week],
    );
  }

  /// `{week} weeks ago`
  String plural_week_ago_(Object week) {
    return Intl.message(
      '$week weeks ago',
      name: 'plural_week_ago_',
      desc: '',
      args: [week],
    );
  }

  /// `{day} day ago`
  String single_day_ago_(Object day) {
    return Intl.message(
      '$day day ago',
      name: 'single_day_ago_',
      desc: '',
      args: [day],
    );
  }

  /// `{day} days ago`
  String plural_day_ago_(Object day) {
    return Intl.message(
      '$day days ago',
      name: 'plural_day_ago_',
      desc: '',
      args: [day],
    );
  }

  /// `{hour} hour ago`
  String single_hour_ago_(Object hour) {
    return Intl.message(
      '$hour hour ago',
      name: 'single_hour_ago_',
      desc: '',
      args: [hour],
    );
  }

  /// `{hour} hours ago`
  String plural_hour_ago_(Object hour) {
    return Intl.message(
      '$hour hours ago',
      name: 'plural_hour_ago_',
      desc: '',
      args: [hour],
    );
  }

  /// `{minute} minute ago`
  String single_minute_ago_(Object minute) {
    return Intl.message(
      '$minute minute ago',
      name: 'single_minute_ago_',
      desc: '',
      args: [minute],
    );
  }

  /// `{minute} minutes ago`
  String plural_minute_ago_(Object minute) {
    return Intl.message(
      '$minute minutes ago',
      name: 'plural_minute_ago_',
      desc: '',
      args: [minute],
    );
  }

  /// `Error`
  String get title_error {
    return Intl.message(
      'Error',
      name: 'title_error',
      desc: '',
      args: [],
    );
  }

  /// `Crop Image`
  String get title_crop_image {
    return Intl.message(
      'Crop Image',
      name: 'title_crop_image',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get title_camera {
    return Intl.message(
      'Camera',
      name: 'title_camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get title_gallery {
    return Intl.message(
      'Gallery',
      name: 'title_gallery',
      desc: '',
      args: [],
    );
  }

  /// `expired {x} day ago`
  String count_single_day_expired_(Object x) {
    return Intl.message(
      'expired $x day ago',
      name: 'count_single_day_expired_',
      desc: '',
      args: [x],
    );
  }

  /// `expired {x} days ago`
  String count_plural_day_expired_(Object x) {
    return Intl.message(
      'expired $x days ago',
      name: 'count_plural_day_expired_',
      desc: '',
      args: [x],
    );
  }

  /// `expired in {x} day`
  String count_single_day_to_be_expired_(Object x) {
    return Intl.message(
      'expired in $x day',
      name: 'count_single_day_to_be_expired_',
      desc: '',
      args: [x],
    );
  }

  /// `expired in {x} days`
  String count_plural_day_to_be_expired_(Object x) {
    return Intl.message(
      'expired in $x days',
      name: 'count_plural_day_to_be_expired_',
      desc: '',
      args: [x],
    );
  }

  /// `{count} day`
  String count_single_day_(Object count) {
    return Intl.message(
      '$count day',
      name: 'count_single_day_',
      desc: '',
      args: [count],
    );
  }

  /// `{count} days`
  String count_plural_day_(Object count) {
    return Intl.message(
      '$count days',
      name: 'count_plural_day_',
      desc: '',
      args: [count],
    );
  }

  /// `{count} hour`
  String count_single_hour_(Object count) {
    return Intl.message(
      '$count hour',
      name: 'count_single_hour_',
      desc: '',
      args: [count],
    );
  }

  /// `{count} hours`
  String count_plural_hour_(Object count) {
    return Intl.message(
      '$count hours',
      name: 'count_plural_hour_',
      desc: '',
      args: [count],
    );
  }

  /// `{count} minute`
  String count_single_minute_(Object count) {
    return Intl.message(
      '$count minute',
      name: 'count_single_minute_',
      desc: '',
      args: [count],
    );
  }

  /// `{count} minutes`
  String count_plural_minute_(Object count) {
    return Intl.message(
      '$count minutes',
      name: 'count_plural_minute_',
      desc: '',
      args: [count],
    );
  }

  /// `Copied`
  String get copied {
    return Intl.message(
      'Copied',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `Remove Profile Picture`
  String get title_remove_profile {
    return Intl.message(
      'Remove Profile Picture',
      name: 'title_remove_profile',
      desc: '',
      args: [],
    );
  }

  /// `Remove Profile Picture?`
  String get msg_title_remove_profile {
    return Intl.message(
      'Remove Profile Picture?',
      name: 'msg_title_remove_profile',
      desc: '',
      args: [],
    );
  }

  /// `Your picture will be removed. This avatar will be used in your profile.`
  String get msg_remove_profile {
    return Intl.message(
      'Your picture will be removed. This avatar will be used in your profile.',
      name: 'msg_remove_profile',
      desc: '',
      args: [],
    );
  }

  /// `DEMO`
  String get testing_environment {
    return Intl.message(
      'DEMO',
      name: 'testing_environment',
      desc: '',
      args: [],
    );
  }

  /// `- Please check your internet connection\n- Encountered technical issues - we are working to resolve\n\nWe apologize and try again later.`
  String get app_load_config_failed {
    return Intl.message(
      '- Please check your internet connection\n- Encountered technical issues - we are working to resolve\n\nWe apologize and try again later.',
      name: 'app_load_config_failed',
      desc: '',
      args: [],
    );
  }

  /// `System Maintenance`
  String get under_maintenance {
    return Intl.message(
      'System Maintenance',
      name: 'under_maintenance',
      desc: '',
      args: [],
    );
  }

  /// `We apologize for the service interruption due to system maintenance. The service will be back online shortly.`
  String get under_maintenance_description {
    return Intl.message(
      'We apologize for the service interruption due to system maintenance. The service will be back online shortly.',
      name: 'under_maintenance_description',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to logout?`
  String get confirm_logout_message {
    return Intl.message(
      'Do you want to logout?',
      name: 'confirm_logout_message',
      desc: '',
      args: [],
    );
  }

  /// `Your logout attempt failed.`
  String get error_logout_failure {
    return Intl.message(
      'Your logout attempt failed.',
      name: 'error_logout_failure',
      desc: '',
      args: [],
    );
  }

  /// `Change password failure`
  String get change_password_failure {
    return Intl.message(
      'Change password failure',
      name: 'change_password_failure',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Input current password`
  String get input_current_password {
    return Intl.message(
      'Input current password',
      name: 'input_current_password',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get current_password {
    return Intl.message(
      'Current password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `Input new password`
  String get input_new_password {
    return Intl.message(
      'Input new password',
      name: 'input_new_password',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get new_password {
    return Intl.message(
      'New password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm new password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed!`
  String get your_password_changed_successfuly {
    return Intl.message(
      'Your password has been changed!',
      name: 'your_password_changed_successfuly',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get title_settings {
    return Intl.message(
      'Settings',
      name: 'title_settings',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_and_conditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get about_app {
    return Intl.message(
      'About App',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `This page could not be found`
  String get page_not_found {
    return Intl.message(
      'This page could not be found',
      name: 'page_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account?`
  String get do_not_have_acc {
    return Intl.message(
      'Do not have an account?',
      name: 'do_not_have_acc',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get create_new_account {
    return Intl.message(
      'New Account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Please input your full name`
  String get pls_input_your_full_name {
    return Intl.message(
      'Please input your full name',
      name: 'pls_input_your_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get date_of_birth {
    return Intl.message(
      'Date of birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Please input your date of birth`
  String get pls_input_your_dob {
    return Intl.message(
      'Please input your date of birth',
      name: 'pls_input_your_dob',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Please input your gender`
  String get pls_input_your_gender {
    return Intl.message(
      'Please input your gender',
      name: 'pls_input_your_gender',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Please input your email`
  String get pls_input_your_email {
    return Intl.message(
      'Please input your email',
      name: 'pls_input_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalid_email {
    return Intl.message(
      'Invalid email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Please input your password`
  String get pls_input_your_password {
    return Intl.message(
      'Please input your password',
      name: 'pls_input_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Please input your phone number`
  String get pls_input_your_phone_number {
    return Intl.message(
      'Please input your phone number',
      name: 'pls_input_your_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalid_phone_number {
    return Intl.message(
      'Invalid phone number',
      name: 'invalid_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `<div>I agree with the <a href='{url}'>Terms and Conditions</a>.</div>`
  String msg_privacy_agreement_(Object url) {
    return Intl.message(
      '<div>I agree with the <a href=\'$url\'>Terms and Conditions</a>.</div>',
      name: 'msg_privacy_agreement_',
      desc: '',
      args: [url],
    );
  }

  /// `Account creation failed`
  String get create_account_failed {
    return Intl.message(
      'Account creation failed',
      name: 'create_account_failed',
      desc: '',
      args: [],
    );
  }

  /// `Input the developer secret code`
  String get please_input_the_secret_code {
    return Intl.message(
      'Input the developer secret code',
      name: 'please_input_the_secret_code',
      desc: '',
      args: [],
    );
  }

  /// `Copyright © 2011 - {year} E-Power CCL Co., Ltd`
  String copyright_(Object year) {
    return Intl.message(
      'Copyright © 2011 - $year E-Power CCL Co., Ltd',
      name: 'copyright_',
      desc: '',
      args: [year],
    );
  }

  /// `Requesting failure, please try again.`
  String get load_data_failed {
    return Intl.message(
      'Requesting failure, please try again.',
      name: 'load_data_failed',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to discard changes?`
  String get msg_confirm_discard_change {
    return Intl.message(
      'Do you want to discard changes?',
      name: 'msg_confirm_discard_change',
      desc: '',
      args: [],
    );
  }

  /// `Invalid url`
  String get invalid_url {
    return Intl.message(
      'Invalid url',
      name: 'invalid_url',
      desc: '',
      args: [],
    );
  }

  /// `Primary Color`
  String get primary_color {
    return Intl.message(
      'Primary Color',
      name: 'primary_color',
      desc: '',
      args: [],
    );
  }

  /// `Your user account has been deleted`
  String get your_account_has_been_deleted {
    return Intl.message(
      'Your user account has been deleted',
      name: 'your_account_has_been_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get inactive {
    return Intl.message(
      'Inactive',
      name: 'inactive',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Shore more`
  String get show_more {
    return Intl.message(
      'Shore more',
      name: 'show_more',
      desc: '',
      args: [],
    );
  }

  /// `Registered Date`
  String get register_date {
    return Intl.message(
      'Registered Date',
      name: 'register_date',
      desc: '',
      args: [],
    );
  }

  /// `General Information`
  String get general_information {
    return Intl.message(
      'General Information',
      name: 'general_information',
      desc: '',
      args: [],
    );
  }

  /// `Linked Customers`
  String get linked_customers {
    return Intl.message(
      'Linked Customers',
      name: 'linked_customers',
      desc: '',
      args: [],
    );
  }

  /// `Account's linked customers will be displayed here.`
  String get empty_linked_customer {
    return Intl.message(
      'Account\'s linked customers will be displayed here.',
      name: 'empty_linked_customer',
      desc: '',
      args: [],
    );
  }

  /// `Customer name`
  String get customer_name {
    return Intl.message(
      'Customer name',
      name: 'customer_name',
      desc: '',
      args: [],
    );
  }

  /// `Customer code`
  String get customer_code {
    return Intl.message(
      'Customer code',
      name: 'customer_code',
      desc: '',
      args: [],
    );
  }

  /// `Installation address`
  String get installation_address {
    return Intl.message(
      'Installation address',
      name: 'installation_address',
      desc: '',
      args: [],
    );
  }

  /// `Licensee`
  String get licensee {
    return Intl.message(
      'Licensee',
      name: 'licensee',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get empty_data {
    return Intl.message(
      'No data',
      name: 'empty_data',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message(
      'Currency',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Edit Account`
  String get edit_account {
    return Intl.message(
      'Edit Account',
      name: 'edit_account',
      desc: '',
      args: [],
    );
  }

  /// `Please input phone number`
  String get pls_input_phone_number {
    return Intl.message(
      'Please input phone number',
      name: 'pls_input_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Please input name`
  String get pls_input_name {
    return Intl.message(
      'Please input name',
      name: 'pls_input_name',
      desc: '',
      args: [],
    );
  }

  /// `Please input email`
  String get pls_input_email {
    return Intl.message(
      'Please input email',
      name: 'pls_input_email',
      desc: '',
      args: [],
    );
  }

  /// `Latitude`
  String get latitude {
    return Intl.message(
      'Latitude',
      name: 'latitude',
      desc: '',
      args: [],
    );
  }

  /// `Longitude`
  String get longitude {
    return Intl.message(
      'Longitude',
      name: 'longitude',
      desc: '',
      args: [],
    );
  }

  /// `Please input latitude`
  String get pls_input_latitude {
    return Intl.message(
      'Please input latitude',
      name: 'pls_input_latitude',
      desc: '',
      args: [],
    );
  }

  /// `Please input longitude`
  String get pls_input_longitude {
    return Intl.message(
      'Please input longitude',
      name: 'pls_input_longitude',
      desc: '',
      args: [],
    );
  }

  /// `Please input address`
  String get pls_input_address {
    return Intl.message(
      'Please input address',
      name: 'pls_input_address',
      desc: '',
      args: [],
    );
  }

  /// `Add News`
  String get add_news {
    return Intl.message(
      'Add News',
      name: 'add_news',
      desc: '',
      args: [],
    );
  }

  /// `Edit News`
  String get edit_news {
    return Intl.message(
      'Edit News',
      name: 'edit_news',
      desc: '',
      args: [],
    );
  }

  /// `Thumbnail`
  String get thumbnail {
    return Intl.message(
      'Thumbnail',
      name: 'thumbnail',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get news_date {
    return Intl.message(
      'Date',
      name: 'news_date',
      desc: '',
      args: [],
    );
  }

  /// `Please input date`
  String get pls_input_news_date {
    return Intl.message(
      'Please input date',
      name: 'pls_input_news_date',
      desc: '',
      args: [],
    );
  }

  /// `Thumbnail Title`
  String get thumbnail_title {
    return Intl.message(
      'Thumbnail Title',
      name: 'thumbnail_title',
      desc: '',
      args: [],
    );
  }

  /// `Please input thumbnail title`
  String get pls_input_thumbnail_title {
    return Intl.message(
      'Please input thumbnail title',
      name: 'pls_input_thumbnail_title',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get news_content {
    return Intl.message(
      'Content',
      name: 'news_content',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this news?`
  String get confirm_delete_news {
    return Intl.message(
      'Do you want to delete this news?',
      name: 'confirm_delete_news',
      desc: '',
      args: [],
    );
  }

  /// `All customer`
  String get all_customer {
    return Intl.message(
      'All customer',
      name: 'all_customer',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Please input user name`
  String get pls_input_user_name {
    return Intl.message(
      'Please input user name',
      name: 'pls_input_user_name',
      desc: '',
      args: [],
    );
  }

  /// `Please input password`
  String get pls_input_password {
    return Intl.message(
      'Please input password',
      name: 'pls_input_password',
      desc: '',
      args: [],
    );
  }

  /// `Please input confirm password`
  String get pls_input_confirm_password {
    return Intl.message(
      'Please input confirm password',
      name: 'pls_input_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password mismatch`
  String get confirm_password_mismatch {
    return Intl.message(
      'Confirm password mismatch',
      name: 'confirm_password_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least 8 digit.`
  String get invalid_password {
    return Intl.message(
      'Please select at least 8 digit.',
      name: 'invalid_password',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get user_name {
    return Intl.message(
      'Username',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Water Supply`
  String get water_supply {
    return Intl.message(
      'Water Supply',
      name: 'water_supply',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location_on_map {
    return Intl.message(
      'Location',
      name: 'location_on_map',
      desc: '',
      args: [],
    );
  }

  /// `My Task`
  String get my_task {
    return Intl.message(
      'My Task',
      name: 'my_task',
      desc: '',
      args: [],
    );
  }

  /// `Grant location Access`
  String get location_permission {
    return Intl.message(
      'Grant location Access',
      name: 'location_permission',
      desc: '',
      args: [],
    );
  }

  /// `Allow the app to access your location in app setting.`
  String get msg_allow_location_permission {
    return Intl.message(
      'Allow the app to access your location in app setting.',
      name: 'msg_allow_location_permission',
      desc: '',
      args: [],
    );
  }

  /// `No Task`
  String get no_task {
    return Intl.message(
      'No Task',
      name: 'no_task',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get draft {
    return Intl.message(
      'Draft',
      name: 'draft',
      desc: '',
      args: [],
    );
  }

  /// `My Request`
  String get request {
    return Intl.message(
      'My Request',
      name: 'request',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `No History`
  String get no_history {
    return Intl.message(
      'No History',
      name: 'no_history',
      desc: '',
      args: [],
    );
  }

  /// `Village`
  String get village {
    return Intl.message(
      'Village',
      name: 'village',
      desc: '',
      args: [],
    );
  }

  /// `Commune`
  String get commune {
    return Intl.message(
      'Commune',
      name: 'commune',
      desc: '',
      args: [],
    );
  }

  /// `District`
  String get district {
    return Intl.message(
      'District',
      name: 'district',
      desc: '',
      args: [],
    );
  }

  /// `Province`
  String get province {
    return Intl.message(
      'Province',
      name: 'province',
      desc: '',
      args: [],
    );
  }

  /// `Water Supply Type`
  String get water_supply_type {
    return Intl.message(
      'Water Supply Type',
      name: 'water_supply_type',
      desc: '',
      args: [],
    );
  }

  /// `Water Supply Code`
  String get water_supply_code {
    return Intl.message(
      'Water Supply Code',
      name: 'water_supply_code',
      desc: '',
      args: [],
    );
  }

  /// `Please input province`
  String get pls_input_province {
    return Intl.message(
      'Please input province',
      name: 'pls_input_province',
      desc: '',
      args: [],
    );
  }

  /// `Please input district`
  String get pls_input_district {
    return Intl.message(
      'Please input district',
      name: 'pls_input_district',
      desc: '',
      args: [],
    );
  }

  /// `Please input commune`
  String get pls_input_commune {
    return Intl.message(
      'Please input commune',
      name: 'pls_input_commune',
      desc: '',
      args: [],
    );
  }

  /// `Please input village`
  String get pls_input_village {
    return Intl.message(
      'Please input village',
      name: 'pls_input_village',
      desc: '',
      args: [],
    );
  }

  /// `View History`
  String get view_history {
    return Intl.message(
      'View History',
      name: 'view_history',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get tab_general {
    return Intl.message(
      'General',
      name: 'tab_general',
      desc: '',
      args: [],
    );
  }

  /// `Specific`
  String get tab_specific {
    return Intl.message(
      'Specific',
      name: 'tab_specific',
      desc: '',
      args: [],
    );
  }

  /// `Map Unit`
  String get map_unit {
    return Intl.message(
      'Map Unit',
      name: 'map_unit',
      desc: '',
      args: [],
    );
  }

  /// `Coordinate UTMX`
  String get utm_x {
    return Intl.message(
      'Coordinate UTMX',
      name: 'utm_x',
      desc: '',
      args: [],
    );
  }

  /// `Coordinate UTMY`
  String get utm_y {
    return Intl.message(
      'Coordinate UTMY',
      name: 'utm_y',
      desc: '',
      args: [],
    );
  }

  /// `Total Family`
  String get total_family {
    return Intl.message(
      'Total Family',
      name: 'total_family',
      desc: '',
      args: [],
    );
  }

  /// `Risk Environment`
  String get risk_enviroment {
    return Intl.message(
      'Risk Environment',
      name: 'risk_enviroment',
      desc: '',
      args: [],
    );
  }

  /// `Construction Date`
  String get construction_date {
    return Intl.message(
      'Construction Date',
      name: 'construction_date',
      desc: '',
      args: [],
    );
  }

  /// `Budget Source`
  String get budget_source {
    return Intl.message(
      'Budget Source',
      name: 'budget_source',
      desc: '',
      args: [],
    );
  }

  /// `Construction By`
  String get construction_by {
    return Intl.message(
      'Construction By',
      name: 'construction_by',
      desc: '',
      args: [],
    );
  }

  /// `Management Type`
  String get management_type {
    return Intl.message(
      'Management Type',
      name: 'management_type',
      desc: '',
      args: [],
    );
  }

  /// `Managed By`
  String get managed_by {
    return Intl.message(
      'Managed By',
      name: 'managed_by',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary Total People`
  String get beneficiary_total_people {
    return Intl.message(
      'Beneficiary Total People',
      name: 'beneficiary_total_people',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary Total Women`
  String get beneficiary_total_women {
    return Intl.message(
      'Beneficiary Total Women',
      name: 'beneficiary_total_women',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary Total Family`
  String get beneficiary_total_family {
    return Intl.message(
      'Beneficiary Total Family',
      name: 'beneficiary_total_family',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary Total Family Poor 1`
  String get beneficiary_total_family_poor_1 {
    return Intl.message(
      'Beneficiary Total Family Poor 1',
      name: 'beneficiary_total_family_poor_1',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary Total Family Poor 2`
  String get beneficiary_total_family_poor_2 {
    return Intl.message(
      'Beneficiary Total Family Poor 2',
      name: 'beneficiary_total_family_poor_2',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary Total Family Vulnerable`
  String get beneficiary_total_family_vulnerable {
    return Intl.message(
      'Beneficiary Total Family Vulnerable',
      name: 'beneficiary_total_family_vulnerable',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary Total Family Indigenous`
  String get beneficiary_total_family_indigenous {
    return Intl.message(
      'Beneficiary Total Family Indigenous',
      name: 'beneficiary_total_family_indigenous',
      desc: '',
      args: [],
    );
  }

  /// `Well Type`
  String get well_type {
    return Intl.message(
      'Well Type',
      name: 'well_type',
      desc: '',
      args: [],
    );
  }

  /// `Well Height(m)`
  String get well_depth {
    return Intl.message(
      'Well Height(m)',
      name: 'well_depth',
      desc: '',
      args: [],
    );
  }

  /// `Filter (Screen) (m)`
  String get well_screen {
    return Intl.message(
      'Filter (Screen) (m)',
      name: 'well_screen',
      desc: '',
      args: [],
    );
  }

  /// `Water Supply (m3/h)`
  String get well_water_supply {
    return Intl.message(
      'Water Supply (m3/h)',
      name: 'well_water_supply',
      desc: '',
      args: [],
    );
  }

  /// `Quality`
  String get water_quality {
    return Intl.message(
      'Quality',
      name: 'water_quality',
      desc: '',
      args: [],
    );
  }

  /// `Niro Static (m)`
  String get well_nirostatic {
    return Intl.message(
      'Niro Static (m)',
      name: 'well_nirostatic',
      desc: '',
      args: [],
    );
  }

  /// `Niro Dynamic (m)`
  String get well_nirodynamic {
    return Intl.message(
      'Niro Dynamic (m)',
      name: 'well_nirodynamic',
      desc: '',
      args: [],
    );
  }

  /// `Water Quality Check`
  String get well_check_water_quality {
    return Intl.message(
      'Water Quality Check',
      name: 'well_check_water_quality',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get well_status {
    return Intl.message(
      'Status',
      name: 'well_status',
      desc: '',
      args: [],
    );
  }

  /// `Reason`
  String get reason {
    return Intl.message(
      'Reason',
      name: 'reason',
      desc: '',
      args: [],
    );
  }

  /// `Type of water source`
  String get source_type_of_water {
    return Intl.message(
      'Type of water source',
      name: 'source_type_of_water',
      desc: '',
      args: [],
    );
  }

  /// `Water production capacity (m3/h)`
  String get abilty_of_produce_water {
    return Intl.message(
      'Water production capacity (m3/h)',
      name: 'abilty_of_produce_water',
      desc: '',
      args: [],
    );
  }

  /// `Groundwater tank (m3)`
  String get underground_pool_storage {
    return Intl.message(
      'Groundwater tank (m3)',
      name: 'underground_pool_storage',
      desc: '',
      args: [],
    );
  }

  /// `Air tank (m3)`
  String get pool_air {
    return Intl.message(
      'Air tank (m3)',
      name: 'pool_air',
      desc: '',
      args: [],
    );
  }

  /// `Filter tank *`
  String get pool_filter {
    return Intl.message(
      'Filter tank *',
      name: 'pool_filter',
      desc: '',
      args: [],
    );
  }

  /// `Number of links`
  String get number_of_link {
    return Intl.message(
      'Number of links',
      name: 'number_of_link',
      desc: '',
      args: [],
    );
  }

  /// `Main pipe length (m)`
  String get pipe_length {
    return Intl.message(
      'Main pipe length (m)',
      name: 'pipe_length',
      desc: '',
      args: [],
    );
  }

  /// `Cover village/commune`
  String get area_covering {
    return Intl.message(
      'Cover village/commune',
      name: 'area_covering',
      desc: '',
      args: [],
    );
  }

  /// `Water quality check *`
  String get water_quality_check {
    return Intl.message(
      'Water quality check *',
      name: 'water_quality_check',
      desc: '',
      args: [],
    );
  }

  /// `Water network status *`
  String get status_pipe {
    return Intl.message(
      'Water network status *',
      name: 'status_pipe',
      desc: '',
      args: [],
    );
  }

  /// `License`
  String get label_is_has_license {
    return Intl.message(
      'License',
      name: 'label_is_has_license',
      desc: '',
      args: [],
    );
  }

  /// `Issue license date`
  String get label_license_registered_date {
    return Intl.message(
      'Issue license date',
      name: 'label_license_registered_date',
      desc: '',
      args: [],
    );
  }

  /// `Expiration license date`
  String get label_license_expired_date {
    return Intl.message(
      'Expiration license date',
      name: 'label_license_expired_date',
      desc: '',
      args: [],
    );
  }

  /// `Water network status`
  String get status_water_kiosk {
    return Intl.message(
      'Water network status',
      name: 'status_water_kiosk',
      desc: '',
      args: [],
    );
  }

  /// `Pond width`
  String get width {
    return Intl.message(
      'Pond width',
      name: 'width',
      desc: '',
      args: [],
    );
  }

  /// `Pond length`
  String get length {
    return Intl.message(
      'Pond length',
      name: 'length',
      desc: '',
      args: [],
    );
  }

  /// `Pond depth`
  String get height {
    return Intl.message(
      'Pond depth',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `Pond Type`
  String get type_of_pond {
    return Intl.message(
      'Pond Type',
      name: 'type_of_pond',
      desc: '',
      args: [],
    );
  }

  /// `Dry season`
  String get is_summer_has_water {
    return Intl.message(
      'Dry season',
      name: 'is_summer_has_water',
      desc: '',
      args: [],
    );
  }

  /// `Type of Use`
  String get type_of_using {
    return Intl.message(
      'Type of Use',
      name: 'type_of_using',
      desc: '',
      args: [],
    );
  }

  /// `Capacity`
  String get capacity_of_rain_water_harvesting {
    return Intl.message(
      'Capacity',
      name: 'capacity_of_rain_water_harvesting',
      desc: '',
      args: [],
    );
  }

  /// `Terminal status`
  String get status_rain_water_harvesting {
    return Intl.message(
      'Terminal status',
      name: 'status_rain_water_harvesting',
      desc: '',
      args: [],
    );
  }

  /// `Source Type of Water:`
  String get source_type_of_water_report_viewer {
    return Intl.message(
      'Source Type of Water:',
      name: 'source_type_of_water_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Ability Produce Water(ចំនួនប៊ីដុង/មួយថ្ងៃ):`
  String get ability_of_produce_water_report_viewer {
    return Intl.message(
      'Ability Produce Water(ចំនួនប៊ីដុង/មួយថ្ងៃ):',
      name: 'ability_of_produce_water_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Underground Pool Storage(m3):`
  String get underground_pool_storage_report_viewer {
    return Intl.message(
      'Underground Pool Storage(m3):',
      name: 'underground_pool_storage_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Pool Air(m3):`
  String get pool_air_report_viewer {
    return Intl.message(
      'Pool Air(m3):',
      name: 'pool_air_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Pool Filter:`
  String get pool_filter_report_viewer {
    return Intl.message(
      'Pool Filter:',
      name: 'pool_filter_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Number of Link:`
  String get number_of_link_report_viewer {
    return Intl.message(
      'Number of Link:',
      name: 'number_of_link_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Water Quality:`
  String get water_quality_check_report_viewer {
    return Intl.message(
      'Water Quality:',
      name: 'water_quality_check_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Pipe Status:`
  String get status_pipe_report_viewer {
    return Intl.message(
      'Pipe Status:',
      name: 'status_pipe_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Water Quality:`
  String get water_quality_report_viewer {
    return Intl.message(
      'Water Quality:',
      name: 'water_quality_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Water Quality Checking:`
  String get water_quality_checking_report_viewer {
    return Intl.message(
      'Water Quality Checking:',
      name: 'water_quality_checking_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Status:`
  String get status_kiosk_report_viewer {
    return Intl.message(
      'Status:',
      name: 'status_kiosk_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Reason:`
  String get reason_report_viewer {
    return Intl.message(
      'Reason:',
      name: 'reason_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Width(m):`
  String get width_report_viewer {
    return Intl.message(
      'Width(m):',
      name: 'width_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Length(m):`
  String get length_report_viewer {
    return Intl.message(
      'Length(m):',
      name: 'length_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Height(m):`
  String get height_report_viewer {
    return Intl.message(
      'Height(m):',
      name: 'height_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Type of Pond:`
  String get type_of_pond_report_viewer {
    return Intl.message(
      'Type of Pond:',
      name: 'type_of_pond_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Summer Has Water:`
  String get is_summer_has_water_report_viewer {
    return Intl.message(
      'Summer Has Water:',
      name: 'is_summer_has_water_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Status:`
  String get pond_status_report_viewer {
    return Intl.message(
      'Status:',
      name: 'pond_status_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Type of Using:`
  String get type_of_using_report_viewer {
    return Intl.message(
      'Type of Using:',
      name: 'type_of_using_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Capacity:`
  String get capacity_of_rain_water_harvesting_report_viewer {
    return Intl.message(
      'Capacity:',
      name: 'capacity_of_rain_water_harvesting_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Status:`
  String get status_rain_water_harvesting_report_viewer {
    return Intl.message(
      'Status:',
      name: 'status_rain_water_harvesting_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Main Pipe Length (m):`
  String get pipe_length_report_viewer {
    return Intl.message(
      'Main Pipe Length (m):',
      name: 'pipe_length_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Cover village/commune:`
  String get area_covering_report_viewer {
    return Intl.message(
      'Cover village/commune:',
      name: 'area_covering_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `License:`
  String get licensee_report_viewer {
    return Intl.message(
      'License:',
      name: 'licensee_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `License Registered Date:`
  String get label_license_registered_date_report_viewer {
    return Intl.message(
      'License Registered Date:',
      name: 'label_license_registered_date_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `License Expired Data:`
  String get label_license_expired_date_report_viewer {
    return Intl.message(
      'License Expired Data:',
      name: 'label_license_expired_date_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Status:`
  String get status_water_kiosk_report_viewer {
    return Intl.message(
      'Status:',
      name: 'status_water_kiosk_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Well Type:`
  String get well_type_report_viewer {
    return Intl.message(
      'Well Type:',
      name: 'well_type_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Status:`
  String get status_well_report_viewer {
    return Intl.message(
      'Status:',
      name: 'status_well_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Nirostatic:`
  String get well_nirostatic_report_viewer {
    return Intl.message(
      'Nirostatic:',
      name: 'well_nirostatic_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Niro Dynamic:`
  String get well_nirodynamic_report_viewer {
    return Intl.message(
      'Niro Dynamic:',
      name: 'well_nirodynamic_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Height Filter:`
  String get well_height_filter_report_viewer {
    return Intl.message(
      'Height Filter:',
      name: 'well_height_filter_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Height:`
  String get well_height_report_viewer {
    return Intl.message(
      'Height:',
      name: 'well_height_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Water Supply:`
  String get well_water_supply_report_viewer {
    return Intl.message(
      'Water Supply:',
      name: 'well_water_supply_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get risk {
    return Intl.message(
      'Yes',
      name: 'risk',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get norisk {
    return Intl.message(
      'No',
      name: 'norisk',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get government {
    return Intl.message(
      'State',
      name: 'government',
      desc: '',
      args: [],
    );
  }

  /// `Organization`
  String get organization {
    return Intl.message(
      'Organization',
      name: 'organization',
      desc: '',
      args: [],
    );
  }

  /// `Charity`
  String get charity {
    return Intl.message(
      'Charity',
      name: 'charity',
      desc: '',
      args: [],
    );
  }

  /// `Community`
  String get community {
    return Intl.message(
      'Community',
      name: 'community',
      desc: '',
      args: [],
    );
  }

  /// `Personal`
  String get private {
    return Intl.message(
      'Personal',
      name: 'private',
      desc: '',
      args: [],
    );
  }

  /// `Data Saved Successfully.`
  String get data_saved_successfully {
    return Intl.message(
      'Data Saved Successfully.',
      name: 'data_saved_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Data Save Failed.`
  String get data_save_failed {
    return Intl.message(
      'Data Save Failed.',
      name: 'data_save_failed',
      desc: '',
      args: [],
    );
  }

  /// `Add New`
  String get add_new_data {
    return Intl.message(
      'Add New',
      name: 'add_new_data',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Environment Risk`
  String get environmental_risk_area {
    return Intl.message(
      'Environment Risk',
      name: 'environmental_risk_area',
      desc: '',
      args: [],
    );
  }

  /// `Please select an environmental risk area`
  String get select_environmental_risk_area_error {
    return Intl.message(
      'Please select an environmental risk area',
      name: 'select_environmental_risk_area_error',
      desc: '',
      args: [],
    );
  }

  /// `Budget Source`
  String get budget_type {
    return Intl.message(
      'Budget Source',
      name: 'budget_type',
      desc: '',
      args: [],
    );
  }

  /// `Please select a budget source`
  String get select_budget_type_error {
    return Intl.message(
      'Please select a budget source',
      name: 'select_budget_type_error',
      desc: '',
      args: [],
    );
  }

  /// `Please select management type`
  String get select_management_type_error {
    return Intl.message(
      'Please select management type',
      name: 'select_management_type_error',
      desc: '',
      args: [],
    );
  }

  /// `Please input beneficiaries total people`
  String get input_total_people_benefice_error {
    return Intl.message(
      'Please input beneficiaries total people',
      name: 'input_total_people_benefice_error',
      desc: '',
      args: [],
    );
  }

  /// `Please input female total beneficiaries`
  String get beneficiary_total_women_error {
    return Intl.message(
      'Please input female total beneficiaries',
      name: 'beneficiary_total_women_error',
      desc: '',
      args: [],
    );
  }

  /// `Please input beneficiaries total family`
  String get beneficiary_total_family_error {
    return Intl.message(
      'Please input beneficiaries total family',
      name: 'beneficiary_total_family_error',
      desc: '',
      args: [],
    );
  }

  /// `Please input beneficiaries total family poor 1`
  String get beneficiary_total_family_poor_1_error {
    return Intl.message(
      'Please input beneficiaries total family poor 1',
      name: 'beneficiary_total_family_poor_1_error',
      desc: '',
      args: [],
    );
  }

  /// `Please input beneficiaries total family poor 2`
  String get beneficiary_total_family_poor_2_error {
    return Intl.message(
      'Please input beneficiaries total family poor 2',
      name: 'beneficiary_total_family_poor_2_error',
      desc: '',
      args: [],
    );
  }

  /// `Please input beneficiaries total family indigenous`
  String get beneficiary_total_family_indigenous_error {
    return Intl.message(
      'Please input beneficiaries total family indigenous',
      name: 'beneficiary_total_family_indigenous_error',
      desc: '',
      args: [],
    );
  }

  /// `Please input beneficiaries total family vulnerable`
  String get beneficiary_total_family_vulnerable_error {
    return Intl.message(
      'Please input beneficiaries total family vulnerable',
      name: 'beneficiary_total_family_vulnerable_error',
      desc: '',
      args: [],
    );
  }

  /// `Please select construction date`
  String get select_construction_date_error {
    return Intl.message(
      'Please select construction date',
      name: 'select_construction_date_error',
      desc: '',
      args: [],
    );
  }

  /// `Please select type of well`
  String get well_type_error {
    return Intl.message(
      'Please select type of well',
      name: 'well_type_error',
      desc: '',
      args: [],
    );
  }

  /// `Please select water quality`
  String get select_water_quality_error {
    return Intl.message(
      'Please select water quality',
      name: 'select_water_quality_error',
      desc: '',
      args: [],
    );
  }

  /// `Please select water quality check`
  String get select_well_check_water_quality_error {
    return Intl.message(
      'Please select water quality check',
      name: 'select_well_check_water_quality_error',
      desc: '',
      args: [],
    );
  }

  /// `Please select well status`
  String get select_well_status_error {
    return Intl.message(
      'Please select well status',
      name: 'select_well_status_error',
      desc: '',
      args: [],
    );
  }

  /// `Please select type of water source`
  String get select_source_type_of_water_error {
    return Intl.message(
      'Please select type of water source',
      name: 'select_source_type_of_water_error',
      desc: '',
      args: [],
    );
  }

  /// `Please select filter tank`
  String get select_pool_filter_error {
    return Intl.message(
      'Please select filter tank',
      name: 'select_pool_filter_error',
      desc: '',
      args: [],
    );
  }

  /// `Please select pipe status`
  String get select_status_pipe_error {
    return Intl.message(
      'Please select pipe status',
      name: 'select_status_pipe_error',
      desc: '',
      args: [],
    );
  }

  /// `View History`
  String get view_history_data {
    return Intl.message(
      'View History',
      name: 'view_history_data',
      desc: '',
      args: [],
    );
  }

  /// `Water Supply Coverage Report`
  String get water_supply_coverage_report {
    return Intl.message(
      'Water Supply Coverage Report',
      name: 'water_supply_coverage_report',
      desc: '',
      args: [],
    );
  }

  /// `Water Supply Detail Report`
  String get water_supply_detail_report {
    return Intl.message(
      'Water Supply Detail Report',
      name: 'water_supply_detail_report',
      desc: '',
      args: [],
    );
  }

  /// `Water Support Report on Map`
  String get water_support_report_on_map {
    return Intl.message(
      'Water Support Report on Map',
      name: 'water_support_report_on_map',
      desc: '',
      args: [],
    );
  }

  /// `Water Supply Coverage Report by Type`
  String get water_supply_coverage_report_by_type {
    return Intl.message(
      'Water Supply Coverage Report by Type',
      name: 'water_supply_coverage_report_by_type',
      desc: '',
      args: [],
    );
  }

  /// `Parameter Code :`
  String get parameter_code_report_viewer {
    return Intl.message(
      'Parameter Code :',
      name: 'parameter_code_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Parameter :`
  String get parameter_report_viewer {
    return Intl.message(
      'Parameter :',
      name: 'parameter_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Unit :`
  String get unit_report_viewer {
    return Intl.message(
      'Unit :',
      name: 'unit_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Standard Water :`
  String get standard_water_report_viewer {
    return Intl.message(
      'Standard Water :',
      name: 'standard_water_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Value :`
  String get value_report_viewer {
    return Intl.message(
      'Value :',
      name: 'value_report_viewer',
      desc: '',
      args: [],
    );
  }

  /// `Have`
  String get have {
    return Intl.message(
      'Have',
      name: 'have',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get nohave {
    return Intl.message(
      'None',
      name: 'nohave',
      desc: '',
      args: [],
    );
  }

  /// `Parameter Code`
  String get parameter_code {
    return Intl.message(
      'Parameter Code',
      name: 'parameter_code',
      desc: '',
      args: [],
    );
  }

  /// `Value`
  String get value {
    return Intl.message(
      'Value',
      name: 'value',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to submit this data?`
  String get do_you_want_to_submit_this_data {
    return Intl.message(
      'Do you want to submit this data?',
      name: 'do_you_want_to_submit_this_data',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this Draft?`
  String get do_you_want_to_delete_this_draft {
    return Intl.message(
      'Do you want to delete this Draft?',
      name: 'do_you_want_to_delete_this_draft',
      desc: '',
      args: [],
    );
  }

  /// `Have (Working)`
  String get have_active {
    return Intl.message(
      'Have (Working)',
      name: 'have_active',
      desc: '',
      args: [],
    );
  }

  /// `Have (Not Working)`
  String get have_inactive {
    return Intl.message(
      'Have (Not Working)',
      name: 'have_inactive',
      desc: '',
      args: [],
    );
  }

  /// `No protection and maintenance`
  String get no_protection_and_maintenance {
    return Intl.message(
      'No protection and maintenance',
      name: 'no_protection_and_maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Protected and maintained`
  String get protected_and_maintained {
    return Intl.message(
      'Protected and maintained',
      name: 'protected_and_maintained',
      desc: '',
      args: [],
    );
  }

  /// `Unused`
  String get not_used {
    return Intl.message(
      'Unused',
      name: 'not_used',
      desc: '',
      args: [],
    );
  }

  /// `Has Water`
  String get have_water {
    return Intl.message(
      'Has Water',
      name: 'have_water',
      desc: '',
      args: [],
    );
  }

  /// `No Water`
  String get no_water {
    return Intl.message(
      'No Water',
      name: 'no_water',
      desc: '',
      args: [],
    );
  }

  /// `Using`
  String get using {
    return Intl.message(
      'Using',
      name: 'using',
      desc: '',
      args: [],
    );
  }

  /// `Unused`
  String get not_using {
    return Intl.message(
      'Unused',
      name: 'not_using',
      desc: '',
      args: [],
    );
  }

  /// `Family`
  String get family {
    return Intl.message(
      'Family',
      name: 'family',
      desc: '',
      args: [],
    );
  }

  /// `School`
  String get school {
    return Intl.message(
      'School',
      name: 'school',
      desc: '',
      args: [],
    );
  }

  /// `Hospital`
  String get hospital {
    return Intl.message(
      'Hospital',
      name: 'hospital',
      desc: '',
      args: [],
    );
  }

  /// `Good`
  String get good {
    return Intl.message(
      'Good',
      name: 'good',
      desc: '',
      args: [],
    );
  }

  /// `Bad`
  String get bad {
    return Intl.message(
      'Bad',
      name: 'bad',
      desc: '',
      args: [],
    );
  }

  /// `Underground Water`
  String get underground_water {
    return Intl.message(
      'Underground Water',
      name: 'underground_water',
      desc: '',
      args: [],
    );
  }

  /// `Surface water`
  String get surface_water {
    return Intl.message(
      'Surface water',
      name: 'surface_water',
      desc: '',
      args: [],
    );
  }

  /// `Spring Water`
  String get spring_water {
    return Intl.message(
      'Spring Water',
      name: 'spring_water',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all_water {
    return Intl.message(
      'All',
      name: 'all_water',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active_status {
    return Intl.message(
      'Active',
      name: 'active_status',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get inactive_status {
    return Intl.message(
      'Inactive',
      name: 'inactive_status',
      desc: '',
      args: [],
    );
  }

  /// `Motorized Pump Well`
  String get motorized_pump_well {
    return Intl.message(
      'Motorized Pump Well',
      name: 'motorized_pump_well',
      desc: '',
      args: [],
    );
  }

  /// `Afridef Pump Well`
  String get afridef_pump_well {
    return Intl.message(
      'Afridef Pump Well',
      name: 'afridef_pump_well',
      desc: '',
      args: [],
    );
  }

  /// `Mark II Well`
  String get mark_II_well {
    return Intl.message(
      'Mark II Well',
      name: 'mark_II_well',
      desc: '',
      args: [],
    );
  }

  /// `Mark III Well`
  String get mark_III_well {
    return Intl.message(
      'Mark III Well',
      name: 'mark_III_well',
      desc: '',
      args: [],
    );
  }

  /// `No.6 Pump Well`
  String get no_6_pump_well {
    return Intl.message(
      'No.6 Pump Well',
      name: 'no_6_pump_well',
      desc: '',
      args: [],
    );
  }

  /// `Drainage Well`
  String get drainage_well {
    return Intl.message(
      'Drainage Well',
      name: 'drainage_well',
      desc: '',
      args: [],
    );
  }

  /// `Mixed Wells`
  String get mixed_wells {
    return Intl.message(
      'Mixed Wells',
      name: 'mixed_wells',
      desc: '',
      args: [],
    );
  }

  /// `Parameter`
  String get parameter {
    return Intl.message(
      'Parameter',
      name: 'parameter',
      desc: '',
      args: [],
    );
  }

  /// `QR Code`
  String get qr_code {
    return Intl.message(
      'QR Code',
      name: 'qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Dirt Underlayment`
  String get dirt_underlayment {
    return Intl.message(
      'Dirt Underlayment',
      name: 'dirt_underlayment',
      desc: '',
      args: [],
    );
  }

  /// `Concrete Underlayment`
  String get concrete_underlayment {
    return Intl.message(
      'Concrete Underlayment',
      name: 'concrete_underlayment',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to reject this request?`
  String get do_you_want_to_reject_this_request {
    return Intl.message(
      'Do you want to reject this request?',
      name: 'do_you_want_to_reject_this_request',
      desc: '',
      args: [],
    );
  }

  /// `Approve`
  String get approve {
    return Intl.message(
      'Approve',
      name: 'approve',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to approve this request?`
  String get do_you_want_to_approve_this_request {
    return Intl.message(
      'Do you want to approve this request?',
      name: 'do_you_want_to_approve_this_request',
      desc: '',
      args: [],
    );
  }

  /// `Request Edit`
  String get edit_request {
    return Intl.message(
      'Request Edit',
      name: 'edit_request',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to request edit this request?`
  String get do_you_want_to_request_edit_this_request {
    return Intl.message(
      'Do you want to request edit this request?',
      name: 'do_you_want_to_request_edit_this_request',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'km'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
