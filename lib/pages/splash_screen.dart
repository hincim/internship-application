import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterstaj/pages/login_page.dart';
import 'package:flutterstaj/utils/practical_method.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late AnimationController _translateController;
  late Animation<double> translateAnimationValues;
  late AnimationController _alphaController;
  late Animation<double> _alphaAnimationValues;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    _auth.authStateChanges().listen((event) {
      if(event != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
        return;
      }
    });
    super.initState();
    Future.delayed(Duration(milliseconds: 3000),(){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
      const LoginPage()));
    });

    Future.delayed(const Duration(milliseconds: 2000),(){
      _alphaController.forward();

    });
    _alphaController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _alphaAnimationValues = Tween(begin: 0.0,end: 1.0).animate(_alphaController)..addListener(() {
      setState(() {});
    });

    _translateController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    translateAnimationValues = Tween(begin: -550.0,end: 0.0).animate(_translateController)..addListener(() {
      setState(() {});
    });

    _translateController.forward();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _translateController.dispose();
    _alphaController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Transform.translate(
                      offset: Offset(translateAnimationValues.value,0.0),
                      child: Image.asset("assets/images/images.png")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Opacity(
                    opacity: _alphaAnimationValues.value,
                    child: Text("splash".tr,style: TextStyle(color: Color(PracticalMethod.HexaColorConvertColor(
                        "#c34240"))
                        ,
                    fontFamily: "TekturRegular",fontSize: 22),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
