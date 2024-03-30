import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webbait/widgets/episode_widget.dart';
import 'package:flutter/services.dart' as rootBundle;

class Detailscreen extends StatefulWidget {
  Detailscreen({
    super.key,
    required this.img,
    required this.id,
    required this.name,
    required this.src,
    required this.storie,
  });
  final String id;
  final String img;
  final String name;
  final String src;
  final String storie;

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  int aaa = 1;

  onButtonTab() async {
    await launchUrlString(
        "https://www.webtoons.com/th/${widget.src}/ep${aaa}/viewer?title_no=${widget.id}&episode_no=${aaa}");
    // "https://comic.naver.com/webtoon/detail?titleId=758150&no=1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 78, 91, 79),
        title: Text(
          widget.name,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 125,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 10),
                        color: Colors.black.withOpacity(0.3),
                      )
                    ]),
                child: Image(
                  image: NetworkImage(widget.img),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(widget.storie,
                  style: const TextStyle(
                    fontSize: 16,
                  )),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 300,
                height: 300,
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      int a = index + 1;
                      return GestureDetector(
                        onTap: () {
                          aaa = a;
                          onButtonTab();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green.shade400,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  offset: const Offset(5, 5),
                                  color: Colors.black.withOpacity(0.1),
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ตอนที่ $a",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    )),
                                const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
