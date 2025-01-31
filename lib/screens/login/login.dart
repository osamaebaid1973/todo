import 'package:flutter/material.dart';
import 'package:todo/app_resources/app_colors.dart';
import 'package:todo/app_resources/app_images_path.dart';
import 'package:todo/app_resources/app_routes_names.dart';
import 'package:todo/firebase/firebase_helper.dart';
import 'package:todo/screens/onboarding/language_switch.dart';

class Login extends StatelessWidget {
  Login({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Image.asset(
                  AppImagesPath.loginLogo,
                  height: 187,
                ),
                const SizedBox(height: 24),
                TextField(
                    controller: emailController,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.lightThemeTextFieldEnabledColor),
                    decoration: const InputDecoration(
                        labelText: 'Email', prefixIcon: Icon(Icons.email))),
                const SizedBox(height: 16),
                TextField(
                    obscureText: true,
                    obscuringCharacter: '#',
                    controller: passwordController,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.lightThemeTextFieldEnabledColor),
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye))),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Forget Password?',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor),
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        FirebaseHelper.login(
                            emailController.text, passwordController.text,
                            onSuccess: () {
                              Navigator.pop(context);
                          Navigator.pushNamedAndRemoveUntil(context, AppRoutesNames.home,(route) => false);
                        }, onError: (error) {
                          Navigator.pop(context);
                          showDialog(context: context, builder:(context){
                            return AlertDialog(title: const Text('Error'),
                              content: Text(error),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))
                              ],
                            );
                          });
                        }, onLoading: () {
                          showDialog(context: context, builder:(context){
                            return const Center(child: CircularProgressIndicator());
                          });
                        });
                      },
                      child: Text('Login',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white))),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutesNames.register);
                          },
                          child: Text(
                            'Create Account',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primaryColor),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(children: [
                  const Expanded(
                      child: Divider(
                          height: 2,
                          indent: 10,
                          endIndent: 40,
                          color: AppColors.primaryColor)),
                  Text('Or',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.primaryColor)),
                  const Expanded(
                      child: Divider(
                          height: 2,
                          indent: 40,
                          endIndent: 10,
                          color: AppColors.primaryColor)),
                ]),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      side:
                          BorderSide(color: AppColors.primaryColor, width: 1)),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImagesPath.googleLogo),
                      const SizedBox(width: 8),
                      Text('Login with Google',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const LanguageSwitch(),
              ],
            ),
          )),
    );
  }
}
