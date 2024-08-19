import 'package:clean_arcitechture_edu/core/utils/themes.dart';
import 'package:clean_arcitechture_edu/core/widgets/main_wrapper.dart';
import 'package:clean_arcitechture_edu/features/feature_bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:clean_arcitechture_edu/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => locator<HomeBloc>(),
          ),
          BlocProvider(
            create: (_) => locator<BookmarkBloc>(),
          ),
        ],
        child: MainWrapper(),
      ),
    );
  }
}
