import 'dart:developer';

import 'package:blurbox/blurbox.dart';
import 'package:clean_arcitechture_edu/core/widgets/app_background.dart';
import 'package:clean_arcitechture_edu/core/widgets/dot_loading_widget.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/data/model/forecast_days_model.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/presentation/bloc/cw_status.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/params/forecast_params.dart';

import '../../domain/entities/forecase_days_entity.dart';
import '../bloc/fw_status.dart';
import '../widgets/day_weather_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = 'Zanjan';
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(cityName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<HomeBloc, HomeState>(buildWhen: (previous, current) {
          if (previous.cwStatus == current.cwStatus) {
            return false;
          } else {
            return true;
          }
        }, builder: (context, state) {
          if (state.cwStatus is CwLoading) {
            return const Expanded(
              child: DotLoadingWidget(),
            );
          }
          if (state.cwStatus is CwCompleted) {
            //* cast
            final CwCompleted cwCompleted = state.cwStatus as CwCompleted;
            final CurrentCityEntity currentCityEntity =
                cwCompleted.currentCityEntity;

            //* create params for api call
            final ForecastParams forecastParams = ForecastParams(
                currentCityEntity.coord!.lat!, currentCityEntity.coord!.lon!);

            //* start load Fw event
            BlocProvider.of<HomeBloc>(context).add(
              LoadFwEvent(forecastParams),
            );

            return Expanded(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics()
                    .applyTo(const BouncingScrollPhysics()),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.2,
                      vertical: height * 0.04,
                    ),
                    child: BlurBox(
                      blur: 10,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              currentCityEntity.name!,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          AppBackground.setIconForMain(
                              currentCityEntity.weather![0].description!),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              currentCityEntity.weather![0].description!,
                            ),
                          ),
                          Text(
                            '${currentCityEntity.main!.temp!.round().toString()}\u00B0',
                            style: const TextStyle(
                              fontSize: 46,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        const Text('Max'),
                                        Text(
                                            '${currentCityEntity.main!.tempMax!.round().toString()}\u00B0'),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        width: 1,
                                        height: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        const Text('Min'),
                                        Text(
                                            '${currentCityEntity.main!.tempMin!.round().toString()}\u00B0'),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'feels like ${currentCityEntity.main!.feelsLike!.round().toString()}\u00B0',
                                    style: const TextStyle(fontSize: 22),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 140,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Center(
                        child: BlocBuilder<HomeBloc, HomeState>(
                          builder: (BuildContext context, state) {
                            /// show Loading State for Fw
                            if (state.fwStatus is FwLoading) {
                              return const DotLoadingWidget();
                            }
                  
                            /// show Completed State for Fw
                            if (state.fwStatus is FwCompleted) {
                              /// casting
                              final FwCompleted fwCompleted =
                                  state.fwStatus as FwCompleted;
                              final ForecastDaysEntity forecastDaysEntity =
                                  fwCompleted.forecastDaysEntity;
                              final List<DataList> mainDaily =
                                  forecastDaysEntity.list!;
                  
                              return ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics()
                                    .applyTo(const BouncingScrollPhysics()),
                                scrollDirection: Axis.horizontal,
                                itemCount: mainDaily.length,
                                itemBuilder: (
                                  BuildContext context,
                                  int index,
                                ) {
                                  return DaysWeatherView(
                                    daily: mainDaily[index],
                                  );
                                },
                              );
                            }
                  
                            /// show Error State for Fw
                            if (state.fwStatus is FwError) {
                              final FwError fwError =
                                  state.fwStatus as FwError;
                              return Center(
                                child: Text(fwError.message!),
                              );
                            }
                  
                            /// show Default State for Fw
                            return Container();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state.cwStatus is CwError) {
            return const Text('Error');
          }
          return const Text(
            'UnKnow Error',
          );
        })
      ],
    );
  }
}
