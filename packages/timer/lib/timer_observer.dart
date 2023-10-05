import 'package:shared/shared.dart';

class TimerObserver extends BlocObserver {
  const TimerObserver();

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // ignore: avoid_print
    print('${transition.runtimeType}; event : ${transition.event.runtimeType}; currentState : ${transition.currentState.runtimeType}; nextState : ${transition.nextState.runtimeType}');
  }
}