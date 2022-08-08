import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class AppToast{
  
  static void showToast(BuildContext context , String title){
    MotionToast(
      icon: Icons.zoom_out,
      primaryColor: Colors.red,
      title:  Text("Data Missing"),
      description:  Text(title),
      position: MotionToastPosition.top,
      animationType: AnimationType.fromTop,
    ).show(context);
  }
}