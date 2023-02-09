import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/appstate.dart';
import 'package:news_app/screens/business.dart';
import 'package:news_app/screens/scinece.dart';
import 'package:news_app/screens/settinge.dart';
import 'package:news_app/screens/sports.dart';
import 'package:news_app/sharead/network/dio_helper.dart';

class AppCubit extends Cubit<Appstate> {
  AppCubit() : super(InitState());
  static AppCubit get(context) => BlocProvider.of(context);

  int curentindex = 0;
  List<Widget> pages = [
    const Business(),
    Sports(),
    Science(),
    Settinge(),
  ];
  changbottom(index) {
    curentindex = index;
    emit(ChangBottomCurentState());
  }

  late List<dynamic> business = [];
  getbussiness() async {
    emit(NewsGetBUsinessLoding());
    await DioHelper.getdata(url: 'v2/top-headlines', query: {
      "country": 'eg',
      "category": 'business',
      "apiKey": '707702dd760848ff9e4498c64ad8326b',
    }).then((value) {
      business = value.data["articles"];
      print(
          "listof bussiness ==================================${business[0]["title"]}");

      emit(NewsGetBUsinessSucces());
    });
  }

  late List<dynamic> sports = [];
  getsports() async {
    emit(NewsGetSportsLoding());
    await DioHelper.getdata(url: 'v2/top-headlines', query: {
      "country": 'eg',
      "category": 'sports',
      "apiKey": '707702dd760848ff9e4498c64ad8326b',
    }).then((value) {
      sports = value.data["articles"];
      print(
          "listof bussiness ==================================${sports[0]["title"]}");
      emit(NewsGetSportsSucces());
    });
  }

  String dark = "dark";
  void changAppamaode() {
    if (dark == "dark") {
      dark = "light";
    } else {
      dark = "dark";
    }
    emit(AppChangeModeState());
  }

  late List<dynamic> technology = [];
  gettechnology() async {
    emit(NewsGetSportsLoding());
    await DioHelper.getdata(url: 'v2/top-headlines', query: {
      "country": 'eg',
      "category": 'technology',
      "apiKey": '707702dd760848ff9e4498c64ad8326b',
    }).then((value) {
      technology = value.data["articles"];
      emit(NewsGetSportsSucces());
    });
  }

  late List<dynamic> general = [];
  getsgeneral() async {
    emit(NewsGetSportsLoding());
    await DioHelper.getdata(url: 'v2/top-headlines', query: {
      "country": 'eg',
      "category": 'general',
      "apiKey": '707702dd760848ff9e4498c64ad8326b',
    }).then((value) {
      general = value.data["articles"];

      emit(NewsGetSportsSucces());
    });
  }

  late List<dynamic> health = [];
  gethealth() async {
    emit(NewsGetSportsLoding());
    await DioHelper.getdata(url: 'v2/top-headlines', query: {
      "country": 'eg',
      "category": 'health',
      "apiKey": '707702dd760848ff9e4498c64ad8326b',
    }).then((value) {
      health = value.data["articles"];

      emit(NewsGetSportsSucces());
    });
  }

  late List<dynamic> science = [];
  getscience() async {
    emit(NewsGetSportsLoding());
    await DioHelper.getdata(url: 'v2/top-headlines', query: {
      "country": 'eg',
      "category": 'science',
      "apiKey": '707702dd760848ff9e4498c64ad8326b',
    }).then((value) {
      science = value.data["articles"];

      emit(NewsGetSportsSucces());
    });
  }
}
