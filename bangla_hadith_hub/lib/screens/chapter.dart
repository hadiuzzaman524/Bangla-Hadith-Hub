import 'package:bangla_hadith_hub/cubits/data_manager_cubit.dart';
import 'package:bangla_hadith_hub/models/chapter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chapter_details.dart';

class Chapter extends StatefulWidget {
  final String bookKey;

  const Chapter({Key? key, required this.bookKey}) : super(key: key);

  @override
  State<Chapter> createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0)).then((value) async {
      await BlocProvider.of<DataManagerCubit>(context)
          .fetchChapter(widget.bookKey);
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : BlocBuilder<DataManagerCubit, DataManagerState>(
                builder: (context, state) {
                  List<ChapterDetails> list =
                      chapterNameFromJson(state.chapterName);
                  return ListView.builder(
                    itemBuilder: (ctx, index) {
                      return ListTile(
                        title: Text(list[index].nameBengali),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => ChapterContent(
                                path:
                                    "${widget.bookKey}/${list[index].chSerial}",
                              ),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: list.length,
                  );
                },
              ),
      ),
    );
  }
}
