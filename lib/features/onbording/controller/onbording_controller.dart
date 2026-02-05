import 'package:flutter/material.dart';
import 'package:news_app/core/datasource/local_data/preferences_manager.dart';
import 'package:news_app/features/auth/sign_in_screen.dart';
 import 'package:news_app/features/onbording/models/onbording_model.dart';

class OnbordingController extends ChangeNotifier {
  final PageController _pageController = PageController();
  int currentPage = 0;
  PageController get pageController => _pageController;
  bool isLastPage = false;

  void nextPage() {
    
    _pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void prevPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }


  void onFinish(BuildContext context)async {
    await PreferencesManager().setBool('onboarding_completed', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void onPageChanged(int index) {
    currentPage = index;
    isLastPage = currentPage == OnbordingModel.onbordingList.length - 1;
    notifyListeners();
  }
}