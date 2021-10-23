import 'package:bangla_hadith_hub/cubits/data_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: RaisedButton(
            onPressed: () {
              BlocProvider.of<DataManagerCubit>(context)
                  .fetchDataFromInternet();
            },
            child: Text("Click here"),
          ),
        ),
      ),
    );
  }
}
