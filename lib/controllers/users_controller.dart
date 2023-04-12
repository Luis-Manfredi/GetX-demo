import 'package:get/get.dart';

import '../data/users_data.dart';

class UsersController extends GetxController {
  // User list declaration
  // List users = [].obs;
  List users = usersList.obs;

  // Events
  add(user) => users.add(user);
  remove(index) => users.removeAt(index);
}