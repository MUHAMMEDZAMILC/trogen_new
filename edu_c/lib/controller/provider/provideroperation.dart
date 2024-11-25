import 'package:edu_c/controller/provider/providerservice.dart';
import 'package:edu_c/model/modules_model.dart';
import 'package:edu_c/model/subject_model.dart';
import 'package:edu_c/model/video_model.dart';
import 'package:flutter/material.dart';

class Provideroperation extends ChangeNotifier {
  ProviderService ntop = ProviderService();
  bool isloading = false,ispageloading = true;

// get subjects method
  List<Subject> subjectlist = [];
  getsubjects(context) async {
    ispageloading = true;
    subjectlist = await ntop.getsubjects(context);
    ispageloading = false;
    notifyListeners();
  }

  // get module method
  List<Modules> modulelist= [];
  getmodules(context,int subjectid) async {
    ispageloading = true;
    modulelist = await ntop.getmodules(context, subjectid);
    ispageloading = false;
    notifyListeners();

  }

  //  get  videos methos
  List<VideoModel> videolist = [];
  getvideos(context,int moduleid) async{
    ispageloading = true;
    videolist = await ntop.getvideo(context, moduleid);
    ispageloading = false;
    notifyListeners();
  }
}