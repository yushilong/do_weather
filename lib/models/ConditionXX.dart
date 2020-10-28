class ConditionXX {
    int code;
    String icon;
    String text;

    ConditionXX({this.code, this.icon, this.text});

    factory ConditionXX.fromJson(Map<String, dynamic> json) {
        return ConditionXX(
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