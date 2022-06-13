import 'dart:math';

import 'package:counter_cubit/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Event Payload',
          debugShowCheckedModeBanner: false,
          theme: context.watch<ThemeBloc>().state.appTheme == AppTheme.light
              ? ThemeData.light()
              : ThemeData.dark(),
          home: const MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            'Change Theme',
            style: TextStyle(fontSize: 24.0),
          ),
          onPressed: () {
            final int randInt = Random().nextInt(10);
            print('randInt: $randInt');

            context.read<ThemeBloc>().add(ChangeThemeEvent(randInt: randInt));
          },
        ),
      ),
    );
  }
}