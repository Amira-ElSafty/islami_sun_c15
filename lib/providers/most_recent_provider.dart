import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_prefs.dart';

class MostRecentProvider extends ChangeNotifier {
  //todo: data
  List<int> mostRecentList = [];

  //todo: get last sura index => read data
  void readLastSuraList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesAsString =
        prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
    //todo: List<String> => List<int> => map()
    //todo: ['1','2'] => [1,2]
    mostRecentList = mostRecentIndicesAsString
        .map(
          (element) => int.parse(element),
        )
        .toList();
    //todo:mostRecentIndicesAsInt.reversed.toList()
    notifyListeners();
  }
}
