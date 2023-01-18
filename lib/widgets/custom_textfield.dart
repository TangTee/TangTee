import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:tangteevs/feed/FeedPage.dart';
import '../HomePage.dart';
import '../utils/color.dart';
import '../utils/color.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(70.0)),
    borderSide: BorderSide(color: green, width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: green, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(70.0)),
    borderSide: BorderSide(color: green, width: 2),
  ),
  fillColor: primaryColor,
  filled: true,
);

const textInputDecorationp = InputDecoration(
  labelStyle: TextStyle(color: Colors.black),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(70.0)),
    borderSide: BorderSide(color: purple, width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: purple, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(70.0)),
    borderSide: BorderSide(color: purple, width: 2),
  ),
  fillColor: primaryColor,
  filled: true,
);

const searchInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(70)),
    borderSide: BorderSide(color: lightOrange, width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: lightOrange, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(70.0)),
    borderSide: BorderSide(color: lightOrange, width: 2),
  ),
  fillColor: primaryColor,
  filled: true,
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplaceOut(context, page) {
  Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page), (route) => false);
}

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 14),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}

void showModalBottomSheetRP(BuildContext context, r_pid) {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final _report = FirebaseFirestore.instance
      .collection('report')
      .doc('reportPost')
      .collection(r_pid['uid'])
      .doc();
  showModalBottomSheet(
    useRootNavigator: true,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: Center(
                  child: Text(
                    'อนาจาร',
                    style: TextStyle(fontFamily: 'MyCustomFont', fontSize: 20),
                  ),
                ),
                onTap: () {
                  _report.set({
                    'rid': _report.id,
                    'postid': r_pid['postid'],
                    'activityName': r_pid['activityName'],
                    'place': r_pid['place'],
                    'location': r_pid['location'],
                    'date': r_pid['date'],
                    'time': r_pid['time'],
                    'detail': r_pid['detail'],
                    'peopleLimit': r_pid['peopleLimit'],
                    'uid': r_pid['uid'],
                    'problem': 'อนาจาร',
                    //'likes': [],
                    'timeStamp': DateTime.now(),
                    'reportBy': FirebaseAuth.instance.currentUser?.uid,
                  }).whenComplete(() {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: const Center(
                  child: Text(
                    'ความรุนแรง',
                    style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 20,
                    ),
                  ),
                ),
                onTap: () {
                  _report.set({
                    'rid': _report.id,
                    'postid': r_pid['postid'],
                    'activityName': r_pid['activityName'],
                    'place': r_pid['place'],
                    'location': r_pid['location'],
                    'date': r_pid['date'],
                    'time': r_pid['time'],
                    'detail': r_pid['detail'],
                    'peopleLimit': r_pid['peopleLimit'],
                    'uid': r_pid['uid'],
                    'problem': 'ความรุนแรง',
                    //'likes': [],
                    'timeStamp': DateTime.now(),
                    'reportBy': FirebaseAuth.instance.currentUser?.uid,
                  }).whenComplete(() {
                    nextScreenReplaceOut(context, MyHomePage());
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: const Center(
                  child: Text(
                    'การคุกคาม',
                    style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 20,
                    ),
                  ),
                ),
                onTap: () {
                  _report.set({
                    'rid': _report.id,
                    'postid': r_pid['postid'],
                    'activityName': r_pid['activityName'],
                    'place': r_pid['place'],
                    'location': r_pid['location'],
                    'date': r_pid['date'],
                    'time': r_pid['time'],
                    'detail': r_pid['detail'],
                    'peopleLimit': r_pid['peopleLimit'],
                    'uid': r_pid['uid'],
                    'problem': 'การคุกคาม',
                    //'likes': [],
                    'timeStamp': DateTime.now(),
                    'reportBy': FirebaseAuth.instance.currentUser?.uid,
                  }).whenComplete(() {
                    nextScreenReplaceOut(context, MyHomePage());
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: const Center(
                  child: Text(
                    'ข้อมูลเท็จ',
                    style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 20,
                    ),
                  ),
                ),
                onTap: () {
                  _report.set({
                    'rid': _report.id,
                    'postid': r_pid['postid'],
                    'activityName': r_pid['activityName'],
                    'place': r_pid['place'],
                    'location': r_pid['location'],
                    'date': r_pid['date'],
                    'time': r_pid['time'],
                    'detail': r_pid['detail'],
                    'peopleLimit': r_pid['peopleLimit'],
                    'uid': r_pid['uid'],
                    'problem': 'ข้อมูลเท็จ',
                    //'likes': [],
                    'timeStamp': DateTime.now(),
                    'reportBy': FirebaseAuth.instance.currentUser?.uid,
                  }).whenComplete(() {
                    nextScreenReplaceOut(context, MyHomePage());
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: const Center(
                  child: Text(
                    'สแปม',
                    style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 20,
                    ),
                  ),
                ),
                onTap: () {
                  _report.set({
                    'rid': _report.id,
                    'postid': r_pid['postid'],
                    'activityName': r_pid['activityName'],
                    'place': r_pid['place'],
                    'location': r_pid['location'],
                    'date': r_pid['date'],
                    'time': r_pid['time'],
                    'detail': r_pid['detail'],
                    'peopleLimit': r_pid['peopleLimit'],
                    'uid': r_pid['uid'],
                    'problem': 'สแปม',
                    //'likes': [],
                    'timeStamp': DateTime.now(),
                    'reportBy': FirebaseAuth.instance.currentUser?.uid,
                  }).whenComplete(() {
                    nextScreenReplaceOut(context, MyHomePage());
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: const Center(
                  child: Text(
                    'คำพูดแสดงความเกลีดชัง',
                    style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 20,
                    ),
                  ),
                ),
                onTap: () {
                  _report.set({
                    'rid': _report.id,
                    'postid': r_pid['postid'],
                    'activityName': r_pid['activityName'],
                    'place': r_pid['place'],
                    'location': r_pid['location'],
                    'date': r_pid['date'],
                    'time': r_pid['time'],
                    'detail': r_pid['detail'],
                    'peopleLimit': r_pid['peopleLimit'],
                    'uid': r_pid['uid'],
                    'problem': 'คำพูดแสดงความเกลีดชัง',
                    //'likes': [],
                    'timeStamp': DateTime.now(),
                    'reportBy': FirebaseAuth.instance.currentUser?.uid,
                  }).whenComplete(() {
                    nextScreenReplaceOut(context, MyHomePage());
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: const Center(
                    child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: redColor,
                      fontFamily: 'MyCustomFont',
                      fontSize: 20),
                )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showModalBottomSheetRC(BuildContext context, r_pid, Map mytext) {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final _report = FirebaseFirestore.instance
      .collection('report')
      .doc('reportComment')
      .collection(mytext['uid'])
      .doc();
  showModalBottomSheet(
    useRootNavigator: true,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: Center(
                  child: Text(
                    'อนาจาร',
                    style: TextStyle(fontFamily: 'MyCustomFont', fontSize: 20),
                  ),
                ),
                onTap: () {
                  _report.set({
                    'rid': _report.id,
                    'postid': mytext['postid'],
                    'Displayname': mytext['Displayname'],
                    'cid': mytext['cid'],
                    'comment': mytext['comment'],
                    'uid': mytext['uid'],
                    'problem': 'อนาจาร',
                    //'likes': [],
                    'timeStamp': DateTime.now(),
                    'reportBy': FirebaseAuth.instance.currentUser?.uid,
                  }).whenComplete(() {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: const Center(
                  child: Text(
                    'ความรุนแรง',
                    style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 20,
                    ),
                  ),
                ),
                onTap: () {
                  _report.set({
                    'rid': _report.id,
                    'postid': mytext['postid'],
                    'Displayname': mytext['Displayname'],
                    'cid': mytext['cid'],
                    'comment': mytext['comment'],
                    'uid': r_pid['uid'],
                    'problem': 'ความรุนแรง',
                    //'likes': [],
                    'timeStamp': DateTime.now(),
                    'reportBy': FirebaseAuth.instance.currentUser?.uid,
                  }).whenComplete(() {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: const Center(
                  child: Text(
                    'การคุกคาม',
                    style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 20,
                    ),
                  ),
                ),
                onTap: () {
                  _report.set({
                    'rid': _report.id,
                    'postid': mytext['postid'],
                    'Displayname': mytext['Displayname'],
                    'cid': mytext['cid'],
                    'comment': mytext['comment'],
                    'uid': r_pid['uid'],
                    'problem': 'การคุกคาม',
                    //'likes': [],
                    'timeStamp': DateTime.now(),
                    'reportBy': FirebaseAuth.instance.currentUser?.uid,
                  }).whenComplete(() {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: const Center(
                  child: Text(
                    'ข้อมูลเท็จ',
                    style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 20,
                    ),
                  ),
                ),
                onTap: () {
                  _report.set({
                    'rid': _report.id,
                    'postid': mytext['postid'],
                    'Displayname': mytext['Displayname'],
                    'cid': mytext['cid'],
                    'comment': mytext['comment'],
                    'uid': r_pid['uid'],
                    'problem': 'ข้อมูลเท็จ',
                    //'likes': [],
                    'timeStamp': DateTime.now(),
                    'reportBy': FirebaseAuth.instance.currentUser?.uid,
                  }).whenComplete(() {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: const Center(
                  child: Text(
                    'สแปม',
                    style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 20,
                    ),
                  ),
                ),
                onTap: () {
                  _report.set({
                    'rid': _report.id,
                    'postid': mytext['postid'],
                    'Displayname': mytext['Displayname'],
                    'cid': mytext['cid'],
                    'comment': mytext['comment'],
                    'uid': r_pid['uid'],
                    'problem': 'สแปม',
                    //'likes': [],
                    'timeStamp': DateTime.now(),
                    'reportBy': FirebaseAuth.instance.currentUser?.uid,
                  }).whenComplete(() {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: const Center(
                  child: Text(
                    'คำพูดแสดงความเกลีดชัง',
                    style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 20,
                    ),
                  ),
                ),
                onTap: () {
                  _report.set({
                    'rid': _report.id,
                    'postid': r_pid['postid'],
                    'activityName': r_pid['activityName'],
                    'place': r_pid['place'],
                    'location': r_pid['location'],
                    'date': r_pid['date'],
                    'time': r_pid['time'],
                    'detail': r_pid['detail'],
                    'peopleLimit': r_pid['peopleLimit'],
                    'uid': r_pid['uid'],
                    'problem': 'คำพูดแสดงความเกลีดชัง',
                    //'likes': [],
                    'timeStamp': DateTime.now(),
                    'reportBy': FirebaseAuth.instance.currentUser?.uid,
                  }).whenComplete(() {
                    nextScreenReplaceOut(context, MyHomePage());
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                title: const Center(
                    child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: redColor,
                      fontFamily: 'MyCustomFont',
                      fontSize: 20),
                )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
