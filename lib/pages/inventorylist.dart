

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/DBHelper.dart';
import '../provider/InventoryProvider.dart';


class InventoryList extends StatefulWidget {
  const InventoryList({
    Key? key,
  }) : super(key: key);

  @override
  State<InventoryList> createState() => _InventoryListState();
}

class _InventoryListState extends State<InventoryList> {
  DBHelper? dbHelper = DBHelper();
  List<bool> tapped = [];

  @override
  void initState() {
    super.initState();
    context.read<InventoryProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: const Text('Achievements', style: TextStyle(fontSize: 22)),

      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<InventoryProvider>(
              builder: (BuildContext context, provider, widget) {
                if (provider.inventory.isEmpty) {
                  return const Center(
                      child: Text(
                        'Coming Soon',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                      ));
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.inventory.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.blueGrey.shade200,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image(
                                  height: 80,
                                  width: 80,
                                  image:
                                  AssetImage(provider.inventory[index].image!),
                                ),
                                SizedBox(
                                  width: 130,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      RichText(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        text: TextSpan(
                                            text: 'Name: ',
                                            style: TextStyle(
                                                color: Colors.blueGrey.shade800,
                                                fontSize: 16.0),
                                            children: [
                                              TextSpan(
                                                  text:
                                                  '${provider.inventory[index].name!}\n',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ]),
                                      ),

                                      RichText(
                                        maxLines: 1,
                                        text: TextSpan(
                                            text: 'Price: ' r"$",
                                            style: TextStyle(
                                                color: Colors.blueGrey.shade800,
                                                fontSize: 16.0),
                                            children: [
                                              TextSpan(
                                                  text:
                                                  '${provider.inventory[index].price!}\n',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),

                                TextButton(
                                    onPressed: () {

                                    },
                                     child: Text('EQUIP'),),
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ),

        ],
      ),
    );
  }
}


