import 'package:flutter/material.dart';
import 'package:flutter_easy_option_menu/gzn_easy_option_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  int _counter = 0;

  void _incrementCounter() {

    List<String> list = [
      "Android CupcakeAndroid CupcakeAndroid CupcakeAndroid Cupcake",
      "Android Donut",
      "Android Eclair",
      "Android Froyo",
      "Android Gingerbread",
      "Android Honeycomb",
      "Android Ice Cream Sandwich",
      "Android Jelly Bean",
      "Android Kitkat",
      // "Android Lollipop",
      // "Android Marshmallow",
      // "Android Nougat",
      // "Android Oreo",
      // "Android Pie",
    ];

    List<ItemOptionModel> listConvert = [];
    for (var i = 0; i < list.length; i++) {
      listConvert.add(ItemOptionModel(unique: i, label: list[i]));
    }

    showDialog(
      context: context,
      builder: (context) => EasyOptionMenu(
        list: listConvert,
      ),
    ).then((value) {
      if(value != null){
        var v = value as ItemOptionModel;
        print("zein_${v.label}_${v.unique}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
