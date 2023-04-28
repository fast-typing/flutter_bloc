import 'dart:async';

import 'package:flutter/material.dart';
import 'counter_block.dart';

void main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatelessWidget {
  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<dynamic>(
            stream: counterBloc.pressedCount,
            builder: (context, snapshot) {
              // print(snapshot);
              return Text(
                'Flutter Counter Bloc Example - ${snapshot.data.toString()}',
              );
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<dynamic>(
                stream: counterBloc.pressedCount,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data.toString()}',
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 100.0,
        height: 100.0,
        child: FloatingActionButton(
          onPressed: () {
            counterBloc.incrementCounter.add(['dfghdfughjshabd', 324234, true]);
          },
          tooltip: 'Increment',
          child: Text(
            "+ \n send \n to BLoC",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}