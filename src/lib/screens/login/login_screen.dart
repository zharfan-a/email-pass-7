
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
	@override
	_LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						TextField(
							controller: _emailController,
							decoration: InputDecoration(
								labelText: 'Email',
							),
						),
						TextField(
							controller: _passwordController,
							decoration: InputDecoration(
								labelText: 'Password',
							),
							obscureText: true,
						),
						SizedBox(height: 20),
						ElevatedButton(
							onPressed: () {
								final email = _emailController.text;
								final password = _passwordController.text;
								context.read<AuthCubit>().login(email, password);
							},
							child: Text('Login'),
						),
					],
				),
			),
		);
	}
}
