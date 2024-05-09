import 'package:get/get.dart';
import 'package:internshipquestion/model/data_model.dart';
import 'package:internshipquestion/service/dio_service.dart';

class MyController extends GetxController {
  var isLoading = true.obs;
  final baseUrl = "https://ajcjewel.com:4000/api/global-gallery/list";
  var dataList = DataModel().obs;

  getData() async {
    try {
      isLoading.value = true;
       final response =  await DioService().getData(baseUrl);
        dataList.value = DataModel.fromJson(response.data);

      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }
  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
