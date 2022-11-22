import 'package:get_it/get_it.dart';
import 'package:imagefilter_flutter/core/services/mock_api_service.dart';

final locator = GetIt.instance;
setUpLocator() {
  locator.registerSingleton<MockApiService>(MockApiService());
}
