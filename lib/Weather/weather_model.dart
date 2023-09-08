class WeatherModels {
  String? name;
  String? update;
  double? temp;
  int? humidity;
  double? feel;
  String? icon;

  WeatherModels(
      {this.name, this.update, this.temp, this.humidity, this.feel, this.icon});

  factory WeatherModels.fromJSON(Map<String, dynamic> json) {
    return WeatherModels(
      name: json["name"],
      update: json["weather"][0]["main"],
      temp: json["main"]["temp"] - 273.15,
      humidity: json["main"]["humidity"],
      feel: json["main"]["feels_like"].toDouble(),
      icon: json["weather"][0]["icon"],
    );
  }
}
