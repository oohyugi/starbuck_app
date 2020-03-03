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
    return BlocBuilder(
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

          return ListView.builder(
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(listStores[i].name),
                subtitle: Text(listStores[i].open != null
                    ? listStores[i].openStatusText
                    : listStores[i].address.streetAddressLine1),
              );
            },
            itemCount: listStores.length,
          );
        });
  }
}
