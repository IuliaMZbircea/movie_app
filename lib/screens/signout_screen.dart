import 'package:flutter/material.dart';
import 'package:movie_app/helpers/constants/constants.dart';
import 'package:movie_app/screens/movie_list_screen.dart';

import '../helpers/constants/routes_name.dart';

class SignOutScreen extends StatefulWidget {
  const SignOutScreen({super.key});

  @override
  State<SignOutScreen> createState() => _SignOutScreenState();
}

class _SignOutScreenState extends State<SignOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: titleFontSize,
            color: redColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: const Column(
            children: [
              Text('logout'),
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          authenticationManager.signOut(context);
        },
        backgroundColor: redColor,
        child: const Icon(Icons.logout_rounded),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        color: appBarColor,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: redColor,
                  size: 35.0,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, watchListRouteName),
              ),
              IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  color: redColor,
                  size: 40.0,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, movieListRouteName),
              ),
              IconButton(
                icon: const Icon(
                  Icons.account_circle_rounded,
                  color: redColor,
                  size: 35.0,
                ),
                onPressed: () => Navigator.pushNamed(context, signOutRouteName),
              )
            ],
          ),
        ),
      ),
    );
  }
}
