import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      routes: {
        Routes.home: (context) => HomeScreen(),
        Routes.login: (context) => LoginScreen()
      },
      initialRoute: Routes.home,
    );
  }
}
