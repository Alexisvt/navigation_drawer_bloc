import 'package:rxdart/rxdart.dart';

class NavigationDrawerBloc {
  final _navigationController = BehaviorSubject<String>.seeded('Home');

  Stream get getNavigation => _navigationController.stream;
  Function(String) get setNavigation => _navigationController.sink.add;

  void dispose() {
    _navigationController.drain();
    _navigationController.close();
  }
}

final NavigationDrawerBloc bloc = NavigationDrawerBloc();
