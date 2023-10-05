import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:counter/counter.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}
