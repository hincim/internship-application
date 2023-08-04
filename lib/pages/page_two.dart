import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterstaj/cubit/page_two_cubit.dart';
import 'package:get/get.dart';

import '../entity/weather.dart';
import '../mobx/whole_model.dart';

SafeArea PageTwo({required double h, required double w, required BuildContext context
  , required WholeModel refreshObject, DateTime? time, @required AnimationController? animationController,
  @required Animation<double>?  animationValue}){
  return SafeArea(
    child: RefreshIndicator(
      onRefresh: () async{
        animationController?.forward();
      refreshObject.refresh(true);
        context.read<PageTwoCubit>().uploadWeather(city: refreshObject.city == ""?"konya":refreshObject.city).then((value){
          refreshObject.refresh(false);
        });
      },
      child: Observer(builder: (_){
        return refreshObject.refreshState ? Center(child: SpinKitFadingCircle(
          color: Colors.red,
          size: h/15,
          duration: Duration(milliseconds: 1200),
        ))
            : BlocBuilder<PageTwoCubit, List<WeatherModel>>(
          builder: (context, weatherInfo) {
            if (weatherInfo.isNotEmpty) {
              return ListView.builder(itemCount: weatherInfo.length,itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        Image(
                          height: h,
                          width: w,
                          image: AssetImage(weatherInfo[index].weatherId<600?"assets/images/cloudy.png":time!.hour >= 19||time.hour<=5?
                          "assets/images/night.png":"assets/images/sunny.png"),
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0,right: 4.0,top: 4),
                          child: Transform.translate(
                            offset: Offset(animationValue!.value,0.0),
                            child: Card(
                              shadowColor: Colors.white,
                              color: Colors.black.withOpacity(0.7),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0,left: 6.0,right: 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text("city".tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${weatherInfo[index].name}",style: TextStyle(color: Colors.white,),),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("temperature".tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${weatherInfo[index].temperature.toInt()}°",style: TextStyle(color: Colors.white,),),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("sensedTemperature".tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${weatherInfo[index].feelsLikeTemperature.toInt()}°",style: TextStyle(color: Colors.white,),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
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
  );
}