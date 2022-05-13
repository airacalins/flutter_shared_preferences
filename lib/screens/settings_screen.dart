// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_playground/models/theme_settings.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Card(
            child: ListTile(
              title: Text('Theme'),
            ),
          ),
          Consumer<ThemeSettings>(
            builder: (context, value, child) {
              return SwitchListTile(
                title: Text('Dark Theme'),
                value: value.isDarkTheme,
                onChanged: (_) {
                  value.toggleTheme();
                },
              );
            },
          )
        ],
      ),
    );
  }
}
