import 'package:crypto_app/Models/ChartModel.dart';
import 'package:crypto_app/Models/Coins_Model.dart';
import 'package:crypto_app/Repository/crypto_Repository.dart';



class CryptoViewModel {
  final _repo = CryptoRepository();

     ///Coins
  Future<List<Coins_Model>> fetchCoinsApi() async {
    final response = await _repo.fetchCoinsApi();
    return response;
  }

  /// Charts
  Future<List<ChartModel>> fetchChartApi() async {
    final response = await _repo.fetchChartApi();
    return response;
  }


}