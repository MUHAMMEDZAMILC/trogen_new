import 'dart:developer';
import 'dart:io';

import 'package:edu_c/controller/urls.dart';
import 'package:edu_c/model/subject_model.dart';
import 'package:http/http.dart' as http;

import '../../model/modules_model.dart';
import '../../model/video_model.dart';
import '../../utils/helper/help_toast.dart';

class ProviderService {
  static const _headers = {'Content-Type': 'application/json', 'Accept': '*/*'};

  //  get subject api service

  getsubjects(context)async {
    List<Subject> emptysubjects=[];
    var url =
        "$baseUrl$subjects";
    log(url);
    try {
      final Uri uri = Uri.parse(url);
    var response = await http.get(uri, headers: _headers);
    log(response.body);
    if (response.statusCode == 200) {
      try {
        return subjectFromJson(response.body);
      } catch (e) {
        snackBar(context, message: '$e');
        return emptysubjects;
      }
    } else {
      snackBar(context, message: response.body);
      return emptysubjects;
    }
    }on SocketException{
      snackBar(context, message: "No Network Connection",type: MessageType.error);
      return emptysubjects;
    } catch (e) {
      snackBar(context, message: '$e');
      return emptysubjects;
    }
    
  }
 
  // get modules api service
  getmodules(context,int subjectid)async {
    List<Modules> emptymodules=[];
    var url =
        "$baseUrl${modeules}subject_id=$subjectid";
    log(url);
    try {
      final Uri uri = Uri.parse(url);
    var response = await http.get(uri, headers: _headers);
    log(response.body);
    if (response.statusCode == 200) {
      try {
        return modulesFromJson(response.body);
      } catch (e) {
        snackBar(context, message: '$e');
        return emptymodules;
      }
    } else {
      snackBar(context, message: response.body);
      return emptymodules;
    }
    }on SocketException{
      snackBar(context, message: "No Network Connection",type: MessageType.error);
      return emptymodules;
    } catch (e) {
      snackBar(context, message: '$e');
      return emptymodules;
    }
    
  }
// get video api service
   getvideo(context,int moduleid)async {
    List<VideoModel> emptyviseo=[];
    var url =
        "$baseUrl${video}module_id=$moduleid";
    log(url);
    try {
      final Uri uri = Uri.parse(url);
    var response = await http.get(uri, headers: _headers);
    log(response.body);
    if (response.statusCode == 200) {
      try {
        return videoModelFromJson(response.body);
      } catch (e) {
        snackBar(context, message: '$e');
        return emptyviseo;
      }
    } else {
      snackBar(context, message: response.body);
      return emptyviseo;
    }
    } on SocketException{
      snackBar(context, message: "No Network Connection",type: MessageType.error);
      return emptyviseo;
    } catch (e) {
      snackBar(context, message: '$e');
      return emptyviseo;
    }
    
  }

}