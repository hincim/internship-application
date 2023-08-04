
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SafeArea ContactPage({required double h, required double w}){

  return SafeArea(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/images/logo.jpeg",height: h/5, width: w/2,)),
            SizedBox(height: h/50,),
            Text("ktun".tr,style: TextStyle(fontSize: w/20,fontFamily: "TekturRegular"),),
            SizedBox(height: h/400,),
            Text("ktun_sub".tr,style: TextStyle(fontSize: w/22,fontFamily: "TekturRegular"),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text("contact_phone".tr +": +90 332 205 1111"),
                ),
                Divider(thickness: 1.2,indent: w/30,endIndent: w/30,),

                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text("address".tr,textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
        ],
      )
      ],
    ),
  );
}