
import 'package:engineering_day_app/core/utils/app_methods/app_methods.dart';
 import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/register2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../views/widgets/register1.dart';
import '../views/widgets/register3.dart';


class RegisterProvider with ChangeNotifier {


  final PageController pageController = PageController();
  int currentPage = 0;

  List<Widget> pages = const [
     RegisterPartOne(),
      RegisterPartTwo(),
      RegisterPartThree(),

  ];

  changePage(page){
    currentPage = page;
    notifyListeners();
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

  late final formKey = GlobalKey<FormState>();

  Future<void> registerFct({required BuildContext context}) async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (pickedImage == null) {
      MyAppMethods.showErrorORWarningDialog(
          context: context,
          subtitle: "Make sure to pick up an image",
          fct: () {});
    }
    if (isValid) {}
  }


  String? selectedCity;
  changeSelectCity(val)
  {
    selectedCity = val;
    notifyListeners();
  }


  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

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








}