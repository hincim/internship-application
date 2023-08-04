/*
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterstaj/mobx/whole_model.dart';

import '../utils/practical_method.dart';

SafeArea MyProfilePage({required double h, required BuildContext context, required WholeModel refreshObject,
required fireStoreDao}){
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: RefreshIndicator(
        onRefresh: () async {
          refreshObject.refresh(true);
          if(refreshObject.refreshState){
            print("object");
          }
          refreshObject.refresh(false);

        },
        child: Observer(builder: (_) {
          return refreshObject.refreshState
              ? Center(child: SpinKitFadingCircle(
            color: Colors.red,
            size: h/15,
            duration: Duration(milliseconds: 1200),
          ))
              : StreamBuilder(
            stream: fireStoreDao,
            builder: (context, snapshot){
              return !snapshot.hasData
                  ? Center(
                child: const CircularProgressIndicator(
                  color: Colors.black38,
                ),
              ):ListView.builder(
                  itemCount: snapshot.data?.docs.length
                  ,itemBuilder: (context, index) {
                var myWords = snapshot.data?.docs[index];
              },);
            },
          );

        }),
      ),
    ),
  );
}*/
