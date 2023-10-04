import 'package:bloc/bloc.dart';

Future<void> main() async {
  Bloc.observer = SimpleBlocObserver();

  print('Cubit theory');
  final cubit = CounterCubit();
  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.close();

  print('Cubit theory - stream');
  final cubit2 = CounterCubit();
  final subscription = cubit2.stream.listen(print);
  cubit2.increment();
  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await cubit2.close();
}

class CounterCubit extends Cubit<int> {
  CounterCubit({int initialValue = 0}) : super(initialValue);

  void increment() => emit(state + 1);

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
