import 'package:flutter/material.dart';

showCustomDialog(context, {required child,bool isDismissible=true}){
  return showDialog(barrierDismissible:isDismissible ,context: context, builder: (context) =>child ,);
}
showLoaderDialog(context){
  return   showCustomDialog(
      isDismissible: false,
      context, child: const Center(
    child: Stack(
      children: [
        CircularProgressIndicator(),
      ],
    ),
  )) ;
}