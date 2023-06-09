import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:random_video_call_app/model/country_response_m.dart';

class CountryCnt extends GetxController {
  final dio = Dio();
  var selected = -1;
  var index = -1;
  var age = -1;
  RxBool isLoading = true.obs;
  String? countryName;
  String? countryFlag;
  Rx<CountryResponseM> countryResponseM = CountryResponseM().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getCountryData();
    super.onInit();
  }

  Future<void> getCountryData() async {
    try {
      isLoading.value = true;
      var response =
          await dio.get('https://yash6292.github.io/category/country.json');
      if (response.statusCode == 200) {
        countryResponseM.value = CountryResponseM.fromJson(response.data);
        isLoading.value = false;
      }
    } catch (e) {
      print('errerr $e');
      isLoading.value = false;
    }
  }
}
