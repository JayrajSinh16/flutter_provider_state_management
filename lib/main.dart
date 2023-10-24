import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/provider/count_provider.dart';
import 'package:state/provider/first_ex_provider.dart';
import 'package:state/provider/fiveth_ex_provider.dart';
import 'package:state/provider/second_ex_provider.dart';
import 'package:state/provider/third_ex_provider.dart';
import 'package:state/screens/fiveth_ex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FirstExampleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SecondExampleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThirdExampleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FivethExampleProvider(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final themeChanger = Provider.of<ThirdExampleProvider>(context);
          return MaterialApp(
            title: 'Iron_Man && Shagun',
            debugShowCheckedModeBanner: false,
            themeMode: themeChanger.themeMode,
            darkTheme: ThemeData.dark(
              useMaterial3: true,
            ),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const FivethExample(),
          );
        },
      ),
    );
  }
}
