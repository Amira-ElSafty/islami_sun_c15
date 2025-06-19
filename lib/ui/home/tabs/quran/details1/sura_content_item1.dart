import 'package:flutter/material.dart';
import 'package:islami_sun_c15/utils/app_colors.dart';
import 'package:islami_sun_c15/utils/app_styles.dart';

class SuraContentItem1 extends StatelessWidget {
  String suraContent;

  int index;

  SuraContentItem1({super.key, required this.suraContent, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primaryColor, width: 2)),
      child: Text(
        '$suraContent [${index + 1}]',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: AppStyles.bold20Primary,
      ),
    );
  }
}
