import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return VxSwiper(
                items: snapshot.data
                    .map<Widget>(
                      (element) => "${element["quoteText"]}".text.make(),
                    )
                    .toList(),
              );
            }
            return "No data found".text.makeCentered();
          } else if (snapshot.connectionState == ConnectionState.none) {
            return "Error".text.makeCentered();
          }
          return CircularProgressIndicator().centered();
        },
      ),
    );
  }

  fetchData() async {
    // Replace with local URL
    final url = "http://192.168.0.113:3000/api/quotes";
    var response = await http.get(url);

    return jsonDecode(utf8.decode(response.bodyBytes))["quotes"];
  }
}
