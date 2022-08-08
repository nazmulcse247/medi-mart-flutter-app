import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../shared_preference/pref_auth.dart';
import '../internet_connection_check/internet_connection.dart';
import '../onboarding/onboarding_screen.dart';
import '../welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToHomeOrInternetCheck();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage(
            //     'assets/images/splash_bg.png'
            //   ),
            //   fit: BoxFit.fill
            // )
          ),
          child: Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 200,
              width: 200,
            ),
          ),
        )
    );
  }

  void _navigateToHomeOrInternetCheck() async {

   // bool result = await InternetConnectionChecker().hasConnection;
   // String? onBoard = await SharedPref.getOnboard();
    await Future.delayed(Duration(milliseconds: 4000),(){});

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingPage()));

    // if(result == true) {
    //
    //
    // }
    // else if(result == true) {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
    //
    // }
    // else if(result == false) {
    //   Navigator.pushReplacement(context, MaterialPageRoute(
    //       builder: (context) => InternetCheck()
    //   ));
    //
    // }

  }


}