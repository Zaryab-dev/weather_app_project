class Hourly {
  String? name;
  final dt;
  String? update;
  String? description;
  double? temp;
  int? humidity;
  double? wind;
  double? feel;
  String? icon;

  Hourly(
      {this.name,
        this.dt,
        this.update,
        this.description,
        this.temp,
        this.humidity,
        this.wind,
        this.icon,
        this.feel});

  factory Hourly.fromJSON(Map<String, dynamic> json) {
    return Hourly(
      name: json["city"]["name"],
      dt: json["list"][0]["dt"].toInt(),
      update: json["list"][0]["weather"][0]["main"],
      description: json["list"][0]["weather"][0]["description"],
      temp: json["list"][0]["main"]["temp"] - 273.15,
      humidity: json["list"][0]["main"]["humidity"],
      wind: json["list"][0]["wind"]["speed"],
      feel: json["list"][0]["main"]["feels_like"] - 273.15,
      icon: json["list"][0]["weather"][0]["icon"],
    );
  }
}
