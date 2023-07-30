
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaj/cubit/mark_cubit.dart';
import 'package:flutterstaj/pages/home_page.dart';
import 'package:flutterstaj/pages/register_page.dart';
import 'package:flutterstaj/utils/practical_method.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final _citizenshipNumber = TextEditingController();
  final _password = TextEditingController();

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
            children: [
          Padding(
            padding: EdgeInsets.only(bottom: h/20),
            child: SizedBox(
                width: w/1.2,
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
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right:h/30,left: h/30,bottom: h/50),
            child: TextField(
              obscureText: context.read<MarkCubit>().mainMark,
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
                    context.read<MarkCubit>().marked("main_page");
                  },
                      icon: Icon(Icons.remove_red_eye_outlined,
                      color:  context.read<MarkCubit>().mainMark ? Colors.black : Colors.red))),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(h/50),
            child: GestureDetector(
              onTap: (){
              },
              child: Text("Şifremi unuttum"
                ,style: TextStyle(
                  color: Color(PracticalMethod.HexaColorConvertColor(
                      "#bd2524"))
                  ,
                  fontSize: w/25,
                ),),
            ),
          ),
          SizedBox(
            height: h/12,
            width: w/2,
            child: Padding(
              padding: EdgeInsets.all(h/100),
              child: ElevatedButton(
                  onPressed: (){
                    /*if(_citizenshipNumber.text.isEmpty || _password.text.isEmpty){
                      showToast("Boş alanları doldurunuz");
                    }else if(_citizenshipNumber.text.length < 11){
                      showToast("Vatandaşlık numarası en az 11 hane olmalıdır");
                    }else{*/
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    //}
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
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Kayıtlı değil misin ?"
                  ,style: TextStyle(

                    fontSize: w/25,
                  ),),
                SizedBox(width: 10,),
                GestureDetector(
                  child: Text("Kayıt Ol"
                    ,style: TextStyle(
                      color: Color(PracticalMethod.HexaColorConvertColor(
                          "#bd2524"))
                      ,
                      fontSize: w/20,
                    ),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
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
