import 'shop.dart';

class FloorItem extends Object {
  Direction direction;
  int position;
  int shopId;
  ItemType itemType;
  int itemNo;
  int floorNo;

  FloorItem(
      {this.direction: Direction.up,
      this.position,
      this.shopId,
      this.itemType,
      this.itemNo,
      this.floorNo});

  bool operator ==(o) =>
      o is FloorItem &&
      o.itemNo == this.itemNo &&
      this.shopId == o.shopId &&
      this.floorNo == o.floorNo;

  int get hashCode => this.shopId + this.itemNo + this.floorNo;
}

enum ItemType { table, door, wc, stair }

enum Direction { up, down, left, right }
