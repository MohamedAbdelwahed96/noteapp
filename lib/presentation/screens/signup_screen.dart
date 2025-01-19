import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/logic/sign_up_bloc/cubit.dart';
import 'package:noteapp/logic/sign_up_bloc/state.dart';
import 'package:noteapp/presentation/screens/home_screen.dart';
import 'package:noteapp/presentation/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 3, 17, 1),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => SignUpCubit(FirebaseAuth.instance),
          child: BlocConsumer<SignUpCubit,SignUpStates>(
            listener: (context,state){
              if(state is SignUpSuccessState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Created Successfully")));
                Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
              }
              else if(state is SignUpErrorState)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.em)));
            },
            builder: (context,state){
              return Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 180),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Create New Account",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text("Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white)),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(242, 214, 241, 0.08),
                          hintText: "example@gmail.com",
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 0.7)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent))),
                    ),
                    const SizedBox(height: 20),
                    const Text("Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white)),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(242, 214, 241, 0.08),
                          hintText: "Enter Your Password",
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 0.7)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent))),
                    ),
                    const SizedBox(height: 80),
                    InkWell(
                      onTap: () {
                        final email = emailController.text;
                        final pass = passController.text;
                        context.read<SignUpCubit>().signUp(email, pass);
                      },
                      child: Container(
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: const Center(
                            child: Text("Sign up",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black))),
                      ),
                    ),
                    const SizedBox(height: 150),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account ?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen()));
                            },
                            child: const Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16))),
                      ],
                    )
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
