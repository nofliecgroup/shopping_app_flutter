import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ncg_shopping_app/views/screens/auths/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const String routeName = '/registration';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Registration'),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome to NCG Shopping App',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium),

                  const SizedBox(height: 15),
                  Center(
                    child: CircleAvatar(
                      radius: 65.0,
                      child: const Icon(
                        CupertinoIcons.person,
                        size: 65.0,
                        color: Colors.white,
                      ),

                      backgroundColor: Colors.blue,
                      backgroundImage: const NetworkImage('https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
                      key: const Key('profile_image'),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text('Create an account to continue',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: const Icon(Icons.person),
                            labelText: 'First Name',
                            hintText: 'John',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: const Icon(Icons.person),
                            labelText: 'Last Name',
                            hintText: 'Doe',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: const Icon(Icons.email),
                            labelText: 'Email address',
                            hintText: 'Enter your email address',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                          ),
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty || value != value) {
                              return 'Please confirm your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            labelText: 'Confirm Password',
                            hintText: 'Confirm your password',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: const Icon(Icons.home),
                            labelText: 'Address',
                            hintText: 'Enter your address',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your city';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: const Icon(Icons.home),
                            labelText: 'City',
                            hintText: 'Enter your city',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your state';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: const Icon(Icons.phone),
                            labelText: 'Mobile',
                            hintText: 'Enter your phone number',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your zip code';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: const Icon(Icons.home),
                            labelText: 'Zip Code',
                            hintText: 'Enter your zip code',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.centerRight,
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.deepOrange),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Processing Data'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please fill in all fields'),
                              ),
                            );
                          }
                        },
                        child: Center(
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
