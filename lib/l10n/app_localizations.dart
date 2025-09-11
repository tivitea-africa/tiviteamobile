import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// First onboarding slide title
  ///
  /// In en, this message translates to:
  /// **'Welcome to tiviTea'**
  String get welcomeToTiviTea;

  /// First onboarding slide subtitle
  ///
  /// In en, this message translates to:
  /// **'Discover the perfect workspace/tool to boost your productivity. Let,s get you set up!'**
  String get discoverWorkSpace;

  /// Second onboarding slide title
  ///
  /// In en, this message translates to:
  /// **'Explore our features'**
  String get exploreFeatures;

  /// Second onboarding slide subtitle
  ///
  /// In en, this message translates to:
  /// **'Find the right workspace or Tool, connect with members and find what you need for work!'**
  String get findWorkspaceOrtool;

  /// Third onboarding slide title
  ///
  /// In en, this message translates to:
  /// **'Book Your Workspace or Rent Your Tool'**
  String get bookWorkspace;

  /// Third onboarding slide subtitle
  ///
  /// In en, this message translates to:
  /// **'Easily find and book a workspace or rent tools and get to work wherever business takes you!'**
  String get findAndBook;

  /// Last onboarding slide title
  ///
  /// In en, this message translates to:
  /// **'Ready To Set Up an Account?'**
  String get readyToSetUpAccount;

  /// Last onboarding slide subtitle
  ///
  /// In en, this message translates to:
  /// **'Take the next 3 minutes to set up your account and get started!'**
  String get takeNext3Minutes;

  /// Skip text
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Continue text
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_;

  /// Next text
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Get Started text
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// Select user type text
  ///
  /// In en, this message translates to:
  /// **'How do you want to register?'**
  String get howToRegister;

  /// How do you want to continue text
  ///
  /// In en, this message translates to:
  /// **'How do you want to continue?'**
  String get howToContinue;

  /// Browse Listings text
  ///
  /// In en, this message translates to:
  /// **'Browse Listings'**
  String get browseListings;

  /// Service Provider text
  ///
  /// In en, this message translates to:
  /// **'Service Provider'**
  String get serviceProvider;

  /// Customer text
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// First Name text
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// First Name hint text
  ///
  /// In en, this message translates to:
  /// **'Enter First Name'**
  String get firstNameHintText;

  /// Last Name text
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// Last Name hint text
  ///
  /// In en, this message translates to:
  /// **'Enter Last Name'**
  String get lastNameHintText;

  /// Phone Number text
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// Phone Number hint text
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get phoneNumberHintText;

  /// Email text
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Password text
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Email hint text
  ///
  /// In en, this message translates to:
  /// **'Enter Email'**
  String get emailHintText;

  /// Create Password text
  ///
  /// In en, this message translates to:
  /// **'Create Password'**
  String get createPassword;

  /// Create Password hint text
  ///
  /// In en, this message translates to:
  /// **'Create New Password'**
  String get createPasswordHintText;

  /// Confirm Password text
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Confirm Password hint text
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmPasswordHintText;

  /// Create Account text
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// Already have Account text
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccount;

  /// Login text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Sign up with Google text
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get googleSignUp;

  /// Buyer/Customer text
  ///
  /// In en, this message translates to:
  /// **'Buyer/Customer'**
  String get buyerOrCustomer;

  /// New to tiviTea text
  ///
  /// In en, this message translates to:
  /// **'New to tiviTea? create your account and get started.'**
  String get newTo;

  /// Register as space user text
  ///
  /// In en, this message translates to:
  /// **'Register as a space or tool user'**
  String get registerAsSpaceUser;

  /// Provide correct info text
  ///
  /// In en, this message translates to:
  /// **'Provide correct information to setup your account'**
  String get provideInfo;

  /// Space/Tool text
  ///
  /// In en, this message translates to:
  /// **'Space/Tool'**
  String get spaceOrTool;

  /// Registration is easy text
  ///
  /// In en, this message translates to:
  /// **'Registration is quick and easy, Lets help you reach a wider audience  today!'**
  String get regIsEasy;

  /// Register as space owner text
  ///
  /// In en, this message translates to:
  /// **'Register as a space or tool owner'**
  String get registerAsSpaceOwner;

  /// Personal Information text
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// Location Details text
  ///
  /// In en, this message translates to:
  /// **'Location Details'**
  String get locationDetails;

  /// Account Information text
  ///
  /// In en, this message translates to:
  /// **'Account Information'**
  String get accountInfo;

  /// Business Details text
  ///
  /// In en, this message translates to:
  /// **'Business Details'**
  String get businessDetails;

  /// Bank Details text
  ///
  /// In en, this message translates to:
  /// **'Bank Details'**
  String get bankDetails;

  /// Your Address text
  ///
  /// In en, this message translates to:
  /// **'Your Address'**
  String get yourAddress;

  /// Your Address hint text
  ///
  /// In en, this message translates to:
  /// **'Enter Address'**
  String get yourAddressHintText;

  /// City text
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// Country text
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// State/Province text
  ///
  /// In en, this message translates to:
  /// **'State/Province'**
  String get stateOrProvince;

  /// Postal/Zip Code text
  ///
  /// In en, this message translates to:
  /// **'Postal/Zip Code'**
  String get postalOrZipCode;

  /// Username text
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// Alternative Phone Number text
  ///
  /// In en, this message translates to:
  /// **'Alternative Phone Number'**
  String get alternativePhone;

  /// Business name text
  ///
  /// In en, this message translates to:
  /// **'Business Name'**
  String get businessName;

  /// Business Name hint text
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get companyName;

  /// Registration Status text
  ///
  /// In en, this message translates to:
  /// **'Registration Status'**
  String get registrationStatus;

  /// Registration Status hint text
  ///
  /// In en, this message translates to:
  /// **'Registered or individual business'**
  String get registeredOrIndividual;

  /// Website text
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// Optional text
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// Business Description text
  ///
  /// In en, this message translates to:
  /// **'Business Description'**
  String get businessDescription;

  /// Business description hint text
  ///
  /// In en, this message translates to:
  /// **'Brief description of space or tool offered'**
  String get briefDescription;

  /// Bank Name text
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bankName;

  /// Account Name text
  ///
  /// In en, this message translates to:
  /// **'Account Name'**
  String get accountName;

  /// Account Name hint text
  ///
  /// In en, this message translates to:
  /// **'Enter Account Name'**
  String get enterAccountName;

  /// Account Number text
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get accountNumber;

  /// Account Number hint text
  ///
  /// In en, this message translates to:
  /// **'Enter Account Number'**
  String get enterAccountNumber;

  /// All Done text
  ///
  /// In en, this message translates to:
  /// **'All Done!'**
  String get allDone;

  /// Account has been setup text
  ///
  /// In en, this message translates to:
  /// **'Your account has been setup'**
  String get accountSetup;

  /// Proceed to login text
  ///
  /// In en, this message translates to:
  /// **'Proceed to Login'**
  String get proceedToLogin;

  /// Go to home text
  ///
  /// In en, this message translates to:
  /// **'Go to home'**
  String get goToHome;

  /// Provide credentials text
  ///
  /// In en, this message translates to:
  /// **'Provide your credentials to access your account'**
  String get provideCredentials;

  /// Remember me text
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// Forgot Password text
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// Log into Account text
  ///
  /// In en, this message translates to:
  /// **'Log into Account'**
  String get logIntoAccount;

  /// Don't have an account text
  ///
  /// In en, this message translates to:
  /// **'Don\'\'t have an account? '**
  String get dontHaveAccount;

  /// Sign Up text
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// Enter your email to receive a password reset link text
  ///
  /// In en, this message translates to:
  /// **'Enter your email to receive a password reset link'**
  String get enterYourEmailForReset;

  /// Send link text
  ///
  /// In en, this message translates to:
  /// **'Send link'**
  String get sendLink;

  /// Set a new password for your account text
  ///
  /// In en, this message translates to:
  /// **'Set a new password for your account'**
  String get setNewPassword;

  /// Enter Password text
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enterPass;

  /// Enter Password Again text
  ///
  /// In en, this message translates to:
  /// **'Enter Password Again'**
  String get enterPassAgain;

  /// Password Changed text
  ///
  /// In en, this message translates to:
  /// **'Password Changed!'**
  String get passwordChanged;

  /// You have successfully changed your password text
  ///
  /// In en, this message translates to:
  /// **'You have successfully changed your password'**
  String get youHaveChangedPassword;

  /// Continue with Google text
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get googleContinue;

  /// Nav bar Home text
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Nav bar Services text
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// Nav bar My History text
  ///
  /// In en, this message translates to:
  /// **'My History'**
  String get myHistory;

  /// Nav bar Profile text
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Dashboard text
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// My Profile text
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// My Listing text
  ///
  /// In en, this message translates to:
  /// **'My Listing'**
  String get myListing;

  /// My Favorites text
  ///
  /// In en, this message translates to:
  /// **'My Favorites'**
  String get myFavorites;

  /// Booking History text
  ///
  /// In en, this message translates to:
  /// **'Booking History'**
  String get bookingHistory;

  /// Payments text
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// Activities text
  ///
  /// In en, this message translates to:
  /// **'Activities'**
  String get activities;

  /// Messages text
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// Add Foot Soldiers text
  ///
  /// In en, this message translates to:
  /// **'Add Foot Soldiers'**
  String get addFootSoldiers;

  /// Customer Review text
  ///
  /// In en, this message translates to:
  /// **'Customer Review'**
  String get customerReview;

  /// Customer Support text
  ///
  /// In en, this message translates to:
  /// **'Customer Support'**
  String get customerSupport;

  /// Settings text
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Report text
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// Log out text
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// Welcome Back text
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// Hi user
  ///
  /// In en, this message translates to:
  /// **'Hi {firstName}, welcome back to tiviTea admin'**
  String hiUser(String firstName);

  /// Filters text
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// Listings text
  ///
  /// In en, this message translates to:
  /// **'Listings'**
  String get listings;

  /// Search text
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Find all you need text
  ///
  /// In en, this message translates to:
  /// **'Find all you need'**
  String get findAll;

  /// From work tools to co-working space text
  ///
  /// In en, this message translates to:
  /// **'From work tools to co-working space.'**
  String get fromWorkTooks;

  /// Caterory text
  ///
  /// In en, this message translates to:
  /// **'Caterory'**
  String get category;

  /// View All text
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// Most Popular text
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get mostPopular;

  /// Create Listing text
  ///
  /// In en, this message translates to:
  /// **'Create Listing'**
  String get createListing;

  /// Add Account Details text
  ///
  /// In en, this message translates to:
  /// **'Add Account Details'**
  String get addAccountDetails;

  /// Listed by text
  ///
  /// In en, this message translates to:
  /// **'Listed by'**
  String get listedBy;

  /// Description text
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Facilities available text
  ///
  /// In en, this message translates to:
  /// **'Facilities available here'**
  String get facilities;

  /// Location available text
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Contact available text
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// You can text
  ///
  /// In en, this message translates to:
  /// **'You can'**
  String get youCan;

  /// Get a Quotation text
  ///
  /// In en, this message translates to:
  /// **'Get a Quotation'**
  String get getQuotation;

  /// Prices are available text
  ///
  /// In en, this message translates to:
  /// **'Prices are available per room and available facility'**
  String get pricesAreAvailable;

  /// Book now text
  ///
  /// In en, this message translates to:
  /// **'Book now'**
  String get bookNow;

  /// Date from text
  ///
  /// In en, this message translates to:
  /// **'Date from'**
  String get dateFrom;

  /// Date to text
  ///
  /// In en, this message translates to:
  /// **'Date to'**
  String get dateTo;

  /// No. of people text
  ///
  /// In en, this message translates to:
  /// **'No. of people'**
  String get numberOfPeople;

  /// Pay Now text
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNow;

  /// Summary text
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// Total Booking text
  ///
  /// In en, this message translates to:
  /// **'Total Booking'**
  String get totalBooking;

  /// Total Listing text
  ///
  /// In en, this message translates to:
  /// **'Total Listing'**
  String get totalListing;

  /// Total Earning text
  ///
  /// In en, this message translates to:
  /// **'Total Earning'**
  String get totalEarning;

  /// Total Received text
  ///
  /// In en, this message translates to:
  /// **'Total Received'**
  String get totalReceived;

  /// Total Activities text
  ///
  /// In en, this message translates to:
  /// **'Total Activities'**
  String get totalActivities;

  /// Booking Summary text
  ///
  /// In en, this message translates to:
  /// **'Booking Summary'**
  String get bookingSummary;

  /// Incoming Bookings text
  ///
  /// In en, this message translates to:
  /// **'Incoming Bookings'**
  String get incomingBookings;

  /// Upcoming Bookings text
  ///
  /// In en, this message translates to:
  /// **'Upcoming Bookings'**
  String get upcomingBookings;

  /// Ongoing Bookings text
  ///
  /// In en, this message translates to:
  /// **'Ongoing Bookings'**
  String get ongoingBookings;

  /// Completed Bookings text
  ///
  /// In en, this message translates to:
  /// **'Completed Bookings'**
  String get completedBookings;

  /// Financial Summary text
  ///
  /// In en, this message translates to:
  /// **'Financial Summary'**
  String get financialSummary;

  /// View Report text
  ///
  /// In en, this message translates to:
  /// **'View Report'**
  String get viewReport;

  /// New listing text
  ///
  /// In en, this message translates to:
  /// **'New listing'**
  String get newListing;

  /// What do you want to list text
  ///
  /// In en, this message translates to:
  /// **'What do you want to list?'**
  String get whatToList;

  /// Co-Working Space text
  ///
  /// In en, this message translates to:
  /// **'Co-Working Space'**
  String get coWorkingSpace;

  /// Work Tool text
  ///
  /// In en, this message translates to:
  /// **'Work Tool'**
  String get workTool;

  /// Other Listing text
  ///
  /// In en, this message translates to:
  /// **'Other Listing'**
  String get otherListing;

  /// Other Listing Category text
  ///
  /// In en, this message translates to:
  /// **'Other Listing Category'**
  String get otherListingCategory;

  /// Space Details text
  ///
  /// In en, this message translates to:
  /// **'Space Details'**
  String get spaceDetails;

  /// Name of Space text
  ///
  /// In en, this message translates to:
  /// **'Name of Space'**
  String get nameOfSpace;

  /// Short Description text
  ///
  /// In en, this message translates to:
  /// **'Short Description'**
  String get shortDescription;

  /// Address of Space text
  ///
  /// In en, this message translates to:
  /// **'Address of Space'**
  String get addressOfSpace;

  /// Space Amenities text
  ///
  /// In en, this message translates to:
  /// **'Space Amenities'**
  String get spaceAmenities;

  /// 24 hrs electricity text
  ///
  /// In en, this message translates to:
  /// **'24 hrs electricity'**
  String get e24hr;

  /// Parking text
  ///
  /// In en, this message translates to:
  /// **'Parking'**
  String get parking;

  /// WiFi text
  ///
  /// In en, this message translates to:
  /// **'WiFi'**
  String get wifi;

  /// CCTV text
  ///
  /// In en, this message translates to:
  /// **'CCTV'**
  String get cctv;

  /// Cafeteria text
  ///
  /// In en, this message translates to:
  /// **'Cafeteria'**
  String get cafeteria;

  /// Add More text
  ///
  /// In en, this message translates to:
  /// **'Add More'**
  String get addMore;

  /// Add Card text
  ///
  /// In en, this message translates to:
  /// **'Add Card'**
  String get addCard;

  /// Upload images of tool or workspace
  ///
  /// In en, this message translates to:
  /// **'Upload images of {tool}'**
  String uploadImagesOf(String tool);

  /// Add Image text
  ///
  /// In en, this message translates to:
  /// **'Add Image'**
  String get addImage;

  /// Room Details text
  ///
  /// In en, this message translates to:
  /// **'Room Details'**
  String get roomDetails;

  /// Name of Room text
  ///
  /// In en, this message translates to:
  /// **'Name of Room'**
  String get nameOfRoom;

  /// Available Seats text
  ///
  /// In en, this message translates to:
  /// **'Available Seats'**
  String get availableSeats;

  /// Pricing Type text
  ///
  /// In en, this message translates to:
  /// **'Pricing Type'**
  String get pricingType;

  /// Save and Publish text
  ///
  /// In en, this message translates to:
  /// **'Save and Publish'**
  String get saveAndPublish;

  /// Save to Draft text
  ///
  /// In en, this message translates to:
  /// **'Save to Draft'**
  String get saveToDraft;

  /// Hourly text
  ///
  /// In en, this message translates to:
  /// **'Hourly'**
  String get hourly;

  /// Fixed text
  ///
  /// In en, this message translates to:
  /// **'Fixed'**
  String get fixed;

  /// Add text
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Add Amentities text
  ///
  /// In en, this message translates to:
  /// **'Add Amentities'**
  String get addAmenities;

  /// Work Tool Details text
  ///
  /// In en, this message translates to:
  /// **'Work Tool Details'**
  String get workToolDetails;

  /// Name of Work Tool text
  ///
  /// In en, this message translates to:
  /// **'Name of Work Tool'**
  String get nameOfWorkTool;

  /// Name of What you are listing text
  ///
  /// In en, this message translates to:
  /// **'Name of What you are listing'**
  String get nameOfWhatYouSelling;

  /// Pick Up Location text
  ///
  /// In en, this message translates to:
  /// **'Pick Up Location'**
  String get pickUpLocation;

  /// Rent Price text
  ///
  /// In en, this message translates to:
  /// **'Rent Price'**
  String get rentPrice;

  /// New text
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get addnew;

  /// Change Password text
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// Caution Fee text
  ///
  /// In en, this message translates to:
  /// **'Caution Fee (Refundable)'**
  String get cautionFee;

  /// Service Fee text
  ///
  /// In en, this message translates to:
  /// **'Service Fee'**
  String get serviceFee;

  /// Total text
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// Bargain Price text
  ///
  /// In en, this message translates to:
  /// **'Bargain Price'**
  String get bargainPrice;

  /// Rent now text
  ///
  /// In en, this message translates to:
  /// **'Rent now'**
  String get rentNow;

  /// Pick up Date text
  ///
  /// In en, this message translates to:
  /// **'Pick up Date'**
  String get pickUpDate;

  /// Return Date text
  ///
  /// In en, this message translates to:
  /// **'Return Date'**
  String get returnDate;

  /// Business Verification text
  ///
  /// In en, this message translates to:
  /// **'Business Verification'**
  String get businessVerification;

  /// Business Verification subtitle text
  ///
  /// In en, this message translates to:
  /// **'tiviTea requires a valid Government-issued document in order to verify the authenticity of your business.pt here!'**
  String get tiviteaRequires;

  /// Document Type text
  ///
  /// In en, this message translates to:
  /// **'Document Type'**
  String get documentType;

  /// Registration Number text
  ///
  /// In en, this message translates to:
  /// **'Registration Number'**
  String get registrationNumber;

  /// Registration Number text
  ///
  /// In en, this message translates to:
  /// **'Enter Registration Number e.g (RC1234...)'**
  String get enterRegistrationNumber;

  /// Business Registration text
  ///
  /// In en, this message translates to:
  /// **'Business Registration Document'**
  String get businessRegistrationDocument;

  /// Upload Scanned text
  ///
  /// In en, this message translates to:
  /// **'Upload scanned copy of your business registration document in JPG, PNG, or PDF'**
  String get uploadScanned;

  /// Choose a file text
  ///
  /// In en, this message translates to:
  /// **'Choose a File'**
  String get chooseAFile;

  /// Take a Picture text
  ///
  /// In en, this message translates to:
  /// **'Take a Picture'**
  String get takeAPicture;

  /// Gallery text
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// Upload Document text
  ///
  /// In en, this message translates to:
  /// **'Upload Document'**
  String get uploadDocument;

  /// Utility Bill Document text
  ///
  /// In en, this message translates to:
  /// **'Utility Bill Document'**
  String get utilityBillDocument;

  /// Utility Bill Document text
  ///
  /// In en, this message translates to:
  /// **'Utility Bill Document'**
  String get proofOfBusinessAddress;

  /// Confirm Info text
  ///
  /// In en, this message translates to:
  /// **'I confirm that all information provided a correct and legitimate.'**
  String get confirmAllInfoProvided;

  /// Complete KYC text
  ///
  /// In en, this message translates to:
  /// **'Complete Your KYC Verification'**
  String get completeKYC;

  /// Ensure secure experience text
  ///
  /// In en, this message translates to:
  /// **'To ensure a secure experience, please complete your KYC verification. This helps us confirm your identity and protect your acccount!'**
  String get ensureSecureExperience;

  /// KYC Verification booking text
  ///
  /// In en, this message translates to:
  /// **'Please complete your KYC verification to continue with booking.'**
  String get toContinueBooking;

  /// KYC Verification listing text
  ///
  /// In en, this message translates to:
  /// **'Please complete your KYC verification to continue with listing.'**
  String get toContinueListing;

  /// Start KYC Process text
  ///
  /// In en, this message translates to:
  /// **'Start KYC Process'**
  String get startKYCProcess;

  /// Need Help text
  ///
  /// In en, this message translates to:
  /// **'Need Help?'**
  String get needHelp;

  /// Contact Support text
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// Verification Successful text
  ///
  /// In en, this message translates to:
  /// **'Verification Successful!'**
  String get verificationSuccessful;

  /// Proof of Identity text
  ///
  /// In en, this message translates to:
  /// **'Proof of Identity'**
  String get proofOfIdentity;

  /// Provide correct information text
  ///
  /// In en, this message translates to:
  /// **'Provide correct information to help us verify your account'**
  String get provideCorrectInfo;

  /// NIN Number text
  ///
  /// In en, this message translates to:
  /// **'NIN Number'**
  String get ninNumber;

  /// Enter NIN Number text
  ///
  /// In en, this message translates to:
  /// **'Enter NIN Number'**
  String get enterNinNumber;

  /// Upload Front text
  ///
  /// In en, this message translates to:
  /// **'Upload Front side of ID Card'**
  String get uploadFront;

  /// Upload back text
  ///
  /// In en, this message translates to:
  /// **'Upload Back side of ID Card'**
  String get uploadBack;

  /// Upload back text
  ///
  /// In en, this message translates to:
  /// **'Upload the front side of your support document in JPG, PNG, or PDF'**
  String get uploadFrontDesc;

  /// Upload back text
  ///
  /// In en, this message translates to:
  /// **'Upload the back side of your support document in JPG, PNG, or PDF'**
  String get uploadBackDesc;

  /// Account Verification text
  ///
  /// In en, this message translates to:
  /// **'Account Verification'**
  String get accountVerification;

  /// Account Verification description text
  ///
  /// In en, this message translates to:
  /// **'Please know that account verification may take up to 2 business days. You will be notified about the status of your verification.'**
  String get twoBusinessDays;

  /// Submit Documents text
  ///
  /// In en, this message translates to:
  /// **'Submit Documents'**
  String get submitDocuments;

  /// Documents submitted text
  ///
  /// In en, this message translates to:
  /// **'Documents submitted for verification!'**
  String get documentSubmitted;

  /// Documents submitted description text
  ///
  /// In en, this message translates to:
  /// **'We will notify you about your verification status after 2 business days. '**
  String get afterTwoBusinessDays;

  /// Go to Dashboard text
  ///
  /// In en, this message translates to:
  /// **'Go to Dashboard'**
  String get goToDashboard;

  /// Edit Profile text
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// Update Profile text
  ///
  /// In en, this message translates to:
  /// **'Update Profile'**
  String get updateProfile;

  /// Old Password text
  ///
  /// In en, this message translates to:
  /// **'Old Password'**
  String get oldPassword;

  /// New Password text
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// Choose Room text
  ///
  /// In en, this message translates to:
  /// **'Choose Room'**
  String get chooseRoom;

  /// Add Package text
  ///
  /// In en, this message translates to:
  /// **'Package'**
  String get package;

  /// Add Package text
  ///
  /// In en, this message translates to:
  /// **'Add Package'**
  String get addPackage;

  /// Name of package text
  ///
  /// In en, this message translates to:
  /// **'Name of package'**
  String get packageName;

  /// Package short desc text
  ///
  /// In en, this message translates to:
  /// **'Package short description'**
  String get packageShortDesc;

  /// Price text
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// Amenities text
  ///
  /// In en, this message translates to:
  /// **'Amenities'**
  String get amenities;

  /// Payment Successful text
  ///
  /// In en, this message translates to:
  /// **'Payment Successful'**
  String get paymentSuccessful;

  /// Your Payment was Successful text
  ///
  /// In en, this message translates to:
  /// **'Your Payment was Successful'**
  String get paymentWasSuccessful;

  /// E-Receipt text
  ///
  /// In en, this message translates to:
  /// **'E-Receipt'**
  String get eReceipt;

  /// Download E-Receipt text
  ///
  /// In en, this message translates to:
  /// **'Download E-Receipt'**
  String get downloadEReceipt;

  /// Download E-Receipt here text
  ///
  /// In en, this message translates to:
  /// **'Download your E-Receipt here'**
  String get downloadEReceiptHere;

  /// Payment Receipt text
  ///
  /// In en, this message translates to:
  /// **'Payment Receipt'**
  String get paymentReceipt;

  /// Back to Home text
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// Received From text
  ///
  /// In en, this message translates to:
  /// **'Received From'**
  String get receivedFrom;

  /// Date text
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// Total Amount text
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmount;

  /// Item text
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get item;

  /// Discount text
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// Caution Fee text
  ///
  /// In en, this message translates to:
  /// **'Caution Fee'**
  String get cautionFeePayment;

  /// VAT text
  ///
  /// In en, this message translates to:
  /// **'VAT(%5)'**
  String get vat;

  /// Go Home text
  ///
  /// In en, this message translates to:
  /// **'Go Home'**
  String get goHome;

  /// Print text
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get print;

  /// Share text
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// E-Ticket text
  ///
  /// In en, this message translates to:
  /// **'E-Ticket'**
  String get eTicket;

  /// Here is your ticket text
  ///
  /// In en, this message translates to:
  /// **'Here is your ticket'**
  String get hereIsETicker;

  /// Total Payment text
  ///
  /// In en, this message translates to:
  /// **'Total Payment'**
  String get totalPayment;

  /// Save text
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Image text
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get image;

  /// PDF text
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get pdf;

  /// Booking History header
  ///
  /// In en, this message translates to:
  /// **'Booking History Details'**
  String get bookingHistoryView;

  /// Create Booking text
  ///
  /// In en, this message translates to:
  /// **'Create Booking'**
  String get createBooking;

  /// Status text
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// Create Workspace text
  ///
  /// In en, this message translates to:
  /// **'Create Workspace'**
  String get createWorkspace;

  /// Personal Information text
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// Security Information text
  ///
  /// In en, this message translates to:
  /// **'Security Information'**
  String get securityInformation;

  /// Upload Picture text
  ///
  /// In en, this message translates to:
  /// **'Upload Picture'**
  String get uploadPicture;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
