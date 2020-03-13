import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starbuck_app/feature/store/bloc/store_bloc.dart';
import 'package:starbuck_app/feature/store/bloc/store_event.dart';
import 'package:starbuck_app/feature/store/bloc/store_state.dart';
import 'package:starbuck_app/model/store_mdl.dart';

class StorePage extends StatefulWidget {
  StorePage({Key key}) : super(key: key);

  @override
  _StorePageState createState() {
    return _StorePageState();
  }
}

class _StorePageState extends State<StorePage> {
  @override
  void initState() {
    super.initState();
    storeBloc.add(FetchAllStore());
  }

  @override
  void dispose() {
    super.dispose();
  }

  StoreBloc storeBloc = StoreBloc();
  List<StoresBean> listStores = List();

  @override
  Widget build(BuildContext context) {
    String address = "";
    double distanceInMeter = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text("Select Outlet", style: TextStyle(color: Colors.black87),),
        centerTitle: false,
      ),
      body: BlocBuilder(
          bloc: storeBloc,
          builder: (context, state) {
            if (state is LoadingStore) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ResponseSuccess) {
              listStores.addAll(state.listDataStore);
//        return Container(child: Text(state.listDataStore[0].name),);
            }
            if (state is ResponseFailed) {
              return Container(
                child: Text(state.errorMessage),
              );
            }

            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16),
              separatorBuilder: (context, index) => Divider(
                color: Colors.black12,
              ),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.pop(context, listStores[i].name);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.place,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              listStores[i].name,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subhead,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.access_time,
                                  size: 16, color: Colors.black38),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                  child: Text(
                                    "${listStores[i].open != null
                                        ? listStores[i].openStatusText
                                        : "24 Hours"}",
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 13),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.drive_eta,
                                  size: 16, color: Colors.black38),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                  child: Text(
                                    "${listStores[i].distance}",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: listStores.length,
            );
          }),
    );
  }
}
