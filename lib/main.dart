import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Overlay Rive"),
          ),
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: "Comment"),
                  onChanged: (val) {
                    setState(() {
                      txt = val;
                    });
                  },
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  if (txt == "congrats") {
                    ShowNotificationIcon sn = new ShowNotificationIcon();
                    sn.show(context);
                  }
                },
                child: Text(
                  "Send",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}

class ShowNotificationIcon {
  void show(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = new OverlayEntry(builder: _build);

    overlayState.insert(overlayEntry);

    await new Future.delayed(const Duration(seconds: 4));

    overlayEntry.remove();
  }

  Widget _build(BuildContext context) {
    return FlareActor("assets/baloons.flr",
        sizeFromArtboard: true,
        fit: BoxFit.cover,
        //alignment: Alignment.center,
        animation: "baloon");
  }
}
