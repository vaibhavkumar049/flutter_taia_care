

import 'package:flutter_taia_care/src/model/base_model.dart';

class DashboardProvider extends BaseModel {
  int _currentTab = 0;
  List<int> _bottomBarStateManagement = [];


  List<int> get bottomBarStateManagement => _bottomBarStateManagement;
  List<String> _notifications;

  List<String> get notifications => _notifications;

  setNotifications(List<String> value) {
    _notifications = value;
    notifyListeners();
  }

  set bottomBarStateManagement(List<int> value) {
    _bottomBarStateManagement = value;
    print(bottomBarStateManagement.length);
    notifyListeners();
  }

  int get currentTab => _currentTab;

  set currentTab(int value) {
    _currentTab = value;
    notifyListeners();
  }




}
