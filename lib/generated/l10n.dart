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

  /// `Find amazing people \naround you`
  String get started_desc_1 {
    return Intl.message(
      'Find amazing people \naround you',
      name: 'started_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Find Your \n Perfect Match`
  String get started_desc_2 {
    return Intl.message(
      'Find Your \n Perfect Match',
      name: 'started_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Meet and Chat to \n people near you`
  String get started_desc_3 {
    return Intl.message(
      'Meet and Chat to \n people near you',
      name: 'started_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get started_skp {
    return Intl.message(
      'Skip',
      name: 'started_skp',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get started_nxt {
    return Intl.message(
      'Next',
      name: 'started_nxt',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get started_conti {
    return Intl.message(
      'Continue',
      name: 'started_conti',
      desc: '',
      args: [],
    );
  }

  /// `Dil Ding Dong Ding Dole`
  String get app_desc {
    return Intl.message(
      'Dil Ding Dong Ding Dole',
      name: 'app_desc',
      desc: '',
      args: [],
    );
  }

  /// `Discover Your Dream Partner`
  String get wlcm_title {
    return Intl.message(
      'Discover Your Dream Partner',
      name: 'wlcm_title',
      desc: '',
      args: [],
    );
  }

  /// `Swipe right to like someone and if \nyou both like each others?`
  String get wlcm_desc {
    return Intl.message(
      'Swipe right to like someone and if \nyou both like each others?',
      name: 'wlcm_desc',
      desc: '',
      args: [],
    );
  }

  /// `\tIt's a match`
  String get wlcm_match {
    return Intl.message(
      '\tIt\'s a match',
      name: 'wlcm_match',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get wlcm_google {
    return Intl.message(
      'Continue with Google',
      name: 'wlcm_google',
      desc: '',
      args: [],
    );
  }

  /// `Login with Phone number`
  String get wlcm_phone {
    return Intl.message(
      'Login with Phone number',
      name: 'wlcm_phone',
      desc: '',
      args: [],
    );
  }

  /// `Trouble Logging In?`
  String get wlcm_trouble {
    return Intl.message(
      'Trouble Logging In?',
      name: 'wlcm_trouble',
      desc: '',
      args: [],
    );
  }

  /// `By continuing you agree to our\n`
  String get wlcm_conclusion {
    return Intl.message(
      'By continuing you agree to our\n',
      name: 'wlcm_conclusion',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions\t`
  String get wlcm_terms {
    return Intl.message(
      'Terms and Conditions\t',
      name: 'wlcm_terms',
      desc: '',
      args: [],
    );
  }

  /// `and\t`
  String get wlcm_and {
    return Intl.message(
      'and\t',
      name: 'wlcm_and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get wlcm_privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'wlcm_privacy',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Phone`
  String get login_phone_title {
    return Intl.message(
      'Continue with Phone',
      name: 'login_phone_title',
      desc: '',
      args: [],
    );
  }

  /// `Verify Phone`
  String get verify_phone_title {
    return Intl.message(
      'Verify Phone',
      name: 'verify_phone_title',
      desc: '',
      args: [],
    );
  }

  /// `You will receive a 4 digit code\nto verfiy next`
  String get phone_code {
    return Intl.message(
      'You will receive a 4 digit code\nto verfiy next',
      name: 'phone_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone Number`
  String get phone_num {
    return Intl.message(
      'Enter Your Phone Number',
      name: 'phone_num',
      desc: '',
      args: [],
    );
  }

  /// `Code is sent to\t`
  String get vrfy_desc {
    return Intl.message(
      'Code is sent to\t',
      name: 'vrfy_desc',
      desc: '',
      args: [],
    );
  }

  /// `8908870022`
  String get vrfy_no {
    return Intl.message(
      '8908870022',
      name: 'vrfy_no',
      desc: '',
      args: [],
    );
  }

  /// `Verify and Create Account`
  String get vrfy_accnt {
    return Intl.message(
      'Verify and Create Account',
      name: 'vrfy_accnt',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive a code?\t`
  String get vrfy_didnt {
    return Intl.message(
      'Didn\'t receive a code?\t',
      name: 'vrfy_didnt',
      desc: '',
      args: [],
    );
  }

  /// `Request Again`
  String get vrfy_resend {
    return Intl.message(
      'Request Again',
      name: 'vrfy_resend',
      desc: '',
      args: [],
    );
  }

  /// `Get via call`
  String get vrfy_via_call {
    return Intl.message(
      'Get via call',
      name: 'vrfy_via_call',
      desc: '',
      args: [],
    );
  }

  /// `Profile Details`
  String get prf_title {
    return Intl.message(
      'Profile Details',
      name: 'prf_title',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get dash_prf {
    return Intl.message(
      'Profile',
      name: 'dash_prf',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get dash_home {
    return Intl.message(
      'Home',
      name: 'dash_home',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get dash_chats {
    return Intl.message(
      'Chats',
      name: 'dash_chats',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get prf_pic {
    return Intl.message(
      'Photo',
      name: 'prf_pic',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get prf_fst_name {
    return Intl.message(
      'First Name',
      name: 'prf_fst_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get prf_lst_name {
    return Intl.message(
      'Last Name',
      name: 'prf_lst_name',
      desc: '',
      args: [],
    );
  }

  /// `What's Your Gender?`
  String get prf_gender {
    return Intl.message(
      'What\'s Your Gender?',
      name: 'prf_gender',
      desc: '',
      args: [],
    );
  }

  /// `Who would you like to date?`
  String get prf_like {
    return Intl.message(
      'Who would you like to date?',
      name: 'prf_like',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get prf_female {
    return Intl.message(
      'Female',
      name: 'prf_female',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get prf_male {
    return Intl.message(
      'Male',
      name: 'prf_male',
      desc: '',
      args: [],
    );
  }

  /// `LGBT`
  String get prf_trans {
    return Intl.message(
      'LGBT',
      name: 'prf_trans',
      desc: '',
      args: [],
    );
  }

  /// `Your Interests`
  String get ui_title {
    return Intl.message(
      'Your Interests',
      name: 'ui_title',
      desc: '',
      args: [],
    );
  }

  /// `You can pick multiple choices`
  String get ui_desc {
    return Intl.message(
      'You can pick multiple choices',
      name: 'ui_desc',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get ui_search {
    return Intl.message(
      'Search',
      name: 'ui_search',
      desc: '',
      args: [],
    );
  }

  /// `Photography`
  String get ui_interests {
    return Intl.message(
      'Photography',
      name: 'ui_interests',
      desc: '',
      args: [],
    );
  }

  /// `What is your birthdate?`
  String get ui_dob {
    return Intl.message(
      'What is your birthdate?',
      name: 'ui_dob',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get ui_day {
    return Intl.message(
      'Date',
      name: 'ui_day',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get ui_mnth {
    return Intl.message(
      'Month',
      name: 'ui_mnth',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get ui_year {
    return Intl.message(
      'Year',
      name: 'ui_year',
      desc: '',
      args: [],
    );
  }

  /// `Your profile is set!`
  String get ui_set {
    return Intl.message(
      'Your profile is set!',
      name: 'ui_set',
      desc: '',
      args: [],
    );
  }

  /// `Your soulmate is waiting`
  String get ui_waiting {
    return Intl.message(
      'Your soulmate is waiting',
      name: 'ui_waiting',
      desc: '',
      args: [],
    );
  }

  /// `Allow access to your location?`
  String get loc_access {
    return Intl.message(
      'Allow access to your location?',
      name: 'loc_access',
      desc: '',
      args: [],
    );
  }

  /// `Allow`
  String get loc_allow {
    return Intl.message(
      'Allow',
      name: 'loc_allow',
      desc: '',
      args: [],
    );
  }

  /// `Not now`
  String get loc_not {
    return Intl.message(
      'Not now',
      name: 'loc_not',
      desc: '',
      args: [],
    );
  }

  /// `App will find your location through a google map.`
  String get loc_desc {
    return Intl.message(
      'App will find your location through a google map.',
      name: 'loc_desc',
      desc: '',
      args: [],
    );
  }

  /// `Flora Agarwal , `
  String get up_name {
    return Intl.message(
      'Flora Agarwal , ',
      name: 'up_name',
      desc: '',
      args: [],
    );
  }

  /// `28`
  String get up_age {
    return Intl.message(
      '28',
      name: 'up_age',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get up_setting {
    return Intl.message(
      'Settings',
      name: 'up_setting',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get up_ed_prf {
    return Intl.message(
      'Edit Profile',
      name: 'up_ed_prf',
      desc: '',
      args: [],
    );
  }

  /// `BOOST`
  String get up_boost {
    return Intl.message(
      'BOOST',
      name: 'up_boost',
      desc: '',
      args: [],
    );
  }

  /// `Be top profile in your area for\n 45 minutes to get more matches.`
  String get up_boost_desc {
    return Intl.message(
      'Be top profile in your area for\n 45 minutes to get more matches.',
      name: 'up_boost_desc',
      desc: '',
      args: [],
    );
  }

  /// `UNLIMITED LIKES`
  String get up_likes {
    return Intl.message(
      'UNLIMITED LIKES',
      name: 'up_likes',
      desc: '',
      args: [],
    );
  }

  /// `Unlimited Likes,Rewinds and More!`
  String get up_likes_desc {
    return Intl.message(
      'Unlimited Likes,Rewinds and More!',
      name: 'up_likes_desc',
      desc: '',
      args: [],
    );
  }

  /// `UPGRADE YOUR LOVE LIFE`
  String get up_upgrade {
    return Intl.message(
      'UPGRADE YOUR LOVE LIFE',
      name: 'up_upgrade',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe to dingdong features`
  String get up_upgrade_desc {
    return Intl.message(
      'Subscribe to dingdong features',
      name: 'up_upgrade_desc',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get ms_title {
    return Intl.message(
      'Message',
      name: 'ms_title',
      desc: '',
      args: [],
    );
  }

  /// `Activities`
  String get ms_activity {
    return Intl.message(
      'Activities',
      name: 'ms_activity',
      desc: '',
      args: [],
    );
  }

  /// `Flora`
  String get ms_frst_name {
    return Intl.message(
      'Flora',
      name: 'ms_frst_name',
      desc: '',
      args: [],
    );
  }

  /// `Agarwal`
  String get ms_lst_name {
    return Intl.message(
      'Agarwal',
      name: 'ms_lst_name',
      desc: '',
      args: [],
    );
  }

  /// `Matches`
  String get mtchs_title {
    return Intl.message(
      'Matches',
      name: 'mtchs_title',
      desc: '',
      args: [],
    );
  }

  /// `This is a list of people who have \n like you and your matches`
  String get mtchs_desc {
    return Intl.message(
      'This is a list of people who have \n like you and your matches',
      name: 'mtchs_desc',
      desc: '',
      args: [],
    );
  }

  /// `02:30 AM`
  String get ms_time {
    return Intl.message(
      '02:30 AM',
      name: 'ms_time',
      desc: '',
      args: [],
    );
  }

  /// `Bangalore , `
  String get up_city {
    return Intl.message(
      'Bangalore , ',
      name: 'up_city',
      desc: '',
      args: [],
    );
  }

  /// `Karnataka`
  String get up_state {
    return Intl.message(
      'Karnataka',
      name: 'up_state',
      desc: '',
      args: [],
    );
  }

  /// `Tap to view the chat..`
  String get ms_desc {
    return Intl.message(
      'Tap to view the chat..',
      name: 'ms_desc',
      desc: '',
      args: [],
    );
  }

  /// `Let's create a incredible bond \n while having a conversation..`
  String get mtch_conv {
    return Intl.message(
      'Let\'s create a incredible bond \n while having a conversation..',
      name: 'mtch_conv',
      desc: '',
      args: [],
    );
  }

  /// `It's A`
  String get mtch_it {
    return Intl.message(
      'It\'s A',
      name: 'mtch_it',
      desc: '',
      args: [],
    );
  }

  /// `Match`
  String get mtch_match {
    return Intl.message(
      'Match',
      name: 'mtch_match',
      desc: '',
      args: [],
    );
  }

  /// `Say Hello`
  String get mtch_hello {
    return Intl.message(
      'Say Hello',
      name: 'mtch_hello',
      desc: '',
      args: [],
    );
  }

  /// `Keep Swiping`
  String get mtch_swipe {
    return Intl.message(
      'Keep Swiping',
      name: 'mtch_swipe',
      desc: '',
      args: [],
    );
  }

  /// `2 Kilometers away`
  String get up_radius {
    return Intl.message(
      '2 Kilometers away',
      name: 'up_radius',
      desc: '',
      args: [],
    );
  }

  /// `Product Designer`
  String get up_profession {
    return Intl.message(
      'Product Designer',
      name: 'up_profession',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get fltr_title {
    return Intl.message(
      'Filter',
      name: 'fltr_title',
      desc: '',
      args: [],
    );
  }

  /// `Show Me`
  String get fltr_show {
    return Intl.message(
      'Show Me',
      name: 'fltr_show',
      desc: '',
      args: [],
    );
  }

  /// `Both`
  String get fltr_both {
    return Intl.message(
      'Both',
      name: 'fltr_both',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get fltr_age {
    return Intl.message(
      'Age',
      name: 'fltr_age',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get fltr_dis {
    return Intl.message(
      'Distance',
      name: 'fltr_dis',
      desc: '',
      args: [],
    );
  }

  /// `18-25`
  String get fltr_age_range {
    return Intl.message(
      '18-25',
      name: 'fltr_age_range',
      desc: '',
      args: [],
    );
  }

  /// `Reset Default`
  String get fltr_reset {
    return Intl.message(
      'Reset Default',
      name: 'fltr_reset',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get fltr_apply {
    return Intl.message(
      'Apply',
      name: 'fltr_apply',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get flter_loc {
    return Intl.message(
      'Location',
      name: 'flter_loc',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get ud_abt {
    return Intl.message(
      'About',
      name: 'ud_abt',
      desc: '',
      args: [],
    );
  }

  /// `Read More`
  String get ud_read {
    return Intl.message(
      'Read More',
      name: 'ud_read',
      desc: '',
      args: [],
    );
  }

  /// `2 Km`
  String get ud_dis {
    return Intl.message(
      '2 Km',
      name: 'ud_dis',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get ud_see_all {
    return Intl.message(
      'See All',
      name: 'ud_see_all',
      desc: '',
      args: [],
    );
  }

  /// `Interests`
  String get ud_interests {
    return Intl.message(
      'Interests',
      name: 'ud_interests',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get ud_gallery {
    return Intl.message(
      'Gallery',
      name: 'ud_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Media`
  String get ued_media {
    return Intl.message(
      'Media',
      name: 'ued_media',
      desc: '',
      args: [],
    );
  }

  /// `Add Media`
  String get ued_add_media {
    return Intl.message(
      'Add Media',
      name: 'ued_add_media',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get ued_about_me {
    return Intl.message(
      'About Me',
      name: 'ued_about_me',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get ued_name {
    return Intl.message(
      'Name',
      name: 'ued_name',
      desc: '',
      args: [],
    );
  }

  /// `Job Title`
  String get ued_job_title {
    return Intl.message(
      'Job Title',
      name: 'ued_job_title',
      desc: '',
      args: [],
    );
  }

  /// `College`
  String get ued_college {
    return Intl.message(
      'College',
      name: 'ued_college',
      desc: '',
      args: [],
    );
  }

  /// `Interests`
  String get ued_interest {
    return Intl.message(
      'Interests',
      name: 'ued_interest',
      desc: '',
      args: [],
    );
  }

  /// `Living In`
  String get ued_living_in {
    return Intl.message(
      'Living In',
      name: 'ued_living_in',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get ued_location {
    return Intl.message(
      'Location',
      name: 'ued_location',
      desc: '',
      args: [],
    );
  }

  /// `Add City`
  String get ued_add_city {
    return Intl.message(
      'Add City',
      name: 'ued_add_city',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get ued_full_name {
    return Intl.message(
      'Full Name',
      name: 'ued_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Search for city`
  String get ued_loc_city {
    return Intl.message(
      'Search for city',
      name: 'ued_loc_city',
      desc: '',
      args: [],
    );
  }

  /// `Near current location`
  String get ued_near {
    return Intl.message(
      'Near current location',
      name: 'ued_near',
      desc: '',
      args: [],
    );
  }

  /// `I don't want to show my location`
  String get ued_dont_show_loc {
    return Intl.message(
      'I don\'t want to show my location',
      name: 'ued_dont_show_loc',
      desc: '',
      args: [],
    );
  }

  /// `4`
  String get uie_count {
    return Intl.message(
      '4',
      name: 'uie_count',
      desc: '',
      args: [],
    );
  }

  /// `out of `
  String get uie_out {
    return Intl.message(
      'out of ',
      name: 'uie_out',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get ued_setting {
    return Intl.message(
      'Settings',
      name: 'ued_setting',
      desc: '',
      args: [],
    );
  }

  /// `Gold`
  String get ued_gold {
    return Intl.message(
      'Gold',
      name: 'ued_gold',
      desc: '',
      args: [],
    );
  }

  /// `Platinum`
  String get ued_platinum {
    return Intl.message(
      'Platinum',
      name: 'ued_platinum',
      desc: '',
      args: [],
    );
  }

  /// `5`
  String get uie_max_count {
    return Intl.message(
      '5',
      name: 'uie_max_count',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get uie_acc {
    return Intl.message(
      'Account Settings',
      name: 'uie_acc',
      desc: '',
      args: [],
    );
  }

  /// `Preferred Languages`
  String get uie_lang {
    return Intl.message(
      'Preferred Languages',
      name: 'uie_lang',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get uie_age {
    return Intl.message(
      'Age',
      name: 'uie_age',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Distance`
  String get uie_max_dis {
    return Intl.message(
      'Maximum Distance',
      name: 'uie_max_dis',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get uie_payment {
    return Intl.message(
      'Payment',
      name: 'uie_payment',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get uie_noti {
    return Intl.message(
      'Notifications',
      name: 'uie_noti',
      desc: '',
      args: [],
    );
  }

  /// `Legal`
  String get uie_legal {
    return Intl.message(
      'Legal',
      name: 'uie_legal',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get uie_privacy {
    return Intl.message(
      'Privacy',
      name: 'uie_privacy',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get uie_contact_us {
    return Intl.message(
      'Contact Us',
      name: 'uie_contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get uie_log_out {
    return Intl.message(
      'Logout',
      name: 'uie_log_out',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get uie_dlt_acc {
    return Intl.message(
      'Delete Account',
      name: 'uie_dlt_acc',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get uie_phone {
    return Intl.message(
      'Phone Number',
      name: 'uie_phone',
      desc: '',
      args: [],
    );
  }

  /// `Verify your phone number to help us to secure your account`
  String get uie_phone_desc {
    return Intl.message(
      'Verify your phone number to help us to secure your account',
      name: 'uie_phone_desc',
      desc: '',
      args: [],
    );
  }

  /// `+91`
  String get uie_number_code {
    return Intl.message(
      '+91',
      name: 'uie_number_code',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get uie_verify {
    return Intl.message(
      'Verify',
      name: 'uie_verify',
      desc: '',
      args: [],
    );
  }

  /// `My name is Aishwarya Agrawal enjoyed meeting new people and finding ways to help them have on uplifting experience enjoyed reading book.`
  String get ud_desc {
    return Intl.message(
      'My name is Aishwarya Agrawal enjoyed meeting new people and finding ways to help them have on uplifting experience enjoyed reading book.',
      name: 'ud_desc',
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
