import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:basics_firebase/core/constant/app_route.dart';
import 'package:basics_firebase/core/controller/login_sign_up_controller.dart';
import 'package:basics_firebase/core/service/user_service.dart';
import 'package:basics_firebase/core/constant/colors.dart';
import 'package:basics_firebase/core/model/user_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LoginSignUpController _loginSignUpController =
      Get.find<LoginSignUpController>();
  final UserService _userService = UserService();

  @override
  void dispose() {
    _loginSignUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Users'),
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          children: <Widget>[
            Expanded(child: UserListWidget(userService: _userService)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await _loginSignUpController.logOut();
                Get.offAllNamed(AppRoutes.loginScreen);
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.buttonBackground,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserListWidget extends StatelessWidget {
  final UserService userService;

  UserListWidget({required this.userService});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserModel>>(
      stream: userService.listenToUserUpdates(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          List<UserModel> users = snapshot.data ?? [];

          return ListView.separated(
            itemCount: users.length,
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              color: AppColors.iconColor.withOpacity(0.5),
            ),
            itemBuilder: (context, index) {
              UserModel user = users[index];
              return UserListItem(user: user, userService: userService);
            },
          );
        } else {
          return const Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class UserListItem extends StatefulWidget {
  final UserModel user;
  final UserService userService;

  UserListItem({required this.user, required this.userService});

  @override
  _UserListItemState createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.avatarColor,
              backgroundImage: NetworkImage(widget.user.photoURL),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter text here',
                  border: InputBorder.none,
                ),
                controller: nameController,
                onChanged: (newName) async {
                  await widget.userService
                      .updateUserName(widget.user.uid, newName);
                  setState(() {
                    widget.user.name = newName;
                  });
                },
                // onSubmitted: (newName) {
                //   widget.userService.updateUserName(widget.user.uid, newName);
                // },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
