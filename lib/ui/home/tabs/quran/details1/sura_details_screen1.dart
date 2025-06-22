import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_sun_c15/providers/most_recent_provider.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/details1/sura_content_item1.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_sun_c15/utils/app_assets.dart';
import 'package:islami_sun_c15/utils/app_colors.dart';
import 'package:islami_sun_c15/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen1 extends StatefulWidget {
  static const String routeName = 'sura_details1';

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  List<String> verses = [];
  late MostRecentProvider mostRecentProvider;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.readLastSuraList();
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    if (verses.isEmpty) {
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
          decoration: const BoxDecoration(
              color: AppColors.blackBgColor,
              image: DecorationImage(
                  image: AssetImage(AppAssets.detailsBg), fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  QuranResources.arabicQuranList[index],
                  textAlign: TextAlign.center,
                  style: AppStyles.bold24Primary,
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Expanded(
                  child: verses.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return SuraContentItem1(
                              suraContent: verses[index],
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: height * 0.02,
                            );
                          },
                          itemCount: verses.length,
                        ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
              ],
            ),
          )),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = fileContent.split('\n');
    verses = lines;
    Future.delayed(const Duration(seconds: 1), () => setState(() {}));
  }
}
