import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/Screens/taps_Screen.dart';
//Iam Here Mother Fucker
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: const Color.fromARGB(255, 131, 7, 219)),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            backgroundColor:
                Theme.of(context).colorScheme.onSecondaryContainer),
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const TapsScreen(),
    );
  }
}
