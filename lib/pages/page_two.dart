import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterstaj/cubit/page_two_cubit.dart';

import '../entity/weather.dart';
import '../mobx/mobx_model.dart';

SafeArea PageTwo({required double h, required double w, required BuildContext context, required MobxModel refreshObject}){
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: RefreshIndicator(
        onRefresh: () async{
          refreshObject.refreshTrue();
          context.read<PageTwoCubit>().uploadWeather().then((value){
            refreshObject.refreshFalse();
          });
        },
        child: Observer(builder: (_){
          return refreshObject.refresh ? Center(child: SpinKitFadingCircle(
            color: Colors.red,
            size: h/15,
            duration: Duration(milliseconds: 1200),
          ))
              : BlocBuilder<PageTwoCubit, List<WeatherModel>>(
            builder: (context, weatherInfo) {
              if (weatherInfo.isNotEmpty) {
                return ListView.builder(itemCount: 1,itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: h/50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Text("${weatherInfo[index].name}",style: TextStyle(color: Colors.black,),),
                        )
                        ,Text("${weatherInfo[index].temperature}",style: TextStyle(color: Colors.black,),)
                      ],
                    ),
                  );
                });
              } else {
                return Center(
                  child: SpinKitFadingCircle(
                    color: Colors.red,
                    size: h/15,
                    duration: Duration(milliseconds: 1200),
                  ),
                );
              }
            },
          );
        },

        ),
      ),
    ),
  );
}