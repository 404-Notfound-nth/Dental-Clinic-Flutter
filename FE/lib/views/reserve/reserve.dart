import 'package:clinicbookingapp/helpers/constants.dart';
import 'package:clinicbookingapp/views/home/home.dart';
import 'package:clinicbookingapp/views/provider/Service.dart';
import 'package:clinicbookingapp/views/reserve/reserve_confirm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReserveScreen extends StatefulWidget {
  final String dentistryAddress;

  const ReserveScreen({Key key, @required this.dentistryAddress})
      : super(key: key);
  @override
  _ReserveScreenState createState() => _ReserveScreenState();
}

class _ReserveScreenState extends State<ReserveScreen> {
  final _formKey = GlobalKey<FormState>();
  String name, address, phone, note, strDate, strTime;
  String _value;
  String _selectedValue;
  List serviceList = [];
  dynamic phoneSession;
  final now = DateTime.now();
  final timeNow = TimeOfDay.now();
  getSession() async {
    phoneSession = await FlutterSession().get("ACCOUNT_PHONE");
  }

  var items = ["7:00", "9:00", "11:00", "13:00", "15:00", "17:00"];

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  addBooking() async {
    var jsonData = null;
    var url = Uri.parse("https://localhost:8080/api/booking/add-booking");
    print(phoneSession);
    print(dateController.text);
    print(timeController.text);
    print(noteController.text);
    print(widget.dentistryAddress);
    print(_selectedValue);
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'account_phone': phoneSession,
        'date': dateController.text,
        'time': timeController.text,
        'note': noteController.text,
        'dentistry_address': widget.dentistryAddress,
        'service_id': _selectedValue
      }),
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(
        () {
          Fluttertoast.showToast(
              msg: "Đặt lịch thành công",
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16);
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => Home()), (route) => false);
        },
      );
    }
  }

  listService() async {
    var url = Uri.parse("https://localhost:8080/api/service");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        serviceList = jsonData;
      });
    }
    print(serviceList);
  }

  @override
  void initState() {
    super.initState();
    getSession();
    listService();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Đăt lịch'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //Text('Đặt lịch', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 15),
                        width: double.infinity,
                        child: Column(
                          children: [
                            //SizedBox(height: 20),
                            // Container(
                            //   alignment: Alignment.topLeft,
                            //   margin: const EdgeInsets.only(left: 5, top: 20),
                            //   child: Text(
                            //     'Họ và tên *',
                            //     textAlign: TextAlign.left,
                            //     style: TextStyle(fontSize: 15),
                            //   ),
                            // ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: TextFormField(
                            //     validator: (String value) {
                            //       if (value.isEmpty) {
                            //         return "Vui lòng không để trống";
                            //       }
                            //       return null;
                            //     },
                            //     decoration: InputDecoration(),
                            //     controller: nameController,
                            //   ),
                            // ),
                            // SizedBox(height: 20),
                            // Container(
                            //   alignment: Alignment.topLeft,
                            //   //margin: EdgeInsets.symmetric(horizontal: 40),
                            //   margin: const EdgeInsets.only(left: 5, top: 10),
                            //   child: Text(
                            //     'Địa chỉ',
                            //     textAlign: TextAlign.left,
                            //     style: TextStyle(fontSize: 15),
                            //   ),
                            // ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   // margin: const EdgeInsets.only(top: 1),
                            //   child: TextFormField(
                            //     onChanged: (text) {
                            //       address = text;
                            //     },
                            //     decoration: InputDecoration(),
                            //   ),
                            // ),
                            //SizedBox(height: 20),
                            // Row(
                            //   children: [
                            //     Container(
                            //       alignment: Alignment.topLeft,
                            //       //margin: EdgeInsets.symmetric(horizontal: 40),
                            //       margin:
                            //           const EdgeInsets.only(left: 5, top: 10),
                            //       child: Text(
                            //         'Số điện thoại: ',
                            //         textAlign: TextAlign.left,
                            //         style: TextStyle(fontSize: 15),
                            //       ),
                            //     ),
                            //     Container(
                            //       alignment: Alignment.center,
                            //       margin:
                            //           const EdgeInsets.only(top: 13, left: 30),
                            //       child: Text(phoneSession),
                            //       // child: TextFormField(
                            //       //   keyboardType: TextInputType.number,
                            //       //   controller: phoneController,
                            //       //   validator: (String value) {
                            //       //     if (value.isEmpty) {
                            //       //       return "Vui lòng không để trống";
                            //       //     }
                            //       //     return null;
                            //       //   },
                            //       //   decoration: InputDecoration(),
                            //       // ),
                            //     ),
                            //   ],
                            // ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 5, top: 20),
                              child: Text(
                                'Ngày *',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Container(
                              child: Container(
                                child: TextFormField(
                                  controller: dateController,
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                    _selectDate();
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Vui lòng không để trống";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 5, top: 20),
                              child: Text(
                                'Giờ *',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Container(
                              child: Container(
                                child: TextFormField(
                                  controller: timeController,
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                    _selectTime();
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Vui lòng không để trống";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            Container(
                              // height: double.infinity,
                              // width: double.infinity,
                              child: Column(
                                children: <Widget>[
                                  // DropdownButtonHideUnderline(
                                  //   child: ButtonTheme(
                                  //     alignedDropdown: true,
                                  //child:
                                  DropdownButton(
                                    isExpanded: true,
                                    hint: Text("Dịch vụ"),
                                    value: _selectedValue,
                                    items: serviceList.map((service) {
                                      return DropdownMenuItem(
                                          value: service['id'],
                                          child: Text(service['serviceName']));
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          _selectedValue = value;
                                          print(_selectedValue);
                                        },
                                      );
                                    },
                                  ),

                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),

                            Container(
                              alignment: Alignment.topLeft,
                              //margin: EdgeInsets.symmetric(horizontal: 40),
                              margin: const EdgeInsets.only(
                                  left: 5, top: 30, bottom: 10),
                              child: Text(
                                'Lưu ý',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                controller: noteController,
                                maxLines: 5,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 70),
                              child: RaisedButton(
                                onPressed: () {
                                  // _formKey.currentState.validate();
                                  setState(
                                    () {
                                      addBooking();
                                      // if (_formKey.currentState.validate()) {
                                      //   Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           InfomationDetailScreen(
                                      //         name: name,
                                      //         address: address,
                                      //         phone: phone,
                                      //         note: note,
                                      //         strDate: strDate,
                                      //         strTime: strTime,
                                      //       ),
                                      //     ),
                                      //   );
                                      // }
                                    },
                                  );
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
//                            Color.fromARGB(255, 255, 136, 34),
//                            Color.fromARGB(255, 255, 177, 41)
                                      ])),
                                  padding: const EdgeInsets.all(0),
                                  child: Text(
                                    "Xác nhận",
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(now.year + 30, now.month, now.day),
    );
    if (picked != null)
      setState(() {
        String convertedDateTime =
            "${picked.day}-${picked.month}-${picked.year}";
        strDate = convertedDateTime;
        dateController.text = convertedDateTime;
      });
    print(picked.toString());
    print(_value);
  }

  Future _selectTime() async {
    TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: timeNow,
    );
    if (picked != null)
      setState(() {
        String convertTime = picked.format(context);
        strTime = convertTime;
        timeController.text = convertTime;
      });
    print(picked.toString());
    print(_value);
  }
}
