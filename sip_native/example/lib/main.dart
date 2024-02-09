import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:sip_native/sip_native.dart';
import 'package:sip_native_example/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SipNative.initPlugin().then((SipNativeSupport value) {
    print("Voip supported: ${value.isVoipSupported}\n" +
        "SipManager supported: ${value.isSipManagerSupported}");

  });
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
