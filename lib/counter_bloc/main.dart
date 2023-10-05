import 'package:bloc_bootcamp/counter_bloc/app_router.dart';
import 'package:bloc_bootcamp/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  final CounterCubit _counterCubit = CounterCubit();

  @override
  void dispose() {
    _counterCubit.close();
    _appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      initialRoute: '/first',
      onGenerateRoute: _appRouter.onGenerateRoute,
      // routes: {
      //   '/first': (context) => BlocProvider<CounterCubit>.value(
      //         value: _counterCubit,
      //         child: const FirstScreen(),
      //       ),
      //   '/second': (context) => BlocProvider<CounterCubit>.value(
      //       value: _counterCubit, child: SecondScreen()),
      // },
      // home: BlocProvider<CounterCubit>(
      //   create: (_) => CounterCubit(),
      //   child: const FirstScreen(),
      // ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) => Text(
              '${state.currentValue}',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.green,
                child: const Icon(Icons.add, color: Colors.white),
                onPressed: () => context.read<CounterCubit>().increment(),
              ),
              const SizedBox(width: 24),
              FloatingActionButton(
                backgroundColor: Colors.orange,
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onPressed: () => context.read<CounterCubit>().decrement(),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (_) => BlocProvider<CounterCubit>.value(
              //       value: context.read<CounterCubit>(),
              //       child: SecondScreen(),
              //     ),
              //   ),
              // );
              Navigator.of(context).pushNamed('/second');
            },
            child: Text('Go to second route'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) => Text(
              '${state.currentValue}',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.teal,
                child: const Icon(Icons.add, color: Colors.white),
                onPressed: () => context.read<CounterCubit>().increment(),
              ),
              const SizedBox(width: 24),
              FloatingActionButton(
                backgroundColor: Colors.deepPurple,
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onPressed: () => context.read<CounterCubit>().decrement(),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (_) => BlocProvider<CounterCubit>.value(
              //       value: context.read<CounterCubit>(),
              //       child: SecondScreen(),
              //     ),
              //   ),
              // );
              Navigator.of(context).pushNamed('/first');
            },
            child: Text('Go to first route'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
          ),
        ],
      ),
    );
  }
}
