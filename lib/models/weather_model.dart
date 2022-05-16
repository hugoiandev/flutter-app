class Weather {
  late final String name;
  late final Main main;

  Weather({required this.name, required this.main});

  Weather.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    main = Main.fromJson(json['main']);
  }
}

class Main {
  late final double temp;
  late final double feelsLike;
  late final double tempMin;
  late final double tempMax;
  late final int pressure;
  late final int humidity;

  Main(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity});

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
