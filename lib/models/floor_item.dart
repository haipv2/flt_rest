import 'shop.dart';

class ItemFloor extends Object {
  Direction direction;
  int position;
  int shopId;
  ItemType itemType;
  int itemNo;
  int floorId;
  bool hovering;
  ItemFloor(
      {this.direction: Direction.up,
      this.position,
      this.shopId,
      this.itemType,
      this.itemNo,
      this.floorId, this.hovering: false});

  bool operator ==(o) =>
      o is ItemFloor &&
      o.itemNo == this.itemNo &&
      o.position == this.position &&
      this.shopId == o.shopId &&
      this.floorId == o.floorId;

  int get hashCode => this.shopId + this.itemNo + this.floorId + this.position;
}

enum ItemType { table, door, wc, stair }

enum Direction { up, down, left, right }
