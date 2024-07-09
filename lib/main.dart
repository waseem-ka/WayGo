import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waygo/controllers/language_controller.dart';
import 'package:waygo/controllers/local_storage.dart';
import 'package:waygo/controllers/user_controller.dart';
import 'package:waygo/screens/login_screen/language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:waygo/screens/base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  // String? user = LocalStorage.getString("user");

  // dynamic json = jsonDecode(user!);
  // print("tokkkkkken ${json['token']}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return GetBuilder<UserController>(
        init: UserController(),
        builder: (userController) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return GetBuilder(
                init: LanguageController(),
                builder: (controller) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: Theme.of(context).copyWith(
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                          primary: const Color(-14469022),
                        ),
                  ),
                  locale: controller.locale,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: child,
                ),
              );
            },
            child: userController.isLoggedIn
                ? const BaseScreen()
                : const StartPage(),
          );
        });
  }
}
