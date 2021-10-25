import 'package:bangla_hadith_hub/cubits/data_manager_cubit.dart';
import 'package:bangla_hadith_hub/models/chapter_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChapterContent extends StatefulWidget {
  final String path;

  const ChapterContent({Key? key, required this.path}) : super(key: key);

  @override
  State<ChapterContent> createState() => _ChapterContentState();
}

class _ChapterContentState extends State<ChapterContent> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 0)).then((value) async {
      await BlocProvider.of<DataManagerCubit>(context)
          .fetchChapterContent(widget.path);
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
                  List<Content> list =
                      chapterContentFromJson(state.chapterContent);

                  return ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text("Hadith No: ${list[index].hadithNo}"),
                          ),
                          ListTile(
                            title: Text("${list[index].hadithArabic}"),
                          ),
                          ListTile(
                            title: Text("${list[index].hadithBengali}"),
                          ),
                          ListTile(
                            title: Text("${list[index].hadithEnglish}"),
                          ),
                          Divider(),
                        ],
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
