import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realworld_app/bloc/authentication/auth_bloc.dart';
import 'package:realworld_app/bloc/authentication/auth_event.dart';
import 'package:realworld_app/bloc/router/router_bloc.dart';
import 'package:realworld_app/bloc/router/router_event.dart';
import 'package:realworld_app/constants/routes.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: 'Username',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: 'Bio',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.deepPurple,
                ),
                foregroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
              ),
              child: Text('Update profile'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthLogout());
                context.read<RouterBloc>().add(GoRouteEvent(context, Routes.home));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.deepPurple,
                ),
                foregroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
              ),
              child: Text('Sign out'),
            ),
          ],
        ),
      )
    );
  }
}
