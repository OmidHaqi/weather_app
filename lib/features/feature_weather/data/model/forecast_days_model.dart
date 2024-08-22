import 'package:clean_arcitechture_edu/features/feature_weather/domain/entities/forecast_days_entity.dart';

class ForecastDaysModel extends ForecastDaysEntity {
  const ForecastDaysModel({
    super.city,
    super.cnt,
    super.cod,
    super.list,
    super.message,
  });

  factory ForecastDaysModel.fromJson(dynamic json) {
    List<DataList> list = [];
    if (json['list'] != null) {
      json['list'].forEach((v) {
        list.add(DataList.fromJson(v));
      });
    }

    return ForecastDaysModel(
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      cnt: json['cnt'],
      cod: json['cod'],
      list: list,
    );
  }
}

/// id : 3163858
/// name : "Zocca"
/// coord : {"lat":44.34,"lon":10.99}
/// country : "IT"
/// population : 4593
/// timezone : 7200
/// sunrise : 1661834187
/// sunset : 1661882248

class City {
  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  City.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
  num? id;
  String? name;
  Coord? coord;
  String? country;
  num? population;
  num? timezone;
  num? sunrise;
  num? sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (coord != null) {
      map['coord'] = coord?.toJson();
    }
    map['country'] = country;
    map['population'] = population;
    map['timezone'] = timezone;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }
}

/// lat : 44.34
/// lon : 10.99

class Coord {
  Coord({
    this.lat,
    this.lon,
  });

  Coord.fromJson(dynamic json) {
    lat = json['lat'];
    lon = json['lon'];
  }
  num? lat;
  num? lon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    return map;
  }
}

/// dt : 1661871600
/// main : {"temp":296.76,"feels_like":296.98,"temp_min":296.76,"temp_max":297.87,"pressure":1015,"sea_level":1015,"grnd_level":933,"humidity":69,"temp_kf":-1.11}
/// weather : [{"id":500,"main":"Rain","description":"light rain","icon":"10d"}]
/// clouds : {"all":100}
/// wind : {"speed":0.62,"deg":349,"gust":1.18}
/// visibility : 10000
/// pop : 0.32
/// rain : {"3h":0.26}
/// sys : {"pod":"d"}
/// dt_txt : "2022-08-30 15:00:00"

class DataList {
  DataList({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  });

  DataList.fromJson(dynamic json) {
    List<Weather> weatherList = [];
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weatherList.add(Weather.fromJson(v));
      });
    }
    dt = json['dt'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    weather = weatherList;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }
  num? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  num? visibility;
  num? pop;
  Rain? rain;
  Sys? sys;
  String? dtTxt;
}

/// pod : "d"

class Sys {
  Sys({
    this.pod,
  });

  Sys.fromJson(dynamic json) {
    pod = json['pod'];
  }
  String? pod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pod'] = pod;
    return map;
  }
}

/// 3h : 0.26

class Rain {
  Rain({
    this.h,
  });

  Rain.fromJson(dynamic json) {
    h = json['3h'];
  }
  num? h;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['3h'] = h;
    return map;
  }
}

/// speed : 0.62
/// deg : 349
/// gust : 1.18

class Wind {
  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  Wind.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }
  num? speed;
  num? deg;
  num? gust;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    map['gust'] = gust;
    return map;
  }
}

/// all : 100

class Clouds {
  Clouds({
    this.all,
  });

  Clouds.fromJson(dynamic json) {
    all = json['all'];
  }
  num? all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }
}

/// id : 500
/// main : "Rain"
/// description : "light rain"
/// icon : "10d"

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
  num? id;
  String? main;
  String? description;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }
}

/// temp : 296.76
/// feels_like : 296.98
/// temp_min : 296.76
/// temp_max : 297.87
/// pressure : 1015
/// sea_level : 1015
/// grnd_level : 933
/// humidity : 69
/// temp_kf : -1.11

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
  }
  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num? pressure;
  num? seaLevel;
  num? grndLevel;
  num? humidity;
  num? tempKf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['sea_level'] = seaLevel;
    map['grnd_level'] = grndLevel;
    map['humidity'] = humidity;
    map['temp_kf'] = tempKf;
    return map;
  }
}
