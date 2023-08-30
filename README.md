# dotter_separator

A Flutter package that provides a customizable DottedSeparator widget that can be used to create a dotted line separator with adjustable color and dash width.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  dotter_separator: ^1.0.0
```

Then run `flutter pub get` to install the package.

## Usage

Import the package in your Dart code:

```dart
import 'package:dotter_separator/dotter_separator.dart';
```

Use the `DottedSeparator` widget to create a dotted line separator:

```dart
DottedSeparator(
  color: Colors.red,   // Color of the dots
  dashWidth: 3,        // Width of each dash
)
```

## Example

```dart
import 'package:flutter/material.dart';
import 'package:dotter_separator/dotter_separator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dotter Separator Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Above Separator'),
              DottedSeparator(
                color: Colors.red,
                dashWidth: 3,
              ),
              Text('Below Separator'),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Features and Customization

The `DottedSeparator` widget supports the following properties for customization:

- `color`: The color of the dots in the separator.
- `dashWidth`: The width of each dash in the separator.

## Compatibility

This package supports both Android and iOS devices.

## Issues and Contributions

If you encounter any issues or would like to contribute to this package, please visit the [GitHub repository](https://github.com/kvkarthik96/dotted_border) for more information.

## License

This package is released under the [MIT License](https://opensource.org/licenses/MIT).
