import 'package:flt_rest/models/food.dart';
import 'package:flutter/material.dart';

class ShopMenuItem extends StatelessWidget {
  final Food food;
  ShopMenuItem(this.food){
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Image(
                  image: AssetImage('${food.image}'),
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text('${food.name}'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
