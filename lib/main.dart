import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/themes.dart';
import 'core/widgets/main_wrapper.dart';
import 'features/feature_bookmark/presentation/bloc/bookmark_bloc.dart';
import 'features/feature_weather/presentation/bloc/home_bloc.dart';
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
          ),
          BlocProvider(
            create: (_) => locator<BookmarkBloc>(),
          ),
        ],
        child: MainWrapper(),
      ),
    ),
  );
}
