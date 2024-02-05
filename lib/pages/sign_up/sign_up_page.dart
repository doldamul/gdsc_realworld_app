import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realworld_app/bloc/router/router_bloc.dart';
import 'package:realworld_app/bloc/router/router_event.dart';
import 'package:realworld_app/constants/routes.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Sign up'),
        ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextButton(
              onPressed: () {
                context.read<RouterBloc>().add(GoRouteEvent(context, Routes.sign_in));
              },
              child: const Text('Have an account?'),
            ),
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Sign up'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
