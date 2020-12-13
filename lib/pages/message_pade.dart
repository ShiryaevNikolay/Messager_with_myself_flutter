import 'dart:async';

import 'package:flutter/material.dart';
import 'package:messager_flutter/model/database.dart';
import 'package:messager_flutter/model/message.dart';
import 'package:provider/provider.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final AppDatabase database = Provider.of(context);

    if (_controller.hasClients) {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    }

    return StreamBuilder(
      stream: database.getMessage(),
      builder: (context, snapshot) {
        return snapshot.data == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                controller: _controller,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                    child: Wrap(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0x20000000),
                                      blurRadius: 5,
                                      offset: Offset(0, 5))
                                ]),
                            child: Text(
                              snapshot.data[index].message,
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  );
                });
      },
    );
  }
}
