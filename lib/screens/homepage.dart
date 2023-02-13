import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:news_app/cubit/appcubit.dart';
import 'package:news_app/cubit/appstate.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstate>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return DefaultTabController(
            length: 6,
            child: Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors.teal,
                elevation: 0,
                foregroundColor: Colors.white,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.teal,
                ),
                title: const Text(
                  "News App",
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  IconButton(
                      onPressed: () {
                        cubit.changAppamaode();
                      },
                      icon: const Icon(Icons.brightness_2_outlined)),
                ],
                bottom: TabBar(
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overlayColor:
                      MaterialStateColor.resolveWith((states) => Colors.teal),
                  dividerColor: Colors.black,
                  isScrollable: true,
                  labelColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: "Home",
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    Tab(
                      text: "Business",
                      icon: Icon(
                        Icons.business,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    Tab(
                      text: "Sports",
                      icon: Icon(
                        Icons.sports,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    Tab(
                      text: "Science",
                      icon: Icon(
                        Icons.science,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    Tab(
                      text: "Health",
                      icon: Icon(
                        Icons.health_and_safety,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    Tab(
                      text: "Technology",
                      icon: Icon(
                        Icons.computer,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              // bottomNavigationBar: BottomNavigationBar(
              //     onTap: ((index) async {
              //       cubit.changbottom(index);
              //       if (index == 0 && cubit.business.length == 0) {
              //         await cubit.getbussiness();
              //       } else if (index == 1 && cubit.sports.length == 0) {
              //         await cubit.getsports();
              //       }
              //     }),
              //     currentIndex: cubit.curentindex,
              //     items: const [
              //       BottomNavigationBarItem(
              //           icon: Icon(Icons.business), label: "business"),
              //       BottomNavigationBarItem(
              //           icon: Icon(Icons.sports), label: "sports"),
              //       BottomNavigationBarItem(
              //           icon: Icon(Icons.science), label: "scinece"),
              //       BottomNavigationBarItem(
              //           icon: Icon(Icons.settings), label: "settinge"),
              //     ]),
              body: TabBarView(
                children: cubit.pages,
              ),
            ));
      },
    );
  }
}
