import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:starbuck_app/data/store_repo.dart';

import 'store_event.dart';
import 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  @override
  StoreState get initialState => StoreInitial();

  StoreRepo repo = StoreRepo();

  @override
  Stream<StoreState> mapEventToState(StoreEvent event) async* {
    if (event is FetchAllStore) {
      yield LoadingStore();
      try {
        var response = await repo.getAllStores();
        yield ResponseSuccess(response.stores);
      } on DioError catch (e) {
        yield ResponseFailed(e.message);
      }
    }
  }
}
