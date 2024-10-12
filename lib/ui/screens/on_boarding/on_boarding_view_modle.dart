import 'package:shared_preferences/shared_preferences.dart';
import 'package:wander_wise_app/ui/utils/app_assets.dart';

class OnBoardingViewModle {
  int index = 0;
  bool isIn = false;

  List<String> titles = [
    "Explore The history with Dalel\n in a smart way",
    "From every placeon earth",
    "Using modern AI technology\nfor better user experience"
  ];
  List<String> subtitles = [
    "LUsing our app’s history libraries \nyou can find many historical periods ",
    "DA big variety of ancient places\nfrom all over the world",
    "AI provide recommendations and helps\nyou to continue the search journey"
  ];
  List<String> images = [
    Assets.assetsImages1,
    Assets.assetsImages2,
    Assets.assetsImages3
  ];
  bool isVisted = false;
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  void setIsVisted() async {
    isVisted = true;
    await prefs.then((value) => value.setBool("isVisted", isVisted));
  }
}
