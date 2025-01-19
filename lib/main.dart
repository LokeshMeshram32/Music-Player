import 'package:flutter/material.dart';
import 'package:flutter_login_screens/ScreenManager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Beats',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: GoogleFonts.quicksandTextTheme(
          const TextTheme(
            bodyMedium: TextStyle(color: Colors.white), // Body text
            bodyLarge: TextStyle(color: Colors.white), // Larger body text
            displayLarge:
                TextStyle(color: Colors.white), // Equivalent to headline1
            displayMedium:
                TextStyle(color: Colors.white), // Equivalent to headline2
            displaySmall:
                TextStyle(color: Colors.white), // Equivalent to headline3
            // Add more styles as needed
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurpleAccent,
        ).copyWith(
          secondary: Colors.deepPurpleAccent,
          onPrimary: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        sliderTheme: const SliderThemeData(
          activeTrackColor: Colors.deepPurpleAccent,
          inactiveTrackColor: Colors.white30,
          thumbColor: Colors.deepPurple,
        ),
        // Adding BottomNavigationBar theme
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor:
              Colors.deepPurpleAccent, // Change this to your desired color
          selectedItemColor: Colors.white, // Color for selected item
          unselectedItemColor: Colors.white54, // Color for unselected items
        ),
      ),
      home: ScreenManager(),
      debugShowCheckedModeBanner: false,
    );
  }
}
