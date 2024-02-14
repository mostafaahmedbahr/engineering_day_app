
import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/register_header.dart';
import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/register_part_three_body.dart';
import 'package:flutter/material.dart';


class RegisterPartThree extends StatelessWidget {
  const RegisterPartThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
         RegisterHeader(),
          RegisterPartThreeBody(),
        ],
      ),
    );
  }
}
