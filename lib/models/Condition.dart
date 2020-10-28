class Condition {
    int code;
    String icon;
    String text;

    Condition({this.code, this.icon, this.text});

    factory Condition.fromJson(Map<String, dynamic> json) {
        return Condition(
            code: json['code'], 
            icon: json['icon'], 
            text: json['text'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['icon'] = this.icon;
        data['text'] = this.text;
        return data;
    }
}