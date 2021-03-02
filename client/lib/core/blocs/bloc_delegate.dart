import 'package:flutter_bloc/flutter_bloc.dart';

class GrpcBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print('${bloc.runtimeType}: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc.runtimeType}: $transition');
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType}: [ERROR] $error');
  }
}

class BlocDelegate {}
