import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/modules/card/card_screen.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var science = NewsCubit.get(context).science;
        return Scaffold(
          body: ConditionalBuilder(
            condition: science.isNotEmpty,
            builder: (context)=>ListView.separated(
                itemBuilder: (context,index)=>CardScreen(science[index]),
                separatorBuilder:  (context,index)=>Container(
                  height: 1,
                  color: Colors.grey,
                ),
                itemCount: science.length),
            fallback: (context)=>Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
