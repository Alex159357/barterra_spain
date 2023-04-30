import 'package:barterra2/src/di/injection_container.dart';
import 'package:barterra2/src/futures/presentation/screens/home/home_screen.dart';
import 'package:barterra2/theme/app_theme/app_theme.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/config/blocs/bloc_provider.dart';
import 'firebase_options.dart';

late SharedPreferences prefs;
late List<CameraDescription> cameras;


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer.instance.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  cameras = await availableCameras();
  // GetWorld().initialize();
  prefs = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark,));
  FlutterNativeSplash.remove();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
      value) =>
      runApp(
        EasyLocalization(
            supportedLocales: const [Locale('en','US'), Locale('uk','UA')],
            path: 'assets/translations',
            fallbackLocale: tryGetLanguage,
            child: MultiBlocProvider(
              providers: blocProviderList,
              child:MaterialApp(
                  debugShowCheckedModeBanner: false,
                  // scrollBehavior: ScrollBeheviorNowRipple(),
                  // localizationsDelegates: context.localizationDelegates,
                  // supportedLocales: context.supportedLocales,
                  // locale: context.locale,
                  title: 'Barterra',
                  theme: AppTheme.light,
                  home: const HomeScreen()
              ),

            )),
      )
  );
}

// ThemeData getThemeData(ThemeState state){
//   switch(state.runtimeType){
//     case ThemeDark: return AppTheme.dark;
//     default: return AppTheme.light;
//   }
// }

Locale  get tryGetLanguage {
  String? code = prefs.getString("");
  if(code != null){
    return Locale(code.split("-")[0], code.split("-")[0]);
  }else {
    return const Locale('en', 'US');
  }
}
