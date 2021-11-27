library orientation_widget;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const autoOrientations = <DeviceOrientation>[
  DeviceOrientation.landscapeRight,
  DeviceOrientation.landscapeLeft,
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
];

const landscapeOrientations = <DeviceOrientation>[
  DeviceOrientation.landscapeRight,
  DeviceOrientation.landscapeLeft,
];

const portraitOrientations = <DeviceOrientation>[
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
];

class OrientationWidget extends StatefulWidget {
  final Widget child;

  final List<DeviceOrientation> orientations;
  final List<DeviceOrientation>? then;

  factory OrientationWidget.portrait({
    required Widget child,
    List<DeviceOrientation>? then,
  }) {
    return OrientationWidget(
      child: child,
      orientations: portraitOrientations,
      then: then,
    );
  }

  factory OrientationWidget.landscape({
    required Widget child,
    List<DeviceOrientation>? then,
  }) {
    return OrientationWidget(
      child: child,
      orientations: landscapeOrientations,
      then: then,
    );
  }

  const OrientationWidget({
    required this.child,
    required this.orientations,
    this.then,
    Key? key,
  }) : super(key: key);

  @override
  OrientationWidgetState createState() => OrientationWidgetState();
}

class OrientationWidgetState extends State<OrientationWidget> {
  @override
  void initState() {
    final state = context.findAncestorStateOfType<OrientationWidgetState>();
    if (state == null) {
      SystemChrome.setPreferredOrientations(widget.orientations);
    } else {
      debugPrint('Already there is an ancestor orientation widget!');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(widget.then ?? autoOrientations);
    super.dispose();
  }
}
