class Location {
    String country;
    double lat;
    String localtime;
    int localtime_epoch;
    double lon;
    String name;
    String region;
    String tz_id;

    Location({this.country, this.lat, this.localtime, this.localtime_epoch, this.lon, this.name, this.region, this.tz_id});

    factory Location.fromJson(Map<String, dynamic> json) {
        return Location(
            country: json['country'], 
            lat: json['lat'], 
            localtime: json['localtime'], 
            localtime_epoch: json['localtime_epoch'], 
            lon: json['lon'], 
            name: json['name'], 
            region: json['region'], 
            tz_id: json['tz_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['country'] = this.country;
        data['lat'] = this.lat;
        data['localtime'] = this.localtime;
        data['localtime_epoch'] = this.localtime_epoch;
        data['lon'] = this.lon;
        data['name'] = this.name;
        data['region'] = this.region;
        data['tz_id'] = this.tz_id;
        return data;
    }
}