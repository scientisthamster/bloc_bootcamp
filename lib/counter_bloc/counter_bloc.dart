import 'package:shared/shared.dart';

class CounterState {
  CounterState({required this.currentValue});

  final int currentValue;
}

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(currentValue: 0));

  void increment() => emit(CounterState(currentValue: state.currentValue + 1));

  void decrement() => emit(CounterState(currentValue: state.currentValue - 1));

  @override
  void onChange(Change<CounterState> change) {
    super.onChange(change);
    print(change.runtimeType);
  }
}
