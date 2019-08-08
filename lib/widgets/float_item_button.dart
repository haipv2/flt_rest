import 'package:flt_rest/commons/const.dart';
import 'package:flt_rest/models/floor_item.dart';
import 'package:flutter/material.dart';

class FloatingItemsShop extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FloatingItemsShop({this.onPressed, this.tooltip, this.icon});

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

  Widget image() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Table',
        child: Draggable(
          data: FloorItem(direction: Direction.up, itemType: ItemType.table),
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

  Widget inbox() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Door',
        child: Draggable(
          data: FloorItem(direction: Direction.up, itemType: ItemType.door),
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

  Widget toggle() {
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
          child: image(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value,
            0.0,
            0.0,
          ),
          child: inbox(),
        ),
        toggle(),
      ],
    );
  }
}
