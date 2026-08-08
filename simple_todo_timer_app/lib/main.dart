import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/todo/presentation/cubits/todo_cubit.dart';
import 'shared/di/injection.dart';
import 'shared/routing/app_router.dart';
import 'shared/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const SimpleTodoTimerApp());
}

class SimpleTodoTimerApp extends StatelessWidget {
  const SimpleTodoTimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoCubit>(
      create: (_) => sl<TodoCubit>()..load(),
      child: MaterialApp.router(
        title: 'Todo & Timer',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: AppRouter.router,
      ),
    );
  }
}