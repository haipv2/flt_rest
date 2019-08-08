import 'package:flt_rest/commons/const.dart';
import 'package:flt_rest/models/floor_item.dart';
import 'package:flt_rest/models/shop.dart';
import 'package:flt_rest/widgets/float_item_button.dart';
import 'package:flt_rest/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ShopTableItem extends StatefulWidget {
  final Shop shop;

  ShopTableItem(this.shop);

  @override
  _ShopTableItemState createState() => _ShopTableItemState();
}

class _ShopTableItemState extends State<ShopTableItem> {
  FloorItem floorItem = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Center(
            child: GridView.builder(
                padding: EdgeInsets.only(top: 5.0),
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 12,
                    crossAxisSpacing: 0.5,
                    mainAxisSpacing: 0.5),
                itemCount: 60,
                itemBuilder: (context, i) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.1, color: Colors.black)),
                    child: DragTarget(
                      builder:
                          (context, List<FloorItem> candidateData, rejectedData) {
                        if (floorItem == null || floorItem.itemNo == null) {
                          return Container();
                        } else {
                          if (floorItem.itemType == ItemType.table) {
                            return ImageIcon(AssetImage(IMG_TABLE_URL));
                          } else if (floorItem.itemType == ItemType.door) {
                            return ImageIcon(AssetImage(IMG_DOOR_URL));
                          } else {
                            return Container();
                          }
                          floorItem = null;
                        }
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        floorItem = data;
                      },
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingItemsShop(),
          ),
//          DragTarget(
//            builder: (context, List<FloorItem> candidateData, rejectData) {
//              return Draggable(
//                child: Container(),
//                feedback: Opacity(opacity: 1.0),
//              );
//            },
//            onWillAccept: (data) {
//              return true;
//            },
//            onAccept: (data) {
//              return true;
//            },
//          ),
        ],
      ),
    );
  }
}
