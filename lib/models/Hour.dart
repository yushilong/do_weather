import 'ConditionX.dart';

class Hour {
    String chance_of_rain;
    String chance_of_snow;
    int cloud;
    ConditionX condition;
    double dewpoint_c;
    double dewpoint_f;
    double feelslike_c;
    double feelslike_f;
    double gust_kph;
    double gust_mph;
    double heatindex_c;
    double heatindex_f;
    int humidity;
    int is_day;
    double precip_in;
    double precip_mm;
    double pressure_in;
    double pressure_mb;
    double temp_c;
    double temp_f;
    String time;
    int time_epoch;
    double vis_km;
    double vis_miles;
    int will_it_rain;
    int will_it_snow;
    int wind_degree;
    String wind_dir;
    double wind_kph;
    double wind_mph;
    double windchill_c;
    double windchill_f;

    Hour({this.chance_of_rain, this.chance_of_snow, this.cloud, this.condition, this.dewpoint_c, this.dewpoint_f, this.feelslike_c, this.feelslike_f, this.gust_kph, this.gust_mph, this.heatindex_c, this.heatindex_f, this.humidity, this.is_day, this.precip_in, this.precip_mm, this.pressure_in, this.pressure_mb, this.temp_c, this.temp_f, this.time, this.time_epoch, this.vis_km, this.vis_miles, this.will_it_rain, this.will_it_snow, this.wind_degree, this.wind_dir, this.wind_kph, this.wind_mph, this.windchill_c, this.windchill_f});

    factory Hour.fromJson(Map<String, dynamic> json) {
        return Hour(
            chance_of_rain: json['chance_of_rain'], 
            chance_of_snow: json['chance_of_snow'], 
            cloud: json['cloud'], 
            condition: json['condition'] != null ? ConditionX.fromJson(json['condition']) : null, 
            dewpoint_c: json['dewpoint_c'], 
            dewpoint_f: json['dewpoint_f'], 
            feelslike_c: json['feelslike_c'], 
            feelslike_f: json['feelslike_f'], 
            gust_kph: json['gust_kph'], 
            gust_mph: json['gust_mph'], 
            heatindex_c: json['heatindex_c'], 
            heatindex_f: json['heatindex_f'], 
            humidity: json['humidity'], 
            is_day: json['is_day'], 
            precip_in: json['precip_in'], 
            precip_mm: json['precip_mm'], 
            pressure_in: json['pressure_in'], 
            pressure_mb: json['pressure_mb'], 
            temp_c: json['temp_c'], 
            temp_f: json['temp_f'], 
            time: json['time'], 
            time_epoch: json['time_epoch'], 
            vis_km: json['vis_km'], 
            vis_miles: json['vis_miles'], 
            will_it_rain: json['will_it_rain'], 
            will_it_snow: json['will_it_snow'], 
            wind_degree: json['wind_degree'], 
            wind_dir: json['wind_dir'], 
            wind_kph: json['wind_kph'], 
            wind_mph: json['wind_mph'], 
            windchill_c: json['windchill_c'], 
            windchill_f: json['windchill_f'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['chance_of_rain'] = this.chance_of_rain;
        data['chance_of_snow'] = this.chance_of_snow;
        data['cloud'] = this.cloud;
        data['dewpoint_c'] = this.dewpoint_c;
        data['dewpoint_f'] = this.dewpoint_f;
        data['feelslike_c'] = this.feelslike_c;
        data['feelslike_f'] = this.feelslike_f;
        data['gust_kph'] = this.gust_kph;
        data['gust_mph'] = this.gust_mph;
        data['heatindex_c'] = this.heatindex_c;
        data['heatindex_f'] = this.heatindex_f;
        data['humidity'] = this.humidity;
        data['is_day'] = this.is_day;
        data['precip_in'] = this.precip_in;
        data['precip_mm'] = this.precip_mm;
        data['pressure_in'] = this.pressure_in;
        data['pressure_mb'] = this.pressure_mb;
        data['temp_c'] = this.temp_c;
        data['temp_f'] = this.temp_f;
        data['time'] = this.time;
        data['time_epoch'] = this.time_epoch;
        data['vis_km'] = this.vis_km;
        data['vis_miles'] = this.vis_miles;
        data['will_it_rain'] = this.will_it_rain;
        data['will_it_snow'] = this.will_it_snow;
        data['wind_degree'] = this.wind_degree;
        data['wind_dir'] = this.wind_dir;
        data['wind_kph'] = this.wind_kph;
        data['wind_mph'] = this.wind_mph;
        data['windchill_c'] = this.windchill_c;
        data['windchill_f'] = this.windchill_f;
        if (this.condition != null) {
            data['condition'] = this.condition.toJson();
        }
        return data;
    }
}