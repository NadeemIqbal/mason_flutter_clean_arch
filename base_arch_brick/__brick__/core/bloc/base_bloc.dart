import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(State initialState) : super(initialState);

  @override
  void onError(Object error, StackTrace stackTrace) {
    // Handle errors consistently
    super.onError(error, stackTrace);
  }
}
