class Astro {
    String moon_illumination;
    String moon_phase;
    String moonrise;
    String moonset;
    String sunrise;
    String sunset;

    Astro({this.moon_illumination, this.moon_phase, this.moonrise, this.moonset, this.sunrise, this.sunset});

    factory Astro.fromJson(Map<String, dynamic> json) {
        return Astro(
            moon_illumination: json['moon_illumination'],
            moon_phase: json['moon_phase'],
            moonrise: json['moonrise'],
            moonset: json['moonset'],
            sunrise: json['sunrise'],
            sunset: json['sunset'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['moon_illumination'] = this.moon_illumination;
        data['moon_phase'] = this.moon_phase;
        data['moonrise'] = this.moonrise;
        data['moonset'] = this.moonset;
        data['sunrise'] = this.sunrise;
        data['sunset'] = this.sunset;
        return data;
    }
}