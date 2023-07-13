import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/api/detail_screen.dart';

import '../model/drinksdata.dart';

class APIScreen extends StatelessWidget {
  const APIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<DrinksData?> data() async {
      final uri =
          Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/search.php")
              .replace(queryParameters: {'s': 'orange'});
      var response = await http.get(
        uri,
      );
      if (response.statusCode == 200) {
        var drinks = DrinksData.fromJson(jsonDecode(response.body));
        return drinks;
      } else {}
    }

    Future<void> nextScreen(drink) async {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              instruction: drink?.strInstructions.toString(),
              name: drink?.strDrink,
              image: drink?.strDrinkThumb,
              strIngredient1: drink?.strIngredient1,
              strIngredient2: drink?.strIngredient2,
              strAlcoholic: drink?.strAlcoholic,
              category: drink?.strCategory,
              glass: drink?.strGlass,
            ),
          ));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('API'),
          backgroundColor: Color(0xff1C6BA4),
        ),
        body: Container(
          height: 600.h,
          child: StreamBuilder(
            stream: data().asStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.drinks?.length,
                  itemBuilder: (context, index) {
                    var drink = snapshot.data?.drinks?.elementAt(index);
                    return Padding(
                      padding:
                          EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
                      child: GestureDetector(
                        onTap: () => nextScreen(drink),
                        child: Container(
                          height: 120.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            //color: Colors.blue,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 120.h,
                                width: 95.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.r),
                                      topLeft: Radius.circular(10.r)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      (drink?.strDrinkThumb).toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Drinkid : ${(drink?.idDrink).toString()}'),
                                    Container(
                                      width: 200.w,
                                      child: Text(
                                          'Drink : ${(drink?.strDrink).toString()}'),
                                    ),
                                    Container(
                                      width: 200.w,
                                      child: Text(
                                          'DrinkCategory : ${drink?.strCategory}'),
                                    ),
                                    Text('Glass : ${drink?.strGlass}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
    );
  }
}
