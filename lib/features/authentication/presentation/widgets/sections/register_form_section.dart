part of '../../pages/register_page.dart';

class _RegisterFormSection extends StatelessWidget {
  const _RegisterFormSection({
    required this.emailController,
    required this.nameController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController nameController;
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
      ],
    );
  }
}
