import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo/app_resources/app_colors.dart';
import 'package:todo/app_resources/app_images_path.dart';
import 'package:todo/app_resources/app_routes_names.dart';
import 'package:todo/firebase/firebase_helper.dart';
import 'package:todo/screens/onboarding/language_switch.dart';

class Register extends StatelessWidget {
  Register({super.key});
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Register',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(
                    AppImagesPath.loginLogo,
                    height: 187,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(validator: (value) {
                    if(value!.isEmpty) 
                    {
                    return 'Please enter your name';
                    }
                    return null;
                  },
                      controller: nameController,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.lightThemeTextFieldEnabledColor),
                      decoration: const InputDecoration(
                          labelText: 'Name', prefixIcon: Icon(Icons.person))),
                  const SizedBox(height: 16),
                  TextFormField(validator: (value) {
                    if(value!.isEmpty) 
                    {
                    return 'Please enter your name';
                    }
                    final bool emailValid = 
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                    if(!emailValid)
                    {
                      return 'Please enter a valid email';
                    }
                    return null;
                    
                  },
                      controller: emailController,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.lightThemeTextFieldEnabledColor),
                      decoration: const InputDecoration(
                          labelText: 'Email', prefixIcon: Icon(Icons.email))),
                  const SizedBox(height: 16),
                  TextFormField(validator: (value) {
                    if(value!.isEmpty) 
                    {
                    return 'Please enter your password';
                    }
                    if(value.length<6) 
                    {
                    return 'Password must be at least 6 characters';
                    }
                    return null;
                    
                  },
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
                  TextFormField(validator: (value) {
                    if(value!.isEmpty) 
                    {
                    return 'Please enter your password';
                    }
                    if(value.length<6) 
                    {
                    return 'Password must be at least 6 characters';
                    }
                    if(value!=passwordController.text) 
                    {
                    return 'Passwords do not match';
                    }
                    return null;
                    
                  },
                      obscureText: true,
                      obscuringCharacter: '#',
                      controller: rePasswordController,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.lightThemeTextFieldEnabledColor),
                      decoration: const InputDecoration(
                          labelText: 'Re Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye))),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                          FirebaseHelper.createUser(
                              emailController.text, passwordController.text,nameController.text,onSuccess: () {
                                Navigator.pop(context);
                                Navigator.pushNamedAndRemoveUntil(context, AppRoutesNames.home,(route) => false);
                              },onError: (error) {
                                Navigator.pop(context);
                                showDialog(context: context, builder: (context) {
                                  return AlertDialog(title: Text('something went wrong'),
                                    content: Text(error),
                                    actions: [
                                      TextButton(onPressed: () {
                                        Navigator.pop(context);
                                      }, child: Text('Ok'))
                                    ],
                                  );
                                });
                              },onLoading: () {
                               
                                showDialog(context: context, builder: (context) {
                                  return const Center(child: CircularProgressIndicator());
                                });
                              });
                          }
                          print('osama');
                        },
                        child: Text('Create Account',
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
                        Text('Already have an account?',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Login',
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
                  const LanguageSwitch()
                ],
              ),
            ),
          )),
    );
  }
}
