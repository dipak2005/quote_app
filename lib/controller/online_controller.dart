import 'package:get/get.dart';
import 'package:quote_app_af/helper/apihelper.dart';

class OnlineController extends GetxController {
  RxBool isShow=RxBool(false);
  @override
  void onInit() {
    ApiHelper().getApiData();
    super.onInit();
  }

  void show(){
    isShow.value=!isShow.value;
    print(isShow.value);
  }
}
