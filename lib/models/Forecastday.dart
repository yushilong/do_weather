import 'Astro.dart';
import 'Day.dart';
import 'Hour.dart';

class Forecastday {
    Astro astro;
    String date;
    int date_epoch;
    Day day;
    List<Hour> hour;

    Forecastday({this.astro, this.date, this.date_epoch, this.day, this.hour});

    factory Forecastday.fromJson(Map<String, dynamic> json) {
        return Forecastday(
            astro: json['astro'] != null ? Astro.fromJson(json['astro']) : null, 
            date: json['date'], 
            date_epoch: json['date_epoch'], 
            day: json['day'] != null ? Day.fromJson(json['day']) : null, 
            hour: json['hour'] != null ? (json['hour'] as List).map((i) => Hour.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['date'] = this.date;
        data['date_epoch'] = this.date_epoch;
        if (this.astro != null) {
            data['astro'] = this.astro.toJson();
        }
        if (this.day != null) {
            data['day'] = this.day.toJson();
        }
        if (this.hour != null) {
            data['hour'] = this.hour.map((v) => v.toJson()).toList();
        }
        return data;
    }
}