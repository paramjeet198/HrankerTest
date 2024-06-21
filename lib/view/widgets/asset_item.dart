import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrankertask/model/asset_api_response.dart';
import 'package:hrankertask/util/logger.dart';

import '../../model/rate_api_response.dart';

class AssetItem extends ConsumerWidget {
  const AssetItem({required this.data, required this.rateData, super.key});

  final AssetData data;
  final RateData? rateData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Log.v('rateData: $rateData');

    return ListTile(
      title: Text('${data.name}'),
      subtitle: Text(
        '${data.symbol}',
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
      ),
      trailing: _showRateView(),
      // trailing: Text(' ${rateData?.currencySymbol ?? ''} ${data.priceUsd!}'),
    );
  }

  Widget _showRateView() {
    if (rateData == null) {
      return Text(' ${rateData?.currencySymbol ?? ''} ${data.priceUsd!}');
    } else {
      return Text(
          ' ${rateData?.currencySymbol ?? ''} ${convertUsdToCurrency(data.priceUsd!, rateData!.rateUsd!)}');
    }
  }

  double convertUsdToCurrency(String usdAmount, String rateUsd) {
    final double amount = double.tryParse(usdAmount) ?? 0;
    final double rate = double.tryParse(rateUsd) ?? 0;
    if (rate == 0) {
      throw Exception('Invalid rate');
    }
    return amount / rate;
  }
}
