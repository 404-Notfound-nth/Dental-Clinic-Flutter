import 'dart:async';

import 'package:clinicbookingapp/views/list%20dental/list_view_dental.dart';
import 'package:clinicbookingapp/views/reserve/reserve.dart';
import 'package:clinicbookingapp/views/search/dental.dart';
import 'package:clinicbookingapp/views/search/dentals_api.dart';
import 'package:clinicbookingapp/views/search/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_session/flutter_session.dart';

//not use
class FilterNetworkListPage extends StatefulWidget {
  @override
  FilterNetworkListPageState createState() => FilterNetworkListPageState();
}

class FilterNetworkListPageState extends State<FilterNetworkListPage> {
  //List<Book> books = [];
  List<Dental> dentals = [];
  Dental dental;
  String query = '';
  Timer debouncer;
  String _placeDistance;
  bool isVisi = false;
  dynamic address;

  @override
  void initState() {
    super.initState();
    //asyncMethod();
    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    //final books = await BooksApi.getBooks(query);

    final dentals = await DentalsApi.getDentals(query);
    //setState(() => this.books = books);
    setState(() => this.dentals = dentals);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                // final dental = dentals[index];

                // return //buildBook(book);
                //     buildDental(dental, context, size);
                DentalClinic dentalClinic = DentalClinic(
                    dentals[index].nameDental,
                    dentals[index].addressDental,
                    dentals[index].rating,
                    dentals[index].email,
                    dentals[index].phone,
                    dentals[index].kilometer,
                    dentals[index].image);
                // print(dentals[index].addressDental);
                // print(dentals[index].email);
                return DentalItem(dentalClinic);
              },
              itemCount: dentals.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Địa chỉ hoặc tên nha khoa',
        onChanged: searchDental,
      );

  Future searchDental(String query) async => debounce(() async {
        final dentals = await DentalsApi.getDentals(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.dentals = dentals;
        });
      });

  //==> phương thức tính toán là _calculateDistance á
  // Method for calculating the distance between two places

  Widget buildDental(Dental dental, BuildContext context, Size size) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dental.nameDental,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Địa chỉ : ' + dental.addressDental,
            ),
            SizedBox(
              height: 4,
            ),
            // Visibility(
            //   visible: _placeDistance == null ? false : true,
            //   child: Text('Khoảng cách : $_placeDistance km'),
            // ),
            Text(
              'Khoảng cách : $_placeDistance km',
            ),
            SizedBox(
              height: 4,
            ),
            _cardRating(dental.rating),
            SizedBox(
              height: 4,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // RaisedButton(
                  //   // onPressed: () {
                  //   //   Navigator.push(
                  //   //     context,
                  //   //     MaterialPageRoute(
                  //   //         builder: (context) => ReserveScreen()),
                  //   //   );
                  //   // },
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(80.0)),
                  //   textColor: Colors.white,
                  //   padding: const EdgeInsets.all(0),
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     height: 40.0,
                  //     width: size.width * 0.4,
                  //     decoration: new BoxDecoration(
                  //         //color: Colors.blue,
                  //         borderRadius: BorderRadius.circular(80.0),
                  //         gradient: new LinearGradient(colors: [
                  //           Color(0xFF007AFF),
                  //           Color(0xFF3E3EF4)
                  //           // Color.fromARGB(255, 255, 136, 34),
                  //           // Color.fromARGB(255, 255, 177, 41)
                  //         ])),
                  //     padding: const EdgeInsets.all(0),
                  //     child: Text(
                  //       "Chi Tiết",
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

RatingBar _cardRating(double totalRating) {
  return RatingBar.builder(
    initialRating: totalRating,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemSize: 20,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: (value) {},
  );
}
