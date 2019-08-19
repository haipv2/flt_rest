import 'package:flt_rest/commons/const.dart';
import 'package:flt_rest/models/floor_item.dart';
import 'package:flt_rest/models/shop.dart';
import 'package:flt_rest/widgets/float_item_button.dart';
import 'package:flt_rest/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ShopFloorDetailPage extends StatefulWidget {
  final Floor floor;

  ShopFloorDetailPage(this.floor);

  @override
  _ShopFloorDetailPageState createState() => _ShopFloorDetailPageState();
}

class _ShopFloorDetailPageState extends State<ShopFloorDetailPage> {
  ItemFloor floorItem;
  Set<int> itemPositionArr = new Set();

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
                      builder: (context, List<ItemFloor> candidateData,
                          rejectedData) {
                        if (floorItem == null) {
                          return Container(
                            child: Text(
                              '$i',
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          );
                        } else {
                          if (floorItem.itemType == ItemType.table) {
                            floorItem = null;
                            return Draggable(
                              data: ItemFloor(
                                  direction: Direction.up,
                                  itemType: ItemType.table),
                              child: Center(
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                        child: ImageIcon(
                                            AssetImage(IMG_TABLE_URL))),
                                    Center(
                                        child: Text(
                                      '2',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 20),
                                    ))
                                  ],
                                ),
                              ),
                              feedback: Container(
                                child: ImageIcon(AssetImage(IMG_TABLE_URL)),
                              ),
                              onDragCompleted: () {
                                print('remove $i');
                                itemPositionArr.remove(i);
                              },
                            );
                          } else if (floorItem.itemType == ItemType.door) {
                            floorItem = null;
                            return ImageIcon(AssetImage(IMG_DOOR_URL));
                          } else {
                            floorItem = null;
                            return Container();
                          }
                        }
                      },
                      onWillAccept: (data) {
//                        if (itemPositionArr.contains(i)) {
//                          return false;
//                        }
                        return true;
                      },
                      onAccept: (data) {
//                          if (itemPositionArr.contains(i)){
//                            return;
//                          }
                          floorItem = data;
                          itemPositionArr.add(i);
                      },
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingItemsShop(),
          ),
        ],
      ),
    );
  }
}
