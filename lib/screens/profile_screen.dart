import 'package:flutter/material.dart';
import 'package:movie_app/helpers/constants/constants.dart';
import 'package:movie_app/screens/movie_list_screen.dart';
import 'package:movie_app/screens/watchlist_screen.dart';

import '../helpers/constants/routes_name.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      body: (FloatingActionButton(
        onPressed: () {
          authenticationManager.signOut(context);
        },
        backgroundColor: appBarColor,
        elevation: 0.0,
        child: const Column(
          children: [
            Icon(
              Icons.logout_rounded,
              color: redColor,
            ),

          ],
        ),
      )),
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
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const WatchListScreen()),
                    (route) => false),
              ),
              IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  color: redColor,
                  size: 35.0,
                ),
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const MovieListScreen()),
                    (route) => false),
              ),
              IconButton(
                icon: const Icon(
                  Icons.account_circle,
                  color: redColor,
                  size: 35.0,
                ),
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const ProfileScreen()),
                    (route) => false),
              )
            ],
          ),
        ),
      ),
    );
  }
}
