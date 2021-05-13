import 'dart:convert';
import 'package:http/http.dart';

var coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate/LTC/AUD?apiKey=';
const apiKey = '6BAEB92E-73C5-4A92-801E-6627D08CC680';

class NetWorkServices {

  Future<dynamic> getETC({ currency}) async {
    String url='https://rest.coinapi.io/v1/exchangerate/ETH/$currency?apiKey=66E68CA3-66DB-425F-8681-8BE5443BD0CD';
    Response response = await get(Uri.parse(url));
    var data = response.body;
    print(data);
    if (response.statusCode == 200) {
       
       var jsonBody=jsonDecode(data);

       return jsonBody;
    } else {
      print("err");
    }
  }
  Future<dynamic> getBTC({ currency}) async {
    String url='https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apiKey=6BAEB92E-73C5-4A92-801E-6627D08CC680';
    Response response = await get(Uri.parse(url));
    var data = response.body;
    print(data);
    if (response.statusCode == 200) {

      var jsonBody=jsonDecode(data);

      return jsonBody;
    } else {
      print("err");
    }
  } Future<dynamic> getLTC({ currency}) async {
    String url='https://rest.coinapi.io/v1/exchangerate/LTC/$currency?apiKey=6BAEB92E-73C5-4A92-801E-6627D08CC680';
    Response response = await get(Uri.parse(url));
    var data = response.body;
    print(data);
    if (response.statusCode == 200) {

      var jsonBody=jsonDecode(data);

      return jsonBody;
    } else {
      print("err");
    }
  }

}
