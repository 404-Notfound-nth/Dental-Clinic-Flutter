import 'package:clinicbookingapp/helpers/constants.dart';
import 'package:clinicbookingapp/views/home/home.dart';
import 'package:clinicbookingapp/views/provider/Booking.dart';
import 'package:clinicbookingapp/views/rating/rating_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

//Create Class Appointment
class Appointment {
  String name;
  String phone;
  String nameClinic;
  String addressClinic;
  String time;
  String service;

  Appointment(this.name, this.phone, this.nameClinic, this.addressClinic,
      this.time, this.service);
}

class AppoinmentDetailScreen extends StatefulWidget {
  final Appointment appointment;
  final String bookingID;
  final String bookingStatus;
  //final String notify;

  // AppoinmentDetailScreen(Appointment appointment, String bookingID)
  //     : appointment = appointment,
  //       bookingID = bookingID,
  //       super(key: new ObjectKey(appointment));

  AppoinmentDetailScreen({
    Key key,
    @required this.appointment,
    @required this.bookingID,
    @required this.bookingStatus,
  }) : super(key: key);

  // AppoinmentDetailScreen({Key key, @required this.notify}) : super(key: key);

  @override
  _AppoinmentDetailScreenState createState() =>
      _AppoinmentDetailScreenState(appointment);
}

class _AppoinmentDetailScreenState extends State<AppoinmentDetailScreen> {
  final Appointment appointment;
  dynamic booking_status;

  Reason _reason;

  _AppoinmentDetailScreenState(this.appointment);
  getSession() async {
    booking_status = await FlutterSession().get("BOOKING_STATUS");
  }

  @override
  void initState() {
    super.initState();
    getSession();
  }

