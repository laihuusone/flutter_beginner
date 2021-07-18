import 'package:flutter/material.dart';
import 'package:beginner/src/common/assets_common.dart';
import 'package:beginner/src/common/data_source.dart';
import 'package:flutter/rendering.dart';

class Exercise3 extends StatelessWidget {
  const Exercise3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 170,
              color: Colors.amber,
              child: Image.asset(
                AssetsCommon.imageExe2,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: TextFormField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Ongoing Promo",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Stack(
              children: [
                Container(
                    height: 150,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: ExactAssetImage(AssetsCommon.imageExe3),
                        fit: BoxFit.cover,
                      ),
                    )),
                Positioned(
                  bottom: 15,
                  right: 40,
                  child: Container(
                    height: 30,
                    width: 130,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amber[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Sure, Let's go!",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Feature Service",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Container(
              height: 250,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemCount: DataSource.services.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green[100],
                          ),
                          child: Icon(DataSource.services[index]['icon'], color: Colors.green[900],),
                        ),
                        SizedBox(height: 7,),
                        Text(DataSource.services[index]['name'], style: TextStyle(fontWeight: FontWeight.w400,))
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
