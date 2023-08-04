import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterstaj/cubit/home_page_cubit.dart';
import 'package:flutterstaj/cubit/page_two_cubit.dart';
import 'package:flutterstaj/mobx/whole_model.dart';
import 'package:flutterstaj/pages/page_two.dart';
import 'package:get/get.dart';
import '../cloud/auth.dart';
import '../global_widget/toast.dart';
import '../repo/cloud_user_Dao.dart';
import 'contact_page.dart';
import 'info_page.dart';
import 'login_page.dart';
import 'my_profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  final _wholeModel = WholeModel();
  late TabController _tabController;
  var time = DateTime.now();

  late AnimationController animasyonKontrol;
  late Animation<double> translateAnimasyonDegerleri;

  final CloudUserDao _fireStoreServiceDao = CloudUserDao();
  final AuthService _authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabChange);
    _wholeModel.packageInfoInit();
    _wholeModel.refresh(true);
    context.read<HomePageCubit>().uploadContacts()
        .catchError((value){
      _wholeModel.refresh(false);
      showToast("Kişiler sayfası yüklenemedi");
    })
        .onError((error, stackTrace){
      _wholeModel.refresh(false);
      showToast("Kişiler sayfası yüklenemedi");
    });
    context.read<PageTwoCubit>().uploadWeather().whenComplete((){
      _wholeModel.refresh(false);
    });

    animasyonKontrol = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    translateAnimasyonDegerleri = Tween(begin: -800.0,end: 0.0).animate(CurvedAnimation(parent: animasyonKontrol, curve: Curves.easeInOut))..addListener(() {
      setState(() {});
    });
  }

  void _handleTabChange() {
    _wholeModel.handleTabChange(_tabController);
  }
  @override
  void dispose() {
    _tabController.dispose();
    animasyonKontrol.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    double width = screen.size.width;
    double height = screen.size.height;

    return Observer(builder: (_){
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              elevation: 7,
              centerTitle: true,
              backgroundColor: Colors.red,
              title: _wholeModel.tabsIndex == 1 && _wholeModel.appBarControl?
              TextField(
                cursorColor: Colors.transparent,
                cursorRadius: Radius.circular(200),
                onSubmitted: _onSubmitted,
                autofocus: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: width/40, vertical: height/200),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "enter_city".tr,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0),),
                      borderSide: BorderSide(color:Colors.black,width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0),),
                      borderSide: BorderSide(color:Colors.red),
                    ),
                   ),
              ):Image.asset("assets/images/logo.jpeg",height: height/5, width: width/5,),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _wholeModel.tabsIndex == 1?Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){
                          _wholeModel.appBarControlled();
                        }, icon: Icon(_wholeModel.appBarControl?Icons.cancel:Icons.search)),
                        menuButton(height: height)
                      ],) :
                    menuButton(height: height)
                  ],
                )],
              bottom: TabBar(tabs: [
                Tab(text: "contact".tr,icon: Icon(Icons.phone,),),
                Tab(text: "weather".tr,icon: Icon(Icons.info),),
                Tab(text: "my_profile".tr,icon: Icon(Icons.person),)
              ],indicatorColor: Colors.red,
                labelStyle: TextStyle(fontFamily: "TekturRegular"),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                controller: _tabController,)
          ),
          body: _wholeModel.refreshState ? Center(child: SpinKitFadingCircle(
            color: Colors.red,
            size: height/15,
            duration: Duration(milliseconds: 1200),
          ))
              :TabBarView(
              controller: _tabController,
              children: [
            ContactPage(h: height,w: width),
            PageTwo(h: height, w: width, context: context, refreshObject: _wholeModel, time: time,animationController: _tabController.index == 1?animasyonKontrol:null,
            animationValue: translateAnimasyonDegerleri),
/*
            InfoPage(h: height, context: context, refreshObject: _wholeModel)
*/
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: RefreshIndicator(
                  onRefresh: () async {
                    _wholeModel.refresh(true);
                    if(_wholeModel.refreshState){
                      _fireStoreServiceDao.getUser();
                    }
                    _wholeModel.refresh(false);

                  },
                  child: Observer(builder: (_) {
                    return _wholeModel.refreshState
                        ? Center(child: SpinKitFadingCircle(
                      color: Colors.red,
                      size: height/15,
                      duration: Duration(milliseconds: 1200),
                    ))
                        : StreamBuilder(
                      stream: _fireStoreServiceDao.getUser(),
                      builder: (context, snapshot){
                        return !snapshot.hasData
                            ? Center(
                          child: const CircularProgressIndicator(
                            color: Colors.black38,
                          ),
                        ):ListView.builder(
                          itemCount: snapshot.data?.docs.length
                          ,itemBuilder: (context, index) {
                          var user = snapshot.data?.docs[index];
                          print(user?["email"]);
                          return Column(
                            children: [
                              Card(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text("city".tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${user?["email"]}",style: TextStyle(color: Colors.white,),),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },);
                      },
                    );

                  }),
                ),
              ),
            )
          ]),
        ),
      );
    });
  }
  Padding menuButton({required double height}){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: PopupMenuButton(child: Icon(Icons.more_vert),
        itemBuilder: (context) => [
          PopupMenuItem(value: 1,child: Text("about".tr)),
          PopupMenuItem(value: 2,child: Text("logout".tr))
        ],onSelected: (itemValue){
        if(itemValue == 1){
          showDialog(context: context, builder: (context) {
            return AlertDialog(
                backgroundColor: Colors.white.withOpacity(.7),
                content: SizedBox(
                  height: height/10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${"version".tr} v${_wholeModel.version}"),
                    ],
                  ),
                ));
          },);
        }else{
          _authService.signOut();
          showToast("Çıkış yapıldı");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
                  (route) => false);
        }

        },),
    );
  }
  void _onSubmitted(String value){
    if(value != ""){
      _wholeModel.appBarControlled();
      _wholeModel.refresh(true);
      _wholeModel.searchWord(value);
      context.read<PageTwoCubit>().uploadWeather(city: value)
          .catchError((value)=> {
        showToast("Girilen değer ile ilgili bilgi bulunamadı")
      }).onError((error, stackTrace) => showToast("Daha sonra tekrar deneyin"))
          .then((value){
        _wholeModel.refresh(false);
        animasyonKontrol?.forward();
      });
    }else{
      showToast("Şehir giriniz");
    }
    }

}

