import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'start_event.dart';
import 'start_state.dart';

class StartBloc extends Bloc<StartEvent, StartState> implements Disposable {
  //final pageViewController = PageController();
  String titleAppBar = 'Start';
  //StartState get initialState => InitialStartState();

  @override
  StartBloc() : super(InitialStartState(totalPlazas: 0));

  @override
  Stream<StartState> mapEventToState(StartEvent event) async* {}

  @override
  void dispose() {}
}
