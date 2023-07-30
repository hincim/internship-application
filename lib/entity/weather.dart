class WeatherModel {
  final double latitude;
  final double longitude;
  final String weatherDescription;
  final String icon;
  final int weatherId;
  final double temperature;
  final double feelsLikeTemperature;
  final double minimumTemperature;
  final double maximumTemperature;
  final int pressure;
  final int humidity;
  final int visibility;
  final double windSpeed;
  final int windDirection;
  final int cloudCover;
  final int sunrise;
  final int sunset;
  final int timezoneOffset;
  final int id;
  final String name;
  final int cod;

  WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.weatherDescription,
    required this.icon,
    required this.weatherId,
    required this.temperature,
    required this.feelsLikeTemperature,
    required this.minimumTemperature,
    required this.maximumTemperature,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
    required this.windDirection,
    required this.cloudCover,
    required this.sunrise,
    required this.sunset,
    required this.timezoneOffset,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      latitude: json['coord']['lat'] as double,
      longitude: json['coord']['lon'] as double,
      weatherDescription: json['weather'][0]['description'] as String,
      icon: json['weather'][0]['icon'] as String,
      weatherId: json['weather'][0]['id'] as int,
      temperature: json['main']['temp'] as double,
      feelsLikeTemperature: json['main']['feels_like'] as double,
      minimumTemperature: json['main']['temp_min'] as double,
      maximumTemperature: json['main']['temp_max'] as double,
      pressure: json['main']['pressure'] as int,
      humidity: json['main']['humidity'] as int,
      visibility: json['visibility'] as int,
      windSpeed: json['wind']['speed'] as double,
      windDirection: json['wind']['deg'] as int,
      cloudCover: json['clouds']['all'] as int,
      sunrise: json['sys']['sunrise'] as int,
      sunset: json['sys']['sunset'] as int,
      timezoneOffset: json['timezone'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      cod: json['cod'] as int,
    );
  }
}