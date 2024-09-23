import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/core/di/dependency_injection.dart';
import 'package:notes/core/ui/widgets/notes_bottom_nav_bar.dart';
import 'package:notes/features/home/presentation/bloc/home_cubit.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
      ],
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: NotesBottomNavBar(
          navigationShell: navigationShell,
        ),
      ),
    );
  }
}
