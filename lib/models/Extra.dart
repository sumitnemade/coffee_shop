class Extra {
  int? id;
  String? max;
  String? min;
  String? name;

  Extra({this.id, this.max, this.min, this.name});

  factory Extra.fromJson(Map<String?, dynamic> json) {
    return Extra(
      id: json['id'],
      max: json['max'],
      min: json['min'],
      name: json['name'],
    );
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['max'] = this.max;
    data['min'] = this.min;
    data['name'] = this.name;
    return data;
  }
}
