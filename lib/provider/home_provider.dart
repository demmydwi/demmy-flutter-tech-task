import 'package:flutter/material.dart';
import 'package:home_credit_flutter_task/model/response_api.dart';
import 'package:home_credit_flutter_task/network/network.dart';

enum HomeState { onLoading, onLoaded, onRefresh, onError, onNoInternet }

class HomeProvider with ChangeNotifier {

  HomeProvider(
      {this.state = HomeState.onLoading, this.errMessage, this.responseApi});

  HomeState state;

  setCurrentState(HomeState newValue) {
    this.state = newValue;
    notifyListeners();
    if (newValue == HomeState.onRefresh) {
      getContent();
      return;
    }
  }

  String errMessage;
  ResponseApi responseApi;

  Future<bool> getContent({String path}) async {
    // additional path for testing purpose
    state = HomeState.onLoading;
    notifyListeners();
    return await ApiManager().getContentHome(
        path: path,
        onError: (errMsg) {
          errMessage = errMsg;
          if (errMsg == "No Internet" || path == "No Internet Simulation") {
            // for simulate no_internet
            state = HomeState.onNoInternet;
          } else {
            state = HomeState.onError;
          }
          notifyListeners();
        },
        onSuccess: (result) {
          state = HomeState.onLoaded;
          responseApi = result;
          notifyListeners();
        });
  }
}
