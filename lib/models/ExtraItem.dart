class ExtraItem {
  int? extra_id;
  int? id;
  String? name;
  String? price;

  ExtraItem({this.extra_id, this.id, this.name, this.price});

  factory ExtraItem.fromJson(Map<String?, dynamic> json) {
    return ExtraItem(
      extra_id: json['extra_id'],
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['extra_id'] = this.extra_id;
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
