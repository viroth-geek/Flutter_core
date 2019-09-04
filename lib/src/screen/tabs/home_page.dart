import 'package:core/data_provider/user/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      builder: (_) => Counter(),
      child: Consumer<Counter> (
        builder: (context, data, _) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${data.counter}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {data.increment();
                  },
                  tooltip: "Increment",
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () {data.decrement();
                  },
                  tooltip: "increment",
                  child: Icon(Icons.remove),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
