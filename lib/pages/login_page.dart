import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterstaj/mobx/whole_model.dart';
import 'package:flutterstaj/pages/home_page.dart';
import 'package:flutterstaj/pages/register_page.dart';
import 'package:flutterstaj/utils/practical_method.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../cloud/auth.dart';
import '../global_widget/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  GetStorage box = GetStorage();

  final _wholeModel = WholeModel();

  final AuthService _authService = AuthService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth.authStateChanges().listen((event) {
      if(event != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomePage()));
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    double w = screen.size.width;
    double h = screen.size.height;
    return Observer(builder: (_){
      return Scaffold(
          backgroundColor: Colors.white,
          body:_wholeModel.refreshState? Padding(
            padding: const EdgeInsets.all(8.0),
            child: SpinKitFadingCircle(
              color: Colors.red,
              size: h/15,
              duration: Duration(milliseconds: 1200),
            ),
          ):Center(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                   Padding(
                     padding: EdgeInsets.only(bottom: h / 20),
                     child: SizedBox(
                         width: w / 1.2,
                         child: Image.asset("assets/images/logo.jpeg")),
                   ),Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: h / 30, left: h / 30, top: h / 30, bottom: h / 50),
                          child: TextField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: h / 30, left: h / 30, bottom: h / 50),
                          child: Observer(builder: (_) {
                            return TextField(
                              obscureText: _wholeModel.iconState,
                              controller: _password,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: "psw".tr,
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        _wholeModel.iconStateChanged();
                                      },
                                      icon: Icon(Icons.remove_red_eye_outlined,
                                          color: _wholeModel.iconState
                                              ? Colors.black
                                              : Colors.red))),
                            );
                          }),
                        ),
                        Padding(
                          padding: EdgeInsets.all(h / 50),
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "psw_forgot".tr,
                              style: TextStyle(
                                color: Color(
                                    PracticalMethod.HexaColorConvertColor("#bd2524")),
                                fontSize: w / 25,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h / 12,
                          width: w / 2,
                          child: Padding(
                            padding: EdgeInsets.all(h / 100),
                            child: ElevatedButton(
                                onPressed: ()  {
                                  _wholeModel.refresh(true);
                                  if (_email.text == "" ||
                                      _password.text == "" ||
                                      _password.text.length < 6) {
                                    _wholeModel.refresh(false);
                                    showToast("fill_in_the_blanks".tr);
                                  } else {
                                    _authService
                                        .signIn(_email.text.trim(), _password.text)
                                        .then((value) {
                                      showToast("signed_in".tr);
                                      return Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage(user: value,))).then((value){
                                        _email.text="";
                                        _password.text = "";
                                        _wholeModel.refresh(false);
                                      });
                                    }).catchError((dynamic error) {
                                      _wholeModel.refresh(false);
                                      switch (error.code) {
                                        case "invalid-email":
                                          showToast("incorrect_email_account".tr);
                                          break;
                                        case "wrong-password":
                                          showToast("wrong_password".tr);
                                          break;
                                        case "user-not-found":
                                          showToast("user_not_found".tr);
                                          break;
                                        default:
                                          break;
                                      }
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(
                                        PracticalMethod.HexaColorConvertColor(
                                            "#bd2524"))),
                                child: Text(
                                  "login".tr,
                                  style: TextStyle(fontSize: h / 35),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "not_registered".tr,
                                style: TextStyle(
                                  fontSize: w / 25,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                child: Text(
                                  "sign_up".tr,
                                  style: TextStyle(
                                    color: Color(
                                        PracticalMethod.HexaColorConvertColor("#bd2524")),
                                    fontSize: w / 20,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterPage()));
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Observer(builder: (_) {
                return PopupMenuButton(
                    offset: Offset(5, 10),
                    onOpened: () {
                      _wholeModel.langOption(true);
                    },
                    onCanceled: () {
                      _wholeModel.langOption(false);
                    },
                    initialValue: box.read("lang") == "tr" ? 2 : 1,
                    elevation: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "language_option".tr,
                          textAlign: TextAlign.center,
                        ),
                        Icon(_wholeModel.langOptionState
                            ? Icons.arrow_drop_up_rounded
                            : Icons.arrow_drop_down),
                      ],
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text("eng".tr),
                        height: w / 10,
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text("turkish".tr),
                        height: w / 10,
                      )
                    ],
                    onSelected: (itemValue) async {
                      if (itemValue == 1) {
                        _wholeModel
                            .initialValueChanged(int.parse(itemValue.toString()));
                        await box.write("lang", "en");
                        Get.updateLocale(Locale("en", "US"));
                      } else {
                        _wholeModel
                            .initialValueChanged(int.parse(itemValue.toString()));
                        await box.write("lang", "tr");
                        Get.updateLocale(Locale("tr", "TR"));
                      }
                    });
              })));
    });
  }
}
