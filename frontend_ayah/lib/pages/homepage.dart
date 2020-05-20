import 'dart:convert';
import 'dart:math';

import 'package:ayah/constants/colors.dart';
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
              return StatefulBuilder(
                builder: (context, setState) {
                  final color = backGroundColors[Random().nextInt(7)];

                  return VxSwiper(
                    scrollDirection: Axis.horizontal,
                    height: context.screenHeight,
                    viewportFraction: 1.0,
                    items: snapshot.data
                        .map<Widget>(
                          (element) => VStack(
                            [
                              "${element["quoteText"]}"
                                  .text
                                  .bold
                                  .center
                                  .white
                                  .xl3
                                  .make(),
                              IconButton(
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                                iconSize: 30.0,
                              )
                            ],
                            crossAlignment: CrossAxisAlignment.center,
                            alignment: MainAxisAlignment.spaceAround,
                          )
                              .animatedBox
                              .p16
                              .color(color)
                              .make()
                              .w(context.screenWidth)
                              .h(context.screenHeight),
                        )
                        .toList(),
                    onPageChanged: (index) {
                      setState(() {});
                    },
                  );
                },
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
