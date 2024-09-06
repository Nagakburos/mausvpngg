import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'initialization/initializer.dart';
import 'routes/routes.dart';
import 'utils/custom_color.dart';
import 'utils/strings.dart';
import 'package:firebase_core_dart/firebase_core_dart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Initializer.adMobInitialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, child) => GetMaterialApp(
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler
                : TextScaler.linear(1.0)),
            child: widget!,
          );
        },
        theme: ThemeData(
          canvasColor: CustomColor.white,
          primaryColor: CustomColor.primaryColor,
          fontFamily: GoogleFonts.josefinSans().fontFamily,
          appBarTheme: AppBarTheme(
            color: CustomColor.primaryColor,
          ),
        ),
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        initialRoute: Routes.splashScreen,
        getPages: Routes.list,
      ),
    );
  }
}
