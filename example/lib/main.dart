import 'package:backdrop_modal_route/backdrop_modal_route.dart';
import 'package:example/custom_backdrop_modal_route.dart';
import 'package:example/stateful_backdrop_overlay_content.dart';
import 'package:example/stateless_backdrop_overlay_content.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Backdrop Modal Route Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // could be anything other than string,
  // depends on your BackdropModalRoute<T> return type
  String? backdropResult = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Backdrop Modal Route'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text('Return Data : $backdropResult'),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    // stateless default
                    Container(
                      child: FlatButton(
                        child: Text(
                          "Default Backdrop (Stateless) \n (String Return)",
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () async {
                          handleStatelessBackdropContent(context);
                        },
                      ),
                    ),

                    // stateful default
                    Container(
                      child: FlatButton(
                        child: Text(
                          "Default Backdrop (Stateful) \n (Int Return)",
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () async {
                          handleStatefulBackdropContent(context);
                        },
                      ),
                    ),

                    // customized
                    Container(
                      child: FlatButton(
                        child: Text(
                          "Inline Customized Default Backdrop \n (Void Return)",
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () =>
                            handleCustomizedBackdropContent(context),
                      ),
                    ),

                    // custom/single purpose extended from base
                    Container(
                      child: FlatButton(
                        child: Text(
                          "Custom/Single purpose backdrop modal route extended from base",
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () =>
                            handleCustomBackdropModalRoute(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleStatelessBackdropContent(BuildContext context) async {
    final result = await Navigator.push(
      context,
      BackdropModalRoute<String>(
        overlayContentBuilder: (context) => StatelessBackdropOverlayContent(),
      ),
    );

    setState(() {
      backdropResult = result;
    });
  }

  void handleStatefulBackdropContent(BuildContext context) async {
    final result = await Navigator.push(
      context,
      BackdropModalRoute<int>(
        overlayContentBuilder: (context) => CounterContentStateful(),
      ),
    );

    setState(() {
      backdropResult = result.toString();
    });
  }

  void handleCustomizedBackdropContent(BuildContext context) async {
    await Navigator.push(
      context,
      BackdropModalRoute<void>(
        overlayContentBuilder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height - 100.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Customized Backdrop Modal'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Barrier Dismiss Disabled'),
                ),
                RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Close'),
                ),
              ],
            ),
          );
        },
        topPadding: 100.0,
        barrierColorVal: Colors.deepPurple,
        backgroundColor: Colors.amberAccent,
        backdropShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
            bottomLeft: Radius.circular(200),
            bottomRight: Radius.circular(200),
          ),
        ),
        barrierLabelVal: 'Customized Backdrop',
        shouldMaintainState: false,
        canBarrierDismiss: false,
      ),
    );
  }

  void handleCustomBackdropModalRoute(BuildContext context) async {
    final result = await Navigator.push(
      context,
      CustomBackdropModalRoute(),
    );

    setState(() {
      backdropResult =
          result != null && result.isNotEmpty ? result.join(', ') : null;
    });
  }
}
