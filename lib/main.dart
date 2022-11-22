import 'package:flutter/material.dart';
import 'package:imagefilter_flutter/core/controllers/GalleryViewModel.dart';
import 'package:imagefilter_flutter/core/services/locator.dart';
import 'package:imagefilter_flutter/ui/root_view.dart';
import 'package:imagefilter_flutter/ui/shared/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GalleryViewModel())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appThemeData,
        debugShowCheckedModeBanner: false,
        home: const RootView(),
      ),
    );
  }
}
