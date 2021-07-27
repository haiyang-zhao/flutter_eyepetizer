import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eyepetizer/app_init.dart';
import 'package:flutter_eyepetizer/tab_nav.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    //setSystemUIOverlayStyle
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FutureBuilder async ui
    return FutureBuilder(
      future: AppInit.init(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        var widget = snapshot.connectionState == ConnectionState.done
            ? TabNavigation()
            : Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
        return _MaterialAppStatefulWidget(child: widget);
      },
    );
  }
}

// material design app
class _MaterialAppStatefulWidget extends StatefulWidget {
  final Widget child;

  _MaterialAppStatefulWidget({Key? key, required this.child}) : super(key: key);

  @override
  __MaterialAppStatefulWidgetState createState() =>
      __MaterialAppStatefulWidgetState();
}

class __MaterialAppStatefulWidgetState
    extends State<_MaterialAppStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EyePetizer",
      initialRoute: '/',
      routes: {"/": (BuildContext context) => widget.child},
    );
  }
}
