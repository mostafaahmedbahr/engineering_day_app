
import 'package:engineering_day_app/features/auth/login/presentation/views/widgets/login_header.dart';
import 'package:engineering_day_app/features/auth/login/presentation/views/widgets/login_view_body.dart';

import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginHeader(),
            LoginViewBody(),
          ],
        ),
      ),
    );
  }
}
