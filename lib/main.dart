import 'package:device_preview/device_preview.dart';
import 'package:extensionapp/views/Importwallet.dart/import.dart';
import 'package:extensionapp/views/Register/Register.dart';

import 'package:extensionapp/Utils/AppTheme.dart';
import 'package:extensionapp/views/swap/swap.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Controller/themeMode.dart';
import 'views/home/home.dart';

void main() {
  //initalize();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
        //   GetBuilder<themedata>(builder: (child) {
        //  return

        GetMaterialApp(
            //   initialRoute: '/',
            // theme: AppThemedata.light,
            //   getPages: [

            // //routes();
            //   ],
            themeMode: ThemeMode.light,
            // darkTheme: AppThemedata.dark,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(

              bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.black54),
              fontFamily: 'Poppins',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
              useMaterial3: true,
            ),
            home: const Register());
    //  }
    // );
  }
}
