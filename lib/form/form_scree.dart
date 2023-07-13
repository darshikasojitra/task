import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/api/api_Screen.dart';
import 'package:task/common_widgets/common_textformfeild.dart';
import 'package:task/provider/gender_provider.dart';
import 'package:task/validator/validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genderProvider = Provider.of<GenderProvider>(context);
    final fromKey = GlobalKey<FormState>();
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController city = TextEditingController();
    TextEditingController state = TextEditingController();
    TextEditingController country = TextEditingController();
    Future<void> nextScreen() async {
      if (fromKey.currentState!.validate()) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => APIScreen(),
            ),
            (route) => false);
      }
    }

    return Scaffold(
      backgroundColor: Color(0xffE4E9F1),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 45.w, top: 70.h),
            child: Container(
              height: 60,
              width: 200,
              //color: Colors.blue,
              child: buildColumn(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, top: 150.h, right: 25.w),
            child: Container(
              height: 450.h,
              width: 400.w,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: fromKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        CommonTextFormFeild(
                            obscureText: false,
                            controller: name,
                            hintText: 'Enter Name',
                            validator: Validator.nameValidator),
                        SizedBox(
                          height: 10.h,
                        ),
                        CommonTextFormFeild(
                            obscureText: false,
                            controller: email,
                            hintText: 'Enter Email',
                            validator: Validator.emailValidator),
                        SizedBox(
                          height: 10.h,
                        ),
                        IntlPhoneField(
                          flagsButtonPadding: EdgeInsets.only(left: 10.w),
                          dropdownIconPosition: IconPosition.trailing,
                          decoration: InputDecoration(
                            hintText: 'Enter Phone number',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1C6BA4)),
                                borderRadius: BorderRadius.circular(35.r)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1C6BA4)),
                                borderRadius: BorderRadius.circular(35.r)),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1C6BA4)),
                                borderRadius: BorderRadius.circular(35.r)),
                          ),
                          initialCountryCode: 'IN',
                        ),
                        CommonTextFormFeild(
                            obscureText: false,
                            hintText: 'Enter City',
                            controller: city,
                            validator: Validator.cityValidator),
                        SizedBox(
                          height: 10.h,
                        ),
                        CommonTextFormFeild(
                            obscureText: false,
                            hintText: 'Enter State',
                            controller: state,
                            validator: Validator.stateValidator),
                        SizedBox(
                          height: 10.h,
                        ),
                        CommonTextFormFeild(
                            obscureText: false,
                            controller: country,
                            hintText: 'Enter Country',
                            validator: Validator.countryValidator),
                        Gender(genderProvider),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 620.h, left: 25.w, right: 25.w),
            child: MaterialButton(
              onPressed: () {
                if (fromKey.currentState!.validate()) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => APIScreen(),
                      ),
                          (route) => false);
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.w)),
              height: 50,
              minWidth: double.infinity,
              color: Color(0xff1C6BA4),
              child: Text(
                'Register',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome,',
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: Color(0xff1C6BA4),
          ),
        ),
        Text(
          'Create an Account',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black),
        )
      ],
    );
  }

  Row Gender(GenderProvider genderProvider) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            activeColor: Color(0xff1C6BA4),
            title: Text(
              "Male",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            value: "male",
            groupValue: genderProvider.gender,
            onChanged: (value) {
              genderProvider.changeGender(value!);
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            activeColor: Color(0xff1C6BA4),
            title: Text(
              "Female",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            value: "female",
            groupValue: genderProvider.gender,
            onChanged: (value) {
              genderProvider.changeGender(value!);
            },
          ),
        ),
      ],
    );
  }
}
