import 'package:crypto_app/Models/Coins_Model.dart';
import 'package:crypto_app/Repository/crypto_Repository.dart';

class CryptoModel {

  final _repo = CryptoRepository();

   Future<coins_Model>fetchCoinsApi()async{
      final response = await _repo.fetchCoinsApi();
      return response;
   }

}