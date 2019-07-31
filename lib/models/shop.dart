import 'dart:ui';

class Shop extends Object {
  final int shopId;
  final String shopName;
  final String shopAddr;

  const Shop({
    this.shopId,
    this.shopName,
    this.shopAddr,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) || this.hashCode == other.hashCode;
  }

  @override
  int get hashCode => shopId;
}
