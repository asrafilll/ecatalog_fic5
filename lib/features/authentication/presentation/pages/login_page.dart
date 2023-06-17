import 'package:fic5_ecatalog_asrafilll/features/app.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/data/models/login_request_model.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/presentation/authentication_bloc/authentication_bloc.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/presentation/pages/register_page.dart';
import 'package:fic5_ecatalog_asrafilll/shared/widget/atoms/h2_text_widget.dart';
import 'package:fic5_ecatalog_asrafilll/shared/widget/atoms/small_text_widget.dart';
import 'package:fic5_ecatalog_asrafilll/shared/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widgets/sections/login_form_section.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const H2TextWidget(text: 'Login'),
              _LoginFormSection(
                emailController: emailController!,
                passwordController: passwordController!,
              ),
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is LoginFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)));
                  }
                  if (state is LoginSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => HomePage(data: state.data),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      final LoginRequestModel model = LoginRequestModel(
                        email: emailController!.text,
                        password: passwordController!.text,
                      );

                      context
                          .read<AuthenticationBloc>()
                          .add(LoginEvent(data: model));
                    },
                    child: const Text('Login'),
                  );
                },
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const RegisterPage(),
                  ),
                ),
                child: const SmallTextWidget(
                    text: 'Don\'t have an account yet? Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
