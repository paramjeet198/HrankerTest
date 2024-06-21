class RateResponse {
  List<RateData>? data;
  int? timestamp;

  RateResponse({this.data, this.timestamp});

  RateResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RateData>[];
      json['data'].forEach((v) {
        data!.add(RateData.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class RateData {
  String? id;
  String? symbol;
  String? currencySymbol;
  String? type;
  String? rateUsd;

  RateData({this.id, this.symbol, this.currencySymbol, this.type, this.rateUsd});

  RateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    currencySymbol = json['currencySymbol'];
    type = json['type'];
    rateUsd = json['rateUsd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    data['currencySymbol'] = currencySymbol;
    data['type'] = type;
    data['rateUsd'] = rateUsd;
    return data;
  }

  @override
  String toString() {
    return 'RateData{id: $id, symbol: $symbol, currencySymbol: $currencySymbol, type: $type, rateUsd: $rateUsd}';
  }
}
