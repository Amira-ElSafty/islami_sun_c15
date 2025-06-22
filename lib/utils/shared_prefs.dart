import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const String mostRecentKey = 'most_recent';
}

//todo: save last sura index => write data
void saveLastSuraIndex(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //todo: get sura list from shared prefs.
  List<String> mostRecentIndicesList =
      prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
  //todo: add new Sura index
  // mostRecentIndicesList.add('$newSuraIndex');
  //todo: duplicate
  if (mostRecentIndicesList.contains('$newSuraIndex')) {
    //todo: if sura index exist => remove list
    mostRecentIndicesList.remove('$newSuraIndex');
    mostRecentIndicesList.insert(0, '$newSuraIndex');
  } else {
    //todo: if sura index not exist => add list
    mostRecentIndicesList.insert(0, '$newSuraIndex');
  }
  if (mostRecentIndicesList.length > 5) {
    // mostRecentIndicesList.removeLast();
    mostRecentIndicesList = mostRecentIndicesList.sublist(0, 5);
  }
  //todo: save new sura index in shared prefs.
  await prefs.setStringList(
      SharedPrefsKeys.mostRecentKey, mostRecentIndicesList);
}
