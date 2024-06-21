import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/rate_api_response.dart';
import '../../providers/provider.dart';

class RateDropdown extends ConsumerStatefulWidget {
  final void Function(RateData?) onRateSelected;

  const RateDropdown({super.key, required this.onRateSelected});

  @override
  RateDropdownState createState() => RateDropdownState();
}

class RateDropdownState extends ConsumerState<RateDropdown> {
  RateData? selectedValue;

  @override
  Widget build(BuildContext context) {
    final rateAsyncValue = ref.watch(rateProvider);

    return rateAsyncValue.when(
      data: (rateResponse) {
        final items = rateResponse.data ?? [];

        return DropdownButton<RateData>(
          hint: const Text('Select Item'),
          value: selectedValue,
          items: items.map((RateData item) {
            return DropdownMenuItem<RateData>(
              value: item,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.id ?? '',
                      style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  Text(item.symbol ?? '', style: const TextStyle(fontSize: 12)),
                ],
              ),
            );
          }).toList(),
          onChanged: (RateData? newValue) {
            setState(() {
              selectedValue = newValue;
              widget.onRateSelected(newValue);
            });
          },
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
