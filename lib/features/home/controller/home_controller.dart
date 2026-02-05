import 'package:flutter/material.dart';
import 'package:news_app/core/datasource/remote_data/api_config.dart';
import 'package:news_app/core/datasource/remote_data/api_service.dart';
import 'package:news_app/features/home/models/news_artical_model.dart';

class HomeController extends ChangeNotifier {
  HomeController(){
    getTopHeadLine();
    getEveryThing();
  }
  bool topHeadLineisLoading = true;
  String? errorMessge;
  List<NewsArticalModel> newsTopHeadLineList = [];
  ApiService apiService = ApiService();
  bool everyThingisLoading = true;
  List<NewsArticalModel> everyThingList = [];
  void getTopHeadLine() async {
    print('head');
    try {
      var result = await apiService.get(
        ApiConfig.topHeadLines,
        params: {'country': 'us'},
      );

      newsTopHeadLineList = (result['articles'] as List)
          .map((e) => NewsArticalModel.fromJson(e))
          .toList();
      topHeadLineisLoading = false;
      errorMessge = null;

      print(result);
    } catch (e) {
      topHeadLineisLoading = false;
      errorMessge = e.toString();

      print(e);
    }
    notifyListeners();
  }

  Future<void> getEveryThing() async {
    print('every');
    try {
      var result = await apiService.get(
        ApiConfig.everything,
        params: {'q': 'AI'},
      );
      everyThingList = (result['articles'] as List)
          .map((e) => NewsArticalModel.fromJson(e))
          .toList();
      everyThingisLoading = false;
      errorMessge = null;

      // print ( result);
    } catch (e) {
      everyThingisLoading = false;
      errorMessge = e.toString();

      print(e);
    }
    notifyListeners();
  }
}
