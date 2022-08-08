import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:medi_mart/utils/app_color.dart';
import 'package:medi_mart/utils/toast.dart';
import 'package:path/path.dart' as path;

import '../login/login_screen.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({Key? key}) : super(key: key);

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {

  String? shopName;
  String? email;
  String? password;
  String? reEnterPassword;
  String? phoneNo;
  String? address1;
  String? address2;
  String? selectedCity;
  String? selectedDivision;
  String? postOffice;
  String? zipCode;
  String? ownersName;
  String? ownersPhone;
  String? selectedGender;

  File? nidFile;
  File? tradeLincenceFile;
  File? drugLincenceFile;
  File? tinLincenceFile;
  File? binLincenceFile;


  DateTime selectedDate = DateTime.now();
  String? tradeExpiredDate;
  String? drugExpiredDate;
  String? tinExpiredDate;
  String? binExpiredDate;

  bool showSpinner = false ;


  final List<String> city = [
    "Brahmanbaria","Bogra","Bandarban","Borguna","Barisal","Bagerhat","Bhola","Chandpur",
    "Chittagong", "Chuadanga", "Comilla", "Cox's Bazar", "Dhaka", "Dinajpur",
    "Faridpur", "Feni","Gaibandha","Gazipur","Gopalganj","Hobiganj","Jaipurhat",
    "Jamalpur","Jessore","Jhalakathi","Jhinaidah","Khagrachori","Khulna","Kishoreganj",
    "Kurigram","Kushtia","Lakshmipur","Lalmonirhat","Madaripur","Magura","Manikganj",
    "Meherpur","Moulvibazar","Munshiganj","Mymensingh","Naogaon","Narayangonj","Narshingdi",
    "Natore","Nawabgon","Netrokona","Nilphamari","Noakhali","Norail","Pabna","Panchagarh",
    "Rajshahi","Patukhali","Pirojpur","Rajbari","Rangamati","Rongpur","Satkhira","Shariyatpur",
    "Sherpur","Sirajgonj","Sunamganj","Sylhet","Tangail","Thakurgaon"
  ];

  final TextEditingController textEditingController = TextEditingController();

  final List<String> divisionList = [
    'Dhaka',
    'Barisal',
    'Chittagong',
    'Khulna',
    'Mymensingh',
    'Rajshahi',
    'Rangpur',
    'Sylhet',
  ];

  final List<String> genderList = [
    'Male',
    'Female',
  ];

  List<File> _image = [];


  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 120,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      'assets/images/retailer.png',
                      width: size.width,
                      fit: BoxFit.cover,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                          child: IconButton(
                            icon: Icon(Icons.keyboard_backspace_outlined,color: Colors.white,size: 30,),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Register as Supplier',
                            style: GoogleFonts.poppins(color: AppColors.white,textStyle: TextStyle(fontSize: 14)),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      top: 90,
                      left: size.width / 2,
                      child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'assets/images/profle.png',
                          )
                      ),
                    ),
                    Positioned(
                      left: size.width / 2 + 10,
                      top: 120,
                      bottom: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(2))
                        ),
                        child: IconButton(
                          icon: Icon(Icons.camera_alt,color: AppColors.inputFieldBg,size: 30,),
                          onPressed: (){
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shop Details',
                          style: GoogleFonts.poppins(color: AppColors.textColor,textStyle: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.inputFieldBg
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Shop Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 8),
                        ),

                        onChanged: (value){
                          shopName = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.inputFieldBg
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 8),
                        ),

                        onChanged: (value){
                          email = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.inputFieldBg
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 8),
                        ),
                        onChanged: (value){
                          password = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.inputFieldBg
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Re- Enter paaaword',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 8),
                        ),
                        onChanged: (value){
                          reEnterPassword = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.inputFieldBg
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Business Phone No',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 8),
                        ),
                        onChanged: (value){
                          phoneNo = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shop Location',
                          style: GoogleFonts.poppins(color: AppColors.textColor,textStyle: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.inputFieldBg
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Address Line 1',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 8),
                        ),
                        onChanged: (value){
                          address1 = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.inputFieldBg
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Address Line 2 (Optional)',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 8),
                        ),
                        onChanged: (value){
                          address2 = value;
                        },
                      ),
                    ),

                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: size.width / 2 -12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: AppColors.inputFieldBg
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Text(
                                ' Country',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: city
                                  .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                                  .toList(),
                              value: selectedCity,
                              onChanged: (value) {
                                setState(() {
                                  selectedCity = value as String;
                                });
                              },
                              buttonHeight: 40,
                              buttonWidth: 200,
                              itemHeight: 40,
                              dropdownMaxHeight: 400,
                              searchController: textEditingController,
                              searchInnerWidget: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 4,
                                  right: 8,
                                  left: 8,
                                ),
                                child: TextFormField(
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    hintText: 'Search city...',
                                    hintStyle: const TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              searchMatchFn: (item, searchValue) {
                                return (item.value.toString().contains(searchValue));
                              },
                              //This to clear the search value when you close the menu
                              onMenuStateChange: (isOpen) {
                                if (!isOpen) {
                                  textEditingController.clear();
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 50,
                          width: size.width / 2 -12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: AppColors.inputFieldBg
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(
                                ' Division',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme
                                      .of(context)
                                      .hintColor,
                                ),
                              ),
                              items: divisionList
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                                  .toList(),
                              value: selectedDivision,
                              onChanged: (value) {
                                setState(() {
                                  selectedDivision = value as String;
                                });
                              },
                              buttonHeight: 40,
                              buttonWidth: 140,
                              itemHeight: 40,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: size.width / 2 - 12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: AppColors.inputFieldBg
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Post Office',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 8),
                            ),
                            onChanged: (value){
                              postOffice = value;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 50,
                          width: size.width / 2 - 12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: AppColors.inputFieldBg
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Zip Code',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 8),
                            ),
                            onChanged: (value){
                              zipCode = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Owner’s Details',
                          style: GoogleFonts.poppins(color: AppColors.textColor,textStyle: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.inputFieldBg
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Owner’s Full Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 8),
                        ),
                        onChanged: (value){
                          ownersName = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.inputFieldBg
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Owner’s phone no',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 8),
                        ),
                        onChanged: (value){
                          ownersPhone = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: size.width / 2 -12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: AppColors.inputFieldBg
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(
                                ' Gender',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme
                                      .of(context)
                                      .hintColor,
                                ),
                              ),
                              items: genderList
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                                  .toList(),
                              value: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value as String;
                                });
                              },
                              buttonHeight: 40,
                              buttonWidth: 140,
                              itemHeight: 40,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            height: 50,
                            width: size.width / 2 - 12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color: AppColors.inputFieldBg
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex:1,
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: nidFile == null
                                          ? Text('Nid')
                                          : Text(
                                        nidFile!.path,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(

                                        ),
                                      )

                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    builChooseOption('nid');
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        color: AppColors.buttonBorder
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Choose',
                                        style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Docomentation',
                          style: GoogleFonts.poppins(color: AppColors.textColor,textStyle: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.inputFieldBg
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex:1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: tradeLincenceFile == null
                                    ? Text('Trade Licence')
                                    :Text(tradeLincenceFile!.path.toString(),overflow: TextOverflow.ellipsis,),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                builChooseOption('trade');
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: AppColors.buttonBorder
                                ),
                                child: Center(
                                  child: Text(
                                    'Choose',
                                    style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.inputFieldBg
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: tradeExpiredDate == null
                                    ? Text('Date of expire')
                                    : Text(tradeExpiredDate!)
                            ),
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: AppColors.buttonBorder
                              ),
                              child: Center(
                                  child: IconButton(
                                    icon: Icon(Icons.calendar_month,color: Colors.white,),
                                    onPressed: () async{
                                      final DateTime? picked = await showDatePicker(
                                          context: context,
                                          initialDate: selectedDate,
                                          firstDate: DateTime(2015, 8),
                                          lastDate: DateTime(2101));

                                      if (picked != null && picked != selectedDate) {
                                        setState(() {
                                          selectedDate = picked;
                                          tradeExpiredDate = DateFormat('dd-MM-yyyy').format(selectedDate);
                                          print(tradeExpiredDate);
                                        });
                                      }
                                    },
                                  )
                              ),
                            )
                          ],
                        )
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.inputFieldBg
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                  padding:  EdgeInsets.only(left: 6.0),
                                  child: drugLincenceFile == null
                                      ? Text('Drug Licence')
                                      : Text(drugLincenceFile!.path,overflow: TextOverflow.ellipsis,)
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                builChooseOption('drug');
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: AppColors.buttonBorder
                                ),
                                child: Center(
                                  child: Text(
                                    'Choose',
                                    style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.inputFieldBg
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: drugExpiredDate == null
                                    ? Text('Date of expire')
                                    : Text(drugExpiredDate!)
                            ),
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: AppColors.buttonBorder
                              ),
                              child: Center(
                                  child: IconButton(
                                    icon: Icon(Icons.calendar_month,color: Colors.white,),
                                    onPressed: () async{
                                      final DateTime? picked = await showDatePicker(
                                          context: context,
                                          initialDate: selectedDate,
                                          firstDate: DateTime(2015, 8),
                                          lastDate: DateTime(2101));

                                      if (picked != null && picked != selectedDate) {
                                        setState(() {
                                          selectedDate = picked;
                                          drugExpiredDate = DateFormat('dd-MM-yyyy').format(selectedDate);
                                          print(drugExpiredDate);
                                        });
                                      }
                                    },
                                  )
                              ),
                            )
                          ],
                        )
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.inputFieldBg
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: tinLincenceFile == null
                                      ? Text('TIN Certificate')
                                      : Text(tinLincenceFile!.path,overflow: TextOverflow.ellipsis,)
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                builChooseOption('tin');
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: AppColors.buttonBorder
                                ),
                                child: Center(
                                  child: Text(
                                    'Choose',
                                    style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.inputFieldBg
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: tinExpiredDate == null
                                    ? Text('Date of expire')
                                    : Text(tinExpiredDate!)
                            ),
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: AppColors.buttonBorder
                              ),
                              child: Center(
                                  child: IconButton(
                                    icon: Icon(Icons.calendar_month,color: Colors.white,),
                                    onPressed: ()async{
                                      final DateTime? picked = await showDatePicker(
                                          context: context,
                                          initialDate: selectedDate,
                                          firstDate: DateTime(2015, 8),
                                          lastDate: DateTime(2101));

                                      if (picked != null && picked != selectedDate) {
                                        setState(() {
                                          selectedDate = picked;
                                          tinExpiredDate = DateFormat('dd-MM-yyyy').format(selectedDate);

                                        });
                                      }
                                    },
                                  )
                              ),
                            )
                          ],
                        )
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.inputFieldBg
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex:1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Text('BIN Certificate (Optional)',overflow: TextOverflow.ellipsis,),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                builChooseOption('bin');
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: AppColors.buttonBorder
                                ),
                                child: Center(
                                  child: Text(
                                    'Choose',
                                    style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.inputFieldBg
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: binExpiredDate == null
                                    ? Text('Date of expire')
                                    : Text(binExpiredDate!)
                            ),
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: AppColors.buttonBorder
                              ),
                              child: Center(
                                  child: IconButton(
                                    icon: Icon(Icons.calendar_month,color: Colors.white,),
                                    onPressed: ()async{
                                      final DateTime? picked = await showDatePicker(
                                          context: context,
                                          initialDate: selectedDate,
                                          firstDate: DateTime(2015, 8),
                                          lastDate: DateTime(2101));

                                      if (picked != null && picked != selectedDate) {
                                        setState(() {
                                          selectedDate = picked;
                                          binExpiredDate = DateFormat('dd-MM-yyyy').format(selectedDate);

                                        });
                                      }
                                    },
                                  )
                              ),
                            )
                          ],
                        )
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: (){
                        if(validRetailerForm()){
                          AppToast.showToast(context, 'Retailer Registration Success');
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

                        }
                      },
                      child: Container(
                        height: 50,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.buttonBorder,

                        ),

                        child: Center(
                          child: Text(
                            'Submit',
                            style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16,color: AppColors.white)),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ],
          )
      ),
    );
  }

  void builChooseOption(String fileType) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Please Choose an option'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: (){
                pickFromCamera(fileType);

              },
              child: Row(
                children: [
                  Icon(
                      Icons.camera_alt,
                      color: AppColors.buttonBorder
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Camera')
                ],
              ),
            ),
            InkWell(
              onTap: (){
                pickFromGallery(fileType);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  children: [
                    Icon(
                        Icons.image,
                        color: AppColors.buttonBorder
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Gallery')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pickFromCamera(String fileType) async{
    XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    cropFile(pickedImage!.path,fileType);
    Navigator.of(context).pop();
  }
  void pickFromGallery(String fileType) async{
    XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    cropFile(pickedImage!.path,fileType);
    Navigator.of(context).pop();
  }

  void cropFile(filePath,String fileType) async{
    CroppedFile? croppedImage = await ImageCropper()
        .cropImage(sourcePath: filePath,maxHeight: 1080,maxWidth: 1080);

    if(croppedImage != null){
      setState(() {
        if(fileType == 'nid'){
          nidFile = File(croppedImage.path);
        }
        else if(fileType == 'trade'){
          tradeLincenceFile = File(croppedImage.path);
        }
        else if(fileType == 'drug'){
          drugLincenceFile = File(croppedImage.path);
        }

        else if(fileType == 'tin'){
          tradeLincenceFile = File(croppedImage.path);
        }

        else if(fileType == 'bin'){
          binLincenceFile = File(croppedImage.path);
        }
      });
    }
  }

  bool validRetailerForm(){
    if(shopName == null){
      AppToast.showToast(context, 'Enter Shop Name');
      return false;
    }
    else if(email == null){
      AppToast.showToast(context, 'Enter Email');
      return false;
    }
    else if(password == null){
      AppToast.showToast(context, 'Enter password');
      return false;
    }

    else if(reEnterPassword == null){
      AppToast.showToast(context, 'Enter ReEnterPassword');
      return false;
    }

    else if(phoneNo == null){
      AppToast.showToast(context, 'Enter phoneNo');
      return false;
    }

    else if(address1 == null){
      AppToast.showToast(context, 'Enter address1');
      return false;
    }

    else if(address2 == null){
      AppToast.showToast(context, 'Enter address2');
      return false;
    }

    else if(selectedCity == null){
      AppToast.showToast(context, 'Enter city');
      return false;
    }

    else if(selectedDivision == null){
      AppToast.showToast(context, 'Enter Division');
      return false;
    }

    else if(postOffice == null){
      AppToast.showToast(context, 'Enter PostOffice');
      return false;
    }
    else if(zipCode == null){
      AppToast.showToast(context, 'Enter zipCode');
      return false;
    }

    else if(ownersName == null){
      AppToast.showToast(context, 'Enter OwnersName');
      return false;
    }


    else if(ownersPhone == null){
      AppToast.showToast(context, 'Enter OwnersPhone');
      return false;
    }


    else if(selectedGender == null){
      AppToast.showToast(context, 'Select Genter');
      return false;
    }


    else if(nidFile == null){
      AppToast.showToast(context, 'Upload Nid');
      return false;
    }

    else if(tradeLincenceFile == null){
      AppToast.showToast(context, 'Upload TradeLicence');
      return false;
    }

    else if(tradeExpiredDate == null){
      AppToast.showToast(context, 'Enter Trade Licence Expire Date');
      return false;
    }

    else if(drugLincenceFile == null){
      AppToast.showToast(context, 'Upload Drug Licence');
      return false;
    }

    else if(drugExpiredDate == null){
      AppToast.showToast(context, 'Enter Drug Licence Expire Date');
      return false;
    }

    else if(tinLincenceFile == null){
      AppToast.showToast(context, 'Upload Tin Licence');
      return false;
    }

    else if(tinExpiredDate == null){
      AppToast.showToast(context, 'Enter Tin Licence Expire Date');
      return false;
    }

    return true;
  }

  Future<void> uploadImage ()async{

    setState(() {
      showSpinner = true ;
    });

    _image.add(nidFile!);
    _image.add(tinLincenceFile!);
    _image.add(drugLincenceFile!);
    _image.add(binLincenceFile!);

    var uri = Uri.parse("https://medimart.bigintbd.com/api/v1/registration");
    http.MultipartRequest request = new http.MultipartRequest('POST', uri);
    request.fields['shop_name'] = shopName!;
    //multipartFile = new http.MultipartFile("imagefile", stream, length, filename: basename(imageFile.path));
    List<MultipartFile> newList = <MultipartFile>[];
    for (int i = 0; i < _image.length; i++) {
      File imageFile = File(_image[i].toString());
      var stream =
      new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();
      var multipartFile = new http.MultipartFile("imagefile", stream, length,
          filename: path.basename(imageFile.path));
      newList.add(multipartFile);
    }
    request.files.addAll(newList);
    var response = await request.send();
    if (response.statusCode == 200) {
      print("Image Uploaded");
      setState(() {
        showSpinner = true ;
      });
    } else {
      print("Upload Failed");
      setState(() {
        showSpinner = true ;
      });
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }


}

