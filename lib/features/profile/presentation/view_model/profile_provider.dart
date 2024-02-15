 import 'package:engineering_day_app/core/utils/app_methods/app_methods.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider with ChangeNotifier
{
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