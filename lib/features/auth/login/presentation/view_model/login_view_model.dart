import 'package:engineering_day_app/core/shared_widgets/loading_dialog.dart';
import 'package:engineering_day_app/core/utils/app_navigatiion/navigator.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/service_locator.dart';
import 'package:engineering_day_app/core/utils/new_toast/new_toast.dart';
import 'package:engineering_day_app/features/auth/login/model/user_model.dart';
import 'package:engineering_day_app/features/auth/login/presentation/view_model/login_services.dart';
import 'package:engineering_day_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends ChangeNotifier {
  static get(context, {listen = true}) =>
      Provider.of<LoginViewModel>(context, listen: listen);

  login(context, {required String email, required String password}) async {
    showLoaderDialog(context);
    LoginServices services = getIt<LoginServices>();

    UserModel userModel =
        await services.login(email: email, password: password);
    try {
      if (userModel.status == true) {
        AppNavigator.navigatePop(context);

        Map<String, dynamic> currentUserJson = userModel.data!.toJson();
        currentUserJson["password"] = password;
        currentUserJson["password"] = password;
        currentUserJson["rememberMe"] = currentUser.value.rememberMe;
        setCurrentUser(currentUserJson);
        currentUser.value.auth = true;
        return AppNavigator.navigateOfAll(context, const HomeView());
      } else {
        AppNavigator.navigatePop(context);
        showCustomToast(context, description: userModel.massageAr.toString());
      }
    } catch (e) {
      showCustomToast(
        context,
        description: e.toString(),
      );
    } finally {}
  }
}
