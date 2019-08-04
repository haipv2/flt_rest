import 'package:flt_rest/models/food.dart';
import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  final Food food;

  FoodItem({this.food});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.topCenter,
      child: GestureDetector(
//        onTap: () => Navigator.of(context).pushNamed(PAGE_FOOD_DETAIL),
        child: Hero(
          tag: 'food-${food.id}',
          child: Image(
            image: AssetImage(food.image),
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }
}
