
import 'package:flutter/material.dart';

import '../../../model/modules_model.dart';
import '../../../utils/helper/help_screensize.dart';
import '../../../utils/helper/pagenavigator.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/dimensions.dart';
import '../../../utils/theme/theme_data.dart';
import '../../components/apptext.dart';
import '../video/videopage.dart';

class ModuleCard extends StatelessWidget {
  const ModuleCard({
    super.key,
    required this.data,
  });

  final Modules data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:  paddingSmall),
      child: InkWell(
        onTap: () {
          Screen.open(context, VideoScreen(moduleid: data.id??0, modulename: data.title??''));
        },
        child: Container(
          width: ScreenUtil.screenWidth,
          height: ScreenUtil.screenHeight!*0.1,
          decoration: BoxDecoration(
            color: ColorResources.WHITE,
            borderRadius: BorderRadius.circular(paddingLarge),
            boxShadow: ColorResources.defshadow,
            border: Border.all(color: primarycolor.withOpacity(0.4),width: 0.5)
          ),
          child: Padding(
            padding: const EdgeInsets.all(paddingSmall),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
               
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(text: data.title??'',weight: FontWeight.w500,letterspace: 0.5,color: ColorResources.BLACK.withOpacity(0.8),maxline: 1,),
                      gap,
                      Padding(
                        padding: const EdgeInsets.only(left: padding),
                        child: AppText(text: data.description??'',weight: FontWeight.w300,letterspace: 0.5,color: ColorResources.BLACK.withOpacity(0.7),maxline: 2,),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}