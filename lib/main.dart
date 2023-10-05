import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:counter/counter.dart';
import 'package:timer/timer.dart';

void main() {
  Bloc.observer = const TimerObserver();
  runApp(const App());
}
