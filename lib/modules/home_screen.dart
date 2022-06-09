import 'dart:math';

import 'package:compass/cubit/compass_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/compass_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompassCubit, CompassStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var c = CompassCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.black38,
          appBar: AppBar(
            centerTitle: true,
            title: Text('Compass App'),
            backgroundColor: Colors.blueGrey.shade900,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${c.heading}'),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/compass.png'),
                    AnimatedContainer(
                      curve: Curves.easeInBack,
                      duration: Duration(microseconds: 500),
                      child: Transform.rotate(

                        angle: ((c.heading ?? 0) * (pi / 180) * -1),
                        child: Image.asset('assets/cadrant.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
