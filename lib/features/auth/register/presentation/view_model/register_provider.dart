import 'package:engineering_day_app/core/shared_widgets/loading_dialog.dart';
import 'package:engineering_day_app/core/utils/app_methods/app_methods.dart';
import 'package:engineering_day_app/core/utils/new_toast/new_toast_2.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/models/register1.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/models/user_type_model.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/repos/register_repos.dart';
import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/register2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

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

  Register1Model register1model = Register1Model();
  var uuid = Uuid();

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
        String sessionid = uuid.v1();
        print("sessionidsessionid ${sessionid}");
        var result = await registerRepo!.register1(
            email: emailCtl.text,
            password: passwordCtl.text,
            userName: userNameCtl.text,
            gender: isMan ? "male" : "female",
            userNameCert: userNameCertCtl.text,
            national: nationalCrl.text,
            phone: phoneCtrl.text,
            file: pickedImage!,
            header: {'Cookie': 'sessionid="aasaasasasasasasasasas"'},
            context: context);
        return result.fold((failure) {
          Navigator.pop(context);
          notifyListeners();
          NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
        }, (data) {
          print("datadatadata ${data.toJson()}");
          if(data.sessionid==null){
            Navigator.pop(context);
            register1(context: context);
          }else{

            register1model = data;
            Navigator.pop(context);
            changePage(currentPage = 1);
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }


          notifyListeners();
        });
      }
    }
  }

  UserTypeModel? userType;

  Future<void> register2({
    required BuildContext context,
  }) async {
    notifyListeners();
    if (userType == null) {
      NewToast.showNewErrorToast(msg: "يرجي اختيار الفئة", context: context);
    } else {
      print("register1model.sessionid ${register1model.sessionid}");
      showLoaderDialog(context);
      print({'Cookie': 'sessionid=${register1model.sessionid}   zxsdsdsdsd'});
      print({'Cookie': 'sessionid=${register1model.sessionid}   zxsdsdsdsd ${userType?.value}' });
      var result = await registerRepo!.register2(
          header: {'Cookie': 'sessionid=${register1model.sessionid}'},
          userType: userType!.value.toString());

      return result.fold((failure) {
        print(failure.errMessage);
        Navigator.pop(context);
        notifyListeners();
        NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
      }, (data) {
        Navigator.pop(context);
        changePage(currentPage = 2);
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        notifyListeners();
      }

      );
    }
  }

  String? selectedCity;

  changeSelectCity(val) {
    selectedCity = val;
    notifyListeners();
  }

//   final List<String> items = [
// UserTypeEnum.values
//   ];

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
