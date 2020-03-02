import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:starbuck_app/data/menu_repo.dart';

import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  @override
  MenuState get initialState => MenuInitial();

  MenuRepo repo = MenuRepo();

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    if (event is FetchAllMenu) {
      yield LoadingMenu();
      try {
        var response = await repo.getAllMenus();
        yield ResponseSuccess(response.data);
      } on DioError catch (e) {
        yield ResponseFailed(e.message);
      }
    }
  }
}
