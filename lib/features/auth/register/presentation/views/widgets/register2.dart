
import 'package:engineering_day_app/features/auth/register/presentation/view_model/register_provider.dart';
 import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/register_header.dart';
import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/register_part_two_body.dart';
import 'package:flutter/material.dart';
 import 'package:provider/provider.dart';


class RegisterPartTwo extends StatelessWidget {
  const RegisterPartTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context, registerProvider, child) {
      return const SingleChildScrollView(
        child: Column(
          children: [
             RegisterHeader(),
            RegisterPartTwoBody(),
          ],
        ),
      );
    });
  }
}
