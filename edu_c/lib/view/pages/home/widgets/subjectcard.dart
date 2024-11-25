
import 'package:flutter/material.dart';

import '../../../../model/subject_model.dart';
import '../../../../utils/helper/help_screensize.dart';
import '../../../../utils/helper/pagenavigator.dart';
import '../../../../utils/theme/colors.dart';
import '../../../../utils/theme/dimensions.dart';
import '../../../components/apptext.dart';
import '../../modules/modulepage.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.data,
  });

  final Subject data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:  paddingSmall),
      child: InkWell(
        onTap: () {
          Screen.open(context, ModuleListScreen(subjectid: data.id??0, sunjectname: data.title??''));
        },
        child: Container(
          width: ScreenUtil.screenWidth,
          height: ScreenUtil.screenHeight!*0.1,
          decoration: BoxDecoration(
            color: ColorResources.WHITE,
            borderRadius: BorderRadius.circular(paddingLarge),
            boxShadow: ColorResources.defshadow,
          ),
          child: Padding(
            padding: const EdgeInsets.all(paddingSmall),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                CircleAvatar(
                  backgroundImage: NetworkImage(data.image??''),
                  radius: 25,
                ),
                gapHorizontal,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(text: data.title??'',weight: FontWeight.w500,letterspace: 0.5,color: ColorResources.BLACK.withOpacity(0.7),maxline: 1,),
                      gap,
                      AppText(text: data.description??'',weight: FontWeight.w300,letterspace: 0.5,color: ColorResources.BLACK.withOpacity(0.7),maxline: 2,)
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