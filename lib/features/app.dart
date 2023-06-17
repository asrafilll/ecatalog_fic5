import 'package:fic5_ecatalog_asrafilll/features/authentication/data/models/login_response_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.data});

  final LoginResponseModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data.accessToken),
      ),
    );
  }
}
