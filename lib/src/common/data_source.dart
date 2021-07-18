import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataSource {
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
