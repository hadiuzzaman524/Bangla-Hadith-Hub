import 'package:bangla_hadith_hub/cubits/data_manager_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MultiBlocProvider(
          providers: [BlocProvider(create: (context) => DataManagerCubit())],
          child: MyApp()),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
