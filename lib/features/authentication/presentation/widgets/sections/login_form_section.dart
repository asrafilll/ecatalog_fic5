part of '../../pages/login_page.dart';

class _LoginFormSection extends StatelessWidget {
  const _LoginFormSection({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Email',
          hintText: 'Input Your Email',
          suffixIcon: Icons.email,
          controller: emailController,
        ),
        const SizedBox(height: 8),
        const SizedBox(height: 8),
        CustomTextField(
          label: 'Password',
          hintText: 'Input Your Password',
          suffixIcon: Icons.visibility,
          obscureText: true,
          controller: passwordController,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
