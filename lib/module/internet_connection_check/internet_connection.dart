import 'package:flutter/material.dart';
class InternetCheck extends StatefulWidget {
  const InternetCheck({Key? key}) : super(key: key);

  @override
  State<InternetCheck> createState() => _InternetCheckState();
}

class _InternetCheckState extends State<InternetCheck> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Internet')
    );
  }
}