import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realworld_app/bloc/router/router_bloc.dart';
import 'package:realworld_app/bloc/router/router_event.dart';
import 'package:realworld_app/constants/routes.dart';
import 'package:realworld_app/bloc/authentication/auth_bloc.dart';
import 'package:realworld_app/bloc/authentication/auth_event.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              controller: usernameController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
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
                  onPressed: () {
                    context.read<AuthBloc>().add(
                        AuthRegister(
                          username: usernameController.value.text,
                          email: emailController.value.text,
                          password: passwordController.value.text,
                        )
                    );
                    // TODO: home에서 register&login 작업 완료 대기 후 렌더링
                    context.read<RouterBloc>().add(GoRouteEvent(context, Routes.home));
                  },
                  child: Text('Sign up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
