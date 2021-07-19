import 'package:clinicbookingapp/views/provider/Account.dart';
import 'package:clinicbookingapp/views/search/filter_network_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clinicbookingapp/views/profile/profile-page.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:provider/provider.dart';
//import 'package:clinicbookingapp/views/schedule/schedule-page.dart';

import '../home/home.dart';
import '../../main.dart';

class MainTabBar extends StatefulWidget {
  // final String phone;

  const MainTabBar({
    Key key,
    //@required this.phone
  }) : super(key: key);
  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  dynamic phone, name;
  getSession() async {
    phone = await FlutterSession().get("ACCOUNT_PHONE");
    name = await FlutterSession().get("ACCOUNT_NAME");
  }

  @override
  void initState() {
    super.initState();
    getSession();
  }

  @override
  Widget build(BuildContext context) {
    //Account account = Provider.of<Account>(context);

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.calendar_today),
//          ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//           ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return CupertinoTabView(
            navigatorKey: firstTabNavKey,
            builder: (BuildContext context) => Home(),
          );
        } else if (index == 1) {
          return CupertinoTabView(
            navigatorKey: secondTabNavKey,
            builder: (BuildContext context) => FilterNetworkListPage(),
            // navigatorKey: secondTabNavKey,
            // builder: (BuildContext context) => DentalList(dental: [
            //   new Dental('Nha khoa Tâm Như', '200/1 Nguyễn Trọng Tuyển', 5),
            //   new Dental('nha khoa Kim', '211/41 Hoàng Văn Thụ', 5),
            // ],),
          );
          //return CupertinoTabView(navigatorKey: secondTabNavKey, builder: (BuildContext context) => SchedulePage(),);
//          return CupertinoTabView(
//            navigatorKey: secondTabNavKey,
//            builder: (BuildContext context) => StepperReserve(),
//          );
        } else {
          return CupertinoTabView(
            navigatorKey: thirdTabNavKey,
            builder: (BuildContext context) => ProfilePage(),
          );
        }
      },
    );
  }
}
