import 'package:flutter/material.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/details1/sura_details_screen1.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/details2/sura_details_screen2.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/sura_item.dart';
import 'package:islami_sun_c15/utils/app_assets.dart';
import 'package:islami_sun_c15/utils/app_colors.dart';
import 'package:islami_sun_c15/utils/app_styles.dart';

/*
width = 430
height = 932
 */
class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
          ),
          SizedBox(
            height: height * 0.02,
          ),
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
                              'Al-Anbiya',
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              'الأنبياء',
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              '112 Verses  ',
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
                itemCount: 10),
          ),
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
                          //todo: navigate to sura details
                          Navigator.of(context).pushNamed(
                              SuraDetailsScreen1.routeName,
                              arguments: index);
                        },
                        child: SuraItem(
                          index: index,
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
                  itemCount: QuranResources.verseNumberList.length))
        ],
      ),
    );
  }
}
