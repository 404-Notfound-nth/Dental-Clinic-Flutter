import 'package:clinicbookingapp/views/appointment_detail/appointment_detail.dart';
import 'package:clinicbookingapp/views/provider/Booking.dart';
import 'package:clinicbookingapp/views/provider/Dentistry.dart';
import 'package:clinicbookingapp/views/provider/Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clinicbookingapp/helpers/constants.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class NextAppointmentCard extends StatefulWidget {
  //final String phone;

  //const NextAppointmentCard({Key key, @required this.phone}) : super(key: key);
  @override
  NextAppointmentCardScreen createState() => NextAppointmentCardScreen();
}

class NextAppointmentCardScreen extends State<NextAppointmentCard> {
  Booking booking;
  List<Service> listService = [];
  dynamic phone, name, booking_status;
  Service service;
  Dentistry dentistry;

  getSession() async {
    phone = await FlutterSession().get("ACCOUNT_PHONE");
    name = await FlutterSession().get("ACCOUNT_NAME");
    booking_status = await FlutterSession().get("BOOKING_STATUS");
  }

  getBooking() async {
    phone = await FlutterSession().get("ACCOUNT_PHONE");
    var url = Uri.parse(
        "https://localhost:8080/api/booking/get-booking/${phone.toString()}");
    print(url);

    //try {
    var res =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    print(res.statusCode);
    if (res.statusCode == 200) {
      var data = json.decode(utf8.decode(res.bodyBytes));
      var session = FlutterSession();
      await session.set("BOOKING_STATUS", data['status_id']);
      setState(() {
        booking = new Booking.fromJson(data);

        if (booking.statusId == 'ACCEPT') {
          booking.statusId = 'Chấp nhận';
        }

        if (booking.statusId == 'DENY') {
          booking.statusId = 'Từ chối';
        }

        if (booking.statusId == 'WATTING') {
          booking.statusId = 'Chờ phản hồi';
        }

        if (booking.statusId == 'CANCEL') {
          booking.statusId = 'Hủy lịch hẹn';
        }
        if (booking.statusId == 'FINISHED') {
          booking.statusId = 'Hoàn thành';
        }

        getService();
        getDentistry();
      });
    } else {
      // setState(() {
      dentistry = new Dentistry();
      dentistry.name = 'Chưa có';
      dentistry.address = 'Chưa có';
      dentistry.phone = 'Chưa có';
      dentistry.rating = 0;

      booking = new Booking();
      booking.accountPhone = 'Chưa có';
      booking.dentistryAddress = 'Chưa có';
      booking.serviceId = 'Chưa có';
      booking.time = 'Chưa có';
      booking.date = '';
      booking.statusId = 'Chưa có';

      service = new Service();
      service.id = '';
      service.price = 0;
      service.serviceName = '';
      // });
    }
    // } catch (e) {
    //   e.toString();
    //   // setState(() {
    //   dentistry = new Dentistry();
    //   dentistry.name = 'Chưa có';
    //   dentistry.address = 'Chưa có';
    //   dentistry.phone = 'Chưa có';
    //   dentistry.rating = 0;

    //   booking = new Booking();
    //   booking.accountPhone = '';
    //   booking.dentistryAddress = 'Chưa có';
    //   booking.serviceId = 'Chưa có';
    //   booking.time = 'Chưa có';
    //   booking.date = null;
    //   booking.createDate = null;

    //   service = new Service();
    //   service.id = 'Chưa có';
    //   service.price = 0;
    //   service.serviceName = 'Chưa có';
    //   // });
    // }
  }

  getDentistry() async {
    var url = Uri.parse(
        'https://localhost:8080/api/dentistry/${booking.dentistryAddress}');
    print(url);
    // try {
    var res =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    if (res.statusCode == 200) {
      var den = json.decode(utf8.decode(res.bodyBytes));
      setState(() {
        dentistry = new Dentistry.fromJson(den);
      });
    } else {
      // setState(() {
      dentistry = new Dentistry();
      dentistry.address = '';
      dentistry.name = '';
      dentistry.phone = '';
      dentistry.rating = 0;
      //});
    }
    // } catch (error) {
    //   throw (error);
    // }
  }
  // getListService() async {
  //   var url = Uri.parse('https://localhost:8080/api/service');

