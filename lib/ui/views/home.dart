import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/users_controller.dart';
import '../../models/user_model.dart';
import '../components/add_user.dart';

class Home extends StatelessWidget {
  final UsersController usersController = Get.put(UsersController());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo GetX'),
      ),

      // Select controller
      body: GetX<UsersController>(
        init: usersController,
        builder: (UsersController usersController) => ListView.separated(
          itemBuilder: (context, index) {
            // Select user
            User user = usersController.users[index];
            // Distribute user data on widget
            return ListTile(
              leading: user.avatar == null 
              ? const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white70),
              ) 
              : CircleAvatar(
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(user.avatar!),
              ),
              title: RichText(text: TextSpan(
                text: '${user.name} | ',
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: user.username,
                    style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.black54)
                  )
                ]
              )),
              subtitle: Text(user.email),
              trailing: IconButton(
                onPressed: () => usersController.remove(index), 
                icon: const Icon(Icons.delete_forever, color: Colors.redAccent)
              ),
            );
          }, 
          separatorBuilder: (context, index) => const SizedBox(height: 5), 
          itemCount: usersController.users.length
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Dialog Add User
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Add new user'),
              content: AddUser(),
              actionsAlignment: MainAxisAlignment.spaceBetween
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}