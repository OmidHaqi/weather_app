import 'package:blurbox/blurbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/params/forecast_params.dart';
import '../../../../core/widgets/app_background.dart';
import '../../../../core/widgets/dot_loading_widget.dart';
import '../../../../locator.dart';
import '../../data/model/forecast_days_model.dart';
import '../../domain/entities/current_city_entity.dart';
import '../../domain/entities/forecase_days_entity.dart';
import '../../domain/use_cases/get_suggestion_city_usecase.dart';
import '../bloc/cw_status.dart';
import '../bloc/fw_status.dart';
import '../bloc/home_bloc.dart';
import '../widgets/city_search.dart';
import '../widgets/day_weather_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();

  GetSuggestionCityUseCase getSuggestionCityUseCase =
      GetSuggestionCityUseCase(locator());
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
        SizedBox(height: height * 0.02),
        //? search box
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CitySearch(
                  width: width,
                  textEditingController: textEditingController,
                  getSuggestionCityUseCase: getSuggestionCityUseCase,
                ),
              ),
            ),
          ],
        ),

        //? main UI
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
                            '${currentCityEntity.main!.temp!.round().toString()}\u00B0C',
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
                                            '${currentCityEntity.main!.tempMax!.round().toString()}\u00B0C'),
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
                                            '${currentCityEntity.main!.tempMin!.round().toString()}\u00B0C'),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'feels like ${currentCityEntity.main!.feelsLike!.round().toString()}\u00B0C',
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
                              final FwError fwError = state.fwStatus as FwError;
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
            //TODO: impl error handeling ...
            return const Expanded(child: Center(child: Text('Error')));
          }
           return const Expanded(child: Center(child: Text('Unknow Error')));
        })
      ],
    );
  }
}
