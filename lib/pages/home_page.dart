import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaj/cubit/home_page_cubit.dart';
import 'package:flutterstaj/cubit/page_two_cubit.dart';
import 'package:flutterstaj/mobx/mobx_model.dart';
import 'package:flutterstaj/pages/page_two.dart';
import 'contact_page.dart';
import 'info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _mobxModel = MobxModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobxModel.packageInfoInit();
    context.read<HomePageCubit>().uploadContacts();
    context.read<PageTwoCubit>().uploadWeather();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    double width = screen.size.width;
    double height = screen.size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 7,
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Image.asset(
            "assets/images/logo.jpeg",
            height: height / 5,
            width: width / 5,
          ),
          bottom: TabBar(tabs: [
            Tab(text: "İletişim",icon: Icon(Icons.phone,),),
            Tab(text: "Hava Durumu",icon: Icon(Icons.info),),
            Tab(text: "Profilim",icon: Icon(Icons.person),)
          ],indicatorColor: Colors.red,
          labelStyle: TextStyle(fontFamily: "TekturRegular"),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,),
         actions: [
           Padding(
             padding: const EdgeInsets.only(right: 15.0),
             child: PopupMenuButton(child: Icon(Icons.more_vert),
             itemBuilder: (context) => [
               PopupMenuItem(value: 1,child: Text("Hakkında"))
             ],onSelected: (itemValue){
               showDialog(context: context, builder: (context) {
                 return AlertDialog(
                     backgroundColor: Colors.white.withOpacity(.7),
                     content: SizedBox(
                       height: height/10,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("Versiyon v${_mobxModel.version}")
                         ],
                       ),
                     ));
               },);
               },),
           )
         ],
        ),
        body: TabBarView(children: [
          ContactPage(h: height,w: width),
          PageTwo(h: height, w: width, context: context, refreshObject: _mobxModel),
          InfoPage(h: height, context: context, refreshObject: _mobxModel)
        ]),
      ),
    );
  }
}

