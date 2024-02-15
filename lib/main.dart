import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/utils/app_colors/theme.dart';
import 'package:engineering_day_app/features/auth/login/presentation/view_model/login_provider.dart';
import 'package:engineering_day_app/features/auth/login/presentation/views/login_view.dart';
import 'package:engineering_day_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'core/utils/app_services/remote_services/service_locator.dart';
import 'features/auth/login/data/repos/login_repo_implement.dart';
import 'features/auth/register/presentation/view_model/register_provider.dart';
import 'features/charts/data/repos/statistics_repo_implement.dart';
import 'features/charts/presentation/view_model/statistics_provider.dart';
import 'features/layout/presentation/view_model/layout_provider.dart';
import 'features/splash/splash_screen.dart';
import 'lang/codegen_loader.g.dart';

void main() async {
  await setup();
  runApp(
    EasyLocalization(
      startLocale: const Locale('ar', ""),
      supportedLocales: const [
        Locale('ar', ""),
        Locale('en', ""),
      ],
      path: 'assets/lang',
      saveLocale: true,
      // <-- change the path of the translation files
      fallbackLocale: const Locale('ar', ""),
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LayoutProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(getIt.get<LoginRepoImpl>()),
        ),
        ChangeNotifierProvider(
          create: (_) => StatisticsProvider(getIt.get<StatisticsRepoImpl>()),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(),
        ),
      ],
      child: MaterialApp(
        theme: lightTheme,
        title: 'Engineering Day App',
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        home: SplashScreen(
          home: currentUser.value.auth == true ? HomeView() : LoginView(),
        ),
        builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1080,
          minWidth: 380,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(460, name: MOBILE),
            const ResponsiveBreakpoint.resize(460, name: PHONE),
            const ResponsiveBreakpoint.resize(450, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        ),
      ),
    );
  }
}
