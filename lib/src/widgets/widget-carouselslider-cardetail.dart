import 'package:beginner/src/common/data_source.dart';
import 'package:beginner/src/models/exe5-cars-model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarDetailCarouselSlider extends StatefulWidget {
  const CarDetailCarouselSlider({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<Images> images;

  @override
  _CarDetailCarouselSliderState createState() =>
      _CarDetailCarouselSliderState();
}

class _CarDetailCarouselSliderState extends State<CarDetailCarouselSlider> {
  //
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        CarouselSlider(
            items: widget.images.map((img) {
              return Container(
                child: Image.asset(
                  img.name,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: size.height * 0.3,
              initialPage: 0,
              viewportFraction: 1,
              autoPlay: false,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setImage(widget.images, index);
                setState(() {
                  _current = index;
                });
              },
            )),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(widget.images, (index, img) {
            return Container(
              width: 40,
              height: 10,
              margin: EdgeInsets.only(top: 5, right: 2, left: 2),
              color: _current == index
                  ? DataSource.mapColors[widget.images[index].color]
                  : Colors.transparent,
            );
          }),
        ),
        Divider(
          thickness: 2,
          indent: 121,
          endIndent: 121,
        ),
      ],
    );
  }

  void setImage(List<Images> images, int index){
    images.forEach((item) {
      setState(() {
        if (images.indexOf(item) == index) {
          item.isChoice = true;
        } else {
          item.isChoice = false;
        }
      });
    });
  }
}


