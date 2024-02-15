import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/register_header.dart';
import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/register_part_one_body.dart';
import 'package:flutter/material.dart';

class RegisterPartOne extends StatelessWidget {
  const RegisterPartOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const RegisterHeader(),
          RegisterPartOneBody(),
        ],
      ),
    );
  }
}
