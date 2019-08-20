import 'package:flt_rest/commons/const.dart';
import 'package:flt_rest/models/floor_item.dart';
import 'package:flt_rest/models/shop.dart';
import 'package:flutter/material.dart';

class ShopFloorDetailPage extends StatefulWidget {
  final Floor floor;
  final Shop shop;

  ShopFloorDetailPage({this.floor, this.shop});

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
                          return Container();
                        } else {
//                          rejectedData.add(floorItem);
//                          floorItem.position = null;
                          if (floorItem.itemType == ItemType.table) {
                            if (!floorItem.hovering || (floorItem.hovering && itemPositionArr.contains(i))) {
                              floorItem?.position = i;
                              return Draggable(
                                data: floorItem,
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      Center(
                                          child: ImageIcon(
                                              AssetImage(IMG_TABLE_URL))),
                                      Center(
                                          child: Text(
                                        '${floorItem.position}',
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
                            }
                            return Container();
                          } else if (floorItem.itemType == ItemType.door) {
                            return ImageIcon(AssetImage(IMG_DOOR_URL));
                          } else {
                            return Container();
                          }
                        }
                      },
                      onWillAccept: (data) {
                        print('onWillAccept $i');
                        if (itemPositionArr.contains(i)) {
                          return false;
                        }
                        floorItem = data;
//                        floorItem.position = i;
                        floorItem.hovering = true;
                        return true;
                      },
                      onAccept: (data) {
                        floorItem.hovering = false;
                        floorItem.floorId = 0;
                        floorItem.itemNo = itemPositionArr.length + 1;
                        itemPositionArr.add(floorItem.position);
                      },
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingItemsShop(shop: widget.shop),
          ),
        ],
      ),
    );
  }
}

class FloatingItemsShop extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;
  final Shop shop;

  FloatingItemsShop({this.onPressed, this.tooltip, this.icon, this.shop});

  @override
  _FloatingItemsShopState createState() => _FloatingItemsShopState();
}

class _FloatingItemsShopState extends State<FloatingItemsShop>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;

//  double _fabHeight = 56.0;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget tableIcon() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Table',
        child: Draggable(
          data: ItemFloor(
              direction: Direction.up,
              itemType: ItemType.table,
              position: null,
              shopId: widget.shop.shopId,
              itemNo: null,
              hovering: false),
          child: ImageIcon(
            AssetImage(IMG_TABLE_URL),
          ),
          feedback: Container(
            child: ImageIcon(
              AssetImage(IMG_TABLE_URL),
            ),
          ),
        ),
      ),
    );
  }

  Widget doorIcon() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Door',
        child: Draggable(
          data: ItemFloor(
            direction: Direction.up,
            itemType: ItemType.door,
            position: null,
            shopId: widget.shop.shopId,
            itemNo: null,
          ),
          child: ImageIcon(
            AssetImage(IMG_DOOR_URL),
          ),
          feedback: Container(
            child: ImageIcon(
              AssetImage(IMG_DOOR_URL),
            ),
          ),
        ),
      ),
    );
  }

  Widget floatBtn() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * 2.0,
            0.0,
            0.0,
          ),
          child: tableIcon(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value,
            0.0,
            0.0,
          ),
          child: doorIcon(),
        ),
        floatBtn(),
      ],
    );
  }
}
