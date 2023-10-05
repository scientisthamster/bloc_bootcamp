import 'package:bloc_bootcamp/counter_bloc/counter_bloc.dart';
import 'package:bloc_bootcamp/counter_bloc/main.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/first':
        return MaterialPageRoute(
          builder: (context) => BlocProvider<CounterCubit>.value(
            value: _counterCubit,
            child: const FirstScreen(),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => BlocProvider<CounterCubit>.value(
            value: _counterCubit,
            child: const SecondScreen(),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
