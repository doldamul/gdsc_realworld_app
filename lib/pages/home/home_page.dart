import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realworld_app/pages/home/article_listitem.dart';
import 'package:realworld_app/pages/home/page_index_switcher.dart';
import 'package:realworld_app/pages/home/tag_toggles.dart';
import 'package:realworld_app/bloc/router/router_bloc.dart';
import 'package:realworld_app/bloc/router/router_event.dart';
import 'package:realworld_app/constants/routes.dart';
import 'package:realworld_app/bloc/authentication/auth_bloc.dart';
import 'package:realworld_app/bloc/authentication/auth_state.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const font = TextStyle(fontSize: 20);
  static const mock_tags = [
    'apple',
    'banana',
    'cake',
    'donut',
    'egg',
    'french fry',
    'grape',
    'hot dog',
  ];

  var list = <Widget>[
    for (var i=0; i < 20; i++) ...[
      ArticleListItem(),
      Divider(height: 1),
    ],
  ];

  var toolbar = BlocBuilder<AuthBloc, AuthState>(
    buildWhen: (prev, curr) => prev != curr,
    builder: (context, state) {
      if (state is AuthAuthenticatedState)
        return Row(
          children: [
            TextButton(
              onPressed: () {
                context.read<RouterBloc>().add(PushRouteEvent(context, Routes.settings));
              },
              child: const Text('Settings'),
            ),
            TextButton(
              onPressed: () {
                context.read<RouterBloc>().add(PushRouteEvent(context, Routes.profile));
              },
              child: Text(state.user.username ?? "anonymous"),
            ),
          ],
        );
      else if (state is AuthUnknownState)
        return Row(
          children: [
            TextButton(
              onPressed: () {
                context.read<RouterBloc>().add(GoRouteEvent(context, Routes.sign_in));
              },
              child: const Text('Sign in'),
            ),
            TextButton(
              onPressed: () {
                context.read<RouterBloc>().add(GoRouteEvent(context, Routes.sign_up));
              },
              child: const Text('Sign up'),
            ),
          ],
        );
      else
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: CircularProgressIndicator(),
        );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RealWorld'),
        actions: [toolbar],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ...list,
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text('Popular Tags'),
                    ),
                    TagToggles(
                      tags: mock_tags,
                    ),
                    PageIndexSwitcher(count: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}