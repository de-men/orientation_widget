import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orientation_widget/orientation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Flutter Demo'),
      ),
      body: const Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OrientationWidget.landscape(
              then: autoOrientations,
              child: const LandscapePage(),
            ),
          ),
        ),
        tooltip: 'Go to landscape',
        child: const Icon(Icons.screen_lock_landscape),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LandscapePage extends StatelessWidget {
  const LandscapePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Flutter Demo'),
      ),
      body: const Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Text('Landscape Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OrientationWidget.portrait(
              then: landscapeOrientations,
              child: const PortraitPage(),
            ),
          ),
        ),
        tooltip: 'Go to portrait',
        child: const Icon(Icons.screen_lock_portrait),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class PortraitPage extends StatelessWidget {
  const PortraitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Flutter Demo'),
      ),
      body: const Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Text('Portrait Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OrientationWidget(
              orientations: [DeviceOrientation.landscapeLeft],
              then: portraitOrientations,
              child: LandscapePage(),
            ),
          ),
        ),
        tooltip: 'Go to landscape left',
        child: const Icon(Icons.screen_lock_rotation),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LandscapeLeftPage extends StatelessWidget {
  const LandscapeLeftPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Flutter Demo'),
      ),
      body: const Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Text('Landscape Left Page'),
      ),
    );
  }
}
