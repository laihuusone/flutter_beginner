import 'package:beginner/src/app.dart';
import 'package:beginner/src/provider/bookmark-model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => BookmarkBloc(),
      child: MyApp(),
    ));
