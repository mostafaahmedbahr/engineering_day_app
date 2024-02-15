import 'package:engineering_day_app/core/shared_widgets/loading_dialog.dart';
import 'package:engineering_day_app/core/utils/app_methods/app_methods.dart';
import 'package:engineering_day_app/core/utils/new_toast/new_toast_2.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/models/register1.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/repos/register_repos.dart';
import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/register2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../views/widgets/register1.dart';
import '../views/widgets/register3.dart';

class RegisterProvider with ChangeNotifier {
  RegisterProvider(this.registerRepo);
  RegisterRepo? registerRepo;

  final PageController pageController = PageController();
  int currentPage = 0;

  List<Widget> pages = const [
    RegisterPartOne(),
    RegisterPartTwo(),
    RegisterPartThree(),
  ];

  changePage(page) {
    currentPage = page;
    notifyListeners();
  }


  XFile? pickedImage;
  final formKey = GlobalKey<FormState>();
  bool isMan = true;

  TextEditingController emailCtl = TextEditingController();
  TextEditingController passwordCtl = TextEditingController();
  TextEditingController userNameCtl = TextEditingController();
  TextEditingController userNameCertCtl = TextEditingController();
  TextEditingController nationalCrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

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


  Register1Model register1model=Register1Model();
  Future<void> register1({
    required BuildContext context,
  }) async {
    print("asas");
    notifyListeners();
    if (formKey.currentState?.validate() ?? false) {
      if (pickedImage == null) {
        NewToast.showNewErrorToast(
            msg: "الصوره الشخصيه مطلوبه", context: context);
      } else {
         showLoaderDialog(context);
        // ignore: use_build_context_synchronously
        var result = await registerRepo!.register1(
            email: emailCtl.text,
            password: passwordCtl.text,
            userName: userNameCtl.text,
            gender: isMan ? "male" : "female",
            userNameCert: userNameCertCtl.text,
            national: nationalCrl.text,
            phone: phoneCtrl.text,
            file: pickedImage!,
            context: context);

        return result.fold((failure) {
          Navigator.pop(context);
          notifyListeners();
          NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
        }, (data) {
          register1model=data;
          Navigator.pop(context);
          changePage(currentPage = 1);
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
          notifyListeners();
        });
      }
    }
  }

  String? selectedCity;

  changeSelectCity(val) {
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
