import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/modules/Busines/busines.dart';
import 'package:newsapp/modules/science/science.dart';
import 'package:newsapp/modules/sports/sports.dart';
import 'package:newsapp/network/dio/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(InitialNewsState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int curentindex =0;
  void ChangeBotom(index)
  {
    curentindex=index;
    screen[index];
    emit(ChangeBottomNav());
  }
  List<Widget> screen=
  [
    BusinesScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<Widget> title=
  [
    Text("Busines",),
    Text("Sports"),
    Text("Science"),
  ];
  List<dynamic> business=[];
  void getDataBusiness()
  {
    emit(NewsLoadingDataState());
    DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country":"eg",
          "category":"business",
          "apiKey":"99fc70fd00da41a9a9ded85a9171d87c"
        }).then((value)
    {
      business=value.data["articles"];
      print(business[0]["title"]);
      emit(NewsSuccessDataState());
    });
  }
  List<dynamic> sports=[];
  void getDataSports()
  {
    emit(NewsLoadingDataState());
    DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country":"eg",
          "category":"sports",
          "apiKey":"99fc70fd00da41a9a9ded85a9171d87c"
        }).then((value)
    {
      sports=value.data["articles"];
      print(business[0]["title"]);
      emit(NewsSuccessDataState());
    });
  } List<dynamic> science=[];
  void getDataScience()
  {
    emit(NewsLoadingDataScienceState());
    DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country":"eg",
          "category":"science",
          "apiKey":"99fc70fd00da41a9a9ded85a9171d87c"
        }).then((value)
    {
      science=value.data["articles"];
      print(business[0]["title"]);
      emit(NewsSuccessDataScienceState());
    });
  }
  List <dynamic> search=[];
  void getSearch({required String value})
  {
    emit(NewsLoadingDataSearchState());
    DioHelper.getData(
        url: "v2/everything",
        query:
        {
          "q":"${value}",
          "apiKey":"99fc70fd00da41a9a9ded85a9171d87c"
        }).then((value)
    {
     search=value.data["articles"];
     emit(NewsSuccessDataSearchState());
    });
  }

}