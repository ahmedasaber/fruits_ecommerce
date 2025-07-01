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
