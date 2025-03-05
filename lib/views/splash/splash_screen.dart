import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/on_boarding/welcome.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  List<String> _text = ['Where', 'Hope', 'Starts'];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.4, curve: Curves.easeIn),
    ));

    _slideAnimation = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0, curve: Curves.easeOut),
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
         RouteUtils.push(context, WelcomeScreen());
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.grey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Image.asset(
                        'logo1'.assetPNG,
                        width: 150,
                        height: 150), // Replace with your logo asset
                  ),
                ),
                SizedBox(height: 20),
                _animatedText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _animatedText() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        int index = (_controller.value * _text.length).toInt();
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: _text
              .sublist(0, index)
              .map((word) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              word,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.white),
            ),
          ))
              .toList(),
        );
      },
    );
  }
}

