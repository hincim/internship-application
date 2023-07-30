
import 'package:flutter/material.dart';

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
            Text("KONYA TEKNİK ÜNİVERSİTESİ",style: TextStyle(fontSize: w/20,fontFamily: "TekturRegular"),),
            SizedBox(height: h/400,),
            Text("Gelişimin Öncüsü",style: TextStyle(fontSize: w/22,fontFamily: "TekturRegular"),),
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
                  child: Text("Telefon: +90 332 205 1111"),
                ),
                Divider(thickness: 1.2,indent: w/30,endIndent: w/30,),

                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text("Adres: Akademi Mahallesi, "
                      "Yeni İstanbul Caddesi No: 235/1, 42250 "
                      "Selçuklu/Konya",textAlign: TextAlign.center),
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