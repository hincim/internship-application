import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterstaj/mobx/whole_model.dart';
import 'package:flutterstaj/utils/practical_method.dart';
import 'package:get/get.dart';

import '../cloud/auth.dart';
import '../global_widget/toast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _identificationNumber = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _passwordAgain = TextEditingController();

  final _registerModel = WholeModel();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    MediaQueryData screen = MediaQuery.of(context);
    double w = screen.size.width;
    double h = screen.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Observer(builder: (_){
        return Center(
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_registerModel.checkBoxOne.toString()),
                  Padding(
                    padding: EdgeInsets.only(bottom: h/100,top: h/25),
                    child: SizedBox(
                        width: w/1.5,
                        child: Image.asset("assets/images/logo.jpeg")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right:h/30,
                        left: h/30,top: h/30,bottom: h/50),
                    child: TextField(
                      controller: _identificationNumber,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "identification_number".tr,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right:h/30,left: h/30,bottom: h/50),
                    child: TextField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Mail",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right:h/30,
                        left: h/30,bottom: h/50),
                    child: TextField(
                      controller: _phone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "phone".tr,
                        hintText: "(xxx) xxx xxxx",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right:h/30,left: h/30,bottom: h/50),
                    child: TextField(
                    obscureText: _registerModel.registerPagePsw,
                        controller: _password,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "psw".tr,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                            suffixIcon: IconButton(onPressed: (){
                              _registerModel.registerPagePswChanged(1);
                              }, icon: Icon(Icons.remove_red_eye_outlined,
                                color: _registerModel.registerPagePsw ? Colors.black : Colors.red)))
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right:h/30,
                        left: h/30,bottom: h/50),
                    child: TextField(
                  obscureText: _registerModel.registerPagePswAgain,
                      controller: _passwordAgain,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "password_repeat".tr,
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          suffixIcon: IconButton(onPressed: (){
                        _registerModel.registerPagePswChanged(2);
                          }, icon: Icon(Icons.remove_red_eye_outlined,
                              color: _registerModel.registerPagePswAgain ? Colors.black : Colors.red))
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.all(h/500),
                          child: Checkbox(
                              value: _registerModel.checkBoxOne,
                              onChanged: (bool? value){
                                print(value);
                            _registerModel.checkBoxChanged(1);
                              }),
                        ),
                        Expanded(child: GestureDetector(
                            onTap: (){
                              _registerModel.checkBoxChanged(1);
                            },
                            child: Text("check_one".tr)))
                      ],),
                      SizedBox(height: 20),
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.all(h/500),
                          child: Checkbox(
                              value: _registerModel.checkBoxTwo,
                              onChanged: (bool? value){

                                _registerModel.checkBoxChanged(2);
                              }),
                        ),
                        Expanded(child: GestureDetector(
                            onTap: (){
                              _registerModel.checkBoxChanged(2);
                            },
                            child: Text("check_two".tr)))
                      ],)
                    ],
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: h/12,
                    width: w/2,
                    child: Padding(
                      padding: EdgeInsets.all(h/80),
                      child: ElevatedButton(
                          onPressed: ()  {
                            if(_password.text != _passwordAgain.text){
                              showToast("Şifreler aynı olmalı");
                            }else if(_registerModel.checkBoxOne == false || _registerModel.checkBoxTwo == false){
                              showToast("İlerlemek için kutucukları işaretleyiniz");
                            }else if(_identificationNumber.text.length<11){
                              showToast("Vatandaşlık numarası en az 11 hane olmalıdır");
                            }else if(_identificationNumber.text.isEmpty || _email.text.isEmpty || _phone.text.isEmpty || _password.text.isEmpty || _passwordAgain.text.isEmpty){
                              showToast("Boş olan yerleri doldurunuz");
                            }else{
                              _authService.createPerson(int.parse(_identificationNumber.text), _email.text, int.parse(_phone.text), _password.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(PracticalMethod.HexaColorConvertColor(
                                  "#bd2524"))
                          ),
                          child: Text(
                            "sign_up".tr
                            ,style: TextStyle(fontSize: h/35),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0,top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("member".tr
                          ,style: TextStyle(
                            fontSize: w/25,
                          ),),
                        SizedBox(width: 10,),
                        GestureDetector(
                          child: Text("login".tr
                            ,style: TextStyle(
                              color: Color(PracticalMethod.HexaColorConvertColor(
                                  "#1abc9c"))
                              ,
                              fontSize: w/20,
                            ),),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              )
          ),
        );
      }),
    );
  }
}
