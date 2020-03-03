import 'package:dio/dio.dart';
import 'package:starbuck_app/model/coffee_mdl.dart';
import 'package:starbuck_app/model/store_mdl.dart';

import 'dio_config.dart';

class StoreRepo {
  var baseUrl = "https://private-4339df-coffee14.apiary-mock.com";

  Future<StoreMdl> getAllStores() async {
    var dio = createDio(baseUrl);
    Response<Map> response =
        await addInterceptors(dio: dio, isRequireAuth: false).get("/stores");
    print(response.data);
    if (response.data != null) {
      return StoreMdl.fromMap(response.data);
    } else {
      return throw Exception("failed to load stores");
    }
  }
}
