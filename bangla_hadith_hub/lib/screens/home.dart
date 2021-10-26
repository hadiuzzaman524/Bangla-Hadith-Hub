import 'package:bangla_hadith_hub/cubits/data_manager_cubit.dart';
import 'package:bangla_hadith_hub/models/name_of_book.dart';
import 'package:bangla_hadith_hub/screens/chapter.dart';
import 'package:bangla_hadith_hub/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // fetch data from server
    Future.delayed(Duration(seconds: 0)).then((value) async {
      print("Collecting...");
      await BlocProvider.of<DataManagerCubit>(context).fetchDataFromInternet();
      print("Fetched");
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
            ? SplashScreen()
            : BlocBuilder<DataManagerCubit, DataManagerState>(
                builder: (context, state) {
                  List<Welcome> list = welcomeFromJson(state.fetchedData);
                  List<Welcome> newList = [];
                  for (int index = 0; index < list.length; index++)
                    if (list[index].bookKey != "") newList.add(list[index]);

                  return GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      for (int index = 0; index < newList.length; index++)
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                        Chapter(bookKey: list[index].bookKey)));
                          },
                          child: Container(
                            color: Colors.green,
                            child: Text(newList[index].nameBengali),
                          ),
                        )
                    ],
                  );
                },
              ),
      ),
    );
  }
}

/*
  return
 */
