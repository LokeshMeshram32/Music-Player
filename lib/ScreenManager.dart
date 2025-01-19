import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_login_screens/homeScreen.dart';

class ScreenManager extends StatefulWidget {
  const ScreenManager({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ScreenManagerState();
  }
}

class _ScreenManagerState extends State<ScreenManager>
    with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Stack(
        children: [
          // Dark gradient background for dark theme
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.black54],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: FadeTransition(
                opacity: _animationController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Music note icon with light color for dark theme
                    Icon(
                      Icons.music_note,
                      color: Colors.white70,
                      size: 100,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Loading...',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return HomeScreen();
    }
  }
}
