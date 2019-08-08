import 'dart:ui';

import 'floor_item.dart';

class Shop extends Object {
  final int shopId;
  final String shopName;
  final String shopAddr;
  final List<FloorItem> floorItems;

  const Shop({
    this.shopId,
    this.shopName,
    this.shopAddr,
    this.floorItems,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) || this.hashCode == other.hashCode;
  }

  @override
  int get hashCode => shopId;
}
