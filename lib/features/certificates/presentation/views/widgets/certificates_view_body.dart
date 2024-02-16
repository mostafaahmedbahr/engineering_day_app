import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_loading.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/features/certificates_and_gifts/presentation/view_model/certificated_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'certificates_view_body_item.dart';

class CertificatesViewBody extends StatefulWidget {
  const CertificatesViewBody({super.key});

  @override
  State<CertificatesViewBody> createState() => _CertificatesViewBodyState();
}

class _CertificatesViewBodyState extends State<CertificatesViewBody> {
  @override
  void initState() {
    CertificatedProvider.get(context, listen: false)
        .getCertificatedData(context: context, listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CertificatedProvider>(
        builder: (context, certificatedProvider, child){
          return ConditionalBuilder(
            condition: certificatedProvider.isLoading != true && certificatedProvider.certificatedModel.userCetificates != null,
            fallback: (context){
              return CustomLoading();
            },
          builder: (context){
              return  Padding(
                padding: const EdgeInsets.all(17.0),
                child: ListView.separated(
                  itemBuilder:  (context , index ){
                    return   CertificatesViewBodyItem(
                      name: certificatedProvider.certificatedModel.userCetificates![index].eventTitle.toString(),
                      url: certificatedProvider.certificatedModel.userCetificates![index].url.toString(),

                    );
                  },
                  separatorBuilder: (context , index ){
                    return const CustomSizedBox(height: 20,);
                  },
                  itemCount: certificatedProvider.certificatedModel.userCetificates!.length,
                ),
              ) ;
          },
          );
        }

    );
  }
}
