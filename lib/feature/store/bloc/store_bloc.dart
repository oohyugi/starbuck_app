import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:starbuck_app/data/store_repo.dart';
import 'package:starbuck_app/helper/pref_helper.dart';
import 'package:starbuck_app/model/store_mdl.dart';

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
        yield* addDistanceResponse(response.stores);
      } on DioError catch (e) {
        yield ResponseFailed(e.message);
      }
    }
    if (event is GetDistanceStore) {}
  }
}

Stream<StoreState> addDistanceResponse(List<StoresBean> stores) async* {
  Position myPos = await PrefHelper.getUserPosition();
  List<StoresBean> newStores = List();
  stores.map((val) async {
    double distance = await Geolocator().distanceBetween(
        myPos.latitude, myPos.longitude, val.coordinates.latitude, val.coordinates.longitude);
    print("my pos ${myPos.latitude}");
    val.distance = "${(distance/1000).toStringAsFixed(2)} km";
//    StoresBean(name:val.name ,distance: 10);
  }).toList();
  yield ResponseSuccess(stores);
}
