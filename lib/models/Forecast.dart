import 'Forecastday.dart';

class Forecast {
    List<Forecastday> forecastday;

    Forecast({this.forecastday});

    factory Forecast.fromJson(Map<String, dynamic> json) {
        return Forecast(
            forecastday: json['forecastday'] != null ? (json['forecastday'] as List).map((i) => Forecastday.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.forecastday != null) {
            data['forecastday'] = this.forecastday.map((v) => v.toJson()).toList();
        }
        return data;
    }
}