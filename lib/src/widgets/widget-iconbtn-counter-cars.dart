import 'package:flutter/material.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.icon,
    this.numOfItems = 0,
    required this.press,
  }) : super(key: key);

  final IconData icon;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        children: [
          Container(
              height: 46,
              width: 46,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                icon,
                color: Colors.black87,
                size: 25,
              )),
          if (numOfItems != 0)
            Positioned(
                top: 2,
                right: 2,
                child: Container(
                  height: 17,
                  width: 17,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.white)),
                  child: Center(
                      child: Text(
                    "$numOfItems",
                    style: TextStyle(
                        fontSize: 10,
                        height: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )),
                ))
        ],
      ),
    );
  }
}
