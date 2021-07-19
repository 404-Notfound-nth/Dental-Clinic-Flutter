import 'dart:convert';

import 'package:clinicbookingapp/helpers/constants.dart';
import 'package:clinicbookingapp/views/global/background.dart';
import 'package:clinicbookingapp/views/home/home.dart';
import 'package:clinicbookingapp/views/provider/AccountProvider.dart';
import 'package:clinicbookingapp/views/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
// import 'dart:async';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String error = "";

  void onSignInClicked() {
    setState(() {
      if (phoneController.text.isEmpty && passwordController.text.isEmpty) {
        error = "Số điện thoại và mật khẩu không được trống !!!";
      } else if (phoneController.text.isEmpty ||
          passwordController.text.isEmpty) {
        error = "Số điện thoại hoặc mật khẩu không được trống !!!";
      } else {
        logIn(phoneController.text, passwordController.text);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomePage(username: username.text,)),
        // );
      }
    });
  }

  void logIn(String phone, String password) async {
    var jsonData = null;
    var url = Uri.parse("https://localhost:8080/api/auth/login");
    //print(phone)
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'phone': phone,
        'password': password,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      jsonData = json.decode(utf8.decode(response.bodyBytes));
      var session = FlutterSession();
      await session.set("ACCOUNT_PHONE", jsonData['phone']);
      await session.set("ACCOUNT_NAME", jsonData['fullname']);
      //await session.set("ACCOUNT_ADRESS", jsonData['']);
      // print(jsonData['username']);
      print(jsonData.toString());
      print(jsonData);
      setState(() {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => Home()), (route) => false);

        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //         builder: (_) => AccountProvider(
        //               account: jsonData,
        //             )),
        //     (route) => false);
      });
    } else {
      setState(() {
        error = "Sai tên đăng nhập hoặc mật khẩu";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Background(
                title: "DENTAL CLINIC BOOKING",
              ),
              SizedBox(height: size.height * 0.001),
              Container(
                alignment: Alignment.center,
                //margin: EdgeInsets.symmetric(horizontal: 40),
                margin: const EdgeInsets.only(left: 35, bottom: 20, right: 35),
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: "Số điện thoại"),
                ),
              ),
              SizedBox(height: size.height * 0.001),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 35, right: 35),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "Mật khẩu"),
                  obscureText: true,
                ),
              ),
              SizedBox(height: size.height * 0.001),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {},
                  child: Text(
                    "Lấy lại mật khẩu",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA)),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 15),
                child: GestureDetector(
                  onTap: () => {},
                  child: Text(
                    error,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () {
                    onSignInClicked();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: new BoxDecoration(
                        //color: Colors.blue,
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(colors: [
                          Constants.PRIMARY_COLOR,
                          Constants.HEAVY_BLUE
                          // Color.fromARGB(255, 255, 136, 34),
                          // Color.fromARGB(255, 255, 177, 41)
                        ])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "Đăng nhập",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()))
                  },
                  child: Text(
                    "Bạn chưa có tài khoản? Hãy đăng kí",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
