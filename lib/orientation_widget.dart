library orientation_widget;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  /// OrientationWidget.portrait is a widget that sets the orientation of the device to portrait.
  /// Should be used with [MaterialPageRoute] to set the orientation of the page.
  ///
  /// [then] is called when the widget is disposed if not null.
  /// It is useful to restore the orientation to the previous one.
  /// For example, if you want to restore the orientation to portrait
  /// after the user leaves the landscape page.
  ///
  /// ```dart
  /// Navigator.of(context).push(
  ///   MaterialPageRoute(
  ///     builder: (context) => OrientationWidget.portrait(
  ///       then: landscapeOrientations,
  ///       child: const LandscapePage(),
  ///     ),
  ///   ),
  /// );
  /// ```
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

  /// OrientationWidget.landscape is a widget that sets the orientation of the device to landscape.
  /// Should be used with [MaterialPageRoute] to set the orientation of the page.
  ///
  /// [then] is called when the widget is disposed if not null.
  /// It is useful to restore the orientation to the previous one.
  /// For example, if you want to restore the orientation to portrait
  /// after the user leaves the landscape page.
  ///
  /// ```dart
  /// Navigator.of(context).push(
  ///   MaterialPageRoute(
  ///     builder: (context) => OrientationWidget.landscape(
  ///       then: portraitOrientations,
  ///       child: const LandscapePage(),
  ///     ),
  ///   ),
  /// );
  /// ```
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

  /// OrientationWidget is a widget that sets the orientation of the device.
  /// Should be used with [MaterialPageRoute] to set the orientation of the page.
  ///
  /// [then] is called when the widget is disposed if not null.
  /// It is useful to restore the orientation to the previous one.
  /// For example, if you want to restore the orientation to portrait
  /// after the user leaves the landscape page.
  ///
  /// ```dart
  /// Navigator.of(context).push(
  ///   MaterialPageRoute(
  ///     builder: (context) => const OrientationWidget(
  ///       orientations: [DeviceOrientation.landscapeLeft],
  ///       then: portraitOrientations,
  ///       child: const PortraitPage(),
  ///     ),
  ///   ),
  /// );
  /// ```
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
    if (context.findAncestorStateOfType<OrientationWidgetState>() != null) {
      throw StateError('There is another OrientationWidgetState in the tree.');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SystemChrome.setPreferredOrientations(widget.orientations),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return widget.child;
        }
        return const SizedBox();
      },
    );
  }

  @override
  void dispose() {
    if (widget.then != null) {
      SystemChrome.setPreferredOrientations(widget.then!);
    }
    super.dispose();
  }
}
