import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/modules/search/search_screen.dart';

class LayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: NewsCubit.get(context).title[NewsCubit.get(context).curentindex],
            actions: [
              IconButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
              }, icon: Icon(Icons.search_sharp))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: NewsCubit.get(context).curentindex,
            onTap: (index)
            {
              NewsCubit.get(context).ChangeBotom(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.business),label:"Busines"),
              BottomNavigationBarItem(icon: Icon(Icons.sports),label:"Sports"),
              BottomNavigationBarItem(icon: Icon(Icons.science),label:"Science"),
            ],
          ),
          body: NewsCubit.get(context).screen[NewsCubit.get(context).curentindex],

        );
      },

    );
  }
}
