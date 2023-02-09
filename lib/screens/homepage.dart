import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
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

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              cubit.getbussiness();
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
            ),
            title: const Text(
              "News App",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    cubit.changAppamaode();
                  },
                  icon: Icon(Icons.brightness_2_outlined)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: ((index) async {
                cubit.changbottom(index);
                if (index == 0 && cubit.business.length == 0) {
                  await cubit.getbussiness();
                } else if (index == 1 && cubit.sports.length == 0) {
                  await cubit.getsports();
                }
              }),
              currentIndex: cubit.curentindex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: "business"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: "sports"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: "scinece"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "settinge"),
              ]),
          body: cubit.pages[cubit.curentindex],
        );
      },
    );
  }
}
