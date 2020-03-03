class StoreMdl {
  PagingBean paging;
  List<StoresBean> stores;
  CoordinatesBean coordinates;
  bool includesRecommendedLocations;

  static StoreMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    StoreMdl menuBean = StoreMdl();
    menuBean.paging = PagingBean.fromMap(map['paging']);
    menuBean.stores = List()
      ..addAll((map['stores'] as List ?? []).map((o) => StoresBean.fromMap(o)));
    menuBean.coordinates = CoordinatesBean.fromMap(map['coordinates']);
    menuBean.includesRecommendedLocations = map['includesRecommendedLocations'];
    return menuBean;
  }

  Map toJson() => {
        "paging": paging,
        "stores": stores,
        "coordinates": coordinates,
        "includesRecommendedLocations": includesRecommendedLocations,
      };
}

class CoordinatesBean {
  double lat;
  double lng;

  static CoordinatesBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    CoordinatesBean coordinatesBean = CoordinatesBean();
    coordinatesBean.lat = map['lat'];
    coordinatesBean.lng = map['lng'];
    return coordinatesBean;
  }

  Map toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class StoresBean {
  RecommendationBean recommendation;
  String storeNumber;
  String id;
  String name;
  dynamic phoneNumber;
  DataCoordinatesBean coordinates;
  List<dynamic> regulations;
  AddressBean address;
  TimeZoneInfoBean timeZoneInfo;
  String brandName;
  String ownershipTypeCode;
  dynamic open;
  String openStatusText;
  List<String> addressLines;
  MopBean mop;
  List<dynamic> features;
  String slug;
  String distance;

  static StoresBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    StoresBean storesBean = StoresBean();
    storesBean.recommendation =
        RecommendationBean.fromMap(map['recommendation']);
    storesBean.storeNumber = map['storeNumber'];
    storesBean.id = map['id'];
    storesBean.name = map['name'];
    storesBean.phoneNumber = map['phoneNumber'];
    storesBean.coordinates = DataCoordinatesBean.fromMap(map['coordinates']);
    storesBean.regulations = map['regulations'];
    storesBean.address = AddressBean.fromMap(map['address']);
    storesBean.timeZoneInfo = TimeZoneInfoBean.fromMap(map['timeZoneInfo']);
    storesBean.brandName = map['brandName'];
    storesBean.ownershipTypeCode = map['ownershipTypeCode'];
    storesBean.open = map['open'];
    storesBean.openStatusText = map['openStatusText'];
    storesBean.addressLines = List()
      ..addAll((map['addressLines'] as List ?? []).map((o) => o.toString()));
    storesBean.mop = MopBean.fromMap(map['mop']);
    storesBean.features = map['features'];
    storesBean.slug = map['slug'];
    storesBean.distance = map['distance'];
    return storesBean;
  }

  Map toJson() => {
        "recommendation": recommendation,
        "storeNumber": storeNumber,
        "id": id,
        "name": name,
        "phoneNumber": phoneNumber,
        "coordinates": coordinates,
        "regulations": regulations,
        "address": address,
        "timeZoneInfo": timeZoneInfo,
        "brandName": brandName,
        "ownershipTypeCode": ownershipTypeCode,
        "open": open,
        "openStatusText": openStatusText,
        "addressLines": addressLines,
        "mop": mop,
        "features": features,
        "slug": slug,
        "distance": distance
      };
}

class MopBean {
  bool ready;
  dynamic wait;

  static MopBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    MopBean mopBean = MopBean();
    mopBean.ready = map['ready'];
    mopBean.wait = map['wait'];
    return mopBean;
  }

  Map toJson() => {
        "ready": ready,
        "wait": wait,
      };
}

class TimeZoneInfoBean {
  int currentTimeOffset;
  String windowsTimeZoneId;
  String olsonTimeZoneId;

  static TimeZoneInfoBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    TimeZoneInfoBean timeZoneInfoBean = TimeZoneInfoBean();
    timeZoneInfoBean.currentTimeOffset = map['currentTimeOffset'];
    timeZoneInfoBean.windowsTimeZoneId = map['windowsTimeZoneId'];
    timeZoneInfoBean.olsonTimeZoneId = map['olsonTimeZoneId'];
    return timeZoneInfoBean;
  }

  Map toJson() => {
        "currentTimeOffset": currentTimeOffset,
        "windowsTimeZoneId": windowsTimeZoneId,
        "olsonTimeZoneId": olsonTimeZoneId,
      };
}

class AddressBean {
  String streetAddressLine1;
  String streetAddressLine2;
  dynamic streetAddressLine3;
  String city;
  String countrySubdivisionCode;
  String countryCode;
  String postalCode;

  static AddressBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddressBean addressBean = AddressBean();
    addressBean.streetAddressLine1 = map['streetAddressLine1'];
    addressBean.streetAddressLine2 = map['streetAddressLine2'];
    addressBean.streetAddressLine3 = map['streetAddressLine3'];
    addressBean.city = map['city'];
    addressBean.countrySubdivisionCode = map['countrySubdivisionCode'];
    addressBean.countryCode = map['countryCode'];
    addressBean.postalCode = map['postalCode'];
    return addressBean;
  }

  Map toJson() => {
        "streetAddressLine1": streetAddressLine1,
        "streetAddressLine2": streetAddressLine2,
        "streetAddressLine3": streetAddressLine3,
        "city": city,
        "countrySubdivisionCode": countrySubdivisionCode,
        "countryCode": countryCode,
        "postalCode": postalCode,
      };
}

class DataCoordinatesBean {
  double latitude;
  double longitude;

  static DataCoordinatesBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataCoordinatesBean coordinatesBean = DataCoordinatesBean();
    coordinatesBean.latitude = map['latitude'];
    coordinatesBean.longitude = map['longitude'];
    return coordinatesBean;
  }

  Map toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class RecommendationBean {
  static RecommendationBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    RecommendationBean recommendationBean = RecommendationBean();
    return recommendationBean;
  }

  Map toJson() => {};
}

class PagingBean {
  int total;
  int offset;
  int limit;
  int returned;

  static PagingBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    PagingBean pagingBean = PagingBean();
    pagingBean.total = map['total'];
    pagingBean.offset = map['offset'];
    pagingBean.limit = map['limit'];
    pagingBean.returned = map['returned'];
    return pagingBean;
  }

  Map toJson() => {
        "total": total,
        "offset": offset,
        "limit": limit,
        "returned": returned,
      };
}
