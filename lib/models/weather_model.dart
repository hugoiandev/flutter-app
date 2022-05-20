class Weather {
  late final String name;
  late final Main main;
  late final List<Details> weather;

  Weather({required this.name, required this.main, required this.weather});

  Weather.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    main = Main.fromJson(json['main']);
    weather =
        List.from(json['weather']).map((e) => Details.fromJson(e)).toList();
  }
}

class Main {
  late final num temp;
  late final num feelsLike;
  late final num tempMin;
  late final num tempMax;
  late final int pressure;
  late final int humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;

    return data;
  }
}

class Details {
  late final int id;
  late final String main;
  late final String description;
  late final String icon;

  Details({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['id'] = id;
    json['name'] = main;
    json['description'] = description;
    json['icon'] = icon;

    return json;
  }
}
