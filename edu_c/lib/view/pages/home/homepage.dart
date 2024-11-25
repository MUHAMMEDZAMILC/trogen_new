import 'package:edu_c/controller/provider/provideroperation.dart';
import 'package:edu_c/model/subject_model.dart';
import 'package:edu_c/utils/helper/help_loader.dart';
import 'package:edu_c/utils/helper/help_screensize.dart';
import 'package:edu_c/utils/theme/colors.dart';
import 'package:edu_c/utils/theme/dimensions.dart';
import 'package:edu_c/view/components/apptext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/subjectcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<Provideroperation>(context,listen: false).getsubjects(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final service =  Provider.of<Provideroperation>(context,listen: false);
    final liveservice =  Provider.of<Provideroperation>(context,listen: true);
    ScreenUtil.init(context);
    return liveservice.ispageloading? const PageEntryLoader(): Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: ColorResources.BLACK.withOpacity(0.3),
        title: AppText(text: '  Edu.C',weight: FontWeight.w500,letterspace: 0.8,size: 20,),
      ),
      body:liveservice.subjectlist.isEmpty?const PageNotData(): SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Padding(
          padding: const EdgeInsets.all(paddingLarge),
          child: ListView.builder(
            itemCount: liveservice.subjectlist.length,
            itemBuilder: (context, index) {
              Subject data = liveservice.subjectlist[index];
            return SubjectCard(data: data);
          },)
        ),
      ),
    );
  }
}
