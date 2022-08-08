import 'dart:convert';
import 'package:coffee_app_ui/functions/idGenerater.dart';

class Product {
  String id = generateId();
  String image = 'assets/images/placeholder.jpg';
  String name = 'productName';
  String packSize = 'PackSize';
  String category = 'category';
  String formula = 'Formula';
  String superCategory = 'superCategory';
  String miniDescription = 'miniDescription';
  bool isPublished = true;
  int weight = 0;
  List<dynamic> usernames = ['usernames'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'weight': weight,
      'image': image,
      'name': name,
      'packSize': packSize,
      'category': category,
      'formula': formula,
      'superCategory': superCategory,
      'miniDescription': miniDescription,
      'isPublished': isPublished,
      'usernames': usernames,
    };
  }

  Map<String, dynamic> createNewProduct() {
    return {
      'id': id,
      'weight': weight,
      'image': image,
      'name': name,
      'packSize': packSize,
      'category': category,
      'formula': formula,
      'superCategory': superCategory,
      'miniDescription': miniDescription,
      'isPublished': isPublished,
      'usernames': usernames,
    };
  }

  Product.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        weight = map['weight'] ?? 0,
        image = map['image'] ?? '',
        name = map['name'] ?? '',
        formula = map['formula'] ?? '',
        packSize = map['packSize'] ?? '',
        category = map['category'] ?? '',
        superCategory = map['superCategory'] ?? '',
        miniDescription = map['miniDescription'] ?? '',
        usernames = map['usernames'] ?? ['usernames'],
        isPublished = map['isPublished'] ?? true;

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(image: $image, name: $name,desc, miniDescription: $miniDescription,packSize: $packSize, formula: $formula, usernames: $usernames)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.image == image &&
        other.weight == weight &&
        other.name == name &&
        other.packSize == packSize &&
        other.category == category &&
        other.formula == formula &&
        other.superCategory == superCategory &&
        other.miniDescription == miniDescription &&
        other.usernames == usernames &&
        other.isPublished == isPublished;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        weight.hashCode ^
        image.hashCode ^
        name.hashCode ^
        packSize.hashCode ^
        category.hashCode ^
        superCategory.hashCode ^
        formula.hashCode ^
        miniDescription.hashCode ^
        usernames.hashCode ^
        isPublished.hashCode;
  }
}
