import 'package:http/http.dart' as http;

class MyApiService {
  static Future getData() async{
    var request = http.Request('GET', Uri.parse('https://www.episodate.com/api/most-popular?page=1'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      return result;
    }
    else {
      print(response.reasonPhrase);
    }

  }
}