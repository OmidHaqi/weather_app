import 'package:clean_arcitechture_edu/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/widgets/main_wrapper.dart';
import 'locator.dart';

main() async {
  
  //* init DI
  await setUp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => locator<HomeBloc>(),
          )
        ],
        child: const MainWrapper(),
      ),
    ),
  );
}
