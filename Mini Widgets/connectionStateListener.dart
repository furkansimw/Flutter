  void listen() async {
    //import 'package:connectivity/connectivity.dart'
    var subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        print('data');
      } else {
        print('yok');
      }
    });
  }
