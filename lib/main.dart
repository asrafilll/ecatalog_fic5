import 'package:fic5_ecatalog_asrafilll/features/authentication/data/datasources/auth_data_sources.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/presentation/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
        AuthDataSource(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ECatalog FIC 5',
        theme: ThemeData(
          fontFamily: 'Plus Jakarta Sans',
          useMaterial3: true,
        ),
        home: const RegisterPage(),
      ),
    );
  }
}
