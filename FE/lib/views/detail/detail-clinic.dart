import 'package:clinicbookingapp/views/reserve/reserve.dart';
import 'package:clinicbookingapp/views/reserve/stepper_reserve.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clinicbookingapp/helpers/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_session/flutter_session.dart';

//Create Class Clinic
// class Clinic {
//   String name;
//   String phone;
//   String email;
//   // String image;
//   String address;
//   // String description;
//   double totalRating;
//   Clinic(this.name, this.phone, this.email, this.address, this.totalRating);
// }

class DetailClinicScreen extends StatefulWidget {
  final String address;
  final double rating;
  final String name;
  final String phone;
  final String email;
  final String kilometer;
  final String image;

  const DetailClinicScreen(
      {Key key,
      @required this.address,
      @required this.rating,
      @required this.name,
      @required this.phone,
      @required this.email,
      @required this.kilometer,
      @required this.image})
      : super(key: key);

  @override
  _DetailClinicScreenState createState() => _DetailClinicScreenState();
}

class _DetailClinicScreenState extends State<DetailClinicScreen> {
  // final Clinic clinic;
  // _DetailClinicScreenState(this.clinic);
  //dynamic address;

  // getSession() async {
  //   address = await FlutterSession().get("ADDRESS");
  //   print(address);
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getSession();
  //   print(address);
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Chi tiết phòng khám"),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Container(
                width: size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: Card(
                          child: Image.asset(
                            Constants.IMAGE_FOLDER_REF + widget.image,
                            height: 250,
                            width: 350,
                            alignment: Alignment.center,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Text(
                          widget.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Text(
                          'Hotline : ' + widget.phone,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        child: Text(
                          'Email : ' + widget.email == null
                              ? ''
                              : 'Email : ' + widget.email,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        child: Text(
                          'Địa chỉ : ' + widget.address,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      // SizedBox(
                      //   height: 5.0,
                      // ),
                      // Container(
                      //   child: Text(
                      //     'Mô tả : ' + " clinic.description",
                      //     style: TextStyle(fontSize: 15),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Text(
                          'Khoảng cách : ' + widget.kilometer + " km",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _totalRating(widget.rating),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      // Container(
                      //   child: Card(
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(10.0))),
                      //     child: SingleChildScrollView(
                      //       child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: <Widget>[
                      //             Container(
                      //               child: Row(
                      //                 children: [
                      //                   Text(
                      //                     'Tổng quan : ',
                      //                     style: TextStyle(fontSize: 20),
                      //                   ),
                      //                   //_totalRating(clinic.totalRating),
                      //                 ],
                      //               ),
                      //             ),
                      //             SizedBox(height: 10),
                      //             Text('3 Đánh giá',
                      //                 style: TextStyle(fontSize: 15)),
                      //             SizedBox(height: 20),
                      //             Container(
                      //               child: ListCommentRating(
                      //                 rating: [
                      //                   new Rating(
                      //                       'Nguyễn Ngọc Linh',
                      //                       'Dịch vụ cạo vôi răng rẻ và tốt',
                      //                       4,
                      //                       'user.png'),
                      //                   new Rating(
                      //                       'Phạm Minh Bảo',
                      //                       'Dịch vụ nhổ răng khôn rẻ',
                      //                       4,
                      //                       'user.png'),
                      //                   new Rating(
                      //                       'Nguyễn Trung Tín',
                      //                       'Dịch vụ niềng răng rẻ',
                      //                       4,
                      //                       'user.png')
                      //                 ],
                      //               ),
                      //             ),
                      //           ]),
                      //     ),
                      //   ),
                      //   //child: RatingBar.builder(itemBuilder: , onRatingUpdate: onRatingUpdate),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            // FloatingActionButton.extended(
            //   onPressed: (){
            //     //Add code here
            //   },
            //   label: const Text('Đặt lịch'),
            //   icon: const Icon(Icons.app_registration),
            // ),
            // FloatingActionButton(
            //   onPressed: (){
            //     //Add code here
            //   },
            //   child: const Icon(Icons.phone),
            // ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    //Add code here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReserveScreen(
                                dentistryAddress: widget.address,
                              )),
                    );
                  },
                  label: const Text('Đặt lịch'),
                  icon: const Icon(Icons.app_registration),
                ),
              ),
//                Align(
//                  alignment: Alignment.bottomRight,
//                  heightFactor: 13.6,
//                  child: FloatingActionButton(
//                    onPressed: (){
//                      //Add code here
//                    },
//                    child: const Icon(Icons.phone),
//                  ),
//                ),
            ],
          ),
        )
        // FloatingActionButton.extended(
        //   onPressed: (){
        //     //Add code here
        //   },
        // label: const Text('Đặt lịch'),
        // icon: const Icon(Icons.a
        );
  }

  RatingBar _totalRating(double totalRating) {
    return RatingBar.builder(
      initialRating: totalRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: 30,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

class Rating {
  String name;
  String commet;
  String image;
  double rating;
  Rating(this.name, this.commet, this.rating, this.image);
}

class ListRating extends StatefulWidget {
  final Rating rating;
  ListRating(Rating rating)
      : rating = rating,
        super(key: new ObjectKey(rating));
  @override
  _ListRatingState createState() => _ListRatingState(rating);
}

class _ListRatingState extends State<ListRating> {
  final Rating rating;
  _ListRatingState(this.rating);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      onTap: null,
      leading: GestureDetector(
        child: CircleAvatar(
          child: Image.asset(Constants.IMAGE_FOLDER_REF + rating.image),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _commentRating(rating.rating),
          Text("rating.name"),
          Text("rating.commet")
        ],
      ),
    );
  }

  RatingBar _commentRating(double totalRating) {
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
      onRatingUpdate: null,
    );
  }
}

class ListCommentRating extends StatefulWidget {
  List<Rating> rating;
  ListCommentRating({Key key, this.rating}) : super(key: key);

  @override
  _ListCommentRatingState createState() => _ListCommentRatingState();
}

class _ListCommentRatingState extends State<ListCommentRating> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    children: widget.rating.map((Rating rating) {
                      return new ListRating(rating);
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
