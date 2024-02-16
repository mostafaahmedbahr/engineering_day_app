import 'package:engineering_day_app/core/utils/app_methods/app_methods.dart';
import 'package:engineering_day_app/core/utils/new_toast/new_toast_2.dart';
import 'package:engineering_day_app/features/profile/data/models/get_profile_model.dart';
import 'package:engineering_day_app/features/profile/data/repos/profile_repos.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileProvider with ChangeNotifier {
  ProfileRepo? profileRepo;

  ProfileProvider(this.profileRepo);

  static ProfileProvider get(context, {listen = true}) =>
      Provider.of<ProfileProvider>(context, listen: listen);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  GetProfileModel getProfileModel = GetProfileModel();

  Future<void> getProfile(
      {required BuildContext context, bool listen = true}) async {
    _isLoading = true;
    if (listen == true) {
      notifyListeners();
    }
    var result = await profileRepo!.getProfile(
      context: context,
    );
    return result.fold((failure) {
      _isLoading = false;
      notifyListeners();
      NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
    }, (data) {
      getProfileModel = data;
      _isLoading = false;
      notifyListeners();
    });
  }

  XFile? pickedImage;

  Future<void> localImagePicker({required BuildContext context}) async {
    final ImagePicker picker = ImagePicker();
    await MyAppMethods.imagePickerDialog(
      context: context,
      cameraFCT: () async {
        pickedImage = await picker.pickImage(source: ImageSource.camera);
        notifyListeners();
      },
      galleryFCT: () async {
        pickedImage = await picker.pickImage(source: ImageSource.gallery);
        notifyListeners();
      },
      removeFCT: () {
        pickedImage = null;
        notifyListeners();
      },
    );
  }

  DateTime? selectedDate;

  Future<void> selectDateFunction(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      notifyListeners();
    }
  }

  var nameCon = TextEditingController();
  var cityCon = TextEditingController();
  var universityCon = TextEditingController();
  var specalizationCon = TextEditingController();
  var collegeCon = TextEditingController();
  var schoolLevelCon = TextEditingController();
  var oldPasswordCon = TextEditingController();
  var newPasswordCon = TextEditingController();
}
