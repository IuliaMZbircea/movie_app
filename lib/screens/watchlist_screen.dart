import 'package:flutter/material.dart';
import 'package:movie_app/helpers/constants/constants.dart';
import 'package:movie_app/screens/movie_list_screen.dart';
import 'package:movie_app/screens/profile_screen.dart';


class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: const Text(
          'My Watchlist',
          style: TextStyle(
            fontSize: titleFontSize,
            color: redColor,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const MovieListScreen()),
                    (route) => false),
        backgroundColor: redColor,
        child: const Icon(
          Icons.add,
          color: appBarColor,
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
                  Icons.favorite,
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
                  Icons.account_circle_outlined,
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
