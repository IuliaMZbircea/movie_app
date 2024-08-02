import 'package:flutter/material.dart';
import 'package:movie_app/helpers/constants/constants.dart';
import 'package:movie_app/helpers/constants/strings-en.dart';
import 'package:movie_app/managers/authentication_manager.dart';
import 'package:movie_app/screens/movie_list_screen.dart';
import 'package:movie_app/screens/watchlist_screen.dart';

AuthenticationManager authenticationManager = AuthenticationManager();

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: const Text(
          profileScreenTitle,
          style: TextStyle(
            fontSize: titleFontSize,
            color: redColor,
          ),
        ),
      ),
      body: Center(
        child: 
            ElevatedButton(
              onPressed: () {
                 authenticationManager.signOut(context);
              }, child: const SizedBox(child:Text('Log Out'),),
          
        ),
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
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const WatchlistScreen()),
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
                  color: Colors.white,
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
