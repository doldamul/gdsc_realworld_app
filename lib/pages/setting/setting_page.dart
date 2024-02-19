import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realworld_app/bloc/authentication/auth_bloc.dart';
import 'package:realworld_app/bloc/authentication/auth_event.dart';
import 'package:realworld_app/bloc/router/router_bloc.dart';
import 'package:realworld_app/bloc/router/router_event.dart';
import 'package:realworld_app/constants/routes.dart';

import 'package:realworld_app/bloc/authentication/auth_state.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    var state = context.read<AuthBloc>().state as AuthAuthenticatedState;
    usernameController.text = state.user.username ?? '';
    emailController.text = state.user.email ?? '';
    bioController.text = state.user.bio ?? '';

    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('Username'),
                  ),
                ],
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Username',
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('Email'),
                  ),
                ],
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('Password'),
                  ),
                ],
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('Bio'),
                  ),
                ],
              ),
              TextField(
                controller: bioController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Bio',
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final String? username = usernameController.text.isEmpty ? null : usernameController.text;
                  final String? password = passwordController.text.isEmpty ? null : passwordController.text;
                  final String? email = emailController.text.isEmpty ? null : emailController.text;

                  context.read<AuthBloc>().add(AuthUpdateUser(
                    newUsername: username,
                    newPassword: password,
                    newEmail: email,
                    newBio: bioController.text,
                  ));
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
        ),
      ),
    );
  }
}
