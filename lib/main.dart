import 'package:clean_arcitechture_edu/core/utils/themes.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/widgets/main_wrapper.dart';
import 'locator.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //* init DI
  await setUp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => locator<HomeBloc>(),
          )
        ],
        child:MainWrapper(),
      ),
    ),
  );
}
