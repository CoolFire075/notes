import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/core/ui/widgets/notes_bottom_nav_bar.dart';
import 'package:notes/features/home/presentation/bloc/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: NotesBottomNavBar(
          navigationShell: navigationShell,
        ),
      ),
    );
  }
}
