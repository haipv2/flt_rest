import 'shop.dart';

class ItemFloor extends Object {
  Direction direction;
  int position;
  int shopId;
  ItemType itemType;
  int itemNo;
  int floorId;

  ItemFloor(
      {this.direction: Direction.up,
      this.position,
      this.shopId,
      this.itemType,
      this.itemNo,
      this.floorId});

  bool operator ==(o) =>
      o is ItemFloor &&
      o.itemNo == this.itemNo &&
      this.shopId == o.shopId &&
      this.floorId == o.floorId;

  int get hashCode => this.shopId + this.itemNo + this.floorId;
}

enum ItemType { table, door, wc, stair }

enum Direction { up, down, left, right }
