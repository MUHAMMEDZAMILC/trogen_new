// ignore_for_file: must_be_immutable

import 'package:edu_c/model/modules_model.dart';
import 'package:edu_c/utils/helper/help_loader.dart';
import 'package:edu_c/utils/helper/help_screensize.dart';
import 'package:edu_c/utils/theme/colors.dart';
import 'package:edu_c/utils/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider/provideroperation.dart';
import '../../components/apptext.dart';
import 'modulecard.dart';

class ModuleListScreen extends StatefulWidget {
   ModuleListScreen({super.key,required this.subjectid,required this.sunjectname});
  String sunjectname;
  int subjectid;
  @override
  State<ModuleListScreen> createState() => _ModuleListScreenState();
}

class _ModuleListScreenState extends State<ModuleListScreen> {
  @override
  void initState() {
     Provider.of<Provideroperation>(context,listen: false).getmodules(context, widget.subjectid);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final service =  Provider.of<Provideroperation>(context,listen: false);
    final liveservice =  Provider.of<Provideroperation>(context,listen: true);
    
    ScreenUtil.init(context);
    return liveservice.ispageloading?const PageEntryLoader(): Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: ColorResources.BLACK.withOpacity(0.3),
        title: AppText(text: '  ${widget.sunjectname}',weight: FontWeight.w500,letterspace: 0.8,size: 20,),),
      body: liveservice.modulelist.isEmpty?const PageNotData(): SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: ListView.builder(
          padding: const EdgeInsets.all(paddingLarge),
          itemCount: liveservice.modulelist.length,
          itemBuilder: (context, index) {
            Modules data = liveservice.modulelist[index];
          return ModuleCard(data: data);
        },),
      ),
    );
  }
}
