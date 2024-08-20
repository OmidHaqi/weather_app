import 'package:clean_arcitechture_edu/core/widgets/my_app.dart';
import 'package:clean_arcitechture_edu/locator.dart';
import 'package:flutter/material.dart';


main() async {

  //!assert.dev
  //? source code?
  //* github.com/omidhaqi/weather_app
  //? Aks me About Flutter 

  WidgetsFlutterBinding.ensureInitialized();

  //* init DI
  await setUp();

  runApp(MyApp());
}
