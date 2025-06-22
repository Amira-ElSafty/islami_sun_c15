import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_sun_c15/model/hadeth.dart';
import 'package:islami_sun_c15/utils/app_assets.dart';
import 'package:islami_sun_c15/utils/app_colors.dart';
import 'package:islami_sun_c15/utils/app_styles.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor,
          image:
              DecorationImage(image: AssetImage(AppAssets.hadethCDetailsBg))),
      child: hadeth == null
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.blackBgColor,
              ),
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppAssets.hadethCornerLeft,
                      width: width * 0.16,
                    ),
                    Expanded(
                      child: Text(
                        hadeth?.title ?? "",
                        textAlign: TextAlign.center,
                        style: AppStyles.bold24Black,
                      ),
                    ),
                    Image.asset(
                      AppAssets.hadethCornerRight,
                      width: width * 0.16,
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadeth?.content ?? "",
                      textAlign: TextAlign.center,
                      style: AppStyles.bold16Black,
                    ),
                  ),
                ),
                Image.asset(AppAssets.hadethMosque),
              ],
            ),
    );
  }

  void loadHadethFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/hadeeth/h$index.txt');
    int fileLinesIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileLinesIndex);
    String content = fileContent.substring(fileLinesIndex + 1);
    hadeth = Hadeth(title: title, content: content);
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
    // List<String> hadethLines = fileContent.split('\n');
    // for(int i = 0 ; i < hadethLines.length ; i++){
    //   String title = hadethLines[0];
    //   hadethLines.removeAt(0);
    //
    // }
  }
}
