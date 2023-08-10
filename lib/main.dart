import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaj/cubit/my_profile_cubit.dart';
import 'package:flutterstaj/cubit/page_two_cubit.dart';
import 'package:flutterstaj/lang.dart';
import 'package:flutterstaj/pages/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp( /*const*/ MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       /* BlocProvider(create: (context) => HomePageCubit()),*/
        BlocProvider(create: (context) => PageTwoCubit()),
        BlocProvider(create: (context) => MyProfileCubit()),
      ],
      child: GetMaterialApp(
      translations: Lang(),
        locale: box.read("lang") == null ? Get.deviceLocale : box.read("lang") == "tr"? Locale("tr","TR"):Locale("en","US"),
        fallbackLocale: Lang.defaultLang,
        title: 'Mezun Takip Sistemi',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
