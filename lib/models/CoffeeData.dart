import 'Category.dart';
import 'Extra.dart';
import 'ExtraItem.dart';
import 'Images.dart';

class CoffeeData {
  String? availability;
  double? before_sale_price;
  Category? category;
  String? description;
  List<ExtraItem>? extra_items;
  List<Extra>? extras;
  String? full_description;
  int? id;
  Images? images;
  String? name;
  int? order;
  int? price;
  List<String>? tags;

  CoffeeData(
      {this.availability,
      this.before_sale_price,
      this.category,
      this.description,
      this.extra_items,
      this.extras,
      this.full_description,
      this.id,
      this.images,
      this.name,
      this.order,
      this.price,
      this.tags});

  factory CoffeeData.fromJson(Map<String?, dynamic> json) {
    return CoffeeData(
      availability: json['availability'],
      before_sale_price: json['before_sale_price'],
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      description: json['description'],
      extra_items: json['extra_items'] != null
          ? (json['extra_items'] as List)
              .map((i) => ExtraItem.fromJson(i))
              .toList()
          : null,
      extras: json['extras'] != null
          ? (json['extras'] as List).map((i) => Extra.fromJson(i)).toList()
          : null,
      full_description: json['full_description'],
      id: json['id'],
      images: json['images'] != null ? Images.fromJson(json['images']) : null,
      name: json['name'],
      order: json['order'],
      price: json['price'],
      tags: json['tags'] != null
          ? (json['tags'] as List).map((i) => (i.toString())).toList()
          : null,
    );
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['availability'] = this.availability;
    data['description'] = this.description;
    data['full_description'] = this.full_description;
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    data['price'] = this.price;

    data['before_sale_price'] = this.before_sale_price;

    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.extra_items != null) {
      data['extra_items'] = this.extra_items!.map((v) => v.toJson()).toList();
    }
    if (this.extras != null) {
      data['extras'] = this.extras!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v).toList();
    }
    return data;
  }
}
