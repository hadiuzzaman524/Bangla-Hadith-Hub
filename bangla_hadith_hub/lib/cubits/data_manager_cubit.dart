import 'package:bangla_hadith_hub/constants/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'data_manager_state.dart';

class DataManagerCubit extends Cubit<DataManagerState> {
  DataManagerCubit()
      : super(DataManagerState(
            fetchedData: "", chapterName: "", chapterContent: ''));

  Future<void> fetchDataFromInternet() async {
    final response =
        await http.get(Uri.parse(bookName)).catchError((Object error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Connection OK");
    } else {
      print("Connection error ${response.statusCode}");
    }
    emit(DataManagerState(
        fetchedData: response.body,
        chapterName: state.chapterName,
        chapterContent: state.chapterContent));
  }

  Future<void> fetchChapter(String bookKey) async {
    final response = await http
        .get(Uri.parse(bookName + "/" + bookKey))
        .catchError((Object error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Connection OK");
    } else {
      print("Connection error ${response.statusCode}");
    }
    emit(DataManagerState(
        fetchedData: state.fetchedData,
        chapterName: response.body,
        chapterContent: state.chapterContent));
  }

  Future<void> fetchChapterContent(String path) async {
    final response = await http
        .get(Uri.parse(bookName + "/" + path))
        .catchError((Object error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Connection OK");
    } else {
      print("Connection error ${response.statusCode}");
    }
    emit(DataManagerState(
        fetchedData: state.fetchedData,
        chapterName: state.chapterName,
        chapterContent: response.body));
  }
}
