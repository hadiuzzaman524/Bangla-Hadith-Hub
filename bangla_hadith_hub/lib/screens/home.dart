import 'package:bangla_hadith_hub/cubits/data_manager_cubit.dart';
import 'package:bangla_hadith_hub/models/name_of_book.dart';
import 'package:bangla_hadith_hub/screens/chapter.dart';
import 'package:bangla_hadith_hub/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  return ListView.builder(
                    itemBuilder: (ctx, index) {
                      return list[index].bookKey != ""
                          ? ListTile(
                              title: Text(list[index].nameBengali),
                              subtitle: Text(list[index].bookKey),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => Chapter(
                                            bookKey: list[index].bookKey)));
                              },
                            )
                          : Container();
                    },
                    itemCount: list.length,
                  );
                },
              ),
      ),
    );
  }
}
