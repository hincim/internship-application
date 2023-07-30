import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaj/cubit/mark_cubit.dart';
import 'package:flutterstaj/utils/practical_method.dart';

import '../global_widget/toast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _citizenshipNumber = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _passwordAgain = TextEditingController();

  @override
  Widget build(BuildContext context) {

    MediaQueryData screen = MediaQuery.of(context);
    double w = screen.size.width;
    double h = screen.size.height;


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: BlocBuilder<MarkCubit,bool>(builder: (context, state){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    controller: _citizenshipNumber,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Vatandaşlık No",
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
                      labelText: "Telefon",
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
                      obscureText: context.read<MarkCubit>().registerMark,
                      controller: _password,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Şifre",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          suffixIcon: IconButton(onPressed: (){
                            context.read<MarkCubit>().marked("register_page_one");
                          }, icon: Icon(Icons.remove_red_eye_outlined,
                              color: context.read<MarkCubit>().registerMark ? Colors.black : Colors.red)))
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:h/30,
                      left: h/30,bottom: h/50),
                  child: TextField(
                    obscureText: context.read<MarkCubit>().registerMarkTwo,
                    controller: _passwordAgain,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Şifre Tekrar",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        suffixIcon: IconButton(onPressed: (){
                          context.read<MarkCubit>().marked("register_page_two");
                        }, icon: Icon(Icons.remove_red_eye_outlined,
                            color: context.read<MarkCubit>().registerMarkTwo ? Colors.black : Colors.red))
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.all(h/500),
                        child: Checkbox(
                            value: context.read<MarkCubit>().checked,
                            onChanged: (bool? value){
                              print(value);
                              context.read<MarkCubit>().checkedBox("check_box_one");
                            }),
                      ),
                      Expanded(child: GestureDetector(
                          onTap: (){
                            context.read<MarkCubit>().checkedBox("check_box_one");
                          },
                          child: Text('6698 Sayılı Kişisel Verilerin Korunması Kanunu uyarınca hazırlanan Aydınlatma Metni’ni okudum.')))
                    ],),
                    SizedBox(height: 20),
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.all(h/500),
                        child: Checkbox(
                            value: context.read<MarkCubit>().checkedTwo,
                            onChanged: (bool? value){
                              print(value);
                              context.read<MarkCubit>().checkedBox("check_box_two");

                            }),
                      ),
                      Expanded(child: GestureDetector(
                          onTap: (){
                            context.read<MarkCubit>().checkedBox("check_box_two");
                          },
                          child: Text('6698 Sayılı Kişisel Verilerin Korunması Kanunu’nun 10. maddesinde düzenlenen veri sorumlusunun aydınlatma yükümlülüğü hükümleri kapsamında veri sorumlusu sıfatıyla Konya Teknik Üniversitesi tarafından size sunulan Aydınlatma Metninin bilgilendirilmesine göre kişisel verilerinizin işlenmesi ve aktarılmasına açık rızam vardır.')))
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
                        onPressed: (){
                          if(_password.text != _passwordAgain.text){
                            showToast("Şifreler aynı olmalı");
                          }else if(context.read<MarkCubit>().checked == false || context.read<MarkCubit>().checkedTwo == false){
                            showToast("İlerlemek için kutucukları işaretleyiniz");
                          }else if(_citizenshipNumber.text.length<11){
                            showToast("Vatandaşlık numarası en az 11 hane olmalıdır");
                          }else if(_citizenshipNumber.text.isEmpty || _email.text.isEmpty || _phone.text.isEmpty || _password.text.isEmpty || _passwordAgain.text.isEmpty){
                            showToast("Boş olan yerleri doldurunuz");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(PracticalMethod.HexaColorConvertColor(
                                "#bd2524"))
                        ),
                        child: Text(
                          "Giriş Yap"
                          ,style: TextStyle(fontSize: h/35),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0,top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Zaten üye misin?"
                        ,style: TextStyle(
                          fontSize: w/25,
                        ),),
                      SizedBox(width: 10,),
                      GestureDetector(
                        child: Text("Giriş Yap"
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
            );
          }),
        ),
      ),
    );
  }
}
