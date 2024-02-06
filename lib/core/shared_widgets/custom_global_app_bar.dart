// import 'package:add_samy_app_1/core/utils/app_styles/app_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../utils/app_images/app_images.dart';
//
// class CustomGlobalAppBar extends StatelessWidget implements PreferredSizeWidget{
//   const CustomGlobalAppBar({super.key, required this.title});
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//         preferredSize: const Size.fromHeight(100),
//         child: AppBar(
//           backgroundColor: Colors.transparent,
//           centerTitle: true,
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFF0D4B74),
//                   Color(0xFF075E89),
//                 ],
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//               ),
//             ),
//           ),
//           elevation: 0,
//           leading: Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: IconButton(
//               icon: SvgPicture.asset(AppImages.arrow2Icon),
//               onPressed: (){
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//           title:   Padding(
//             padding:  const EdgeInsets.only(top: 20),
//             child: Text(title,
//             style: AppStyles.textStyle18,),
//           ),
//
//         ));
//   }
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => const Size.fromHeight(100);
// }
