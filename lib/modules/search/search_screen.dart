import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/modules/card/card_screen.dart';

class SearchScreen extends StatelessWidget {
TextEditingController search =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body: BlocConsumer<NewsCubit,NewsStates>(
            listener: (context,state){},
            builder: (context,state){

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Colors.black
                          ),
                          borderRadius: BorderRadiusDirectional.circular(15),
                          color: Colors.grey[200]

                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        onChanged: (value)
                        {
                          NewsCubit.get(context).getSearch(value: value);
                        },
                        controller: search,
                        decoration: InputDecoration(
                          hintText:"Search ...",
                          border: InputBorder.none,



                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index)=>CardScreen(NewsCubit.get(context).search[index]),
                          separatorBuilder: (context,index)=>Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          itemCount: NewsCubit.get(context).search.length),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
