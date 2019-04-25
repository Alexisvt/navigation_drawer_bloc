import 'package:rxdart/rxdart.dart';
import './navigation_provider.dart';

class NavigationDrawerBloc {
  final _navigationController = BehaviorSubject<String>.seeded('Home');
  NavigationProvider navigationProvider = NavigationProvider();

  Stream get getNavigation => _navigationController.stream;
  Function(String) get _setNavigation => _navigationController.sink.add;

  void updateNavigation(String navigation) {
    navigationProvider.updateNavigation(navigation);
    _setNavigation(navigationProvider.currentNavigation);
  }

  void dispose() {
    _navigationController.close();
  }
}

final NavigationDrawerBloc bloc = NavigationDrawerBloc();
