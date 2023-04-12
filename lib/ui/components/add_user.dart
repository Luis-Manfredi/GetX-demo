import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/models/user_model.dart';

import '../../controllers/users_controller.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  // Controllers
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final UsersController usersController = Get.put(UsersController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFECECEC),
              hintText: 'Add a name',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5)
              )
            ),
            validator: (name) => name!.isEmpty ? 'Name is required' : null,
          ),

          const SizedBox(height: 10),
    
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFECECEC),
              hintText: 'Add an username',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5)
              )
            ),
            validator: (username) => username!.isEmpty ? 'Username is required' : null,
          ),

          const SizedBox(height: 10),
    
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFECECEC),
              hintText: 'Add an email',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5)
              )
            ),
            validator: (email) => email!.isEmpty ? 'Email is required' : null,
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context), 
                child: const Text('Cancel')
              ),
              ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState!.validate();
                  // Form validate
                  if (form) {
                    // Add new user to the list
                    usersController.add(User(
                        name: nameController.text, 
                        username: usernameController.text, 
                        email: emailController.text
                      )
                    );
                    // Clear inputs and close modal
                    nameController.clear();
                    usernameController.clear();
                    emailController.clear();
                    Navigator.pop(context);
                  }
                }, 
                child: const Text('Add')
              )
            ],
          )
        ],
      ),
    );
  }
}