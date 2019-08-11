import 'floor_item.dart';

class Shop extends Object {
  final int shopId;
  final String shopName;
  final String shopAddr;
  List<Floor> floorList = [
    Floor(id: 1, floorNo: 1, itemFloor: [
      ItemFloor(floorId: 1, itemType: ItemType.table, shopId: 1)
    ]),
    Floor(
        id: 2,
        floorNo: 2,
        itemFloor: [ItemFloor(floorId: 2, itemType: ItemType.table, shopId: 1)])
  ];

  Shop({this.shopId, this.shopName, this.shopAddr}) {
    this.floorList = floorList;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || this.hashCode == other.hashCode;
  }

  @override
  int get hashCode => shopId;
}

class Floor extends Object {
  int id;
  int floorNo;
  List<ItemFloor> itemFloor;

  Floor({this.id, this.floorNo, this.itemFloor});
}
