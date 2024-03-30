// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:flutter/services.dart' as rootBundle;

// class Episode extends StatefulWidget {
//   const Episode(
//       {super.key, required this.id, required this.src, required this.id_page});

//   final String id;
//   final String src;
//   final int id_page;

//   @override
//   State<Episode> createState() => _EpisodeState();
// }

// class _EpisodeState extends State<Episode> {
//   int aaa = 1;

//   onButtonTab() async {
//     await launchUrlString(
//         "https://www.webtoons.com/th/${widget.src}/ep${aaa}/viewer?title_no=${widget.id}&episode_no=${aaa}");
//     // "https://comic.naver.com/webtoon/detail?titleId=758150&no=1");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         aaa = widget.id_page;
//         onButtonTab();
//       },
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 10),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.green.shade400,
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 5,
//                 offset: const Offset(5, 5),
//                 color: Colors.black.withOpacity(0.1),
//               )
//             ]),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: 10,
//             horizontal: 20,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("ตอนที่ ${widget.id_page}",
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                   )),
//               const Icon(
//                 Icons.chevron_right_rounded,
//                 color: Colors.white,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
