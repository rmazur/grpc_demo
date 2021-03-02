import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'core/blocs/bloc_delegate.dart';
import 'core/blocs/greet/greet_bloc.dart';
import 'core/managers/greet_manager.dart';
import 'core/services/web/greet_service_web.dart'
    if (dart.library.io) 'core/services/mobile/greet_service_mobile.dart';
import 'ui/views/views.dart';

void main() {
  BlocSupervisor.delegate = GrpcBlocDelegate();
  final app = BlocProvider(
    create: (context) => GreetBloc(GreetService()..init()),
    child: Provider(
      create: (context) => GreetManager(
        greetBloc: BlocProvider.of<GreetBloc>(context),
      ),
      child: MyApp(),
    ),
  );
  runApp(app);
}

mixin BlocSupervisor {
  static GrpcBlocDelegate delegate;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AppView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
