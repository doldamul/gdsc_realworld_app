import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:realworld_app/pages/home/home_page.dart';
import 'package:realworld_app/pages/article/article_page.dart';
import 'package:realworld_app/pages/sign_up/sign_up_page.dart';
import 'package:realworld_app/pages/sign_in/sign_in_page.dart';
import 'package:realworld_app/pages/profile/profile_page.dart';
import 'package:realworld_app/pages/setting/setting_page.dart';

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
          builder: (context, state) => HomePage(),
          routes: [
            GoRoute(
              path: 'login',
              builder: (context, state) => SignInPage(),
            ),
            GoRoute(
              path: 'register',
              builder: (context, state) => SignUpPage(),
            ),
          ],
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => SettingPage(),
        ),
        GoRoute(
          path: '/profile', // TODO: '/profile/:userID'
          builder: (context, state) => ProfilePage(),
        ),
        GoRoute(
          path: '/article', // TODO: '/article/:articleID'
          builder: (context, state) => ArticlePage(),
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