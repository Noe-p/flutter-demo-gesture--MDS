import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemples de GestureDetector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Example 1: Tap avec long appui
            GestureDetector(
              onTap: () {
                print('Tap detected!');
              },
              onLongPress: () {
                print('Long press detected!');
              },
              child: Container(
                width: 200,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Appuyez ou Maintenez!',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),

            // Example 2: Double Tap
            GestureDetector(
              onDoubleTap: () {
                print('Double tap detected!');
              },
              child: Container(
                width: 200,
                height: 100,
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    'Double Appuyez!',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),

            // Example 3: Pan (Déplacement)
            GestureDetector(
              onPanUpdate: (details) {
                print('Pan update - Delta: ${details.delta}');
              },
              child: Container(
                width: 200,
                height: 100,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Faites glisser!',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),

            // Example 4: Scale (Mise à l'échelle)
            ScaleExample(),
          ],
        ),
      ),
    );
  }
}

class ScaleExample extends StatefulWidget {
  const ScaleExample({super.key});

  @override
  _ScaleExampleState createState() => _ScaleExampleState();
}

class _ScaleExampleState extends State<ScaleExample> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleUpdate: (details) {
        setState(() {
          _scale = details.scale;
        });
      },
      child: Transform.scale(
        scale: _scale,
        child: Container(
          width: 200,
          height: 100,
          color: Colors.purple,
          child: const Center(
            child: Text(
              'Pincez pour mettre à l\'échelle!',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
