import 'package:engineering_day_app/core/utils/new_toast/new_toast_2.dart';
import 'package:engineering_day_app/features/certificates_and_gifts/data/models/certificated_model.dart';
import 'package:engineering_day_app/features/certificates_and_gifts/data/repos/certificated_repo.dart';
  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CertificatedProvider with ChangeNotifier {
  CertificatedProvider(this.certificatedRepo);

  static CertificatedProvider get(context, {listen = true}) =>
      Provider.of<CertificatedProvider>(context, listen: listen);



  bool _isLoading = false;
  bool _isLoggedIn = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;

  bool get isLoggedIn => _isLoggedIn;

  String get errorMessage => _errorMessage;



  CertificatedRepo? certificatedRepo;

  CertificatedModel certificatedModel = CertificatedModel();

  Future<void> getCertificatedData(
      {required BuildContext context, bool listen = true}) async {
    _isLoading = true;
    if (listen == true) {
      notifyListeners();
    }
    var result = await certificatedRepo!.getCertificated(
      context: context,
    );
    return result.fold((failure) {
      _isLoading = false;
      notifyListeners();
      NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
    }, (data) {
      certificatedModel = data;
      _isLoading = false;
      notifyListeners();
    });
  }



}
