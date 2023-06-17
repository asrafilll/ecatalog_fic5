import 'package:fic5_ecatalog_asrafilll/features/authentication/data/models/register_response_model.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.data});

  final RegisterResponseModel data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login PAge'),
      ),
      body: Column(children: [
        Text(data.name!),
      ]),
    );
  }
}
