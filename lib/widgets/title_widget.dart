import 'package:flt_rest/commons/const.dart';
import 'package:flt_rest/models/floor_item.dart';
import 'package:flutter/material.dart';

class FloorTile extends StatelessWidget {
  final FloorItem floorItem;
  final bool isOccupied;
  final Widget child;
  final int tileNo;
  FloorTile({this.floorItem, this.isOccupied: false, this.child, this.tileNo});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: buildTitle(),
      ),
    );
  }

  Widget buildTitle() {
    if (floorItem.itemType == ItemType.table) {
      return ImageIcon(AssetImage(IMG_TABLE_URL));
    } else if (floorItem.itemType == ItemType.door) {
      return ImageIcon(AssetImage(IMG_DOOR_URL));
    } else {
      return Container();
    }
  }
}
