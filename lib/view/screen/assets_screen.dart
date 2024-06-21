import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrankertask/providers/provider.dart';
import 'package:hrankertask/util/logger.dart';
import 'package:hrankertask/view/widgets/asset_item.dart';

import '../../model/rate_api_response.dart';
import '../../util/WiFiSecurityUtility.dart';
import '../widgets/dropdown_widget.dart';

class AssetScreen extends ConsumerStatefulWidget {
  const AssetScreen({super.key});

  @override
  ConsumerState createState() => _AssetScreenState();
}

class _AssetScreenState extends ConsumerState<AssetScreen> {
  RateData? _selectedRateData;

  void _onRateSelected(RateData? rate) {
    setState(() {
      _selectedRateData = rate!;
      Log.v('Selected Value: $_selectedRateData');
    });
  }

  @override
  void initState() {
    super.initState();
    WiFiSecurityUtility.checkAndShowAlertDialog(context);

    /*_selectedRateData = RateData(
        id: 'bitcoin',
        type: 'crypto',
        currencySymbol: '₿',
        rateUsd: '6441.6817435327728704',
        symbol: 'BTC');*/

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RateDropdown(
              onRateSelected: (data) {
                _onRateSelected(data);
              },
            ),
          ),
          // Expanded(child: Text('kjfjdb'))
          Expanded(child: _assetListView(selectedRateData: _selectedRateData)),
        ],
      ),
    );
  }

  Widget _assetListView({required RateData? selectedRateData}) {
    return Center(
      child: ref.watch(assetProvider).when(
        data: (data) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.data?.length,
            itemBuilder: (context, index) {
              return AssetItem(
                data: data.data![index],
                rateData: _selectedRateData,
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Text('Error: $error');
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
