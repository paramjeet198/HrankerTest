import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrankertask/core/api_service.dart';

final assetProvider = FutureProvider((ref) {
  return ApiService().getAssets();
});


final rateProvider = FutureProvider((ref) {
  return ApiService().getRates();
});
