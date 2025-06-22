import 'package:flutter/material.dart';
import 'package:islami_sun_c15/providers/most_recent_provider.dart';
import 'package:islami_sun_c15/ui/home/home_screen.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/details1/sura_details_screen1.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/details2/sura_details_screen2.dart';
import 'package:islami_sun_c15/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MostRecentProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen1.routeName: (context) => SuraDetailsScreen1(),
        SuraDetailsScreen2.routeName: (context) => SuraDetailsScreen2(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
