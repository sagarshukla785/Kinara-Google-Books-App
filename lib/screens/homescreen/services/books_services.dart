import 'package:http/http.dart' as http;

class BooksServices {
  Future<String> get(String host, String endpoint, String searchKeyword) async {
    var url =
      Uri.https(host, endpoint, {'q': searchKeyword});
    var response = await http.get(url);
    if(response.statusCode == 200){
      return response.body;
    }
    return '';
  }
}
