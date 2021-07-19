import 'dart:convert';

import 'package:clinicbookingapp/views/provider/Dentistry.dart';
import 'package:clinicbookingapp/views/rating/rating_page.dart';
import 'package:clinicbookingapp/views/search/filter_network_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clinicbookingapp/views/home/next-appointment-card.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clinicbookingapp/helpers/constants.dart';
import 'package:clinicbookingapp/views/global/shared-component.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  // final String phone;
  // final String notify;
  const Home({
    Key key,
    // @required this.phone, this.notify
  }) : super(key: key);

  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<Home> {
  List<Dentistry> listDentistry = [];
  dynamic phone, name, booking_status;

  List<Map<String, dynamic>> listDental = [
    {
      'name': 'Nha Khoa Tâm Như',
      'address': '200/1 Nguyễn Trọng Tuyển',
      'rating': 5,
    },
    {
      'name': 'Nha Khoa Kim',
      'address': '211/41 Hoàng Văn Thụ',
      'rating': 5,
    }
  ];

  List<Dentistry> parsePost(String responeBody) {
    var list = json.decode(responeBody) as List<dynamic>;
    var dentistry = list.map((model) => Dentistry.fromJson(model)).toList();
    return dentistry;
  }

  getSession() async {
    phone = await FlutterSession().get("ACCOUNT_PHONE");
    name = await FlutterSession().get("ACCOUNT_NAME");
    booking_status = await FlutterSession().get("BOOKING_STATUS");
    print("STATUS +======================+");
    print(booking_status);
  }

  Future<List<Dentistry>> fetchDentistry() async {
    final url = Uri.parse('https://localhost:8080/api/dentistry');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    }
  }

  getListDentistry() async {
    var url = Uri.parse('https://localhost:8080/api/dentistry');
    try {
      var response =
          await http.get(url, headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        var dental = json.decode(utf8.decode(response.bodyBytes));
        setState(() {
          for (var u in dental) {
            Dentistry dentistry = new Dentistry.fromJson(u);
            listDentistry.add(dentistry);
          }
          // for (var u in listDentistry) {
          //   print(u.address);
          // }
        });
      }
    } catch (error) {
      throw (error);
    }
  }

  @override
  void initState() {
    super.initState();
    getSession();
    getListDentistry();
  }

  @override
  Widget build(BuildContext context) {
    //Account account = Provider.of<Account>(context);
    return Scaffold(
      appBar: SharedComponent.shared.buildAppBar("Dental Clinic Booking"),
      body: buildBody(context),
    );
  }

  IconButton createIconButtonForTabBar(String imageRef) {
    return IconButton(
      icon: SvgPicture.asset(
        imageRef,
        height: 30.0,
        width: 30.0,
        color: Constants.SILVER,
      ),
      onPressed: () {},
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/tooth.svg"),
        onPressed: () {},
      ),
//      title: Text("Home"),
      centerTitle: true,
    );
  }

  RatingBar _buildRatingBar(double rating) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: 20,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }

  Container buildBody(BuildContext context) {
    var datetime = DateTime.now();
    Size size = MediaQuery.of(context).size;
    //Account account = Provider.of<Account>(context);
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            children: <Widget>[
              // 1
              Padding(
                child: Column(
                  children: <Widget>[
                    Text(
                      DateFormat('dd/MM/yyyy').format(datetime),
                      style: TextStyle(color: Constants.PRIMARY_COLOR),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Chào " + name.toString() == null
                          ? 'GUEST'
                          : "Chào " + name.toString(),
                      style: TextStyle(fontSize: 32),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                padding: EdgeInsets.only(left: 12),
              ),

              // your next appointment
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: NextAppointmentCard(
                    // phone: phone.toString() == null
                    //     ? 'Not yet'
                    //     : phone.toString()
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   itemBuilder: (_, index) {
              //     Dental dental = Dental(
              //         listDentistry[index].name,
              //         listDentistry[index].address,
              //         listDentistry[index].rating);
              //     return DentalItem(dental);
              //   },
              //   itemCount: listDentistry.length,
              // ),

              // RaisedButton(onPressed: () => Navigator.of(context).push(context, MaterialPageRoute(builder: (_) => Home()), (route) => false)),
              // SizedBox(height: size.height * 0.05),

              // Container(
              //   alignment: Alignment.center,
              //   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              //   child: RaisedButton(
              //     onPressed: () {
              //       Navigator.pushAndRemoveUntil(
              //           context,
              //           MaterialPageRoute(
              //               builder: (_) => FilterNetworkListPage()),
              //           (route) => false);
              //     },
              //                       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(80.0)),
              //     textColor: Colors.white,
              //     padding: const EdgeInsets.all(0),
              //     child: Container(
              //       alignment: Alignment.center,
              //       height: 50.0,
              //       width: size.width * 0.5,
              //       decoration: new BoxDecoration(
              //           //color: Colors.blue,
              //           borderRadius: BorderRadius.circular(80.0),
              //           gradient: new LinearGradient(colors: [
              //             Constants.PRIMARY_COLOR,
              //             Constants.HEAVY_BLUE
              //             // Color.fromARGB(255, 255, 136, 34),
              //             // Color.fromARGB(255, 255, 177, 41)
              //           ])),
              //       padding: const EdgeInsets.all(0),
              //       child: Text(
              //         "Đăng nhập",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //   ),
              // ),

              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () {
                    // onSignInClicked();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FilterNetworkListPage()));
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
                      "Tìm kiếm nha khoa",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.05),

              // Visibility(
              //   visible: booking_status == 'FINISHED',
              //   child: Container(
              //     alignment: Alignment.center,
              //     margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              //     child: RaisedButton(
              //       onPressed: () {
              //         // onSignInClicked();
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => RatingsPage()));
              //       },
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(80.0)),
              //       textColor: Colors.white,
              //       padding: const EdgeInsets.all(0),
              //       child: Container(
              //         alignment: Alignment.center,
              //         height: 50.0,
              //         width: size.width * 0.5,
              //         decoration: new BoxDecoration(
              //             //color: Colors.blue,
              //             borderRadius: BorderRadius.circular(80.0),
              //             gradient: new LinearGradient(colors: [
              //               Constants.PRIMARY_COLOR,
              //               Constants.HEAVY_BLUE
              //               // Color.fromARGB(255, 255, 136, 34),
              //               // Color.fromARGB(255, 255, 177, 41)
              //             ])),
              //         padding: const EdgeInsets.all(0),
              //         child: Text(
              //           "Đánh giá nha khoa",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 80,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
