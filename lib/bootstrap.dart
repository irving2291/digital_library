import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
//import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Esto es para poder ejecutar nuestra app no registrada en Firebase en debug.
  await FirebaseAppCheck.instance.activate(
    appleProvider: AppleProvider.debug,
    androidProvider: AndroidProvider.debug,
  );

  runApp(await builder());
}
