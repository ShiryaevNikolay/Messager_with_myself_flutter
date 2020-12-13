import 'package:flutter/material.dart';
import 'package:messager_flutter/model/database.dart';
import 'package:messager_flutter/pages/message_pade.dart';
import 'package:messager_flutter/ui/new_message_input_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppDatabase(),
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // SizedBox(
            //   height: statusBarHeight,
            // ),
            Expanded(child: MessagePage()),
            NewMessageInput()
          ],
        ),
      ),
    );
  }
}
