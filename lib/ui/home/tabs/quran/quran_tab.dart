import 'package:flutter/material.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/details1/sura_details_screen1.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/most_recent_widget.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/sura_item.dart';
import 'package:islami_sun_c15/utils/app_assets.dart';
import 'package:islami_sun_c15/utils/app_colors.dart';
import 'package:islami_sun_c15/utils/app_styles.dart';
import 'package:islami_sun_c15/utils/shared_prefs.dart';

/*
width = 430
height = 932
 */
class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(
    114,
    (index) => index,
  );

  /// 114
  // void addFilterList(){
  //   for(int i = 0 ; i < 114 ; i++){
  //     filterList.add(i);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: AppStyles.bold16White,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2)),
                prefixIcon: Image.asset(AppAssets.iconSearch),
                hintText: 'Sura Name',
                hintStyle: AppStyles.bold16White),
            onChanged: (newText) {
              searchByNewText(newText);
            },
          ),
          SizedBox(
            height: height * 0.02,
          ),
          MostRecentWidget(),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            'Suras List',
            style: AppStyles.bold16White,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          //todo: save last sura index in shared prefs
                          saveLastSuraIndex(filterList[index]);
                          //todo: navigate to sura details
                          Navigator.of(context).pushNamed(
                              SuraDetailsScreen1.routeName,
                              arguments: filterList[index]);
                        },
                        child: SuraItem(
                          index: filterList[index],
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.whiteColor,
                      thickness: 2,
                      indent: width * 0.1,
                      endIndent: width * 0.05,
                    );
                  },
                  itemCount: filterList.length))
        ],
      ),
    );
  }

  void searchByNewText(String newText) {
    List<int> filterSearchList = [];
    for (int i = 0; i < QuranResources.englishQuranList.length; i++) {
      //todo: toLowerCase()  => Saba  => saba
      //todo: toUpperCase()  => Saba  => SABA  , saba => SABA
      if (QuranResources.englishQuranList[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        filterSearchList.add(i);
      }
      if (QuranResources.arabicQuranList[i].contains(newText)) {
        filterSearchList.add(i);
      }
    }
    filterList = filterSearchList;
    setState(() {});
  }
}