  //   ///${booking.serviceId}
  //   try {
  //     var response =
  //         await http.get(url, headers: {'Content-Type': 'application/json'});
  //     if (response.statusCode == 200) {
  //       var ser = json.decode(utf8.decode(response.bodyBytes));
  //       setState(() {
  //         for (var u in ser) {
  //           Service service = new Service.fromJson(u);
  //           // print(service);
  //           listService.add(service);
  //         }
  //         for (var u in listService) {
  //           print("-------------------" + u.serviceName);
  //         }
  //       });
  //     }
  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  getService() async {
    var url =
        Uri.parse('https://localhost:8080/api/service/${booking.serviceId}');
    print(url);
    // try {
    var res =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    print(res.statusCode);
    if (res.statusCode == 200) {
      var ser = json.decode(utf8.decode(res.bodyBytes));
      setState(() {
        service = new Service.fromJson(ser);
      });
    } else {
      // setState(() {
      service = new Service();
      service.id = '';
      service.price = 0;
      service.serviceName = '';
      //});
    }
    // } catch (error) {
    //   throw (error);
    // }
  }

  @override
  void initState() {
    super.initState();
    getSession();
    getBooking();
    // getDentistry();
    // getService();
  }

  @override
  Widget build(BuildContext context) {
    // Account account = Provider.of<Account>(context);
    Booking bookingID;
    var sampleAppointment = new Appointment(
      name.toString() == null ? 'Chưa có' : name.toString(),
      phone.toString() == null ? 'Chưa có' : phone.toString(),
      dentistry.name == null ? 'Chưa có' : dentistry.name,
      dentistry.address == null ? 'Chưa có' : dentistry.address,
      booking.date == null
          ? 'Chưa có'
          : booking.date + " - " + booking.time == null
              ? 'Chưa có'
              : booking.time,
      service.serviceName == null ? 'Chưa có' : service.serviceName,
    );
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(const Radius.circular(4)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 2)),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SvgPicture.asset(
                  Constants.CALENDAR_ICON_REF,
                  height: 30.0,
                  width: 30.0,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Lịch hẹn tiếp theo của bạn",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),

            // location of clinic
            Text("\u2022 Địa chỉ: " + " " + dentistry.name == null
                ? 'Chưa có'
                : "\u2022 Địa chỉ: " + " " + dentistry.address),
            SizedBox(
              height: 8,
            ),
            // time of the next appointment
            Text("\u2022" +
                        // DateFormat("dd/MM/yyyy").format(
                        //     booking.date == null ? 'Chưa có' : booking.date) +
                        " - " +
                        booking.time ==
                    null
                ? 'Chưa có'
                : "\u2022 Thời gian: " + booking.time),
            SizedBox(
              height: 8,
            ),
            // dentist info
            Text("\u2022 Nha sĩ: " + dentistry.address == null
                ? ''
                : "\u2022 Nha sĩ: " +
                    'Chúng tôi sẽ sắp xếp cho bạn nha sĩ tốt nhất'),

            SizedBox(
              height: 8,
            ),
            // dentist info
            Text("\u2022 Tình trạng: " + booking.statusId == null
                ? 'Chưa có'
                : "\u2022 Tình trạng: " + booking.statusId),
            SizedBox(
              height: 8,
            ),
            // Text("\u2022 Nha sĩ: Nguyen Duc Huy"),
            // SizedBox(
            //   height: 8,
            // ),
            // // Nurse info
            // Text("\u2022 Y tá: Nguyen Duc Huy"),
            // SizedBox(
            //   height: 8,
            // ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppoinmentDetailScreen(
                        appointment: sampleAppointment,
                        bookingID: booking.id,
                        bookingStatus: booking_status,
                      ),
                    ),
                  ),
                },
                child: Text(
                  "Xem chi tiết lịch hẹn",
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    // color: Color(0xFF2661FA)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
