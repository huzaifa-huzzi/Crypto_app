import 'dart:convert';
import 'package:crypto_app/Models/ChartModel.dart';
import 'package:http/http.dart' as http;
import 'package:crypto_app/Models/Coins_Model.dart';



class CryptoRepository {

  /// Coins API
  Future<List<Coins_Model>> fetchCoinsApi() async {
    String url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => Coins_Model.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching coins data');
    }
  }

  /// Charts Api
  Future<List<ChartModel>> fetchChartApi() async {
    String url =
        'https://api.coingecko.com/api/v3/coins/bitcoin/ohlc?vs_currency=usd&days=1';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => ChartModel.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching coins data');
    }
  }


}
