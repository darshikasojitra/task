import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/audio_player/AudioPlayerPage.dart';

class DetailScreen extends StatelessWidget {
  final String? name;
  final String? instruction;
  final String? image;
  final String? category;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strAlcoholic;
  final String? glass;
  const DetailScreen(
      {Key? key,
      this.name,
      this.image,
      this.category,
      this.instruction,
      this.strIngredient1,
      this.strIngredient2,
      this.glass,
      this.strAlcoholic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name.toString()),
        backgroundColor: Color(0xff1C6BA4),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0, right: 0, top: 20.h),
              child: Container(
                height: 200.h,
                width: 350.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      (image).toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 0, right: 0, top: 20.h, bottom: 10.h),
              child: Text(
                'Instruction : ${instruction.toString()}',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
            ),
            Text(
              'Category : ${category}',
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Glass : ${glass}',
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Alcoholic : ${strAlcoholic}',
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Ingredient1 : ${strIngredient1}',
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Ingredient1 : ${strIngredient2}',
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 70.h),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AudioPlayerPage(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.w)),
                height: 50.h,
                minWidth: double.infinity,
                color: Color(0xff1C6BA4),
                child: Text(
                  'Listen Audio',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
