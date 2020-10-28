import 'ConditionXX.dart';

class Day {
    double avghumidity;
    double avgtemp_c;
    double avgtemp_f;
    double avgvis_km;
    double avgvis_miles;
    ConditionXX condition;
    String daily_chance_of_rain;
    String daily_chance_of_snow;
    int daily_will_it_rain;
    int daily_will_it_snow;
    double maxtemp_c;
    double maxtemp_f;
    double maxwind_kph;
    double maxwind_mph;
    double mintemp_c;
    double mintemp_f;
    double totalprecip_in;
    double totalprecip_mm;
    double uv;

    Day({this.avghumidity, this.avgtemp_c, this.avgtemp_f, this.avgvis_km, this.avgvis_miles, this.condition, this.daily_chance_of_rain, this.daily_chance_of_snow, this.daily_will_it_rain, this.daily_will_it_snow, this.maxtemp_c, this.maxtemp_f, this.maxwind_kph, this.maxwind_mph, this.mintemp_c, this.mintemp_f, this.totalprecip_in, this.totalprecip_mm, this.uv});

    factory Day.fromJson(Map<String, dynamic> json) {
        return Day(
            avghumidity: json['avghumidity'], 
            avgtemp_c: json['avgtemp_c'], 
            avgtemp_f: json['avgtemp_f'], 
            avgvis_km: json['avgvis_km'], 
            avgvis_miles: json['avgvis_miles'], 
            condition: json['condition'] != null ? ConditionXX.fromJson(json['condition']) : null, 
            daily_chance_of_rain: json['daily_chance_of_rain'], 
            daily_chance_of_snow: json['daily_chance_of_snow'], 
            daily_will_it_rain: json['daily_will_it_rain'], 
            daily_will_it_snow: json['daily_will_it_snow'], 
            maxtemp_c: json['maxtemp_c'], 
            maxtemp_f: json['maxtemp_f'], 
            maxwind_kph: json['maxwind_kph'], 
            maxwind_mph: json['maxwind_mph'], 
            mintemp_c: json['mintemp_c'], 
            mintemp_f: json['mintemp_f'], 
            totalprecip_in: json['totalprecip_in'], 
            totalprecip_mm: json['totalprecip_mm'], 
            uv: json['uv'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avghumidity'] = this.avghumidity;
        data['avgtemp_c'] = this.avgtemp_c;
        data['avgtemp_f'] = this.avgtemp_f;
        data['avgvis_km'] = this.avgvis_km;
        data['avgvis_miles'] = this.avgvis_miles;
        data['daily_chance_of_rain'] = this.daily_chance_of_rain;
        data['daily_chance_of_snow'] = this.daily_chance_of_snow;
        data['daily_will_it_rain'] = this.daily_will_it_rain;
        data['daily_will_it_snow'] = this.daily_will_it_snow;
        data['maxtemp_c'] = this.maxtemp_c;
        data['maxtemp_f'] = this.maxtemp_f;
        data['maxwind_kph'] = this.maxwind_kph;
        data['maxwind_mph'] = this.maxwind_mph;
        data['mintemp_c'] = this.mintemp_c;
        data['mintemp_f'] = this.mintemp_f;
        data['totalprecip_in'] = this.totalprecip_in;
        data['totalprecip_mm'] = this.totalprecip_mm;
        data['uv'] = this.uv;
        if (this.condition != null) {
            data['condition'] = this.condition.toJson();
        }
        return data;
    }
}