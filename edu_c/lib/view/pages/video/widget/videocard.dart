
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../model/video_model.dart';
import '../../../../utils/helper/help_screensize.dart';
import '../../../../utils/helper/pagenavigator.dart';
import '../../../../utils/theme/colors.dart';
import '../../../../utils/theme/dimensions.dart';
import '../../../../utils/theme/theme_data.dart';
import '../../../components/apptext.dart';
import '../videoplaypage.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    super.key,
    required this.data,
  });

  final VideoModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical:  paddingSmall,horizontal: paddingLarge),
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
                      AppText(text: data.title??'',weight: FontWeight.w500,letterspace: 0.5,color: ColorResources.BLACK,maxline: 1,),
                      gap,
                      AppText(text: data.description??'',weight: FontWeight.w300,letterspace: 0.5,color: ColorResources.BLACK.withOpacity(0.7),maxline: 2,)
                    ],
                  ),
                ),
                gapHorizontal,
                InkWell(
                  onTap: () {
                    Screen.open(context, VideoPlayScreen(videodata: data));
                  },
                  child: const CircleAvatar(
                    backgroundColor: secondarycolor,
                    child: Center(child: Icon(CupertinoIcons.play_arrow_solid,color: ColorResources.WHITE,)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}