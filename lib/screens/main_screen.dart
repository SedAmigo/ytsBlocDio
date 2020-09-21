import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ytsbloc/bloc/bottom_navbar_bloc.dart';
import 'package:ytsbloc/screens/tabs/movies_tab.dart';
import 'package:ytsbloc/screens/tabs/search_tab.dart';
import 'package:ytsbloc/screens/tabs/suggestion_tab.dart';
import 'package:ytsbloc/utils/appcolor.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  NavBarBLoc _bottomNavBarBloc;

  @override
  void initState() {
    _bottomNavBarBloc = NavBarBLoc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<NavBarItem>(
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem,
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            switch (snapshot.data) {
              case NavBarItem.SUGGESTIONS:
                return SuggestionTab();
              case NavBarItem.MOVIES:
                return MoviesTab();
              case NavBarItem.SEARCH:
                return SearchTab();
            }
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (context, AsyncSnapshot<NavBarItem> snapshot) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[100], spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: AppColor.mainColor,
                iconSize: 20,
                unselectedItemColor: AppColor.unsColor,
                unselectedFontSize: 9.5,
                selectedFontSize: 9.5,
                type: BottomNavigationBarType.fixed,
                fixedColor: AppColor.fillsColor,
                currentIndex: snapshot.data.index,
                onTap: _bottomNavBarBloc.pickBar,
                items: [
                  BottomNavigationBarItem(
                    title: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Suggestion",
                            style: TextStyle(fontWeight: FontWeight.w600))),
                    icon: Icon(EvaIcons.bulbOutline),
                    activeIcon: Icon(EvaIcons.bulb),
                  ),
                  BottomNavigationBarItem(
                    title: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Movies",
                            style: TextStyle(fontWeight: FontWeight.w600))),
                    icon: Icon(EvaIcons.filmOutline),
                    activeIcon: Icon(EvaIcons.film),
                  ),
                  BottomNavigationBarItem(
                    title: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Search",
                            style: TextStyle(fontWeight: FontWeight.w600))),
                    icon: Icon(EvaIcons.searchOutline),
                    activeIcon: Icon(EvaIcons.search),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
