import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:internshipquestion/components/auth_key.dart';

class DioService{
  Dio dio = Dio();
  getData( String baseUrl) async{
    try{
      final response = await dio.post(baseUrl,
        options: Options(
          headers: {
            'Authorization': authKey,
          },
        ),
        data: {
          "statusArray": [1],
          "screenType": [],
          "responseFormat": [],
          "globalGalleryIds": [],
          "categoryIds": [],
          "docTypes": [],
          "types": [],
          "limit": 10,
          "skip": 0,
          "searchingText": ""
        },
      );
      if(response.statusCode == 201){
        Get.snackbar("Success","Fetch Data Success",backgroundColor: Colors.green);
        return response;
      }
      else{
        Get.snackbar("Error","Data Error",backgroundColor: Colors.red);
      }
    }catch(e){
      print('Error: $e');
    }

  }
}