import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_navigatiion/navigator.dart';
import 'package:engineering_day_app/features/certificates_and_gifts/presentation/view_model/certificated_provider.dart';
import 'package:engineering_day_app/features/charts/presentation/views/charts_view.dart';
import 'package:engineering_day_app/features/job_fair/presentation/view_model/get_recruitment_cv_provider.dart';
import 'package:engineering_day_app/features/layout/presentation/views/widgets/bottom_nav_bar_item.dart';
import 'package:engineering_day_app/features/profile/presentation/view_model/profile_provider.dart';
import 'package:engineering_day_app/features/tickets/presentation/view_model/ticket_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../view_model/layout_provider.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  void initState() {
    ProfileProvider.get(context, listen: false)
        .getProfile(context: context, listen: false);

    CertificatedProvider.get(context, listen: false)
        .getCertificatedData(context: context, listen: false);
    TicketProvider.get(context, listen: false)
        .getTicket(context: context, isLoad: false);

    RecruitmentCVProvider prov =
        RecruitmentCVProvider.get(context, listen: false);

    prov.getRecruitmentCV(context: context, listen: false).then((value) {
      setState(() {});
      prov.linkedInCon =
          TextEditingController(text: prov.recruitmentCv?.linkedin ?? '');
      prov.cvLinkCon =
          TextEditingController(text: prov.recruitmentCv?.cvLink ?? '');
      prov.pdfLink = (prov.recruitmentCv?.cv?.isEmpty ?? true)
          ? null
          : prov.recruitmentCv?.cv;

      print("prov.pdfLinkprov.pdfLink ${prov.recruitmentCv?.cv}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<LayoutProvider>(context);
    return Consumer<LayoutProvider>(builder: (context, layoutProvider, child) {
      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              PageView(
                controller: layoutProvider.controller,
                physics: const NeverScrollableScrollPhysics(),
                children: layoutProvider.pages,
              ),
              Positioned(
                  // top: 0,
                  bottom: 20,
                  left: 10,
                  child: RawMaterialButton(
                    onPressed: () {
                      AppNavigator.navigateTo(context, const ChartsView());
                    },
                    elevation: 2.0,
                    fillColor: AppColors.mainColor3,
                    padding: const EdgeInsets.all(15.0),

                    shape: const CircleBorder(),
                    constraints:
                        const BoxConstraints(minWidth: 60.0, minHeight: 25.0),
                    child: SvgPicture.asset(
                      AppImages.chart,

                      color: AppColors.whiteColor,
                    ),
                  ))
            ],
          ),
          bottomNavigationBar: const BottomNavBarItems(),
        ),
      );
    });
  }
}
