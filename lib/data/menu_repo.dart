import 'package:dio/dio.dart';
import 'package:starbuck_app/model/coffee_mdl.dart';

import 'dio_config.dart';

class MenuRepo {
  var baseUrl = "https://private-4339df-coffee14.apiary-mock.com";

  Future<MenuMdl> getAllMenus() async {
    var dio = createDio(baseUrl);
    Response<Map> response =
        await addInterceptors(dio: dio, isRequireAuth: false).get("/menus");
    print(response.data);
    if (response.data != null) {
      return MenuMdl.fromMap(response.data);
    } else {
      return throw Exception("failed to load menus");
    }
  }
}
