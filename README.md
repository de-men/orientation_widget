<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A Flutter widget that forces the device rotates into the set of orientations the application interface can be displayed in.

## Features

Force device keep portrait/landscape or what the set of orientations that you want.
Support to reset that config after disposing.

## Getting started

Keep in mind that the widget will only work once in a top-level container. the descendants will not work.

## Usage

Keep portrait orientations

```dart
OrientationWidget.portrait(
  child: const PortraitPage(),
)
```

Keep landscape orientations

```dart
OrientationWidget.landscape(
  child: const LandscapePage(),
)
```

Keep specific orientations

```dart
OrientationWidget(
  child: const LandscapeLeftPage(),
  orientations: [DeviceOrientation.landscapeLeft],
)
```

Then reset to specific orientations, otherwise it allows autoOrientations

```dart
OrientationWidget.portrait(
  child: const PortraitPage(),
  then: landscapeOrientations,
),
```

## Additional information

Feel free to give feedbacks or report issues. Thank you!