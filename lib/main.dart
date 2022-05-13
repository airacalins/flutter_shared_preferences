// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_playground/models/theme_settings.dart';
import 'package:flutter_playground/screens/settings_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeSettings(),
        )
      ],
      child: Consumer<ThemeSettings>(
        builder: ((context, value, child) {
          return MaterialApp(
            theme: value.isDarkTheme ? darkTheme : lightTheme,
            home: SettingsScreen(),
          );
        }),
      ),
    );
  }
}
