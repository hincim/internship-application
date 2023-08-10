/*


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterstaj/global_widget/toast.dart';
import 'package:flutterstaj/mobx/whole_model.dart';
import 'package:get/get.dart';

import '../cubit/home_page_cubit.dart';
import '../entity/users.dart';
import '../utils/practical_method.dart';

SafeArea InfoPage({required double h, required BuildContext context, required WholeModel refreshObject}){
   return SafeArea(
     child: Padding(
       padding: const EdgeInsets.only(top: 4.0),
       child: RefreshIndicator(
         onRefresh: () async {
          refreshObject.refresh(true);
           if(refreshObject.refreshState){
             print("object");
           }
           context.read<HomePageCubit>().uploadContacts()
               .onError((error, stackTrace){
             refreshObject.refresh(false);
              showToast("Hata daha sonra tekrar deneyin");
           })
           .catchError((value){
             refreshObject.refresh(false);
             showToast("Hata daha sonra tekrar deneyin");
           }).then((value) {
             refreshObject.refresh(false);

           });
         },
         child: Observer(builder: (_) {
           return refreshObject.refreshState
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
                                     Expanded(
                                       child: Text(
                                         "${person.userTel}",
                                         style: TextStyle(fontSize: 20),
                                       ),
                                     )
                                   ],
                                 ),
                               )),
                         ));
                   },
                 );
               } else {
                 return refreshObject.refreshState ?Center(
                   child: SpinKitFadingCircle(
                     color: Colors.red,
                     size: h/15,
                     duration: Duration(milliseconds: 1200),
                   ),
                 ):Center(
                  child: Text("no_data".tr),
                 );
               }
             },
           );
         }),
       ),
     ),
   );
}*/
