// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:tangteevs/admin/tag/case/Cat.dart';
// import 'package:tangteevs/admin/tag/case/Tag.dart';
// import '../../utils/color.dart';

// class TagPage extends StatefulWidget {
//   const TagPage({Key? key}) : super(key: key);
//   // const TagPage({required this.snap});
//   // final snap;
//   // const TagPage({required this.snap});

//   @override
//   _TagPageState createState() => _TagPageState();
// }

// class _TagPageState extends State<TagPage> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 1,
//           backgroundColor: mobileBackgroundColor,
//           title: const TabBar(
//             indicatorColor: green,
//             labelColor: green,
//             labelPadding: EdgeInsets.symmetric(horizontal: 30),
//             unselectedLabelColor: unselected,
//             labelStyle: TextStyle(
//                 fontSize: 20.0, fontFamily: 'MyCustomFont'), //For Selected tab
//             unselectedLabelStyle: TextStyle(
//                 fontSize: 20.0,
//                 fontFamily: 'MyCustomFont'), //For Un-selected Tabs
//             tabs: [
//               Tab(text: 'Category'),
//               Tab(text: 'Tag'),
//             ],
//           ),
//         ),
//         body: 
//         ),
//       ),
//     );
//   }
// }

// class CategoyPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final CollectionReference _categorys =
//       FirebaseFirestore.instance.collection('categorys');
//     return const MaterialApp(
//       home: CategoryPage(),
//     );
//   }
// }