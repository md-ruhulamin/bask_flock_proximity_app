import 'package:bask_flock_proximity_app/bloc/floc_feed_bloc.dart';
import 'package:bask_flock_proximity_app/bloc/flock_feed_event.dart';
import 'package:bask_flock_proximity_app/screens/flock_feed_screen.dart';
import 'package:bask_flock_proximity_app/theme/medical_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: MedicalTheme.darkTheme,
      home: BlocProvider(
        create: (_) => FlockBloc()..add(StartTracking()),
        child: const FlockFeedScreen(),
      ),
    );
  }
}
