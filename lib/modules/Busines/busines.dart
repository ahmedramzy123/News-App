import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/modules/card/card_screen.dart';

class BusinesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).business;
        return Scaffold(
          body:ConditionalBuilder(
            condition:list.isNotEmpty ,
            builder: (context)=>Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index)=>CardScreen(list[index]),
                  separatorBuilder: (context,index)=>Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  itemCount: list.length),
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
