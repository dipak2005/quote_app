// ignore_for_file: empty_constructor_bodies
import 'package:http/http.dart' as http;
import 'package:quote_app_af/model/quotes_api_model.dart';

class ApiHelper {
  static final ApiHelper apiHelper = ApiHelper._();
  final String baseUrl = "https://api.quotable.io/quotes";

  ApiHelper._();

  factory ApiHelper() {
    return apiHelper;
  }

  Future<QuoteApi?> getApiData() async {
    http.Response url = await http.get(Uri.parse(baseUrl));
    if (url.statusCode == 200) {
      QuoteApi quote = quoteApiFromJson(url.body);
      return quote;
    }
    return null;
  }
}
