import 'dart:convert';

import 'package:clinicbookingapp/views/provider/Dentistry.dart';
import 'package:clinicbookingapp/views/search/dental.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

//not need
class DentalsApi {
  static Future<List<Dental>> getDentals(String query) async {
    List<Dentistry> listDentistry = [];
    final url = Uri.parse('https://localhost:8080/api/dentistry');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List dentals = json.decode(utf8.decode(response.bodyBytes));
      print(dentals);
      var den = json.decode(utf8.decode(response.bodyBytes));
      var session = FlutterSession();
      // for (int i = 0; i < dentals.length; i++) {
      //   print("=======================" + dentals[i]['id']);
      //   await session.set("ADDRES " + i.toString(), dentals[i]['address']);
      // }
      // for (int i = 0; i < dentals.length; i++) {
      //   dynamic address = await FlutterSession().get("ADDRES " + i.toString());

      //   print("+++++++++++++++++++" + address);
      // }
      return dentals.map((json) => Dental.fromJson(json)).where((dental) {
        final nameDental = dental.nameDental.toLowerCase();
        final addressDental = dental.addressDental.toLowerCase();
        final searchLower = query.toLowerCase();

        return nameDental.contains(searchLower) ||
            addressDental.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
