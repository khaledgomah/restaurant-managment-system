import 'dart:convert';

abstract class ItemModel {
  final String name;
  final int orders;
  final double ppu;
  final String type;
  final String? imagePath;
  ItemModel(
      {required this.name,
      this.imagePath,
      required this.orders,
      required this.ppu,
      required this.type});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'orders': orders,
      'ppu': ppu,
      'type': type,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    switch (map['type'] as String) {
      case 'burger':
        return Burger(
          name: map['name'] as String,
          orders: map['orders'] as int,
          ppu: map['ppu'] as double,
          type: map['type'] as String,
        );
      case 'meal':
        return Meal(
          name: map['name'] as String,
          orders: map['orders'] as int,
          ppu: map['ppu'] as double,
          type: map['type'] as String,
        );
      case 'sandwitch':
        return Sandwitch(
          name: map['name'] as String,
          orders: map['orders'] as int,
          ppu: map['ppu'] as double,
          type: map['type'] as String,
        );
      case 'side':
        return Side(
          name: map['name'] as String,
          orders: map['orders'] as int,
          ppu: map['ppu'] as double,
          type: map['type'] as String,
        );
      default:
        throw Exception('Unknown type: ${map['type']}');
    }
  }
  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Burger extends ItemModel {
  Burger(
      {required super.name,
      required super.orders,
      required super.ppu,
      required super.type});
}

class Meal extends ItemModel {
  Meal(
      {required super.name,
      required super.orders,
      required super.ppu,
      required super.type});
}

class Sandwitch extends ItemModel {
  Sandwitch(
      {required super.name,
      required super.orders,
      required super.ppu,
      required super.type});
}

class Side extends ItemModel {
  Side(
      {required super.name,
      required super.orders,
      required super.ppu,
      required super.type});
}
