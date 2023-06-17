import 'package:fic5_ecatalog_asrafilll/features/authentication/data/models/register_request_model.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/presentation/login_page.dart';
import 'package:fic5_ecatalog_asrafilll/shared/widget/atoms/h2_text_widget.dart';
import 'package:fic5_ecatalog_asrafilll/shared/widget/atoms/small_text_widget.dart';
import 'package:fic5_ecatalog_asrafilll/shared/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? emailController;
  TextEditingController? nameController;
  TextEditingController? passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController!.dispose();
    nameController!.dispose();
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
              const H2TextWidget(text: 'Register'),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Email',
                hintText: 'Input Your Email',
                suffixIcon: Icons.email,
                controller: emailController,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                label: 'Name',
                hintText: 'Input Your Name',
                suffixIcon: Icons.person,
                controller: nameController,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                label: 'Password',
                hintText: 'Input Your Password',
                suffixIcon: Icons.visibility,
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 32),
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is RegisterFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)));
                  }
                  if (state is RegisterSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => LoginPage(data: state.data),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is RegisterLoading) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      final RegisterRequestModel model = RegisterRequestModel(
                        name: nameController!.text,
                        email: emailController!.text,
                        password: passwordController!.text,
                      );
                      context
                          .read<AuthenticationBloc>()
                          .add(RegisterEvent(data: model));
                    },
                    child: const Text('Register'),
                  );
                },
              ),
              const SizedBox(height: 8),
              const SmallTextWidget(text: 'Already have an account? Login')
            ],
          ),
        ),
      ),
    );
  }
}
