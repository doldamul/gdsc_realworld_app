import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:realworld_app/pages/home/home_page.dart';
import 'package:realworld_app/pages/article/article_page.dart';
import 'package:realworld_app/pages/sign_up/sign_up_page.dart';
import 'package:realworld_app/pages/sign_in/sign_in_page.dart';
import 'package:realworld_app/pages/profile/profile_page.dart';

class RealWorldRouter extends StatefulWidget {
  const RealWorldRouter({super.key});

  @override
  State<RealWorldRouter> createState() => _RealWorldRouterState();
}

class _RealWorldRouterState extends State<RealWorldRouter> {
  late final GoRouter _routerConf;

  @override
  void initState() {
    super.initState();

    _routerConf = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          // builder: (context, state) => ProfilePage(),
          // builder: (context, state) => SignUpPage(),
          // builder: (context, state) => SignInPage(),
          // builder: (context, state) => ArticlePage(),
          builder: (context, state) => HomePage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routerConf,
      debugShowCheckedModeBanner: false,
      title: 'RealWorld Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}