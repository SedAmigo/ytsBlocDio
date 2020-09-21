import 'dart:async';

enum NavBarItem {
  SUGGESTIONS,
  MOVIES,
  SEARCH,
}

class NavBarBLoc {
  final StreamController<NavBarItem> _navBarController =
      StreamController<NavBarItem>.broadcast();

  NavBarItem defaultItem = NavBarItem.MOVIES;

  Stream<NavBarItem> get itemStream => _navBarController.stream;

  void pickBar(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(NavBarItem.SUGGESTIONS);
        break;
        case 1:
        _navBarController.sink.add(NavBarItem.MOVIES);
        break;
      case 2:
        _navBarController.sink.add(NavBarItem.SEARCH);
    }
  }

  close() {
    _navBarController?.close();
  }
}
