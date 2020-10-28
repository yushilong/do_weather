import 'package:do_weather/models/Location.dart';

import 'Alert.dart';
import 'Current.dart';
import 'Forecast.dart';

class weatherForecast {
    Alert alert;
    Current current;
    Forecast forecast;
    Location location;

    weatherForecast({this.alert, this.current, this.forecast, this.location});

    factory weatherForecast.fromJson(Map<String, dynamic> json) {
        return weatherForecast(
            alert: json['alert'] != null ? Alert.fromJson(json['alert']) : null, 
            current: json['current'] != null ? Current.fromJson(json['current']) : null, 
            forecast: json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null, 
            location: json['location'] != null ? Location.fromJson(json['location']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.alert != null) {
            data['alert'] = this.alert.toJson();
        }
        if (this.current != null) {
            data['current'] = this.current.toJson();
        }
        if (this.forecast != null) {
            data['forecast'] = this.forecast.toJson();
        }
        if (this.location != null) {
            data['location'] = this.location.toJson();
        }
        return data;
    }
}