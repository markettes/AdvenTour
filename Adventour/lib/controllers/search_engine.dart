import 'package:http/http.dart';

class SearchEngine {
  Future search() async {
    var url = 'https://example.com/whatsit/create';
    Response response = await get(url);
    print(response.body);
  }
}
