import 'package:beginner/src/models/exe5-cars-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'assets_common.dart';


class DataSource {
  static final List<CarsModel> cars = [
    CarsModel(
        id: '1',
        name: 'Ferrari 488 Spider',
        price: [
          Prices(period: "12 Month", price: 3.986, isChoice: true),
          Prices(period: "6 Month", price: 4.240, isChoice: false),
          Prices(period: "1 Month", price: 4.890, isChoice: false)
        ],
        image: [
          Images(name: AssetsCommon.imageExe5Ferrari1, color: "Blue", isChoice: true),
          Images(name: AssetsCommon.imageExe5Ferrari2, color: "White", isChoice: false),
          Images(name: AssetsCommon.imageExe5Ferrari3, color: "Black", isChoice: false)
        ],
        height: 1.475,
        length: 4.640,
        width: 1.790,
        weight: 1.362,
        isFavourite: false,
        isCart: false,
        checkBoxCart: false,
        numberCar: 1),
    CarsModel(
        id: '2',
        name: 'Range Rover Sport',
        price: [
          Prices(period: "12 Month", price: 4.350, isChoice: true),
          Prices(period: "6 Month", price: 4.840, isChoice: false),
          Prices(period: "1 Month", price: 5.090, isChoice: false)
        ],
        image: [
          Images(name: AssetsCommon.imageExe5RangeRover1, color: "White", isChoice: true),
          Images(name: AssetsCommon.imageExe5RangeRover2, color: "Black", isChoice: false),
          Images(name: AssetsCommon.imageExe5RangeRover3, color: "White", isChoice: false)
        ],
        height: 1.345,
        length: 5.040,
        width: 1.670,
        weight: 1.212,
        isFavourite: false,
        isCart: false,
        checkBoxCart: false,
        numberCar: 1),
    CarsModel(
        id: '3',
        name: 'Alfa Rameo 4C',
        price: [
          Prices(period: "12 Month", price: 380.0, isChoice: true),
          Prices(period: "6 Month", price: 440.0, isChoice: false),
          Prices(period: "1 Month", price: 490.0, isChoice: false)
        ],
        image: [
          Images(name: AssetsCommon.imageExe5AlfaRameo1, color: "Red", isChoice: true),
          Images(name: AssetsCommon.imageExe5AlfaRameo2, color: "Blue", isChoice: false),
          Images(name: AssetsCommon.imageExe5AlfaRameo3, color: "Yellow", isChoice: false)
        ],
        height: 1.655,
        length: 4.370,
        width: 1.640,
        weight: 1.730,
        isFavourite: false,
        isCart: false,
        checkBoxCart: false,
        numberCar: 1),
    CarsModel(
        id: '4',
        name: 'Mercedes C300',
        price: [
          Prices(period: "12 Month", price: 1.850, isChoice: true),
          Prices(period: "6 Month", price: 2.310, isChoice: false),
          Prices(period: "1 Month", price: 2.560, isChoice: false)
        ],
        image: [
          Images(name: AssetsCommon.imageExe5Mercedes1, color: "Blue", isChoice: true),
          Images(name: AssetsCommon.imageExe5Mercedes2, color: "Red", isChoice: false),
          Images(name: AssetsCommon.imageExe5Mercedes3, color: "White", isChoice: false)
        ],
        height: 1.365,
        length: 4.568,
        width: 1.699,
        weight: 1.842,
        isFavourite: false,
        isCart: false,
        checkBoxCart: false,
        numberCar: 1),
    CarsModel(
        id: '5',
        name: 'Civic Type R 2019',
        price: [
          Prices(period: "12 Month", price: 4.350, isChoice: true),
          Prices(period: "6 Month", price: 4.800, isChoice: false),
          Prices(period: "1 Month", price: 5.100, isChoice: false)
        ],
        image: [
          Images(name: AssetsCommon.imageExe5Civic1, color: "Yellow", isChoice: true),
          Images(name: AssetsCommon.imageExe5Civic2, color: "Sliver", isChoice: false),
          Images(name: AssetsCommon.imageExe5Civic3, color: "Blue", isChoice: false)
        ],
        height: 1.447,
        length: 4.712,
        width: 1.680,
        weight: 1.174,
        isFavourite: false,
        isCart: false,
        checkBoxCart: false,
        numberCar: 1),
    CarsModel(
        id: '6',
        name: 'Lamborghini Urus',
        price: [
          Prices(period: "12 Month", price: 222.000, isChoice: true),
          Prices(period: "6 Month", price: 224.150, isChoice: false),
          Prices(period: "1 Month", price: 225.770, isChoice: false)
        ],
        image: [
          Images(name: AssetsCommon.imageExe5Lamborghini1, color: "Yellow", isChoice: true),
          Images(name: AssetsCommon.imageExe5Lamborghini2, color: "Black", isChoice: false),
          Images(name: AssetsCommon.imageExe5Lamborghini3, color: "Green", isChoice: false)
        ],
        height: 1.638,
        length: 5.112,
        width: 2.016,
        weight: 1.958,
        isFavourite: false,
        isCart: false,
        checkBoxCart: false,
        numberCar: 1),
  ];

  static final Map mapColors = {
    'Blue': Colors.blue[700],
    'Green': Colors.green[700],
    'Yellow': Colors.yellow[700],
    'White': Colors.white,
    'Black': Colors.black,
    'Red': Colors.red[500],
    'Sliver': Colors.white54
  };

  static final List services = [
    {'name': 'All Services', 'icon': Icons.select_all_rounded},
    {'name': 'Mobile Credit', 'icon': Icons.mobile_screen_share_rounded},
    {'name': 'Electricity', 'icon': Icons.electrical_services_rounded},
    {'name': 'Water', 'icon': Icons.water_rounded},
    {'name': 'Internet', 'icon': Icons.wifi_rounded},
    {'name': 'Cable TV', 'icon': Icons.tv_rounded},
    {'name': 'Installment', 'icon': Icons.money_rounded},
    {'name': 'Insurance', 'icon': Icons.security_rounded}
  ];

  static final List<Color> colors = [
    Colors.green.shade100,
    Colors.green.shade200,
    Colors.green.shade300,
    Colors.green.shade400,
    Colors.green.shade500,
    Colors.green.shade600,
    Colors.green.shade700
  ];
}
