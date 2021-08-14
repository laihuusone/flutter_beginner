import 'package:flutter/material.dart';

class CarDetailPrice extends StatefulWidget {
  const CarDetailPrice({
    Key? key,
    required this.title,
    required this.price,
    required this.priceBackgroundColor,
  }) : super(key: key);

  final String title;
  final double price;
  final bool priceBackgroundColor;

  @override
  _CarDetailPriceState createState() => _CarDetailPriceState();
}

class _CarDetailPriceState extends State<CarDetailPrice> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 120,
      margin: EdgeInsets.fromLTRB(0, 10, 5, 10),
      decoration: BoxDecoration(
          color: widget.priceBackgroundColor
              ? Colors.deepPurple[400]
              : Colors.white70,
          border: Border.all(width: 1, color: Colors.black26),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.priceBackgroundColor
                    ? Colors.white
                    : Colors.black87,
              ),
            ),
            Text(
              widget.price.toStringAsFixed(3),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: widget.priceBackgroundColor
                    ? Colors.white
                    : Colors.black87,
              ),
            )
          ],
        ),
      ),
    );
  }
}
