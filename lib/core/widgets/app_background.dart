import 'package:clean_arcitechture_edu/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppBackground {
static AssetImage getBackGroundImage() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('kk').format(now);
  int hour = int.parse(formattedDate);
  String timeCategory;

if (hour >= 6 && hour < 7) {
  timeCategory = 'sunrise';
} else if (hour >= 18 && hour < 19) {
  timeCategory = 'sunset';
} else if (hour >= 19 && hour < 24) {
  timeCategory = 'evening';
} else if (hour < 6) {
  timeCategory = 'lateNight';
} else if (hour >= 7 && hour < 12) {
  timeCategory = 'morning';
} else if (hour >= 12 && hour < 18) {
  timeCategory = 'afternoon';
} else {
  timeCategory = 'lateNight';
}

  switch (timeCategory) {
    case 'lateNight':
      return  AssetImage(Assets.images.lateNight.path);
    case 'morning':
      return  AssetImage(Assets.images.morning.path);
    case 'afternoon':
      return  AssetImage(Assets.images.afternoon.path);
    case 'sunset':
      return  AssetImage(Assets.images.sunset.path);
    case 'sunrise':
      return  AssetImage(Assets.images.sunrise.path);
    case 'evening':
      return  AssetImage(Assets.images.evening.path);
    default:
      return  AssetImage(Assets.images.evening.path);
  }
}

  static Image setIconForMain(description) {
    if (description == "clear sky") {
      return  Image(
          image: AssetImage(
        Assets.images.suny.path,
      ));
    } else if (description == "few clouds") {
      return  Image(
          image: AssetImage(Assets.images.fewClouds.path));
    } else if (description.contains("clouds")) {
      return  Image(image: AssetImage(Assets.images.clouds.path));
    } else if (description.contains("thunderstorm")) {
      return  Image(image: AssetImage(Assets.images.thunderstorm.path));
    } else if (description.contains("drizzle")) {
      return  Image(image: AssetImage(Assets.images.drizzle.path));
    } else if (description.contains("rain")) {
      return  Image(image: AssetImage(Assets.images.rain.path));
    } else if (description.contains("snow")) {
      return  Image(image: AssetImage(Assets.images.snow.path));
    } else {
      return  Image(
          image: AssetImage(Assets.images.windy.path));
    }
  }
}
