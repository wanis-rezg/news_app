import 'package:flutter/material.dart';
import 'package:news_app/core/datasource/local_data/preferences_manager.dart';
import 'package:news_app/features/auth/sign_in_screen.dart';
import 'package:news_app/features/main/main_screen.dart';
import 'package:news_app/features/onbording/onbording_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterSplash();
  }

  _navigateAfterSplash() async{
    await Future.delayed(const Duration(seconds: 1));
    final bool onboardingCompleted = PreferencesManager().getBool('onboarding_completed') ?? false;
    final bool isLoggedIn = PreferencesManager().getBool('is_logged_in') ?? false;
if(!mounted) return;
    if(!onboardingCompleted){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnbordingScreen()));
    }else if(!isLoggedIn){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
