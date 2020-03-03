import 'package:starbuck_app/model/store_mdl.dart';

abstract class StoreEvent {}

class FetchAllStore extends StoreEvent {
  FetchAllStore();

}
class GetDistanceStore extends StoreEvent{
  GetDistanceStore(CoordinatesBean coordinatesBean);
}
