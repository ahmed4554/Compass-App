import 'package:bloc/bloc.dart';
import 'package:compass/cubit/compass_cubit.dart';
import 'package:compass/cubit/compass_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constant/bloc_observer.dart';
import 'modules/home_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(CompassApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class CompassApp extends StatelessWidget {
  const CompassApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompassCubit()..listenToMove(),
      child: BlocConsumer<CompassCubit, CompassStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
