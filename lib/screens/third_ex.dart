import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/provider/third_ex_provider.dart';

class ThirdExample extends StatefulWidget {
  const ThirdExample({super.key});

  @override
  State<ThirdExample> createState() => _ThirdExampleState();
}

class _ThirdExampleState extends State<ThirdExample> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThirdExampleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Third_Example"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text(
              "Light Mode",
            ),
            value: ThemeMode.light,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text(
              "Dark Mode",
            ),
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text(
              "System Default",
            ),
            value: ThemeMode.system,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,
          ),

        ],
      ),
    );
  }
}
