import 'package:beginner/src/models/exe5-cars-model.dart';
import 'package:beginner/src/provider/bookmark-model.dart';
import 'package:beginner/src/resources/exercise5-details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class CarsGridView extends StatefulWidget {
  const CarsGridView({
    required this.cars,
    Key? key,
  }) : super(key: key);

  final List<CarsModel> cars;

  @override
  _CarsGridViewState createState() => _CarsGridViewState();
}

class _CarsGridViewState extends State<CarsGridView> {
  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);

    return Container(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: widget.cars.length,
        itemBuilder: (context, index) {
          var item = widget.cars[index];
          return Container(
              child: Card(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Exercise5Details.routeName,
                    arguments: item.id.toString());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Ink.image(
                    image:
                        AssetImage(item.image[0].name),
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      item.name,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '\$',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            item.price[0].price.toStringAsFixed(3),
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: IconButton(
                              onPressed: () {
                                if (!item.isFavourite) {
                                  // Add id to Favourite list
                                  bookmarkBloc.additemsFavourite(item.id);
                                }
                                setState(() {
                                  // Set attribute 'favourite': false -> true
                                  item.isFavourite = true;
                                });
                              },
                              icon: Icon(
                                item.isFavourite
                                    ? Icons.star
                                    : Icons.star_border,
                                color: item.isFavourite
                                    ? Colors.yellow[800]
                                    : null,
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
        },
        staggeredTileBuilder: (index) =>
            new StaggeredTile.count(1, index.isEven ? 1.12 : 1.2),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 6.0,
      ),
    );
  }
}
