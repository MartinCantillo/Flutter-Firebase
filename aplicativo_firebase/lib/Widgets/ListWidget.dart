import 'package:flutter/material.dart';
import 'package:aplicativo_firebase/Model/Data.dart';
import 'package:aplicativo_firebase/Provider/Service.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  late Future<List<Data>> dataList;
  Services service = Services();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    dataList = service.getAll();

    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo is ScrollEndNotification &&
            _scrollController.position.extentAfter == 0) {}
        return false;
      },
      child: FutureBuilder<List<Data>>(
        future: dataList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Data>? data = snapshot.data;

            if (data != null && data.isNotEmpty) {
            
              return ListView.builder(
                controller: _scrollController,
                itemCount: data.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < data.length) {
                    return uploadList(context, data[index]);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            } else {
              return const Text('No hay datos disponibles');
            }
          }
        },
      ),
    );
  }

  Widget uploadList(BuildContext context, Data data) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.black,
      ),
      onDismissed: (direccion){
        print("onmisi");
       service.delete(data.id.toString());

      },
      child: ListTile(
        title: Text("${data.name.toString()}  ${data.lastname.toString()}"),
        subtitle: Text("Days ${data.days} * Num Cigarretes ${data.cigarettes}"),
        trailing: Text("Status ${data.status?.toString()}"),
        leading: Text("*"),
      ),
    );
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {}
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
