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

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n         It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).`
  String get lorem {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n         It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
      name: 'lorem',
      desc: '',
      args: [],
    );
  }

  /// `----------------------------------------------`
  String get settings_cycle {
    return Intl.message(
      '----------------------------------------------',
      name: 'settings_cycle',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get app_language {
    return Intl.message(
      'Arabic',
      name: 'app_language',
      desc: '',
      args: [],
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

  /// `My Wallet`
  String get my_wallet {
    return Intl.message(
      'My Wallet',
      name: 'my_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Gift cards`
  String get gift_cards {
    return Intl.message(
      'Gift cards',
      name: 'gift_cards',
      desc: '',
      args: [],
    );
  }

  /// `About Biflora`
  String get about_biflora {
    return Intl.message(
      'About Biflora',
      name: 'about_biflora',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms_conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
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

  /// `App Version - `
  String get app_version {
    return Intl.message(
      'App Version - ',
      name: 'app_version',
      desc: '',
      args: [],
    );
  }

  /// `----------------------------------------------`
  String get nav_cycle {
    return Intl.message(
      '----------------------------------------------',
      name: 'nav_cycle',
      desc: '',
      args: [],
    );
  }

  /// `Main`
  String get main {
    return Intl.message(
      'Main',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `----------------------------------------------`
  String get home_cycle {
    return Intl.message(
      '----------------------------------------------',
      name: 'home_cycle',
      desc: '',
      args: [],
    );
  }

  /// `Digital gifts`
  String get digital_gifts {
    return Intl.message(
      'Digital gifts',
      name: 'digital_gifts',
      desc: '',
      args: [],
    );
  }

  /// `Quick orders`
  String get quick_orders {
    return Intl.message(
      'Quick orders',
      name: 'quick_orders',
      desc: '',
      args: [],
    );
  }

  /// `----------------------------------------------`
  String get order_cycle {
    return Intl.message(
      '----------------------------------------------',
      name: 'order_cycle',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `InProgress`
  String get in_progress {
    return Intl.message(
      'InProgress',
      name: 'in_progress',
      desc: '',
      args: [],
    );
  }

  /// `Scheduled`
  String get scheduled {
    return Intl.message(
      'Scheduled',
      name: 'scheduled',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Rate Order`
  String get rate_order {
    return Intl.message(
      'Rate Order',
      name: 'rate_order',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule`
  String get reschedule {
    return Intl.message(
      'Reschedule',
      name: 'reschedule',
      desc: '',
      args: [],
    );
  }

  /// `Track Order`
  String get track_order {
    return Intl.message(
      'Track Order',
      name: 'track_order',
      desc: '',
      args: [],
    );
  }

  /// `Add to Basket`
  String get add_to_basket {
    return Intl.message(
      'Add to Basket',
      name: 'add_to_basket',
      desc: '',
      args: [],
    );
  }

  /// `Schedule an order`
  String get schedule_an_order {
    return Intl.message(
      'Schedule an order',
      name: 'schedule_an_order',
      desc: '',
      args: [],
    );
  }

  /// `Quick order`
  String get quick_order {
    return Intl.message(
      'Quick order',
      name: 'quick_order',
      desc: '',
      args: [],
    );
  }

  /// `Similar Items`
  String get similar_items {
    return Intl.message(
      'Similar Items',
      name: 'similar_items',
      desc: '',
      args: [],
    );
  }

  /// `Closed`
  String get closed {
    return Intl.message(
      'Closed',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `Gifts`
  String get gifts {
    return Intl.message(
      'Gifts',
      name: 'gifts',
      desc: '',
      args: [],
    );
  }

  /// `Km`
  String get km {
    return Intl.message(
      'Km',
      name: 'km',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get active {
    return Intl.message(
      'Apply',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `min`
  String get min {
    return Intl.message(
      'min',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get order_details {
    return Intl.message(
      'Order Details',
      name: 'order_details',
      desc: '',
      args: [],
    );
  }

  /// `Who's the gift for ?`
  String get who_the_gift_for {
    return Intl.message(
      'Who\'s the gift for ?',
      name: 'who_the_gift_for',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get payment_method {
    return Intl.message(
      'Payment method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Product tracking`
  String get product_tracking {
    return Intl.message(
      'Product tracking',
      name: 'product_tracking',
      desc: '',
      args: [],
    );
  }

  /// `Gift for me`
  String get gift_for_me {
    return Intl.message(
      'Gift for me',
      name: 'gift_for_me',
      desc: '',
      args: [],
    );
  }

  /// `Gift for someone else`
  String get gift_for_someone_else {
    return Intl.message(
      'Gift for someone else',
      name: 'gift_for_someone_else',
      desc: '',
      args: [],
    );
  }

  /// `Delivery details can be specified in this field`
  String get delivery_details_can_be_specified_in_this_field {
    return Intl.message(
      'Delivery details can be specified in this field',
      name: 'delivery_details_can_be_specified_in_this_field',
      desc: '',
      args: [],
    );
  }

  /// `Do you have promo or voucher discount code?`
  String get do_you_have_promo_or_voucher_discount_code {
    return Intl.message(
      'Do you have promo or voucher discount code?',
      name: 'do_you_have_promo_or_voucher_discount_code',
      desc: '',
      args: [],
    );
  }

  /// `Paying off`
  String get paying_off {
    return Intl.message(
      'Paying off',
      name: 'paying_off',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions`
  String get suggestions {
    return Intl.message(
      'Suggestions',
      name: 'suggestions',
      desc: '',
      args: [],
    );
  }

  /// `Find a shop`
  String get find_a_shop {
    return Intl.message(
      'Find a shop',
      name: 'find_a_shop',
      desc: '',
      args: [],
    );
  }

  /// `Reject all suggestions`
  String get reject_all_suggestions {
    return Intl.message(
      'Reject all suggestions',
      name: 'reject_all_suggestions',
      desc: '',
      args: [],
    );
  }

  /// `Complete Order`
  String get complete_order {
    return Intl.message(
      'Complete Order',
      name: 'complete_order',
      desc: '',
      args: [],
    );
  }

  /// `Delivery date`
  String get delivery_date {
    return Intl.message(
      'Delivery date',
      name: 'delivery_date',
      desc: '',
      args: [],
    );
  }

  /// `Send Rate`
  String get send_rate {
    return Intl.message(
      'Send Rate',
      name: 'send_rate',
      desc: '',
      args: [],
    );
  }

  /// `Order Tracking`
  String get order_tracking {
    return Intl.message(
      'Order Tracking',
      name: 'order_tracking',
      desc: '',
      args: [],
    );
  }

  /// `Ordered items`
  String get ordered_items {
    return Intl.message(
      'Ordered items',
      name: 'ordered_items',
      desc: '',
      args: [],
    );
  }

  /// `Looking fo Delivery man`
  String get looking_fo_delivery_man {
    return Intl.message(
      'Looking fo Delivery man',
      name: 'looking_fo_delivery_man',
      desc: '',
      args: [],
    );
  }

  /// `The request is being prepared`
  String get the_request_is_being_prepared {
    return Intl.message(
      'The request is being prepared',
      name: 'the_request_is_being_prepared',
      desc: '',
      args: [],
    );
  }

  /// `On the way to delivery`
  String get on_the_way_to_delivery {
    return Intl.message(
      'On the way to delivery',
      name: 'on_the_way_to_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Delivery man information:`
  String get delivery_man_information {
    return Intl.message(
      'Delivery man information:',
      name: 'delivery_man_information',
      desc: '',
      args: [],
    );
  }

  /// `Your request has been recieved safely`
  String get your_request_has_been_recieved_safely {
    return Intl.message(
      'Your request has been recieved safely',
      name: 'your_request_has_been_recieved_safely',
      desc: '',
      args: [],
    );
  }

  /// `The request was successfully executed`
  String get the_request_was_successfully_executed {
    return Intl.message(
      'The request was successfully executed',
      name: 'the_request_was_successfully_executed',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message(
      'Call',
      name: 'call',
      desc: '',
      args: [],
    );
  }

  /// `----------------------------------------------`
  String get common_cycle {
    return Intl.message(
      '----------------------------------------------',
      name: 'common_cycle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
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

  /// `----------------------------------------------`
  String get wallet_cycle {
    return Intl.message(
      '----------------------------------------------',
      name: 'wallet_cycle',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Add new Card`
  String get add_new_card {
    return Intl.message(
      'Add new Card',
      name: 'add_new_card',
      desc: '',
      args: [],
    );
  }

  /// `Card holder name`
  String get card_holder_name {
    return Intl.message(
      'Card holder name',
      name: 'card_holder_name',
      desc: '',
      args: [],
    );
  }

  /// `Your Wallet Balance`
  String get your_wallet_balance {
    return Intl.message(
      'Your Wallet Balance',
      name: 'your_wallet_balance',
      desc: '',
      args: [],
    );
  }

  /// `Card number`
  String get card_number {
    return Intl.message(
      'Card number',
      name: 'card_number',
      desc: '',
      args: [],
    );
  }

  /// `Expiry`
  String get expiry {
    return Intl.message(
      'Expiry',
      name: 'expiry',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Name Surname`
  String get name_surname {
    return Intl.message(
      'Name Surname',
      name: 'name_surname',
      desc: '',
      args: [],
    );
  }

  /// `----------------------------------------------`
  String get gift_cycle {
    return Intl.message(
      '----------------------------------------------',
      name: 'gift_cycle',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Select the paid amount`
  String get select_the_paid_amount {
    return Intl.message(
      'Select the paid amount',
      name: 'select_the_paid_amount',
      desc: '',
      args: [],
    );
  }

  /// `Remain amount`
  String get remain_amount {
    return Intl.message(
      'Remain amount',
      name: 'remain_amount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm payment`
  String get confirm_payment {
    return Intl.message(
      'Confirm payment',
      name: 'confirm_payment',
      desc: '',
      args: [],
    );
  }

  /// `RS`
  String get rs {
    return Intl.message(
      'RS',
      name: 'rs',
      desc: '',
      args: [],
    );
  }

  /// `Receiver name`
  String get receiver_name {
    return Intl.message(
      'Receiver name',
      name: 'receiver_name',
      desc: '',
      args: [],
    );
  }

  /// `Send a Gift`
  String get send_a_gift {
    return Intl.message(
      'Send a Gift',
      name: 'send_a_gift',
      desc: '',
      args: [],
    );
  }

  /// `----------------------------------------------`
  String get profile_cycle {
    return Intl.message(
      '----------------------------------------------',
      name: 'profile_cycle',
      desc: '',
      args: [],
    );
  }

  /// `Your information`
  String get your_information {
    return Intl.message(
      'Your information',
      name: 'your_information',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `E-mail address`
  String get email_address {
    return Intl.message(
      'E-mail address',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Open map`
  String get open_map {
    return Intl.message(
      'Open map',
      name: 'open_map',
      desc: '',
      args: [],
    );
  }

  /// `Delete profile`
  String get delete_profile {
    return Intl.message(
      'Delete profile',
      name: 'delete_profile',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `----------------------------------------------`
  String get basket_cycle {
    return Intl.message(
      '----------------------------------------------',
      name: 'basket_cycle',
      desc: '',
      args: [],
    );
  }

  /// `Basket`
  String get basket {
    return Intl.message(
      'Basket',
      name: 'basket',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get total_amount {
    return Intl.message(
      'Total Amount',
      name: 'total_amount',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Price`
  String get delivery_price {
    return Intl.message(
      'Delivery Price',
      name: 'delivery_price',
      desc: '',
      args: [],
    );
  }

  /// `Total Calculted Amount`
  String get total_calculted_amount {
    return Intl.message(
      'Total Calculted Amount',
      name: 'total_calculted_amount',
      desc: '',
      args: [],
    );
  }

  /// `Order Now`
  String get order_now {
    return Intl.message(
      'Order Now',
      name: 'order_now',
      desc: '',
      args: [],
    );
  }

  /// `Now`
  String get now {
    return Intl.message(
      'Now',
      name: 'now',
      desc: '',
      args: [],
    );
  }

  /// `----------------------------------------------`
  String get auth_cycle {
    return Intl.message(
      '----------------------------------------------',
      name: 'auth_cycle',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get remember_me {
    return Intl.message(
      'Remember me',
      name: 'remember_me',
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

  /// `Login as a guest`
  String get login_as_a_guest {
    return Intl.message(
      'Login as a guest',
      name: 'login_as_a_guest',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the OTP code`
  String get please_enter_the_otp_code {
    return Intl.message(
      'Please enter the OTP code',
      name: 'please_enter_the_otp_code',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_ {
    return Intl.message(
      'Continue',
      name: 'continue_',
      desc: '',
      args: [],
    );
  }

  /// `You didn't receive any code? `
  String get you_did_nt_receive_any_code {
    return Intl.message(
      'You didn`t receive any code? ',
      name: 'you_did_nt_receive_any_code',
      desc: '',
      args: [],
    );
  }

  /// `Request new OTP code in`
  String get request_new_otp_code_in {
    return Intl.message(
      'Request new OTP code in',
      name: 'request_new_otp_code_in',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Allow the “APP” to use your location?`
  String get allow_the_app_to_use_your_location {
    return Intl.message(
      'Allow the “APP” to use your location?',
      name: 'allow_the_app_to_use_your_location',
      desc: '',
      args: [],
    );
  }

  /// `Allow once`
  String get allow_once {
    return Intl.message(
      'Allow once',
      name: 'allow_once',
      desc: '',
      args: [],
    );
  }

  /// `Do not allow`
  String get do_not_allow {
    return Intl.message(
      'Do not allow',
      name: 'do_not_allow',
      desc: '',
      args: [],
    );
  }

  /// `Search for your address`
  String get search_for_your_address {
    return Intl.message(
      'Search for your address',
      name: 'search_for_your_address',
      desc: '',
      args: [],
    );
  }

  /// `Deliver here`
  String get deliver_here {
    return Intl.message(
      'Deliver here',
      name: 'deliver_here',
      desc: '',
      args: [],
    );
  }

  /// `------`
  String get error___ {
    return Intl.message(
      '------',
      name: 'error___',
      desc: '',
      args: [],
    );
  }

  /// `enter_Location`
  String get enter_Location {
    return Intl.message(
      'enter_Location',
      name: 'enter_Location',
      desc: '',
      args: [],
    );
  }

  /// `enter_code`
  String get enter_code {
    return Intl.message(
      'enter_code',
      name: 'enter_code',
      desc: '',
      args: [],
    );
  }

  /// `apply`
  String get apply {
    return Intl.message(
      'apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `private_profile`
  String get private_profile {
    return Intl.message(
      'private_profile',
      name: 'private_profile',
      desc: '',
      args: [],
    );
  }

  /// `car`
  String get car {
    return Intl.message(
      'car',
      name: 'car',
      desc: '',
      args: [],
    );
  }

  /// `files`
  String get files {
    return Intl.message(
      'files',
      name: 'files',
      desc: '',
      args: [],
    );
  }

  /// `the name`
  String get the_name {
    return Intl.message(
      'the name',
      name: 'the_name',
      desc: '',
      args: [],
    );
  }

  /// `national ID number`
  String get national_ID_number {
    return Intl.message(
      'national ID number',
      name: 'national_ID_number',
      desc: '',
      args: [],
    );
  }

  /// `client mode`
  String get client_mode {
    return Intl.message(
      'client mode',
      name: 'client_mode',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get available {
    return Intl.message(
      'Available',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `Unavailable`
  String get unavailable {
    return Intl.message(
      'Unavailable',
      name: 'unavailable',
      desc: '',
      args: [],
    );
  }

  /// `automatic acceptance`
  String get automatic_acceptance {
    return Intl.message(
      'automatic acceptance',
      name: 'automatic_acceptance',
      desc: '',
      args: [],
    );
  }

  /// `wallet`
  String get wallet {
    return Intl.message(
      'wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `performance`
  String get performance {
    return Intl.message(
      'performance',
      name: 'performance',
      desc: '',
      args: [],
    );
  }

  /// `number of orders`
  String get number_of_orders {
    return Intl.message(
      'number of orders',
      name: 'number_of_orders',
      desc: '',
      args: [],
    );
  }

  /// `completed order`
  String get completed_order {
    return Intl.message(
      'completed order',
      name: 'completed_order',
      desc: '',
      args: [],
    );
  }

  /// `working hours`
  String get working_hours {
    return Intl.message(
      'working hours',
      name: 'working_hours',
      desc: '',
      args: [],
    );
  }

  /// `rating`
  String get rating {
    return Intl.message(
      'rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `acceptance rate`
  String get acceptance_rate {
    return Intl.message(
      'acceptance rate',
      name: 'acceptance_rate',
      desc: '',
      args: [],
    );
  }

  /// `Allow while using app`
  String get allow_location {
    return Intl.message(
      'Allow while using app',
      name: 'allow_location',
      desc: '',
      args: [],
    );
  }

  /// `enter Adresss`
  String get enter_Adresss {
    return Intl.message(
      'enter Adresss',
      name: 'enter_Adresss',
      desc: '',
      args: [],
    );
  }

  /// `quick`
  String get quick {
    return Intl.message(
      'quick',
      name: 'quick',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `offer`
  String get offer {
    return Intl.message(
      'offer',
      name: 'offer',
      desc: '',
      args: [],
    );
  }

  /// `delivery mode`
  String get delivery_mode {
    return Intl.message(
      'delivery mode',
      name: 'delivery_mode',
      desc: '',
      args: [],
    );
  }

  /// `total Amount`
  String get totalAmount {
    return Intl.message(
      'total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `add note`
  String get add_note {
    return Intl.message(
      'add note',
      name: 'add_note',
      desc: '',
      args: [],
    );
  }

  /// `gift voucher`
  String get gift_voucher {
    return Intl.message(
      'gift voucher',
      name: 'gift_voucher',
      desc: '',
      args: [],
    );
  }

  /// `bank`
  String get bank {
    return Intl.message(
      'bank',
      name: 'bank',
      desc: '',
      args: [],
    );
  }

  /// `performance details`
  String get performance_details {
    return Intl.message(
      'performance details',
      name: 'performance_details',
      desc: '',
      args: [],
    );
  }

  /// `shops`
  String get shops {
    return Intl.message(
      'shops',
      name: 'shops',
      desc: '',
      args: [],
    );
  }

  /// `show cart`
  String get show_cart {
    return Intl.message(
      'show cart',
      name: 'show_cart',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Dont have data of`
  String get no_data {
    return Intl.message(
      'Dont have data of',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `no similar results found`
  String get no_similar_results_found {
    return Intl.message(
      'no similar results found',
      name: 'no_similar_results_found',
      desc: '',
      args: [],
    );
  }

  /// `Please choose the address first`
  String get please_choose_the_address_first {
    return Intl.message(
      'Please choose the address first',
      name: 'please_choose_the_address_first',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
