import 'package:clinicbookingapp/helpers/constants.dart';
import 'package:clinicbookingapp/views/global/background.dart';
import 'package:clinicbookingapp/views/home/home.dart';
import 'package:clinicbookingapp/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:dio/dio.dart';

//import 'package:profile/components/background.dart';
//import 'package:profile/screens/login/login.dart';
class Register extends StatefulWidget {
  @override
  RegisterScreen createState() => RegisterScreen();
}

class RegisterScreen extends State<Register> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  String error = "";
  String success = "";

  void onSignInClicked() {
    setState(() {
      if (phoneController.text.isEmpty) {
        error = "Số điện thoại không được trống !!!";
      } else if (passwordController.text.isEmpty) {
        error = "Mật khẩu không được trống !!!";
      } else if (fullNameController.text.isEmpty) {
        error = "Tên không được trống !!!";
      } else {
        register(phoneController.text, passwordController.text,
            fullNameController.text);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomePage(username: username.text,)),
        // );
      }
    });
  }

  var url = "https://localhost:8080/api/account/register";
  Future register(String phone, String password, String fullname) async {
    try {
      var Url = Uri.parse(url);
      var response = await http.post(
        Url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'phone': phone,
          'password': password,
          'fullname': fullname,
        }),
      );
      if (response.statusCode == 200) {
        setState(() {
          Fluttertoast.showToast(
              msg: "Đăng ký thành công",
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16);
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => Home()), (route) => false);
          // phoneController.clear();
          // passwordController.clear();
          // fullNameController.clear();
          //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Home(), (route) => false);
          // success = "Đăng ký thành công";
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Register()));
        });
      } else {
        success = "Số điện thoại đã tồn tại";
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Background(
                  title: "ĐĂNG KÍ",
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Số điện thoại"),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 38, top: 5),
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
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: "Mật khẩu"),
                    obscureText: true,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 38, top: 5),
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
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    right: 35,
                    left: 35,
                  ),
                  child: TextFormField(
                    controller: fullNameController,
                    decoration: InputDecoration(labelText: "Họ và tên"),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 38, top: 5),
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
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () => {},
                    child: Text(
                      success.isEmpty ? '' : success,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerRight,
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
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: new LinearGradient(colors: [
                            Constants.PRIMARY_COLOR,
                            Constants.HEAVY_BLUE
                            // Color.fromARGB(255, 255, 136, 34),
                            // Color.fromARGB(255, 255, 177, 41)
                          ])),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Đăng kí",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()))
                    },
                    child: Text(
                      "Bạn đã có tài khoản rồi? Đăng nhập lại",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA)),
                    ),
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
