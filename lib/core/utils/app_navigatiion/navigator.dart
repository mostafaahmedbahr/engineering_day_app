import 'package:flutter/material.dart';


class AppNavigator {
  static Future navigateTo(context, Widget widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );

  static void navigateOff(context, Widget widget) => Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );

  static void navigateOffWithoutAnimation(context, Widget widget) =>
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => widget,
          transitionDuration: const Duration(seconds: 0),
        ),
      );

  static void navigateOfAll(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) => false);
  static Future navigateToNameWithoutAnimation(context, Widget widget) =>
      Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => widget,
              transitionDuration: Duration.zero));

  static void navigateOffName(context, route, {arguments}) =>
      Navigator.pushReplacementNamed(context, route, arguments: arguments);

  static navigateAllNameOf(context, String route, {arguments}) =>
      Navigator.pushNamedAndRemoveUntil(context, route, (route) => false,
          arguments: arguments);

  static navigatePop(context, {data}) => Navigator.pop(context, data);

// static addConfirmPasswordBetweenScreen(context, String nextPageName,
//     {RouteArgument? argument}) {
//   // ////print("addConfirmPasswordBetweenScreen+  $nextPageName");
//   // ////print("argument+  ${argument?.param}");
//   return AppNavigator.navigateTo(
//       context,
//       ConfirmPassword(
//         nextPageRoute: nextPageName,
//       ));
// }
}