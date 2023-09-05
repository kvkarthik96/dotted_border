
import 'package:dotted_separator/dotted_separator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Dotted Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const DottedSeparator(
              height: 20,
              width: double.infinity,
              axis: Axis.horizontal,
              dashColor: Colors.black,
              dashSpace: 4,
            ),
            const Text(
              'Horizontal dashed line',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const DottedSeparator(
                height: 20, width: double.infinity, axis: Axis.horizontal),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DottedSeparator(
                  height: 100,
                  width: 10,
                  axis: Axis.vertical,
                  dashSpace: 3,
                ),
                Text(
                  'Vertical dashed line',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                DottedSeparator(
                  height: 100,
                  width: 10,
                  axis: Axis.vertical,
                  dashColor: Colors.black,
                  dashSpace: 4,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DottedContainer(
                  height: 100,
                  width: 150,
                  shape: Shape.box,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Rectangle',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                DottedContainer(
                  height: 100,
                  width: 100,
                  shape: Shape.box,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'Square',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DottedContainer(
                  height: 100,
                  width: 150,
                  shape: Shape.box,
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                  child: const Center(
                    child: Text(
                      'Rounded Box',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.red),
                    ),
                  ),
                ),
                const DottedContainer(
                  height: 100,
                  width: 100,
                  shape: Shape.circle,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Circle',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
