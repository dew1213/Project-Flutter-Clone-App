import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:webbait/models/webtoon_models.dart';
import 'package:webbait/screens/detail_screen.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "Webmaitoon clone",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<WebtoonModel>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detailscreen(
                              img: items[index].thumb.toString(),
                              id: items[index].id.toString(),
                              name: items[index].title.toString(),
                              src: items[index].src.toString(),
                              storie: items[index].storie.toString()),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 250,
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
                                image:
                                    NetworkImage(items[index].thumb.toString()),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 8, right: 8, top: 15),
                              child: Text(
                                items[index].title.toString(),
                                style: GoogleFonts.inter(
                                  // textStyle: Theme.of(context).textTheme.titleLarge,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<WebtoonModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString("assets/today.json");
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => WebtoonModel.fromJson(e)).toList();
  }
}
