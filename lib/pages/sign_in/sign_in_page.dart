import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realworld_app/bloc/router/router_bloc.dart';
import 'package:realworld_app/bloc/router/router_event.dart';
import 'package:realworld_app/constants/routes.dart';
import 'package:realworld_app/bloc/authentication/auth_bloc.dart';
import 'package:realworld_app/bloc/authentication/auth_event.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
        title: const Text('Sign in'),
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
                context.read<RouterBloc>().add(GoRouteEvent(context, Routes.sign_up));
              },
              child: const Text('Need an account?'),
            ),
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
                        AuthLogin(
                          email: emailController.value.text,
                          password: passwordController.value.text,
                        )
                      );
                    
                    context.read<RouterBloc>().add(GoRouteEvent(context, Routes.home));
                  },
                  child: Text('Sign in'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
