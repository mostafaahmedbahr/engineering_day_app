import 'package:engineering_day_app/core/shared_widgets/loading_dialog.dart';
import 'package:engineering_day_app/core/utils/new_toast/new_toast_2.dart';
import 'package:engineering_day_app/features/job_fair/data/models/get_recruitment_cv_model.dart';
import 'package:engineering_day_app/features/job_fair/data/repos/recruitment_repos.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RecruitmentCVProvider with ChangeNotifier {
  RecruitmentCVProvider(this.recruitmentCVRepo);

  RecruitmentCVRepo? recruitmentCVRepo;

  static RecruitmentCVProvider get(context, {listen = true}) =>
      Provider.of<RecruitmentCVProvider>(context, listen: listen);

  bool _isLoading = false;
  final bool _isLoggedIn = false;
  final String _errorMessage = '';

  bool get isLoading => _isLoading;

  bool get isLoggedIn => _isLoggedIn;

  String get errorMessage => _errorMessage;

  GetRecruitmentCvModel? recruitmentCv;
  bool showAddCv = false;

  XFile? filePdf;

  Future uploadPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ["pdf"],
      type: FileType.custom,
    );

    if(result!=null){
      filePdf =
          XFile(result.files.single.path ?? "", name: result.files.single.name);
      debugPrint("---------- upload is done ------------");
      notifyListeners();

    }

  }

  Future<void> getRecruitmentCV(
      {required BuildContext context, bool listen = true}) async {
    _isLoading = true;
    if (listen == true) {
      notifyListeners();
    }
    var result = await recruitmentCVRepo!.getGetRecruitmentCv(
      context: context,
    );
    return result.fold((failure) {
      _isLoading = false;
      notifyListeners();
      NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
    }, (data) {
      showAddCv = false;

      recruitmentCv = data;
      _isLoading = false;
      notifyListeners();
    });
  }

  final formKey = GlobalKey<FormState>();
  var cvLinkCon = TextEditingController();
  var linkedInCon = TextEditingController();
  String? pdfLink;

  Future<void> updateRecruitmentCv(
      {required BuildContext context, bool listen = true}) async {
    // _isLoading = true;
    if (formKey.currentState?.validate() ?? false) {
      showLoaderDialog(context);
      if (listen == true) {
        notifyListeners();
      }
      var result = await recruitmentCVRepo!.updateRecruitmentCv(
        context: context,
        linkedInLink: linkedInCon.text,
        cvLink: cvLinkCon.text,
        pdfFile: filePdf,
      );
      return result.fold((failure) {
        Navigator.pop(context);
        _isLoading = false;
        notifyListeners();
        NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
      }, (data) {
        Navigator.pop(context);
        _isLoading = false;
        filePdf = null;
        pdfLink = null;
        getRecruitmentCV(context: context);
        NewToast.showNewSuccessToast(msg: "تم التحديث بنجاح", context: context);
        notifyListeners();
      });
    }
  }

  Future<void> addRecruitmentCv(
      {required BuildContext context, bool listen = true}) async {
    // _isLoading = true;
    if ((filePdf == null||(filePdf?.path.isEmpty??true)) &&
        (((recruitmentCv?.cv == null &&
                    recruitmentCv?.linkedin == null &&
                    recruitmentCv?.cvLink == null) ||
                ((recruitmentCv?.cv?.isEmpty ?? true) &&
                    (recruitmentCv?.linkedin?.isEmpty ?? true) &&
                    (recruitmentCv?.cvLink?.isEmpty ?? true))) ==
            true)) {
      NewToast.showNewErrorToast(
          msg: "يجب اضافة السيره الذاتيه", context: context);
    } else if (formKey.currentState?.validate() ?? false) {
      showLoaderDialog(context);
      if (listen == true) {
        notifyListeners();
      }
      var result = await recruitmentCVRepo!.addRecruitmentCv(
        context: context,
        linkedInLink: linkedInCon.text,
        cvLink: cvLinkCon.text,
        pdfFile: filePdf,
      );
      return result.fold((failure) {
        Navigator.pop(context);
        _isLoading = false;
        notifyListeners();
        NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
      }, (data) {
        Navigator.pop(context);
        _isLoading = false;

        getRecruitmentCV(context: context);
        NewToast.showNewSuccessToast(msg: "تم التحديث بنجاح", context: context);
        notifyListeners();
      });
    }
  }
}
