

class Coins_Model {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? marketCap;
  int? marketCapRank;
  double? fullyDilutedValuation;
  double? totalVolume;
  double? high24h;
  double? low24h;
  double? priceChange24h;
  double? priceChangePercentage24h;
  double? marketCapChange24h;
  double? marketCapChangePercentage24h;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  double? ath;
  double? athChangePercentage;
  String? athDate;
  double? atl;
  double? atlChangePercentage;
  String? atlDate;
  dynamic roi; // Changed Null to dynamic for flexibility
  String? lastUpdated;
  SparklineIn7d? sparklineIn7d;

  Coins_Model({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.marketCapChange24h,
    this.marketCapChangePercentage24h,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
    this.sparklineIn7d,
  });

  Coins_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    currentPrice = (json['current_price'] as num?)?.toDouble();
    marketCap = (json['market_cap'] as num?)?.toDouble();
    marketCapRank = json['market_cap_rank'];
    fullyDilutedValuation = (json['fully_diluted_valuation'] as num?)?.toDouble();
    totalVolume = (json['total_volume'] as num?)?.toDouble();
    high24h = (json['high_24h'] as num?)?.toDouble();
    low24h = (json['low_24h'] as num?)?.toDouble();
    priceChange24h = (json['price_change_24h'] as num?)?.toDouble();
    priceChangePercentage24h = (json['price_change_percentage_24h'] as num?)?.toDouble();
    marketCapChange24h = (json['market_cap_change_24h'] as num?)?.toDouble();
    marketCapChangePercentage24h =
        (json['market_cap_change_percentage_24h'] as num?)?.toDouble();
    circulatingSupply = (json['circulating_supply'] as num?)?.toDouble();
    totalSupply = (json['total_supply'] as num?)?.toDouble();
    maxSupply = (json['max_supply'] as num?)?.toDouble();
    ath = (json['ath'] as num?)?.toDouble();
    athChangePercentage = (json['ath_change_percentage'] as num?)?.toDouble();
    athDate = json['ath_date'];
    atl = (json['atl'] as num?)?.toDouble();
    atlChangePercentage = (json['atl_change_percentage'] as num?)?.toDouble();
    atlDate = json['atl_date'];
    roi = json['roi'];

    // Parse sparkline_in_7d if valid
    if (json['sparkline_in_7d'] != null && json['sparkline_in_7d'] is Map<String, dynamic>) {
      sparklineIn7d = SparklineIn7d.fromJson(json['sparkline_in_7d']);
    } else {
      sparklineIn7d = null;
    }

    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    data['name'] = name;
    data['image'] = image;
    data['current_price'] = currentPrice;
    data['market_cap'] = marketCap;
    data['market_cap_rank'] = marketCapRank;
    data['fully_diluted_valuation'] = fullyDilutedValuation;
    data['total_volume'] = totalVolume;
    data['high_24h'] = high24h;
    data['low_24h'] = low24h;
    data['price_change_24h'] = priceChange24h;
    data['price_change_percentage_24h'] = priceChangePercentage24h;
    data['market_cap_change_24h'] = marketCapChange24h;
    data['market_cap_change_percentage_24h'] = marketCapChangePercentage24h;
    data['circulating_supply'] = circulatingSupply;
    data['total_supply'] = totalSupply;
    data['max_supply'] = maxSupply;
    data['ath'] = ath;
    data['ath_change_percentage'] = athChangePercentage;
    data['ath_date'] = athDate;
    data['atl'] = atl;
    data['atl_change_percentage'] = atlChangePercentage;
    data['atl_date'] = atlDate;
    data['roi'] = roi;
    data['last_updated'] = lastUpdated;
    if (sparklineIn7d != null) {
      data['sparkline_in_7d'] = sparklineIn7d!.toJson();
    }
    return data;
  }
}

class SparklineIn7d {
  List<double>? price;

  SparklineIn7d({this.price});

  SparklineIn7d.fromJson(Map<String, dynamic> json) {
    price = (json['price'] as List<dynamic>?)?.map((e) => (e as num).toDouble()).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    return data;
  }
}
