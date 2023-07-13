import 'package:flutter/material.dart';
import 'package:task/form/form_scree.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/gender_provider.dart';

import 'api/api_Screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: false,
      builder: (BuildContext context, Widget? child){
        return ChangeNotifierProvider(
          create: (context) => GenderProvider(),
          child: MaterialApp(
            title: 'Task',
            home: const FormScreen(),
          ),
        );
      },
    );
  }
}

