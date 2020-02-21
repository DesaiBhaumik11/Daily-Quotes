import 'package:daily_quotes/Model_Class/get_catagory_modelClass.dart';
import 'package:daily_quotes/Model_Class/get_quotes_modelClass.dart';
import 'package:http/http.dart' as http;

//Creating Class URLs
class URLS {
  static const String DISPLAY_QUOTES_CATEGORY = "http://192.168.1.134./quotes/get-category-api.php";
  static const String DISPLAY_CATEGORY_WISE_QUOTES_CATEGORY = "http://192.168.1.134./quotes/get-quote-api.php?category_id=";
}

class ApiService {

  static Future<Category> getQuotesCategory() async {
    final response = await http.get(URLS.DISPLAY_QUOTES_CATEGORY);
    if(response.statusCode == 200) {
      return Category.fromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<Quotes> getCategoryViceQuotes(String categoryId) async {
    final response = await http.get(URLS
        .DISPLAY_CATEGORY_WISE_QUOTES_CATEGORY + categoryId);
    if(response.statusCode == 200) {
      return Quotes.fromJson(response.body);
    } else {
      return null;
    }
  }

}