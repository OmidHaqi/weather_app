import 'package:clean_arcitechture_edu/features/feature_weather/presentation/bloc/cw_status.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(const LoadCwEvent('London'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.cwStatus is CwLoading) {
              return const Center(
                child: Text('Loading...'),
              );
            }
            if (state.cwStatus is CwCompleted) {
              return const Center(
                child: Text('Completed'),
              );
            }
            if (state.cwStatus is CwError) {
              return const Center(
                child: Text('Error'),
              );
            }
            return const Text('CleanArcitechtureEdu');
          },
        ),
      ),
    );
  }
}
