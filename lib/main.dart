import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Transaction> transactions = [
    Transaction(
        't1', 'Transportation', 99.9, DateTime.now(), 'Lucena to Padre Burgos'),
    Transaction('t2', 'Food', 10.9, DateTime.now(), 'Bonchon'),
    Transaction('t3', 'Grocery', 150.9, DateTime.now(), ''),
    Transaction(
        't1', 'Transportation', 99.9, DateTime.now(), 'Lucena to Padre Burgos'),
    Transaction('t2', 'Food', 10.9, DateTime.now(), 'Bonchon'),
    Transaction('t3', 'Grocery', 150.9, DateTime.now(), ''),
    Transaction(
        't1', 'Transportation', 99.9, DateTime.now(), 'Lucena to Padre Burgos'),
    Transaction('t2', 'Food', 10.9, DateTime.now(), 'Bonchon'),
    Transaction('t3', 'Grocery', 150.9, DateTime.now(), ''),
  ];

  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet Raptor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wallet Raptor'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Charts
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Charts'),
                ],
              ),
            ),
            // Accounts
            // Container(
            //   height: 100,
            //   decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.black,
            //       width: 1,
            //     ),
            //   ),
            //   margin: const EdgeInsets.all(5),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: const [
            //       Text('Accounts'),
            //     ],
            //   ),
            // ),
            Card(
              elevation: 5,
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    controller: titleControler,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                    ),
                    controller: amountControler,
                  ),
                  TextButton(
                    onPressed: () {
                      // ignore: avoid_print
                      print(titleControler.text);
                      // ignore: avoid_print
                      print(amountControler.text);
                    },
                    child: const Text('Add Transaction'),
                  ),
                ],
              ),
            ),
            // Transaction List
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: (transactions.map(
                (tx) => Container(
                  margin: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      // Category Icon Column
                      const Expanded(
                        flex: 1,
                        child: Icon(Icons.money),
                      ),
                      // Details Column
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              tx.note,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Price Column
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PHP ${tx.amount}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(DateFormat('MM/dd/yyyy').format(tx.date)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
