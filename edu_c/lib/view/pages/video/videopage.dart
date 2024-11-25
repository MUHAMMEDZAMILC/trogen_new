// ignore_for_file: must_be_immutable

import 'package:edu_c/model/video_model.dart';
import 'package:edu_c/utils/helper/help_loader.dart';
import 'package:edu_c/utils/helper/help_screensize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider/provideroperation.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/dimensions.dart';
import '../../components/apptext.dart';
import 'widget/videocard.dart';

class VideoScreen extends StatefulWidget {
   VideoScreen({super.key,required this.moduleid,required this.modulename});
  String modulename;
  int moduleid;
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
     Provider.of<Provideroperation>(context,listen: false).getvideos(context, widget.moduleid);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final service =  Provider.of<Provideroperation>(context,listen: false);
    final liveservice =  Provider.of<Provideroperation>(context,listen: true);
    
    ScreenUtil.init(context);
    return liveservice.ispageloading?const PageEntryLoader(): Scaffold(
      appBar:  AppBar(
        elevation: 4,
        shadowColor: ColorResources.BLACK.withOpacity(0.3),
        title: AppText(text: '  ${widget.modulename}',weight: FontWeight.w500,letterspace: 0.8,size: 20,),),
    body:liveservice.videolist.isEmpty?const PageNotData(): SizedBox(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: paddingLarge),
        itemCount: liveservice.videolist.length,
        itemBuilder: (context, index) {
        VideoModel data = liveservice.videolist[index];
        return VideoCard(data: data);
      },)
    ),
    );
  }
}
