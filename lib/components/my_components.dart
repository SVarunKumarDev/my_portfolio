import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../view_page/error_page.dart';
import '../view_page/my_home_page.dart';

const String collectionPath = 'add your firestore collection name';
const String firebaseEndpoint = 'https://fcm.googleapis.com/fcm/send';
const String fcmServerCredential = 'add your firebase fcm server token';

Map<String, dynamic> portfolioMapDatum = {};

class MyComponents {
  static const String appName = 'MyPortfolio';
  static const String appVersionCode = 'Version: 1.0.0';
  static const String initialRoute = '/home';
  static const String initialErrorRoute = '/under-development';

  static const String appImageLogo = 'images/favicon.png';
  static const String introImage = 'images/profile_info.png';
  static const String aboutImage = 'images/about_me.png';
  static const String errorImage = 'images/404.gif';

  static Map<String, Widget Function(BuildContext)> initialRoutes = {
    initialRoute: (context) => const MyHomePage(),
    initialErrorRoute: (context) => const ErrorPage(),
  };
}

String htmlBody(String fullname, String message) =>
    "Hi I'am $fullname,\n$message";

bool isValidateEmail(String email) =>
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+', caseSensitive: false)
        .hasMatch(email);

Size sizeOfContext(BuildContext context) => MediaQuery.sizeOf(context);

toastMessenger(
        {required String message,
        ToastGravity? gravity = ToastGravity.BOTTOM}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: 5,
        webShowClose: true,
        webBgColor: "linear-gradient(to right, #8F73BB, #9FBB73)",
        fontSize: 16.0);

const Color kPrimaryColor = Color(0xFFFF6868);
const Color kSecondaryColor = Color(0xFF9FBB73);
const Color kOnSecondaryColor = Color(0xFF8F73BB);
const Color kBlackColor = Colors.black;
const Color kWhiteColor = Colors.white;
const Color kGreyColor = Colors.grey;
const Color kRedColor = Colors.red;
const Color kTransparent = Colors.transparent;

ThemeData kLightThemeData({required BuildContext context}) => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          brightness: Brightness.light,
          background: kWhiteColor),
      appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: kWhiteColor,
          surfaceTintColor: kTransparent),
      chipTheme: ChipThemeData(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: kTransparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );

ThemeData kDarkThemeData({required BuildContext context}) => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          brightness: Brightness.dark,
          background: kBlackColor),
      appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: kBlackColor,
          surfaceTintColor: kTransparent),
      chipTheme: ChipThemeData(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: kTransparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