  // cancelBooking(String reason) async {
  //   var url = Uri.parse(
  //       'https://localhost:8080/api/booking/cancel/${booking.id}/${reason}');
  //   print(url);
  //   try {
  //     var response =
  //         await http.get(url, headers: {'Content-Type': 'application/json'});
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       //var ser = json.decode(utf8.decode(response.bodyBytes));
  //       setState(() {});
  //     }
  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   cancelBooking();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(widget.bookingStatus);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Thông tin lịch hẹn"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Center(
                child: Text(
                  "Thông tin chi tiết",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  //margin: EdgeInsets.symmetric(horizontal: 40),
                  margin: const EdgeInsets.only(left: 5, top: 30),
                  child: Text(
                    'Họ và tên: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 5, top: 30),
                  child: Text(
                    appointment.name,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  //margin: EdgeInsets.symmetric(horizontal: 40),
                  margin: const EdgeInsets.only(left: 5, top: 30),
                  child: Text(
                    'Số điện thoại: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 5, top: 30),
                  child: Text(
                    appointment.phone,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  //margin: EdgeInsets.symmetric(horizontal: 40),
                  margin: const EdgeInsets.only(left: 5, top: 30),
                  child: Text(
                    'Phòng khám: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 5, top: 30),
                  child: Text(
                    appointment.nameClinic,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  //margin: EdgeInsets.symmetric(horizontal: 40),
                  margin: const EdgeInsets.only(left: 5, top: 30),
                  child: Text(
                    'Địa chỉ: ',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 5, top: 30),
                  child: Text(
                    appointment.addressClinic,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  //margin: EdgeInsets.symmetric(horizontal: 40),
                  margin: const EdgeInsets.only(left: 5, top: 30),
                  child: Text(
                    'Thời gian: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 5, top: 30),
                  child: Text(
                    appointment.time,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  //margin: EdgeInsets.symmetric(horizontal: 40),
                  margin: const EdgeInsets.only(left: 5, top: 30),
                  child: Text(
                    'Dịch vụ: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 5, top: 30),
                  child: Text(
                    appointment.service,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                // FlatButton(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => StepperReserve()));
                //     },
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         side: BorderSide(color: Colors.black)),
                //     child: Container(
                //       child: Row(
                //         children: [
                //           Text("Đổi lịch hẹn"),
                //           SizedBox(
                //             width: 10,
                //           ),
                //           Icon(Icons.date_range_outlined),
                //         ],
                //       ),
                //     )),
                SizedBox(
                  width: 100,
                ),
                FlatButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            insetPadding: EdgeInsets.all(10),
                            content: Stack(
                              overflow: Overflow.visible,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: ReasonRadio(
                                    bookingID: widget.bookingID,
                                    // phone: widget.phone,
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black)),
                  child: Row(
                    children: [
                      Text("Hủy lịch hẹn"),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.cancel_outlined)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Visibility(
              visible: widget.bookingStatus == 'FINISHED',
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () {
                    // onSignInClicked();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RatingsPage()));
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
                      "Đánh giá nha khoa",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Reason { onBussiness, wrongDay, other, wrongService }

class ReasonRadio extends StatefulWidget {
  final String bookingID;
  // final String phone;
  ReasonRadio({
    Key key,
    @required this.bookingID,
    //@required this.phone
  }) : super(key: key);

  @override
  _ReasonRadioState createState() => _ReasonRadioState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ReasonRadioState extends State<ReasonRadio> {
  TextEditingController otherController = TextEditingController();
  Reason _character = Reason.onBussiness;
  String notify = "";
  bool isVisible = false;
  Booking booking;

  cancelBooking(String reason) async {
    //Account account = Provider.of<Account>(context);
    print(widget.bookingID);
    // print(widget.phone);
    // print("+++++++++++" + booking.id);
    var url = Uri.parse(
        // ignore: unnecessary_brace_in_string_interps
        'https://localhost:8080/api/booking/cancel/${widget.bookingID}/${reason}');
    print(url);
    try {
      var response =
          await http.put(url, headers: {'Content-Type': 'application/json'});
      print(response.statusCode);
      if (response.statusCode == 200) {
        // var book = json.decode(utf8.decode(response.bodyBytes));
        setState(() {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => Home()), (route) => false);
          // notify = "Bạn đã hủy lịch thành công";
        });
      }
    } catch (error) {
      throw (error);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text('Chọn các lý do sau'),
          RadioListTile<Reason>(
            title: Text('Bận công việc riêng'),
            value: Reason.onBussiness,
            groupValue: _character,
            onChanged: (Reason value) {
              setState(() {
                _character = value;
              });
              if (value != Reason.other) {
                setState(() {
                  isVisible = false;
                });
              }
            },
          ),
          RadioListTile<Reason>(
            title: const Text('Đặt nhầm ngày'),
            value: Reason.wrongDay,
            groupValue: _character,
            onChanged: (Reason value) {
              setState(() {
                _character = value;
              });
              if (value != Reason.other) {
                setState(() {
                  isVisible = false;
                });
              }
            },
          ),
          RadioListTile<Reason>(
            title: const Text('Đặt nhầm dịch vụ'),
            value: Reason.wrongService,
            groupValue: _character,
            onChanged: (Reason value) {
              setState(() {
                _character = value;
                if (value != Reason.other) {
                  setState(() {
                    isVisible = false;
                  });
                }
              });
            },
          ),
          RadioListTile<Reason>(
            title: const Text('Khác'),
            value: Reason.other,
            groupValue: _character,
            onChanged: (Reason value) {
              setState(() {
                _character = value;
              });
              if (value == Reason.other) {
                setState(() {
                  isVisible = true;
                });
              } else {
                setState(() {
                  isVisible = false;
                });
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: isVisible,
            child: TextFormField(
              controller: otherController,
              maxLines: 3,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Xin bạn vui lòng cho biết lí do sau:'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.25,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: new LinearGradient(colors: [
                      Constants.PRIMARY_COLOR,
                      Constants.HEAVY_BLUE
                      // Color.fromARGB(255, 255, 136, 31),
                      // Color.fromARGB(255, 255, 136, 31)
                    ]),
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Hủy bỏ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              RaisedButton(
                onPressed: () {
                  switch (_character) {
                    case Reason.onBussiness:
                      cancelBooking("Bận công việc riêng");
                      break;
                    case Reason.wrongDay:
                      cancelBooking("Đặt nhầm ngày");
                      break;
                    case Reason.wrongService:
                      cancelBooking("Đặt nhầm dịch vụ");
                      break;
                    case Reason.other:
                      cancelBooking(otherController.text);
                      break;
                    default:
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.25,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: new LinearGradient(colors: [
                      Constants.PRIMARY_COLOR,
                      Constants.HEAVY_BLUE
                      // Color.fromARGB(255, 255, 136, 34),
                      // Color.fromARGB(255, 255, 177, 41)
                    ]),
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Gửi",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
