import 'package:flutter/material.dart';
import 'package:islami_sun_c15/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_sun_c15/utils/app_assets.dart';
import 'package:islami_sun_c15/utils/app_styles.dart';

class SuraItem extends StatelessWidget {
  int index;

  SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.vectorImage),
            Text(
              '${index + 1}',
              style: AppStyles.bold14White,
            )
          ],
        ),
        SizedBox(
          width: width * 0.06,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranList[index],
              style: AppStyles.bold20White,
            ),
            Text(
              '${QuranResources.verseNumberList[index]}  Verses',
              style: AppStyles.bold14White,
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranResources.arabicQuranList[index],
          style: AppStyles.bold20White,
        )
      ],
    );
  }
}
