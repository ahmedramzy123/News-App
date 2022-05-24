import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/modules/card/card_screen.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var sport=NewsCubit.get(context).sports;
        return Scaffold(
          body:ListView.separated(
              itemBuilder: (context,index)=>CardScreen(sport[index]),
              separatorBuilder: (context,index)=>Container(
                height: 1,
                color: Colors.grey,
              ),
              itemCount: sport.length),
        );
      },
    );
  }
}
