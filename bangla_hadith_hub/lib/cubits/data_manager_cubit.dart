import 'package:bangla_hadith_hub/constants/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'data_manager_state.dart';

class DataManagerCubit extends Cubit<DataManagerState> {
  DataManagerCubit() : super(DataManagerState(fetchedData: ""));

  Future<void> fetchDataFromInternet() async {

    final response = await http.get(Uri.parse(bookName)).catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Connection OK");
    } else {
      print("Connection error ${response.statusCode}");
    }
    emit(DataManagerState(fetchedData: response.body));
  }
}
