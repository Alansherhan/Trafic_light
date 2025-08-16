import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traffic Light',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 71, 68, 68),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Color cColor1 = Colors.redAccent,
      cColor3 = const Color.fromARGB(255, 33, 68, 30),
      cColor2 = const Color.fromARGB(255, 70, 70, 30),
      tColor = Colors.red;
  String? _msg = "STOP";
  int _counter = 1;
  void _changeColor() {
    switch (_counter) {
      case 1:
        cColor1 = Colors.red;
        cColor3 = const Color.fromARGB(255, 33, 68, 30);
        cColor2 = const Color.fromARGB(255, 70, 70, 30);
        tColor = Colors.red;
        _msg = 'STOP';
      // _counter++;
      case 2:
        cColor2 = Colors.yellow;
        cColor1 = const Color.fromARGB(255, 99, 42, 42);
        _msg = 'WAIT';
        tColor = Colors.yellow;
      // _counter++;
      case 3:
        tColor = Colors.green;
        cColor3 = Colors.green;
        cColor2 = const Color.fromARGB(255, 70, 70, 30);
        _msg = 'GO';
      // _counter = 1;
    }
  }
  // int _count = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter == 3) {
        _counter = 1;
      } else {
        _counter++;
      }
      _changeColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Traffic light"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LikeButton(),
            Text('$_msg', style: TextStyle(color: tColor, fontSize: 45)),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 70,
              height: 192,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: cColor1,
                      shape: BoxShape.circle,
                    ),
                    //color: const Color.fromARGB(255, 255, 20, 12),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: cColor2,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: cColor3,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            Container(width: 5, height: 250, color: tColor),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.swap_horiz_outlined),
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          liked = !liked;
        });
      },
      icon: Icon(
        liked ? Icons.favorite : Icons.favorite_outline,
        color: Colors.red,
      ),
    );
  }
}
