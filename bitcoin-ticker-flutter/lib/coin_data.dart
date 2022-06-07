import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  // 'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String apiKey = 'FAFAF75E-9FA8-4404-96D7-B18BF604417F';
  String urlBase = 'https://rest.coinapi.io/v1/exchangerate/';

  Future<Map<String, dynamic>> getCoinData(
      String selectedCurrency, String coinType) async {
    String url = urlBase + '$coinType/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('ERROR: ${response.statusCode}');
      throw 'Problem with the GET request: $url';
    }
  }
}
