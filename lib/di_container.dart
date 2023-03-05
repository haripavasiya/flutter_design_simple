import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sbn/provider/otp_provider.dart';
import 'package:sbn/provider/splash_provider.dart';
import 'package:sbn/provider/theme_provider.dart';
import 'package:sbn/utill/app_constants.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'helper/preferenceutils.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Repo
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl()));
  // Provider
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => SplashProvider());
  sl.registerFactory(() => OTPProvider());
  // External
  PreferenceUtils.init();
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
