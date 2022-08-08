import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medi_mart/module/login/login_screen.dart';
import 'package:medi_mart/module/retailer/retailer.dart';
import 'package:medi_mart/module/supplier/supplier_screen.dart';
import 'package:medi_mart/utils/app_color.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace_outlined,color: Colors.black,size: 30,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/welcome.png',
                  height: 200,
                  width: 200,
                ),


              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome To MediMart',
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.welColeTextColor
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Text(
              'Do you want to bye or sell \n'
                  'medicine with MediMart?',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor
              ),
            ),

            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: AppColors.buttonBorder)

                ),

                child: Center(
                  child: Text(
                      'Login',
                    style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16,color: AppColors.buttonBorder)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RetailerPage()));
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.buttonBorder,

                ),

                child: Center(
                  child: Text(
                    'Sign up as retailer',
                    style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16,color: AppColors.white)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SupplierPage()));

              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.buttonBorder,

                ),

                child: Center(
                  child: Text(
                    'Sign up as SUPPLIER',
                    style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16,color: AppColors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}