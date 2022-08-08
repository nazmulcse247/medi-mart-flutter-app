import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared_preference/pref_auth.dart';
import '../welcome/welcome_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  final controller = PageController();
  bool secondPage = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0),
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
                SharedPref.saveOnboard('checked');
              },
              child: Text(
                'Skip',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff090F47)),
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: PageView(
          controller: controller,
          onPageChanged: (index){
            setState(() {
              secondPage = index == 1;
            });
          },
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/onboarding_1.png',
                    height: 200,
                    width: 200,

                  ),


                  Image.asset(
                    'assets/images/buy_sell.png',
                    height: 170,
                    width: 170,

                  ),

                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Lorem ipsum dolor sit amet, consectetur \n',
                            style: TextStyle(color: Color(0xff090F47))),
                        TextSpan(
                            text: 'adipiscing elit. Tellus luctus id eu nulla \n'),
                        TextSpan(text: 'nulla accumsan sed fringilla.'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [

                  Image.asset(
                    'assets/images/onboarding_2_new.png',
                    height: 200,
                    width: 200,

                  ),

                  Image.asset(
                    'assets/images/onboarding_2_sub.png',
                    height: 170,
                    width: 170,

                  ),


                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Lorem ipsum dolor sit amet, consectetur \n',
                            style: TextStyle(color: Color(0xff090F47))),
                        TextSpan(
                            text: 'adipiscing elit. Tellus luctus id eu nulla \n'),
                        TextSpan(text: 'nulla accumsan sed fringilla.'),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            secondPage
                ? IconButton(
                onPressed: (){
                  controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);
                },
                icon: Text('Back',style: TextStyle(fontSize: 14),))
                : Text('      '),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 2,
              ),
            ),

            TextButton(
                onPressed: (){
                  if(secondPage){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
                    SharedPref.saveOnboard('checked');
                  }
                  else {
                    controller.nextPage(duration: Duration(milliseconds: 500),
                        curve: Curves.easeOut);
                  }

                },
                child: Text('Next')),


          ],
        ),
      ),
    );
  }
}