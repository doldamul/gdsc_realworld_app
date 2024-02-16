import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realworld_app/bloc/authentication/auth_bloc.dart';
import 'package:realworld_app/bloc/router/router_bloc.dart';
import 'package:realworld_app/pages/realworld_router.dart';
import 'package:realworld_app/repository/article_repository.dart';
import 'package:realworld_app/repository/auth_repository.dart';
import 'package:realworld_app/repository/profile_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProfileRepository(),
        ),
        RepositoryProvider(
          create: (context) => ArticleRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RouterBloc(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(authRepository: context.read<AuthRepository>()),
          )
        ],
        child: const RealWorldRouter(),
      ),
    );
  }
}