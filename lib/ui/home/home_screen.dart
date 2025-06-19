import 'package:flutter/material.dart';
import 'package:islami_sun_c15/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_sun_c15/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami_sun_c15/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_sun_c15/ui/home/tabs/time/time_tab.dart';
import 'package:islami_sun_c15/utils/app_assets.dart';
import 'package:islami_sun_c15/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Stack(
      children: [
        Image.asset(
          getBackgroundImage(),
          // backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
                // backgroundColor: AppColors.primaryColor,
                //   type: BottomNavigationBarType.fixed,
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationBar(
                          index: 0, imageName: AppAssets.iconQuran),
                      label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationBar(
                          index: 1, imageName: AppAssets.iconHadeth),
                      label: 'Hadeth'),
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationBar(
                          index: 2, imageName: AppAssets.iconSebha),
                      label: 'Sebha'),
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationBar(
                          index: 3, imageName: AppAssets.iconRadio),
                      label: 'Radio'),
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationBar(
                          index: 4, imageName: AppAssets.iconTime),
                      label: 'Time'),
                ]),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo,
                height: height * 0.22,),
              Expanded(child: tabs[selectedIndex])
            ],
          ),
        )
      ],
    );
  }

  Widget builtBottomNavigationBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.blackBgColor),
            child: ImageIcon(AssetImage(imageName)))
        : ImageIcon(AssetImage(imageName));
  }

  String getBackgroundImage() {
    switch (selectedIndex) {
      case 0:
        return AppAssets.quranBg;
      case 1:
        return AppAssets.hadethBg;
      case 2:
        return AppAssets.sebhaBg;
      case 3:
        return AppAssets.radioBg;
      case 4:
        return AppAssets.timeBg;
      default:
        return AppAssets.quranBg;
    }
  }
}
