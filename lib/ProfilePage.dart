import 'package:facebook_auth/SignInPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.photoURL ?? ''),
              ),
            SizedBox(height: 16.0),
            Text(
              "Welcome, ${user?.displayName ?? 'User'}!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Email: ${user?.email}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

          ],
        ),
      ),
    );
  }
}
