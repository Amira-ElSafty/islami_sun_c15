import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/details1/sura_content_item1.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/details2/sura_content_item2.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_sun_c15/utils/app_assets.dart';
import 'package:islami_sun_c15/utils/app_colors.dart';
import 'package:islami_sun_c15/utils/app_styles.dart';

class SuraDetailsScreen2 extends StatefulWidget {
  static const String routeName = 'sura_details2';

  @override
  State<SuraDetailsScreen2> createState() => _SuraDetailsScreen2State();
}

class _SuraDetailsScreen2State extends State<SuraDetailsScreen2> {
  String suraContent = '';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (suraContent.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            QuranResources.englishQuranList[index],
            style: AppStyles.bold20Primary,
          ),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            color: AppColors.blackBgColor,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.cornerLeft),
                  Text(
                    QuranResources.arabicQuranList[index],
                    style: AppStyles.bold24Primary,
                  ),
                  Image.asset(AppAssets.cornerRight),
                ],
              ),
              Expanded(
                  child: suraContent.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : SingleChildScrollView(
                          child: SuraContentItem2(suraContent: suraContent),
                        )),
              Image.asset(AppAssets.mosqueImage)
            ])));
  }

  void loadSuraFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}] ';
    }
    suraContent = lines.join();
    Future.delayed(const Duration(seconds: 1), () => setState(() {}));
  }
}
