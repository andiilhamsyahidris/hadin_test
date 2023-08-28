import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hadin/src/presentation/features/home/homescreen.dart';
import 'package:test_hadin/src/presentation/states/bloc/faculty_bloc.dart';
import 'package:test_hadin/src/presentation/states/gedung_bloc/gedung_bloc.dart';
import 'injection.dart' as di;

class Hadin extends StatelessWidget {
  const Hadin({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<FacultyBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<GedungBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Homescreen(),
      ),
    );
  }
}
