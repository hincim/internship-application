

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../cubit/home_page_cubit.dart';
import '../entity/users.dart';
import '../mobx/mobx_model.dart';
import '../utils/practical_method.dart';

SafeArea InfoPage({required double h, required BuildContext context, required MobxModel refreshObject}){
   return SafeArea(
     child: Padding(
       padding: const EdgeInsets.only(top: 4.0),
       child: RefreshIndicator(
         onRefresh: () async {
           refreshObject.refreshTrue();
           if(refreshObject.refresh){
             print("object");
           }
           context.read<HomePageCubit>().uploadContacts().then((value) {
             refreshObject.refreshFalse();
           });
         },
         child: Observer(builder: (_) {
           return refreshObject.refresh
               ? Center(child: SpinKitFadingCircle(
             color: Colors.red,
             size: h/15,
             duration: Duration(milliseconds: 1200),
           ))
               : BlocBuilder<HomePageCubit, List<Users>>(
             builder: (context, usersList) {
               if (usersList.isNotEmpty) {
                 return ListView.builder(
                   itemCount: usersList.length,
                   itemBuilder: (context, index) {
                     var person = usersList[index];
                     return SizedBox(
                         height: 100,
                         child: Padding(
                           padding: const EdgeInsets.only(
                               left: 4.0, right: 4.0),
                           child: Card(
                               color: Color(
                                   PracticalMethod.HexaColorConvertColor(
                                       "#E2E2E3")),
                               elevation: 2.0,
                               child: Padding(
                                 padding: const EdgeInsets.all(18.0),
                                 child: Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.center,
                                   children: [
                                     Text(
                                       "${person.userName}",
                                       style: const TextStyle(
                                           fontFamily: "TekturRegular",
                                           fontSize: 20),
                                     ),
                                     Spacer(),
                                     Text(
                                       "${person.userTel}",
                                       style: TextStyle(fontSize: 20),
                                     )
                                   ],
                                 ),
                               )),
                         ));
                   },
                 );
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
         }),
       ),
     ),
   );
}