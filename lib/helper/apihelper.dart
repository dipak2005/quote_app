// ignore_for_file: empty_constructor_bodies

class ApiHelper {
  static final ApiHelper apiHelper = ApiHelper._();
 final String _baseUrl="https://api.quotable.io/quotes";
  ApiHelper._();
  factory ApiHelper(){
   return apiHelper;
  }

  void getApi(){

  }
}
