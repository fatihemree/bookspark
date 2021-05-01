import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/views/home/home_view.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifer.dart';
import './product/widget/bottomNavigation/bottom_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleManager.prefrencesInit();
  initializeDateFormatting('tr', null).then((value) => runApp(MultiProvider(
        providers: [...ApplicationProvider.instance.dependItems],
        child: EasyLocalization(
            child: MyApp(),
            supportedLocales: LanguageManager.instance.supportedLocales,
            path: ApplicationConstants.LANG_ASSET_PATH),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: BottomNavigation(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
