import 'package:starbuck_app/model/coffee_mdl.dart';
import 'package:starbuck_app/model/store_mdl.dart';

abstract class StoreState {}

class StoreInitial extends StoreState {
  StoreInitial();
}

class LoadingStore extends StoreState {
  LoadingStore();
}

class ResponseFailed extends StoreState {
  final String errorMessage;

  ResponseFailed(this.errorMessage);
}

class ResponseSuccess extends StoreState {
  final List<StoresBean> listDataStore;

  ResponseSuccess(this.listDataStore);
}
