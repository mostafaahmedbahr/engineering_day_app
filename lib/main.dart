import 'package:easy_localization/easy_localization.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'core/utils/app_services/local_services/cache_helper.dart';
import 'core/utils/app_services/remote_services/service_locator.dart';
import 'features/layout/presentation/view_model/layout_provider.dart';
import 'features/layout/presentation/views/layout_view.dart';
import 'lang/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  setup();
  runApp(
    EasyLocalization(
      startLocale: const Locale('ar',""),
      supportedLocales: const [
        Locale('ar',""),
        Locale('en',""),
      ],
      path: 'assets/lang',
      saveLocale: true,// <-- change the path of the translation files
      fallbackLocale: const Locale('ar',""),
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

        // BlocProvider(create: (context) => LayoutCubit(getIt.get<LayoutRepoImpl>())),
        // BlocProvider(create: (context) => ServicesCubit(getIt.get<ServicesReposImplementation>())),
        // BlocProvider(create: (context) => ServicesDetailsCubit(getIt.get<ServicesDetailsRepoImpl>())),
        // BlocProvider(create: (context) => QoutesCubit(getIt.get<QoutesReposImplementation>())),
        // BlocProvider(create: (context) => CourseDetailsCubit(getIt.get<CourseDetailsRepoImplementation>())),
        // BlocProvider(create: (context) => OurTeamCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffEBE9E9),
        ),
        title: 'Engineering Day App',
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        home: const LayoutView(),
        builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        ),
      ),
    );
  }
}
