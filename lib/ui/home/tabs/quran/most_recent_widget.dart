import 'package:flutter/material.dart';
import 'package:islami_sun_c15/providers/most_recent_provider.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/quran_resources.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class MostRecentWidget extends StatefulWidget {
  MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    //todo: this is bloc of code can be execute after build function
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        //todo: this is bloc of code can be execute after build function
        mostRecentProvider.readLastSuraList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most Recently',
            style: AppStyles.bold16White,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
            height: height * 0.16,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryColor),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              QuranResources.englishQuranList[
                                  mostRecentProvider.mostRecentList[index]],
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              QuranResources.arabicQuranList[
                                  mostRecentProvider.mostRecentList[index]],
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              '${QuranResources.verseNumberList[mostRecentProvider.mostRecentList[index]]} Verses  ',
                              style: AppStyles.bold14Black,
                            ),
                          ],
                        ),
                        Image.asset(AppAssets.mostRecently)
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: width * 0.02,
                  );
                },
                itemCount: mostRecentProvider.mostRecentList.length),
          ),
        ],
      ),
    );
  }
}
