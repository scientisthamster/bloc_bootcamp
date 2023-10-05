
import 'package:shared/shared.dart';

Future<void> main() async {
  print('Bloc theory');
  final bloc = CounterBloc();
  print(bloc.state);
  bloc.add(CounterIncrementPressed());
  await Future.delayed(Duration.zero);
  print(bloc.state);
  await bloc.close();
}

sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc({int initialValue = 0}) : super(initialValue) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print(transition);
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }

  @override
  void onEvent(CounterEvent event) {
    // TODO: implement onEvent
    super.onEvent(event);
    print(event.runtimeType);
  }
}
