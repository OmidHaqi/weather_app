import 'package:blurbox/blurbox.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/data/model/forecast_days_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/date_converter.dart';
import '../../../../core/widgets/app_background.dart';

class DaysWeatherView extends StatelessWidget {
  final DataList daily;

  const DaysWeatherView({
    super.key,
    required this.daily,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: BlurBox(
        blur: 10,
        width: 80,
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            Text(
              DateConverter.changeDtToDateTime(daily.dt),
              style:
                  const TextStyle(fontSize: 12),
            ),
            Text(
              DateConverter.changeDtToTime(daily.dt),
              style:
                  const TextStyle(fontSize: 12),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: AppBackground.setIconForMain(daily.weather![0].description),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "${daily.main?.temp!.round()}\u00B0",
                  style: const TextStyle(
                      fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
