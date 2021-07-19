import 'package:clinicbookingapp/helpers/constants.dart';
import 'package:clinicbookingapp/views/home/home.dart';
import 'package:clinicbookingapp/views/rating/rating.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RatingsPage extends StatefulWidget {
  @override
  _RatingsPage createState() => _RatingsPage();
}

class _RatingsPage extends State<RatingsPage> {
  int _rating;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Đánh giá ")),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(bottom: size.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Rating((rating) {
                setState(() {
                  _rating = rating;
                  print(_rating);
                });
              }, 5),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 44,
                child: (_rating != null && _rating != 0)
                    ? Text("Cảm ơn bạn vì đã đánh giá $_rating sao",
                        style: TextStyle(fontSize: 18))
                    : SizedBox.shrink(),
              ),
              SizedBox(height: size.width * 0.3),
              SizedBox(
                child: RaisedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Đánh giá thành công",
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
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
                      "Gửi đánh giá",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
