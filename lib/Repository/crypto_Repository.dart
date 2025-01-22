


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto_app/Models/Coins_Model.dart';

class CryptoRepository {

   /// coins Api
   Future<coins_Model>fetchCoinsApi()async{
     String url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';
     final response =await http.get(Uri.parse(url));

      if(response.statusCode == 200){
        final body = jsonDecode(response.body);
        return coins_Model.fromJson(body);
      } else {
        throw Exception( 'Error');
      }
   }


}