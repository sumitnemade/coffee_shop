class Images {
  String? full_size;
  String? thumbnail;

  Images({this.full_size, this.thumbnail});

  factory Images.fromJson(Map<String?, dynamic> json) {
    return Images(
      full_size: json['full_size'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['full_size'] = this.full_size;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
