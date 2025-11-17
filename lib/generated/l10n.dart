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

  /// `Start Now`
  String get startNow {
    return Intl.message(
      'Start Now',
      name: 'startNow',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide collection of premium fresh fruits and enjoy the best deals and top quality.`
  String get onBoardingSubTitlePage1 {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide collection of premium fresh fruits and enjoy the best deals and top quality.',
      name: 'onBoardingSubTitlePage1',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to `
  String get onBoardingTitleTextSpan1Page1 {
    return Intl.message(
      'Welcome to ',
      name: 'onBoardingTitleTextSpan1Page1',
      desc: '',
      args: [],
    );
  }

  /// `Fruit`
  String get onBoardingTitleTextSpan2Page1 {
    return Intl.message(
      'Fruit',
      name: 'onBoardingTitleTextSpan2Page1',
      desc: '',
      args: [],
    );
  }

  /// `HUB`
  String get onBoardingTitleTextSpan3Page1 {
    return Intl.message(
      'HUB',
      name: 'onBoardingTitleTextSpan3Page1',
      desc: '',
      args: [],
    );
  }

  /// `We bring you the best carefully selected fruits. Check details, images, and reviews to choose your perfect fruit.`
  String get onBoardingSubTitlePage2 {
    return Intl.message(
      'We bring you the best carefully selected fruits. Check details, images, and reviews to choose your perfect fruit.',
      name: 'onBoardingSubTitlePage2',
      desc: '',
      args: [],
    );
  }

  /// `Search and Shop`
  String get onBoardingTitleTextPage2 {
    return Intl.message(
      'Search and Shop',
      name: 'onBoardingTitleTextPage2',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get weakPassword {
    return Intl.message(
      'The password provided is too weak.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists for that email.`
  String get emailAlreadyInUse {
    return Intl.message(
      'An account already exists for that email.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection.`
  String get networkError {
    return Intl.message(
      'Please check your internet connection.',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again.`
  String get genericError {
    return Intl.message(
      'Something went wrong, please try again.',
      name: 'genericError',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password.`
  String get invalidEmailOrPassword {
    return Intl.message(
      'Invalid email or password.',
      name: 'invalidEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password. Please try again.`
  String get invalidCredential {
    return Intl.message(
      'Incorrect email or password. Please try again.',
      name: 'invalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `The email address is already associated with a different sign-in method.`
  String get facebookAccountExistsDifferentCredential {
    return Intl.message(
      'The email address is already associated with a different sign-in method.',
      name: 'facebookAccountExistsDifferentCredential',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred during Facebook login.`
  String get facebookLoginError {
    return Intl.message(
      'An error occurred during Facebook login.',
      name: 'facebookLoginError',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get newAccountTitleBar {
    return Intl.message(
      'New Account',
      name: 'newAccountTitleBar',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullNameHint {
    return Intl.message(
      'Full Name',
      name: 'fullNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailHint {
    return Intl.message(
      'Email Address',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get passwordHint {
    return Intl.message(
      'password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get newAccountButton {
    return Intl.message(
      'Create New Account',
      name: 'newAccountButton',
      desc: '',
      args: [],
    );
  }

  /// `You must accept the terms and conditions.`
  String get mustAcceptTerms {
    return Intl.message(
      'You must accept the terms and conditions.',
      name: 'mustAcceptTerms',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
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

  /// `By creating an account, you agree to `
  String get termsIntro {
    return Intl.message(
      'By creating an account, you agree to ',
      name: 'termsIntro',
      desc: '',
      args: [],
    );
  }

  /// `our Terms and Conditions `
  String get termsAndConditions {
    return Intl.message(
      'our Terms and Conditions ',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get noAccount {
    return Intl.message(
      'Don’t have an account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get createAccount {
    return Intl.message(
      'Create an Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get orDivider {
    return Intl.message(
      'Or',
      name: 'orDivider',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get signInWithApple {
    return Intl.message(
      'Sign in with Apple',
      name: 'signInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Apple Sign-In is not developed yet for iOS users.`
  String get appleSignInNotDeveloped {
    return Intl.message(
      'Apple Sign-In is not developed yet for iOS users.',
      name: 'appleSignInNotDeveloped',
      desc: '',
      args: [],
    );
  }

  /// `This Field is required`
  String get fieldRequired {
    return Intl.message(
      'This Field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `This email address is not registered with us.`
  String get notRegisteredEmail {
    return Intl.message(
      'This email address is not registered with us.',
      name: 'notRegisteredEmail',
      desc: '',
      args: [],
    );
  }

  /// `Added to cart`
  String get addedToCart {
    return Intl.message(
      'Added to cart',
      name: 'addedToCart',
      desc: '',
      args: [],
    );
  }

  /// `Removed from cart`
  String get removedFromCart {
    return Intl.message(
      'Removed from cart',
      name: 'removedFromCart',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get errorOccurred {
    return Intl.message(
      'An error occurred',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Good morning!..`
  String get goodMorning {
    return Intl.message(
      'Good morning!..',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Search for.......`
  String get searchFor {
    return Intl.message(
      'Search for.......',
      name: 'searchFor',
      desc: '',
      args: [],
    );
  }

  /// `Best Selling`
  String get bestSelling {
    return Intl.message(
      'Best Selling',
      name: 'bestSelling',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `/ kilo`
  String get perKilo {
    return Intl.message(
      '/ kilo',
      name: 'perKilo',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `{count} results`
  String resultsCount(int count) {
    return Intl.message(
      '$count results',
      name: 'resultsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Do you want to log out?`
  String get logoutConfirmation {
    return Intl.message(
      'Do you want to log out?',
      name: 'logoutConfirmation',
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

  /// `Cancel`
  String get doNotWant {
    return Intl.message(
      'Cancel',
      name: 'doNotWant',
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

  /// `Invalid email format.`
  String get invalidEmailFormat {
    return Intl.message(
      'Invalid email format.',
      name: 'invalidEmailFormat',
      desc: '',
      args: [],
    );
  }

  /// `This email is not registered.`
  String get emailNotRegistered {
    return Intl.message(
      'This email is not registered.',
      name: 'emailNotRegistered',
      desc: '',
      args: [],
    );
  }

  /// `This email is not registered with us.`
  String get emailNotRegisteredHere {
    return Intl.message(
      'This email is not registered with us.',
      name: 'emailNotRegisteredHere',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts. Please try again later.`
  String get tooManyRequests {
    return Intl.message(
      'Too many attempts. Please try again later.',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Server error`
  String get serverError {
    return Intl.message(
      'Server error',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again.`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong, please try again.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again.`
  String get somethingWentWrongRetry {
    return Intl.message(
      'Something went wrong, please try again.',
      name: 'somethingWentWrongRetry',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection.`
  String get noInternet {
    return Intl.message(
      'No internet connection.',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred.`
  String get unexpectedError {
    return Intl.message(
      'An unexpected error occurred.',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred. Try again`
  String get unexpectedErrorRetry {
    return Intl.message(
      'An unexpected error occurred. Try again',
      name: 'unexpectedErrorRetry',
      desc: '',
      args: [],
    );
  }

  /// `You must log in again before changing your password.`
  String get recentLoginRequired {
    return Intl.message(
      'You must log in again before changing your password.',
      name: 'recentLoginRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password is too weak. Please choose a stronger password.`
  String get weakPasswordUpdate {
    return Intl.message(
      'Password is too weak. Please choose a stronger password.',
      name: 'weakPasswordUpdate',
      desc: '',
      args: [],
    );
  }

  /// `This account is disabled and cannot be modified.`
  String get accountDisabled {
    return Intl.message(
      'This account is disabled and cannot be modified.',
      name: 'accountDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Invalid login session, please log in again.`
  String get invalidSession {
    return Intl.message(
      'Invalid login session, please log in again.',
      name: 'invalidSession',
      desc: '',
      args: [],
    );
  }

  /// `Current password is incorrect.`
  String get currentPasswordIncorrect {
    return Intl.message(
      'Current password is incorrect.',
      name: 'currentPasswordIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `New password confirmation is incorrect`
  String get confirmPasswordIncorrect {
    return Intl.message(
      'New password confirmation is incorrect',
      name: 'confirmPasswordIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully.`
  String get passwordChangedSuccessfully {
    return Intl.message(
      'Password changed successfully.',
      name: 'passwordChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry, just enter your email and we'll send you a link to reset your password.`
  String get forgotPasswordInstructions {
    return Intl.message(
      'Don\'t worry, just enter your email and we\'ll send you a link to reset your password.',
      name: 'forgotPasswordInstructions',
      desc: '',
      args: [],
    );
  }

  /// `A reset link has been sent to your email to reset your password.`
  String get resetLinkSent {
    return Intl.message(
      'A reset link has been sent to your email to reset your password.',
      name: 'resetLinkSent',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again. Make sure of your current password.`
  String get errorCheckCurrentPassword {
    return Intl.message(
      'Something went wrong, please try again. Make sure of your current password.',
      name: 'errorCheckCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Nothing to show here!`
  String get nothingToShow {
    return Intl.message(
      'Nothing to show here!',
      name: 'nothingToShow',
      desc: '',
      args: [],
    );
  }

  /// `We'll notify you as soon as new notifications arrive.`
  String get willNotifyYou {
    return Intl.message(
      'We\'ll notify you as soon as new notifications arrive.',
      name: 'willNotifyYou',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `🍎 FruitHub is an online store specialized in selling the finest fresh and seasonal fruits, created to make buying fruits easier and more convenient than ever.`
  String get aboutText1 {
    return Intl.message(
      '🍎 FruitHub is an online store specialized in selling the finest fresh and seasonal fruits, created to make buying fruits easier and more convenient than ever.',
      name: 'aboutText1',
      desc: '',
      args: [],
    );
  }

  /// `At FruitHub, we believe that health starts with food, so we strive to provide high-quality natural products, carefully selected from the best local and international farms to ensure fresh flavor and complete nutritional value.`
  String get aboutText2 {
    return Intl.message(
      'At FruitHub, we believe that health starts with food, so we strive to provide high-quality natural products, carefully selected from the best local and international farms to ensure fresh flavor and complete nutritional value.',
      name: 'aboutText2',
      desc: '',
      args: [],
    );
  }

  /// `We always strive to provide a comfortable and safe shopping experience for all our customers, through a simple and fast user interface, with the ability to browse products easily, add favorites, and follow offers and discounts continuously.`
  String get aboutText3 {
    return Intl.message(
      'We always strive to provide a comfortable and safe shopping experience for all our customers, through a simple and fast user interface, with the ability to browse products easily, add favorites, and follow offers and discounts continuously.',
      name: 'aboutText3',
      desc: '',
      args: [],
    );
  }

  /// `We also provide a fast and safe delivery service to your doorstep, ensuring that the fruits reach you fresh as if you had chosen them yourself.`
  String get aboutText4 {
    return Intl.message(
      'We also provide a fast and safe delivery service to your doorstep, ensuring that the fruits reach you fresh as if you had chosen them yourself.',
      name: 'aboutText4',
      desc: '',
      args: [],
    );
  }

  /// `Our goal is to be the first destination for fresh fruit lovers everywhere, through product quality, ease of use, and the trust we build with every purchase.`
  String get aboutText5 {
    return Intl.message(
      'Our goal is to be the first destination for fresh fruit lovers everywhere, through product quality, ease of use, and the trust we build with every purchase.',
      name: 'aboutText5',
      desc: '',
      args: [],
    );
  }

  /// `🌿 FruitHub — Your health starts with choosing the best.`
  String get aboutText6 {
    return Intl.message(
      '🌿 FruitHub — Your health starts with choosing the best.',
      name: 'aboutText6',
      desc: '',
      args: [],
    );
  }

  /// `By El Za3eemooooooooo`
  String get developer {
    return Intl.message(
      'By El Za3eemooooooooo',
      name: 'developer',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Successful!`
  String get successfullyCompleted {
    return Intl.message(
      'Successful!',
      name: 'successfullyCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get orderNumber {
    return Intl.message(
      'Order Number',
      name: 'orderNumber',
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

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
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

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Floor Number, Apartment Number..`
  String get floorAndApartment {
    return Intl.message(
      'Floor Number, Apartment Number..',
      name: 'floorAndApartment',
      desc: '',
      args: [],
    );
  }

  /// `Save Address`
  String get saveAddress {
    return Intl.message(
      'Save Address',
      name: 'saveAddress',
      desc: '',
      args: [],
    );
  }

  /// `Shipping`
  String get shipping {
    return Intl.message(
      'Shipping',
      name: 'shipping',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address:`
  String get deliveryAddress {
    return Intl.message(
      'Delivery Address:',
      name: 'deliveryAddress',
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

  /// `Order Summary:`
  String get orderSummary {
    return Intl.message(
      'Order Summary:',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal:`
  String get subtotal {
    return Intl.message(
      'Subtotal:',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Delivery:`
  String get delivery {
    return Intl.message(
      'Delivery:',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `40 EGP`
  String get deliveryPrice {
    return Intl.message(
      '40 EGP',
      name: 'deliveryPrice',
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

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Order`
  String get confirmOrder {
    return Intl.message(
      'Confirm Order',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Pay via PayPal`
  String get payViaPaypal {
    return Intl.message(
      'Pay via PayPal',
      name: 'payViaPaypal',
      desc: '',
      args: [],
    );
  }

  /// `Please select payment method`
  String get pleaseSelectPayment {
    return Intl.message(
      'Please select payment method',
      name: 'pleaseSelectPayment',
      desc: '',
      args: [],
    );
  }

  /// `Please select payment method`
  String get pleaseSelectPaymentMethod {
    return Intl.message(
      'Please select payment method',
      name: 'pleaseSelectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Delivery from Location`
  String get deliveryFromLocation {
    return Intl.message(
      'Delivery from Location',
      name: 'deliveryFromLocation',
      desc: '',
      args: [],
    );
  }

  /// `Online Payment`
  String get onlinePayment {
    return Intl.message(
      'Online Payment',
      name: 'onlinePayment',
      desc: '',
      args: [],
    );
  }

  /// `Operation completed successfully`
  String get operationSuccessful {
    return Intl.message(
      'Operation completed successfully',
      name: 'operationSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get expirationMonths {
    return Intl.message(
      'Month',
      name: 'expirationMonths',
      desc: '',
      args: [],
    );
  }

  /// `Validity`
  String get validity {
    return Intl.message(
      'Validity',
      name: 'validity',
      desc: '',
      args: [],
    );
  }

  /// `Organic`
  String get organic {
    return Intl.message(
      'Organic',
      name: 'organic',
      desc: '',
      args: [],
    );
  }

  /// `Calories`
  String get calories {
    return Intl.message(
      'Calories',
      name: 'calories',
      desc: '',
      args: [],
    );
  }

  /// `Grams`
  String get grams {
    return Intl.message(
      'Grams',
      name: 'grams',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message(
      'Add to Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get main {
    return Intl.message(
      'Home',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get shoppingCart {
    return Intl.message(
      'Shopping Cart',
      name: 'shoppingCart',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get myAccount {
    return Intl.message(
      'My Account',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `You have {count} products in your shopping cart`
  String youHaveProductsInCart(int count) {
    return Intl.message(
      'You have $count products in your shopping cart',
      name: 'youHaveProductsInCart',
      desc: '',
      args: [count],
    );
  }

  /// `Pay {price} EGP`
  String checkoutPrice(String price) {
    return Intl.message(
      'Pay $price EGP',
      name: 'checkoutPrice',
      desc: '',
      args: [price],
    );
  }

  /// `{amount} Kg`
  String totalAmountKg(String amount) {
    return Intl.message(
      '$amount Kg',
      name: 'totalAmountKg',
      desc: '',
      args: [amount],
    );
  }

  /// `{price} EGP`
  String priceInEGP(String price) {
    return Intl.message(
      '$price EGP',
      name: 'priceInEGP',
      desc: '',
      args: [price],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `No products in cart`
  String get noProductsInCart {
    return Intl.message(
      'No products in cart',
      name: 'noProductsInCart',
      desc: '',
      args: [],
    );
  }

  /// `Shop Now`
  String get shopNow {
    return Intl.message(
      'Shop Now',
      name: 'shopNow',
      desc: '',
      args: [],
    );
  }

  /// `Holiday Offers`
  String get holidayOffers {
    return Intl.message(
      'Holiday Offers',
      name: 'holidayOffers',
      desc: '',
      args: [],
    );
  }

  /// `25% Discount`
  String get discount25 {
    return Intl.message(
      '25% Discount',
      name: 'discount25',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Personal Profile`
  String get personalProfile {
    return Intl.message(
      'Personal Profile',
      name: 'personalProfile',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `Payments`
  String get payments {
    return Intl.message(
      'Payments',
      name: 'payments',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
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

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Sort By:`
  String get sortBy {
    return Intl.message(
      'Sort By:',
      name: 'sortBy',
      desc: '',
      args: [],
    );
  }

  /// `Price (Low to High)`
  String get priceLowToHigh {
    return Intl.message(
      'Price (Low to High)',
      name: 'priceLowToHigh',
      desc: '',
      args: [],
    );
  }

  /// `Price (High to Low)`
  String get priceHighToLow {
    return Intl.message(
      'Price (High to Low)',
      name: 'priceHighToLow',
      desc: '',
      args: [],
    );
  }

  /// `Alphabetical`
  String get alphabetical {
    return Intl.message(
      'Alphabetical',
      name: 'alphabetical',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `You haven't placed any orders yet!`
  String get noOrdersYet {
    return Intl.message(
      'You haven\'t placed any orders yet!',
      name: 'noOrdersYet',
      desc: '',
      args: [],
    );
  }

  /// `Order No: {orderId}#`
  String orderNumberHash(String orderId) {
    return Intl.message(
      'Order No: $orderId#',
      name: 'orderNumberHash',
      desc: '',
      args: [orderId],
    );
  }

  /// `Ordered: {date}`
  String orderDate(String date) {
    return Intl.message(
      'Ordered: $date',
      name: 'orderDate',
      desc: '',
      args: [date],
    );
  }

  /// `Number of Orders:`
  String get ordersCount {
    return Intl.message(
      'Number of Orders:',
      name: 'ordersCount',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
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

  /// `Recent Searches`
  String get recentSearches {
    return Intl.message(
      'Recent Searches',
      name: 'recentSearches',
      desc: '',
      args: [],
    );
  }

  /// `Delete All`
  String get deleteAll {
    return Intl.message(
      'Delete All',
      name: 'deleteAll',
      desc: '',
      args: [],
    );
  }

  /// `Oops... This information is not available at the moment`
  String get infoNotAvailable {
    return Intl.message(
      'Oops... This information is not available at the moment',
      name: 'infoNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Search Results`
  String get searchResults {
    return Intl.message(
      'Search Results',
      name: 'searchResults',
      desc: '',
      args: [],
    );
  }

  /// `Select Language:`
  String get chooseLanguage {
    return Intl.message(
      'Select Language:',
      name: 'chooseLanguage',
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
