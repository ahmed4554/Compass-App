import 'package:bloc/bloc.dart';
import 'package:compass/cubit/compass_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';

class CompassCubit extends Cubit<CompassStates> {
  CompassCubit() : super(InitialCompassState());
  static CompassCubit get(context) => BlocProvider.of(context);
  double? heading = 0;
  void listenToMove(){
    FlutterCompass.events!.listen((event) {
      heading = event.heading;
      emit(TransformCompassState());
    });
  }
}
