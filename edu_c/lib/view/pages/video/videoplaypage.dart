// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:edu_c/model/video_model.dart';
import 'package:edu_c/utils/helper/help_screensize.dart';
import 'package:edu_c/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayScreen extends StatefulWidget {
   VideoPlayScreen({super.key,required this.videodata});
  VideoModel videodata;
  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
 
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videodata.videoUrl??'');
    _controller = YoutubePlayerController(
      initialVideoId:videoId??'',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    

    super.initState();
  }
  String extractVimeoId(String url) {
    log("vimeo url ${url.split('/').last}");
  return url.split('/').last;
}
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: ColorResources.BLACK,
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Column(
          children: [
           SizedBox(
            width: ScreenUtil.screenWidth,
            height: ScreenUtil.screenHeight,
             child:widget.videodata.videoType=='YouTube'? YoutubePlayer(
                controller: _controller,
                  aspectRatio: 16/9,
                  // thumbnail: Image.asset('assets/images/Spread.jpg',fit: BoxFit.cover,),
                  ):VimeoPlayer(
  videoId: extractVimeoId(widget.videodata.videoUrl??''),
),
           ),
                
          ],
        ),
      ),
    );
    
  }
   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}