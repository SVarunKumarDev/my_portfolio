import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/firebase_options.dart';
import 'components/my_components.dart';
import 'controllers/shared_theme_provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreference.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedThemeProvider sharedThemeProvider = SharedThemeProvider();

  @override
  void initState() {
    super.initState();
    sharedThemeProvider.setDarkThemeMode = SharedPreference.isDarkThemeMode;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sharedThemeProvider,
      child: Consumer<SharedThemeProvider>(
        builder: (context, value, child) => MaterialApp(
            routes: MyComponents.initialRoutes,
            initialRoute: MyComponents.initialRoute,
            title: MyComponents.appName,
            theme: kLightThemeData(context: context),
            darkTheme: kDarkThemeData(context: context),
            themeMode: value.isDarkThemeMode ? ThemeMode.light : ThemeMode.dark,
            debugShowCheckedModeBanner: false),
      ),
    );
  }
}
