import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medi_mart/module/supplier/supplier_screen.dart';

import '../../utils/app_color.dart';
import '../retailer/retailer.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool passwordobscureText = true;
  int retailerOrSupplier = 1;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace_rounded,color: Colors.black,),
          onPressed: (){},
        ),
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  width: 200,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      retailerOrSupplier = 1;

                    });
                  },
                  child: Container(
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                      color: retailerOrSupplier == 1 ? AppColors.buttonBorder : AppColors.inputFieldBg,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Center(
                      child: Text(
                        'Retailer',
                        style: GoogleFonts.poppins(textStyle: TextStyle(
                          fontSize: 16,
                          color: retailerOrSupplier == 1 ? Colors.white : AppColors.textColor,
                        )),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      retailerOrSupplier = 2;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                        color:  retailerOrSupplier == 2 ? AppColors.buttonBorder : AppColors.inputFieldBg ,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Center(
                      child: Text(
                        'Supplier',
                        style: GoogleFonts.poppins(textStyle: TextStyle(
                          fontSize: 16,
                          color: retailerOrSupplier == 2 ? Colors.white : AppColors.textColor,
                        )),
                      ),
                    ),
                  ),
                )

              ],
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email/Phone',

                  border: UnderlineInputBorder(
                  )
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: passwordobscureText,
                decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordobscureText = !passwordobscureText;
                        });
                      },
                      icon: Icon(
                        passwordobscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 18,
                      ),
                    ),
                    border: UnderlineInputBorder(
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: passwordobscureText,
                decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordobscureText = !passwordobscureText;
                        });
                      },
                      icon: Icon(
                        passwordobscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 18,
                      ),
                    ),
                    border: UnderlineInputBorder(
                    )
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password ?',
                  style: GoogleFonts.poppins(textStyle: TextStyle(
                    fontSize: 14,
                    color: AppColors.buttonBorder,
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) => RetailerPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.buttonBorder,

                  ),

                  child: Center(
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16,color: AppColors.white)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t Have an account ? ',
                  style: GoogleFonts.poppins(textStyle: TextStyle(
                    fontSize: 14,
                    color: AppColors.textColor,
                  )),
                ),
                InkWell(
                  onTap: (){
                    if(retailerOrSupplier == 1){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RetailerPage()));
                    }
                    else if(retailerOrSupplier == 2){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SupplierPage()));
                    }
                  },
                  child: Text(
                    'Sing up',
                    style: GoogleFonts.poppins(textStyle: TextStyle(
                      fontSize: 14,
                      color: AppColors.buttonBorder,
                    )),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Or ',
                  style: GoogleFonts.poppins(textStyle: TextStyle(
                    fontSize: 14,
                    color: AppColors.textColor,
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            retailerOrSupplier == 1
                ? InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RetailerPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: size.width,
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
            )
                : InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SupplierPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.buttonBorder,

                  ),
                  child: Center(
                    child: Text(
                      'Sign up as supplier',
                      style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16,color: AppColors.white)),
                    ),
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


