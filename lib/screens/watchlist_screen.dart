import 'package:flutter/material.dart';
import 'package:movie_app/helpers/constants/constants.dart';
import 'package:movie_app/screens/movie_list_screen.dart';

import '../helpers/constants/routes_name.dart';

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
        onPressed: () => Navigator.pushNamed(context, movieListRouteName),
        backgroundColor: redColor,
        child: const Icon(Icons.add),
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
                  Icons.account_circle_outlined,
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
