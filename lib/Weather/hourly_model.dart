class HourlyForecast {
  final time;
  final double temperature;
  final String icon;

  HourlyForecast({
    required this.time,
    required this.temperature,
    required this.icon,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    return HourlyForecast(
      time: json['dt'],
      temperature: json['main']['temp'] - 273.15,
      icon: json['weather'][0]['icon'],
    );
  }
}
