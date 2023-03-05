// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sbn/provider/otp_provider.dart';
import 'package:sbn/provider/splash_provider.dart';
import 'package:sbn/provider/theme_provider.dart';
import 'package:sbn/theme/dark_theme.dart';
import 'package:sbn/theme/light_theme.dart';
import 'package:sbn/utill/app_constants.dart';
import 'package:sbn/view/screen/splash/splash_screen.dart';
import 'di_container.dart' as di;
import 'helper/preferenceutils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value){
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<OTPProvider>()),
      ],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Color(0xFFFF0000), statusBarBrightness: Brightness.light));
    PreferenceUtils.init();
    return MaterialApp(
      title: AppConstants.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      home: SplashScreen(),
    );
  }
}