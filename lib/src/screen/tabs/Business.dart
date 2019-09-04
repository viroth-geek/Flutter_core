import 'dart:async';

import 'package:core/service/requestService/get_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Business extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BusinessState();
  }
}

class _BusinessState extends State<Business> {
  final _streamController = StreamController<String>();

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetUser>(
      builder: (_) => GetUser(),
      child: Consumer<GetUser>(
        builder: (context, data, _) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                StreamBuilder(
                  stream: _streamController.stream,
                  builder: (context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      return Text(snapshot.requireData);
                    }
                    return Text("Business");
                  },
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                data.getUser();
                print("damn ${data.damn}");
                print("object list ${data.user.length}");
                _streamController.add(data.damn);
              },
            ),
          );
        },
      ),
    );
  }
}
