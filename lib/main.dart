import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setup();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(  const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(  create: (context) => OnBoardingCubit()),
        BlocProvider(create: (context) => LayoutCubit(getIt.get<LayoutRepoImpl>())),
        BlocProvider(create: (context) => ServicesCubit(getIt.get<ServicesReposImplementation>())),
        BlocProvider(create: (context) => ServicesDetailsCubit(getIt.get<ServicesDetailsRepoImpl>())),
        BlocProvider(create: (context) => QoutesCubit(getIt.get<QoutesReposImplementation>())),
        BlocProvider(create: (context) => CourseDetailsCubit(getIt.get<CourseDetailsRepoImplementation>())),
        BlocProvider(create: (context) => OurTeamCubit()),
      ],
      child:MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffEBE9E9),
        ),
        title: 'Add Samy App',
        debugShowCheckedModeBanner: false,
        home:     const SplashView(),
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