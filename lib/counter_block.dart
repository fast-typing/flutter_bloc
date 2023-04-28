import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class CounterBloc {
  late int _counter;

  CounterBloc() {   // Описываем дефолт
    _counter = -1;
    _actionController.stream.listen(_increaseStream);   // ? Функция, которую можно будет использовать. Навешеваем слушатель
  }

  final _counterStream = BehaviorSubject<int>.seeded(-1); // Что мы изначально отображаем

  Stream get pressedCount => _counterStream.stream;
  Sink get _addValue => _counterStream.sink;

  StreamController _actionController = StreamController();
  StreamSink get incrementCounter => _actionController.sink;

  void _increaseStream(data) {
    _counter += 1;
    _addValue.add(_counter);
  }

  void dispose() {    // Закрываем потоки если они нам больше не нужны
    _counterStream.close();
    _actionController.close();
  }
}