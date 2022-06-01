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

  /// `Confirm your phone number.`
  String get confirm_number_title {
    return Intl.message(
      'Confirm your phone number.',
      name: 'confirm_number_title',
      desc: '',
      args: [],
    );
  }

  /// `Please let us know which phone number to verify via SMS or voice call.`
  String get select_number_title {
    return Intl.message(
      'Please let us know which phone number to verify via SMS or voice call.',
      name: 'select_number_title',
      desc: '',
      args: [],
    );
  }

  /// `You will immediately receive an SMS to the number you have given `
  String get confirm_number_subtitle1 {
    return Intl.message(
      'You will immediately receive an SMS to the number you have given ',
      name: 'confirm_number_subtitle1',
      desc: '',
      args: [],
    );
  }

  /// ` Please enter the popular 5-digit code to create your user account.`
  String get confirm_number_subtitle2 {
    return Intl.message(
      ' Please enter the popular 5-digit code to create your user account.',
      name: 'confirm_number_subtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Send SMS again`
  String get sms_resend {
    return Intl.message(
      'Send SMS again',
      name: 'sms_resend',
      desc: '',
      args: [],
    );
  }

  /// `The entered code was invalid.`
  String get sms_invalid {
    return Intl.message(
      'The entered code was invalid.',
      name: 'sms_invalid',
      desc: '',
      args: [],
    );
  }

  /// `RETURN`
  String get return_button {
    return Intl.message(
      'RETURN',
      name: 'return_button',
      desc: '',
      args: [],
    );
  }

  /// `Select country code`
  String get select_country_code {
    return Intl.message(
      'Select country code',
      name: 'select_country_code',
      desc: '',
      args: [],
    );
  }

  /// `Choose your favorite method to the number you provided `
  String get call_method1 {
    return Intl.message(
      'Choose your favorite method to the number you provided ',
      name: 'call_method1',
      desc: '',
      args: [],
    );
  }

  /// ` to verify.`
  String get call_method2 {
    return Intl.message(
      ' to verify.',
      name: 'call_method2',
      desc: '',
      args: [],
    );
  }

  /// `SMS`
  String get sms {
    return Intl.message(
      'SMS',
      name: 'sms',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone_call {
    return Intl.message(
      'Phone',
      name: 'phone_call',
      desc: '',
      args: [],
    );
  }

  /// `Country name`
  String get country_name {
    return Intl.message(
      'Country name',
      name: 'country_name',
      desc: '',
      args: [],
    );
  }

  /// `Required field`
  String get required_field {
    return Intl.message(
      'Required field',
      name: 'required_field',
      desc: '',
      args: [],
    );
  }

  /// `User account created`
  String get user_account_created {
    return Intl.message(
      'User account created',
      name: 'user_account_created',
      desc: '',
      args: [],
    );
  }

  /// `Create your company profile.`
  String get create_company_profile {
    return Intl.message(
      'Create your company profile.',
      name: 'create_company_profile',
      desc: '',
      args: [],
    );
  }

  /// `Let us know how your company can be reached by post.`
  String get create_company_profile_descr {
    return Intl.message(
      'Let us know how your company can be reached by post.',
      name: 'create_company_profile_descr',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully created your user account and therefore only have one more step to gain access to Hamster's BusinessTerminal.`
  String get user_account_created_description {
    return Intl.message(
      'You have successfully created your user account and therefore only have one more step to gain access to Hamster\'s BusinessTerminal.',
      name: 'user_account_created_description',
      desc: '',
      args: [],
    );
  }

  /// `Administration`
  String get administration {
    return Intl.message(
      'Administration',
      name: 'administration',
      desc: '',
      args: [],
    );
  }

  /// `Account Verification`
  String get account_verification {
    return Intl.message(
      'Account Verification',
      name: 'account_verification',
      desc: '',
      args: [],
    );
  }

  /// `My Company`
  String get my_company {
    return Intl.message(
      'My Company',
      name: 'my_company',
      desc: '',
      args: [],
    );
  }

  /// `User Management`
  String get user_management {
    return Intl.message(
      'User Management',
      name: 'user_management',
      desc: '',
      args: [],
    );
  }

  /// `Finance`
  String get finance {
    return Intl.message(
      'Finance',
      name: 'finance',
      desc: '',
      args: [],
    );
  }

  /// `Finance1`
  String get finance1 {
    return Intl.message(
      'Finance1',
      name: 'finance1',
      desc: '',
      args: [],
    );
  }

  /// `User account`
  String get user_account {
    return Intl.message(
      'User account',
      name: 'user_account',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_password {
    return Intl.message(
      'Change password',
      name: 'change_password',
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

  /// `Help center`
  String get help_center {
    return Intl.message(
      'Help center',
      name: 'help_center',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get cancel_register {
    return Intl.message(
      'Logout',
      name: 'cancel_register',
      desc: '',
      args: [],
    );
  }

  /// `Company name`
  String get company_hint {
    return Intl.message(
      'Company name',
      name: 'company_hint',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street_hint {
    return Intl.message(
      'Street',
      name: 'street_hint',
      desc: '',
      args: [],
    );
  }

  /// `Postcode`
  String get post_hint {
    return Intl.message(
      'Postcode',
      name: 'post_hint',
      desc: '',
      args: [],
    );
  }

  /// `No.`
  String get num_hint {
    return Intl.message(
      'No.',
      name: 'num_hint',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location_hint {
    return Intl.message(
      'Location',
      name: 'location_hint',
      desc: '',
      args: [],
    );
  }

  /// `Maximum number {length} characters`
  String min_number(Object length) {
    return Intl.message(
      'Maximum number $length characters',
      name: 'min_number',
      desc: '',
      args: [length],
    );
  }

  /// `Minimum number {length} characters`
  String max_number(Object length) {
    return Intl.message(
      'Minimum number $length characters',
      name: 'max_number',
      desc: '',
      args: [length],
    );
  }

  /// `Country`
  String get country_hint {
    return Intl.message(
      'Country',
      name: 'country_hint',
      desc: '',
      args: [],
    );
  }

  /// `Company profile`
  String get company_profile {
    return Intl.message(
      'Company profile',
      name: 'company_profile',
      desc: '',
      args: [],
    );
  }

  /// `Add logo`
  String get add_logo {
    return Intl.message(
      'Add logo',
      name: 'add_logo',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Company name`
  String get company_name {
    return Intl.message(
      'Company name',
      name: 'company_name',
      desc: '',
      args: [],
    );
  }

  /// `Street, house number`
  String get street_house_number {
    return Intl.message(
      'Street, house number',
      name: 'street_house_number',
      desc: '',
      args: [],
    );
  }

  /// `ZIP code and location`
  String get zip_code_and_location {
    return Intl.message(
      'ZIP code and location',
      name: 'zip_code_and_location',
      desc: '',
      args: [],
    );
  }

  /// `Base data`
  String get base_data {
    return Intl.message(
      'Base data',
      name: 'base_data',
      desc: '',
      args: [],
    );
  }

  /// `Commercial Register No. (if available)`
  String get commercial_register_number {
    return Intl.message(
      'Commercial Register No. (if available)',
      name: 'commercial_register_number',
      desc: '',
      args: [],
    );
  }

  /// `Tax number`
  String get tax_number {
    return Intl.message(
      'Tax number',
      name: 'tax_number',
      desc: '',
      args: [],
    );
  }

  /// `VAT ID (if available)`
  String get vat_id {
    return Intl.message(
      'VAT ID (if available)',
      name: 'vat_id',
      desc: '',
      args: [],
    );
  }

  /// `Payment Information`
  String get payment_information {
    return Intl.message(
      'Payment Information',
      name: 'payment_information',
      desc: '',
      args: [],
    );
  }

  /// `Add bank details`
  String get add_bank_details {
    return Intl.message(
      'Add bank details',
      name: 'add_bank_details',
      desc: '',
      args: [],
    );
  }

  /// `Account owner`
  String get account_owner {
    return Intl.message(
      'Account owner',
      name: 'account_owner',
      desc: '',
      args: [],
    );
  }

  /// `IBAN`
  String get iban {
    return Intl.message(
      'IBAN',
      name: 'iban',
      desc: '',
      args: [],
    );
  }

  /// `The minimum number of characters was not reached`
  String get min_length_field {
    return Intl.message(
      'The minimum number of characters was not reached',
      name: 'min_length_field',
      desc: '',
      args: [],
    );
  }

  /// `USER`
  String get user {
    return Intl.message(
      'USER',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `NUMBER`
  String get number {
    return Intl.message(
      'NUMBER',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `CONNECTION`
  String get connection {
    return Intl.message(
      'CONNECTION',
      name: 'connection',
      desc: '',
      args: [],
    );
  }

  /// `STATUS`
  String get status {
    return Intl.message(
      'STATUS',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `COMPANIES`
  String get companies {
    return Intl.message(
      'COMPANIES',
      name: 'companies',
      desc: '',
      args: [],
    );
  }

  /// `Tills`
  String get tills {
    return Intl.message(
      'Tills',
      name: 'tills',
      desc: '',
      args: [],
    );
  }

  /// `Branches`
  String get branches {
    return Intl.message(
      'Branches',
      name: 'branches',
      desc: '',
      args: [],
    );
  }

  /// `Verified`
  String get verified {
    return Intl.message(
      'Verified',
      name: 'verified',
      desc: '',
      args: [],
    );
  }

  /// `Visible`
  String get visible {
    return Intl.message(
      'Visible',
      name: 'visible',
      desc: '',
      args: [],
    );
  }

  /// `Not visible`
  String get not_visible {
    return Intl.message(
      'Not visible',
      name: 'not_visible',
      desc: '',
      args: [],
    );
  }

  /// `Data incomplete`
  String get data_incomplete {
    return Intl.message(
      'Data incomplete',
      name: 'data_incomplete',
      desc: '',
      args: [],
    );
  }

  /// `Add branch`
  String get add_branch {
    return Intl.message(
      'Add branch',
      name: 'add_branch',
      desc: '',
      args: [],
    );
  }

  /// `Store Profile`
  String get branch_profile {
    return Intl.message(
      'Store Profile',
      name: 'branch_profile',
      desc: '',
      args: [],
    );
  }

  /// `Store Categories`
  String get branch_category {
    return Intl.message(
      'Store Categories',
      name: 'branch_category',
      desc: '',
      args: [],
    );
  }

  /// `Store equipment`
  String get branch_equipment {
    return Intl.message(
      'Store equipment',
      name: 'branch_equipment',
      desc: '',
      args: [],
    );
  }

  /// `store name`
  String get branch_name {
    return Intl.message(
      'store name',
      name: 'branch_name',
      desc: '',
      args: [],
    );
  }

  /// `Website (if any)`
  String get website_if_available {
    return Intl.message(
      'Website (if any)',
      name: 'website_if_available',
      desc: '',
      args: [],
    );
  }

  /// `Phone number for customers (if available)`
  String get telephone_number_if_available {
    return Intl.message(
      'Phone number for customers (if available)',
      name: 'telephone_number_if_available',
      desc: '',
      args: [],
    );
  }

  /// `Number of store entrances`
  String get number_of_branch_entrances {
    return Intl.message(
      'Number of store entrances',
      name: 'number_of_branch_entrances',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Opening hours`
  String get opening_hours {
    return Intl.message(
      'Opening hours',
      name: 'opening_hours',
      desc: '',
      args: [],
    );
  }

  /// `closed`
  String get closed {
    return Intl.message(
      'closed',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `Add your business account`
  String get add_business_account {
    return Intl.message(
      'Add your business account',
      name: 'add_business_account',
      desc: '',
      args: [],
    );
  }

  /// `For credits and regular billing, we still need your bank details and consent to the direct debit procedure`
  String get for_credits_and_regular_billing {
    return Intl.message(
      'For credits and regular billing, we still need your bank details and consent to the direct debit procedure',
      name: 'for_credits_and_regular_billing',
      desc: '',
      args: [],
    );
  }

  /// `I authorize Hamster Systems AG to collect payments from my account by direct debit. At the same time, I instruct my bank to redeem the direct debits drawn by Hamster Systems AG on my account. By accepting this agreement, Hamster Systems AG undertakes to im to the same extent on the payment of credit to the above account`
  String get i_authorize_collect_payment {
    return Intl.message(
      'I authorize Hamster Systems AG to collect payments from my account by direct debit. At the same time, I instruct my bank to redeem the direct debits drawn by Hamster Systems AG on my account. By accepting this agreement, Hamster Systems AG undertakes to im to the same extent on the payment of credit to the above account',
      name: 'i_authorize_collect_payment',
      desc: '',
      args: [],
    );
  }

  /// `Maximum length reached`
  String get max_length_reached {
    return Intl.message(
      'Maximum length reached',
      name: 'max_length_reached',
      desc: '',
      args: [],
    );
  }

  /// `The maximum length is $0 characters`
  String get max_length_error {
    return Intl.message(
      'The maximum length is \$0 characters',
      name: 'max_length_error',
      desc: '',
      args: [],
    );
  }

  /// `The IBAN number should only contain Latin letters and numbers`
  String get iban_format_error {
    return Intl.message(
      'The IBAN number should only contain Latin letters and numbers',
      name: 'iban_format_error',
      desc: '',
      args: [],
    );
  }

  /// `Number: {number}`
  String branch_id(Object number) {
    return Intl.message(
      'Number: $number',
      name: 'branch_id',
      desc: '',
      args: [number],
    );
  }

  /// `Have you forgotten\nyour password?`
  String get forget_password {
    return Intl.message(
      'Have you forgotten\nyour password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address associated with\nyour account to continue\nresetting your password.`
  String get forget_password_subtitle {
    return Intl.message(
      'Enter your email address associated with\nyour account to continue\nresetting your password.',
      name: 'forget_password_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose your favorite method to recover the account password`
  String get forgetpassword_email_subtitle {
    return Intl.message(
      'Choose your favorite method to recover the account password',
      name: 'forgetpassword_email_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `\nto reset.`
  String get forgetpassword_email_subtitle2 {
    return Intl.message(
      '\nto reset.',
      name: 'forgetpassword_email_subtitle2',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Cash register system used in your branch`
  String get cash_register_system_used {
    return Intl.message(
      'Cash register system used in your branch',
      name: 'cash_register_system_used',
      desc: '',
      args: [],
    );
  }

  /// `Help us connect your branch by specifying you POS systems`
  String get help_us_connect_branch {
    return Intl.message(
      'Help us connect your branch by specifying you POS systems',
      name: 'help_us_connect_branch',
      desc: '',
      args: [],
    );
  }

  /// `Cash register manufacturer`
  String get cash_register_manufacturer {
    return Intl.message(
      'Cash register manufacturer',
      name: 'cash_register_manufacturer',
      desc: '',
      args: [],
    );
  }

  /// `Model (if known)`
  String get model_if_known {
    return Intl.message(
      'Model (if known)',
      name: 'model_if_known',
      desc: '',
      args: [],
    );
  }

  /// `Number of registers`
  String get number_of_registers {
    return Intl.message(
      'Number of registers',
      name: 'number_of_registers',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forget_password_header {
    return Intl.message(
      'Forgot your password?',
      name: 'forget_password_header',
      desc: '',
      args: [],
    );
  }

  /// `Choose a main category.`
  String get choose_main_category {
    return Intl.message(
      'Choose a main category.',
      name: 'choose_main_category',
      desc: '',
      args: [],
    );
  }

  /// `Choose a main category by double-clicking it. This is displayed to all HamsterApp users.`
  String get choose_main_category_descr {
    return Intl.message(
      'Choose a main category by double-clicking it. This is displayed to all HamsterApp users.',
      name: 'choose_main_category_descr',
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

  /// `Select appropriate subcategories.`
  String get select_subcategories {
    return Intl.message(
      'Select appropriate subcategories.',
      name: 'select_subcategories',
      desc: '',
      args: [],
    );
  }

  /// `Select up to nine subcategories to improve search results in the HamsterApp.`
  String get select_subcategories_descr {
    return Intl.message(
      'Select up to nine subcategories to improve search results in the HamsterApp.',
      name: 'select_subcategories_descr',
      desc: '',
      args: [],
    );
  }

  /// `Add subcategory`
  String get add_subcategory {
    return Intl.message(
      'Add subcategory',
      name: 'add_subcategory',
      desc: '',
      args: [],
    );
  }

  /// `Subcategory`
  String get subcategory {
    return Intl.message(
      'Subcategory',
      name: 'subcategory',
      desc: '',
      args: [],
    );
  }

  /// `CONTINUE`
  String get continue_button {
    return Intl.message(
      'CONTINUE',
      name: 'continue_button',
      desc: '',
      args: [],
    );
  }

  /// `Add store categories`
  String get add_category {
    return Intl.message(
      'Add store categories',
      name: 'add_category',
      desc: '',
      args: [],
    );
  }

  /// `Main category`
  String get main_category {
    return Intl.message(
      'Main category',
      name: 'main_category',
      desc: '',
      args: [],
    );
  }

  /// `Resend email`
  String get reset_email {
    return Intl.message(
      'Resend email',
      name: 'reset_email',
      desc: '',
      args: [],
    );
  }

  /// `I hereby certify that all of the information I have given is complete and correct.`
  String get i_certify_info_correct {
    return Intl.message(
      'I hereby certify that all of the information I have given is complete and correct.',
      name: 'i_certify_info_correct',
      desc: '',
      args: [],
    );
  }

  /// `Request verification`
  String get request_verification {
    return Intl.message(
      'Request verification',
      name: 'request_verification',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Add branch hours`
  String get add_branch_hours {
    return Intl.message(
      'Add branch hours',
      name: 'add_branch_hours',
      desc: '',
      args: [],
    );
  }

  /// `First select the day(s) of the week whose opening hours you want to edit`
  String get select_week_days {
    return Intl.message(
      'First select the day(s) of the week whose opening hours you want to edit',
      name: 'select_week_days',
      desc: '',
      args: [],
    );
  }

  /// `Select all`
  String get select_all {
    return Intl.message(
      'Select all',
      name: 'select_all',
      desc: '',
      args: [],
    );
  }

  /// `as`
  String get ass {
    return Intl.message(
      'as',
      name: 'ass',
      desc: '',
      args: [],
    );
  }

  /// `If the branch is closed on the selected day(s), leave the fields below empty`
  String get if_branch_closed_on_selected {
    return Intl.message(
      'If the branch is closed on the selected day(s), leave the fields below empty',
      name: 'if_branch_closed_on_selected',
      desc: '',
      args: [],
    );
  }

  /// `Opens`
  String get opens {
    return Intl.message(
      'Opens',
      name: 'opens',
      desc: '',
      args: [],
    );
  }

  /// `Closes`
  String get closes {
    return Intl.message(
      'Closes',
      name: 'closes',
      desc: '',
      args: [],
    );
  }

  /// `Add opening time`
  String get add_opening_time {
    return Intl.message(
      'Add opening time',
      name: 'add_opening_time',
      desc: '',
      args: [],
    );
  }

  /// `Add your company logo.`
  String get addYourCompanyLogo {
    return Intl.message(
      'Add your company logo.',
      name: 'addYourCompanyLogo',
      desc: '',
      args: [],
    );
  }

  /// `Choose your company logo and upload it. Make sure the selected image file is of sufficient quality.`
  String get addYourCompanyLogoDescription {
    return Intl.message(
      'Choose your company logo and upload it. Make sure the selected image file is of sufficient quality.',
      name: 'addYourCompanyLogoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `wip`
  String get work_in_progress {
    return Intl.message(
      'wip',
      name: 'work_in_progress',
      desc: '',
      args: [],
    );
  }

  /// `Add the appropriate\nbranch information`
  String get add_details {
    return Intl.message(
      'Add the appropriate\nbranch information',
      name: 'add_details',
      desc: '',
      args: [],
    );
  }

  /// `If your company and a branch have the identical\naddress, please mark the \ninformation that is over -aging.`
  String get if_identical_addresses {
    return Intl.message(
      'If your company and a branch have the identical\naddress, please mark the \ninformation that is over -aging.',
      name: 'if_identical_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Entrance doors amount {number}`
  String entrances_count(Object number) {
    return Intl.message(
      'Entrance doors amount $number',
      name: 'entrances_count',
      desc: '',
      args: [number],
    );
  }

  /// `Forgot your password?`
  String get forget_pasword_header {
    return Intl.message(
      'Forgot your password?',
      name: 'forget_pasword_header',
      desc: '',
      args: [],
    );
  }

  /// `Resend email`
  String get resetmail {
    return Intl.message(
      'Resend email',
      name: 'resetmail',
      desc: '',
      args: [],
    );
  }

  /// `Ersetzen Sie Ihr altes Passwort.`
  String get changePasswordHeader {
    return Intl.message(
      'Ersetzen Sie Ihr altes Passwort.',
      name: 'changePasswordHeader',
      desc: '',
      args: [],
    );
  }

  /// `Ersetzen Sie nun ihr altes, ausgedientes Passwort durch ein neues, um die Sicherheit Ihres Accounts zu wahren`
  String get changePasswordSubHeader {
    return Intl.message(
      'Ersetzen Sie nun ihr altes, ausgedientes Passwort durch ein neues, um die Sicherheit Ihres Accounts zu wahren',
      name: 'changePasswordSubHeader',
      desc: '',
      args: [],
    );
  }

  /// `Aktuelles Passwort`
  String get currentPassword {
    return Intl.message(
      'Aktuelles Passwort',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Dein Passwort muss mindestens die \nnachfolgenden Kriterien erfüllen:`
  String get passwordHintTitle {
    return Intl.message(
      'Dein Passwort muss mindestens die \nnachfolgenden Kriterien erfüllen:',
      name: 'passwordHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `10 Zeichen lang`
  String get hasTenCharacters {
    return Intl.message(
      '10 Zeichen lang',
      name: 'hasTenCharacters',
      desc: '',
      args: [],
    );
  }

  /// `1 Kleinbuchstabe`
  String get hasOneLoweCaseLetter {
    return Intl.message(
      '1 Kleinbuchstabe',
      name: 'hasOneLoweCaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `1 Großbuchstabe`
  String get hasOneUpperCaseLetter {
    return Intl.message(
      '1 Großbuchstabe',
      name: 'hasOneUpperCaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `1 Zahl`
  String get hasOneSpecialCharacter {
    return Intl.message(
      '1 Zahl',
      name: 'hasOneSpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Hinweis schließen`
  String get closeHint {
    return Intl.message(
      'Hinweis schließen',
      name: 'closeHint',
      desc: '',
      args: [],
    );
  }

  /// `Passwort geändert.`
  String get passwordChanged {
    return Intl.message(
      'Passwort geändert.',
      name: 'passwordChanged',
      desc: '',
      args: [],
    );
  }

  /// `Sie haben erfolgreich Ihr altes durch ein neues Passwort ersetzt und können sich ab sofort mit diesem bereits anmelden.`
  String get passwordChangedDescription {
    return Intl.message(
      'Sie haben erfolgreich Ihr altes durch ein neues Passwort ersetzt und können sich ab sofort mit diesem bereits anmelden.',
      name: 'passwordChangedDescription',
      desc: '',
      args: [],
    );
  }

  /// `Falsches Passwort`
  String get falschesPasswort {
    return Intl.message(
      'Falsches Passwort',
      name: 'falschesPasswort',
      desc: '',
      args: [],
    );
  }

  /// `Bitte überprüfen Sie nochmals das von Ihnen eingegebene aktuelle Passwort, da dies nicht mit unseren Daten übereinstimmt.`
  String get passwordIncorrectDescription {
    return Intl.message(
      'Bitte überprüfen Sie nochmals das von Ihnen eingegebene aktuelle Passwort, da dies nicht mit unseren Daten übereinstimmt.',
      name: 'passwordIncorrectDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add pictures of your branch.`
  String get add_picture_for_branch {
    return Intl.message(
      'Add pictures of your branch.',
      name: 'add_picture_for_branch',
      desc: '',
      args: [],
    );
  }

  /// `Select and upload your branch images. Make sure that the selected image files are of sufficient quality.`
  String get add_picture_for_branch_descr {
    return Intl.message(
      'Select and upload your branch images. Make sure that the selected image files are of sufficient quality.',
      name: 'add_picture_for_branch_descr',
      desc: '',
      args: [],
    );
  }

  /// `Add branch picture`
  String get add_branch_picture {
    return Intl.message(
      'Add branch picture',
      name: 'add_branch_picture',
      desc: '',
      args: [],
    );
  }

  /// `TO SAVE`
  String get to_save {
    return Intl.message(
      'TO SAVE',
      name: 'to_save',
      desc: '',
      args: [],
    );
  }

  /// `Edit your profile photo.`
  String get edit_photo {
    return Intl.message(
      'Edit your profile photo.',
      name: 'edit_photo',
      desc: '',
      args: [],
    );
  }

  /// `Select the correct section of your profile photo.`
  String get edit_photo_descr {
    return Intl.message(
      'Select the correct section of your profile photo.',
      name: 'edit_photo_descr',
      desc: '',
      args: [],
    );
  }

  /// `Ersetzen Sie Ihr altes Passwort.`
  String get confirmNewPasswordTitle {
    return Intl.message(
      'Ersetzen Sie Ihr altes Passwort.',
      name: 'confirmNewPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ersetzen Sie nun Ihr altes, ausgedientes Passwort durch ein neues, um wieder ohne Probleme auf Ihren Account zugreifen zu können.`
  String get confirmNewPasswordSubtitle {
    return Intl.message(
      'Ersetzen Sie nun Ihr altes, ausgedientes Passwort durch ein neues, um wieder ohne Probleme auf Ihren Account zugreifen zu können.',
      name: 'confirmNewPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Passwort geändert.`
  String get newPasswordInstalledTitle {
    return Intl.message(
      'Passwort geändert.',
      name: 'newPasswordInstalledTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sie haben erfolgreich Ihr altes durch ein neues. Passwort ersetzt und können sich ab sofort mit diesem bereits anmelden.`
  String get newPasswordIntalledDescription {
    return Intl.message(
      'Sie haben erfolgreich Ihr altes durch ein neues. Passwort ersetzt und können sich ab sofort mit diesem bereits anmelden.',
      name: 'newPasswordIntalledDescription',
      desc: '',
      args: [],
    );
  }

  /// `Sie erhalten gleich eine SMS an die mit dem Nutzeraccount, beispiel@unternehmen.de, verknüpfte Nummer`
  String get forgetPasswordSmsSubtitle1 {
    return Intl.message(
      'Sie erhalten gleich eine SMS an die mit dem Nutzeraccount, beispiel@unternehmen.de, verknüpfte Nummer',
      name: 'forgetPasswordSmsSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `. Bitte geben Sie den 5-stelligen Code ein, um Ihre Passwort zurück zu setzen.`
  String get forgetPasswordSmsSubtitle2 {
    return Intl.message(
      '. Bitte geben Sie den 5-stelligen Code ein, um Ihre Passwort zurück zu setzen.',
      name: 'forgetPasswordSmsSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Sie erhalten gleich einen Anruf mit automatischer Sprachansage auf der mit dem Nutzeraccount, beispiel@unternehmen.de, verknüpften Nummer`
  String get forgetPasswordPhoneCallSubtitle1 {
    return Intl.message(
      'Sie erhalten gleich einen Anruf mit automatischer Sprachansage auf der mit dem Nutzeraccount, beispiel@unternehmen.de, verknüpften Nummer',
      name: 'forgetPasswordPhoneCallSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Bitte geben Sie den 5-stelligen Code ein, um Ihre Passwort zurück zu setzen.`
  String get forgetPasswordPhoneCallSubtitle2 {
    return Intl.message(
      'Bitte geben Sie den 5-stelligen Code ein, um Ihre Passwort zurück zu setzen.',
      name: 'forgetPasswordPhoneCallSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `E-Mail erneut versenden`
  String get resetEmail {
    return Intl.message(
      'E-Mail erneut versenden',
      name: 'resetEmail',
      desc: '',
      args: [],
    );
  }

  /// `SMS erneut versenden`
  String get resetSms {
    return Intl.message(
      'SMS erneut versenden',
      name: 'resetSms',
      desc: '',
      args: [],
    );
  }

  /// `Anruf erneut durchführen`
  String get resetPhoneCall {
    return Intl.message(
      'Anruf erneut durchführen',
      name: 'resetPhoneCall',
      desc: '',
      args: [],
    );
  }

  /// `Sie erhalten in Kürze erneut eine SMS von uns`
  String get sieErhaltenInKrzeErneutEineSmsVonUns {
    return Intl.message(
      'Sie erhalten in Kürze erneut eine SMS von uns',
      name: 'sieErhaltenInKrzeErneutEineSmsVonUns',
      desc: '',
      args: [],
    );
  }

  /// `Sie erhalten in Kürze erneut eine SMS von uns`
  String get smsResent {
    return Intl.message(
      'Sie erhalten in Kürze erneut eine SMS von uns',
      name: 'smsResent',
      desc: '',
      args: [],
    );
  }

  /// `Wir werden Sie in Kürze erneut anrufen.`
  String get callIsOrdered {
    return Intl.message(
      'Wir werden Sie in Kürze erneut anrufen.',
      name: 'callIsOrdered',
      desc: '',
      args: [],
    );
  }

  /// `Sie erhalten in Kürze erneut eine E-Mail von uns.`
  String get emailCodeSent {
    return Intl.message(
      'Sie erhalten in Kürze erneut eine E-Mail von uns.',
      name: 'emailCodeSent',
      desc: '',
      args: [],
    );
  }

  /// `Der eingegebene Code war ungültig.`
  String get forgetPasswordCodeIncorrect {
    return Intl.message(
      'Der eingegebene Code war ungültig.',
      name: 'forgetPasswordCodeIncorrect',
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
      Locale.fromSubtags(languageCode: 'de'),
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
