import 'ConditionXX.dart';

class Current {
    int cloud;
    ConditionXX condition;
    double feelslike_c;
    double feelslike_f;
    double gust_kph;
    double gust_mph;
    int humidity;
    int is_day;
    String last_updated;
    int last_updated_epoch;
    double precip_in;
    double precip_mm;
    double pressure_in;
    double pressure_mb;
    double temp_c;
    double temp_f;
    double uv;
    double vis_km;
    double vis_miles;
    int wind_degree;
    String wind_dir;
    double wind_kph;
    double wind_mph;

    Current({this.cloud, this.condition, this.feelslike_c, this.feelslike_f, this.gust_kph, this.gust_mph, this.humidity, this.is_day, this.last_updated, this.last_updated_epoch, this.precip_in, this.precip_mm, this.pressure_in, this.pressure_mb, this.temp_c, this.temp_f, this.uv, this.vis_km, this.vis_miles, this.wind_degree, this.wind_dir, this.wind_kph, this.wind_mph});

    factory Current.fromJson(Map<String, dynamic> json) {
        return Current(
            cloud: json['cloud'], 
            condition: json['condition'] != null ? ConditionXX.fromJson(json['condition']) : null,
            feelslike_c: json['feelslike_c'], 
            feelslike_f: json['feelslike_f'], 
            gust_kph: json['gust_kph'], 
            gust_mph: json['gust_mph'], 
            humidity: json['humidity'], 
            is_day: json['is_day'], 
            last_updated: json['last_updated'], 
            last_updated_epoch: json['last_updated_epoch'], 
            precip_in: json['precip_in'], 
            precip_mm: json['precip_mm'], 
            pressure_in: json['pressure_in'], 
            pressure_mb: json['pressure_mb'], 
            temp_c: json['temp_c'], 
            temp_f: json['temp_f'], 
            uv: json['uv'], 
            vis_km: json['vis_km'], 
            vis_miles: json['vis_miles'], 
            wind_degree: json['wind_degree'], 
            wind_dir: json['wind_dir'], 
            wind_kph: json['wind_kph'], 
            wind_mph: json['wind_mph'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cloud'] = this.cloud;
        data['feelslike_c'] = this.feelslike_c;
        data['feelslike_f'] = this.feelslike_f;
        data['gust_kph'] = this.gust_kph;
        data['gust_mph'] = this.gust_mph;
        data['humidity'] = this.humidity;
        data['is_day'] = this.is_day;
        data['last_updated'] = this.last_updated;
        data['last_updated_epoch'] = this.last_updated_epoch;
        data['precip_in'] = this.precip_in;
        data['precip_mm'] = this.precip_mm;
        data['pressure_in'] = this.pressure_in;
        data['pressure_mb'] = this.pressure_mb;
        data['temp_c'] = this.temp_c;
        data['temp_f'] = this.temp_f;
        data['uv'] = this.uv;
        data['vis_km'] = this.vis_km;
        data['vis_miles'] = this.vis_miles;
        data['wind_degree'] = this.wind_degree;
        data['wind_dir'] = this.wind_dir;
        data['wind_kph'] = this.wind_kph;
        data['wind_mph'] = this.wind_mph;
        if (this.condition != null) {
            data['condition'] = this.condition.toJson();
        }
        return data;
    }
}