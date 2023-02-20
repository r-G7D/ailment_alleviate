// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/emperis_provider.dart';

class EmperisScreen extends StatelessWidget {
  const EmperisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<EmperisProvider>(context);
    return Scaffold(
      backgroundColor: prov.colorList[prov.active],
      body: Row(
        children: [
          tabBar(context),
          Container(
            width: 100,
            height: 100,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget tabBar(BuildContext context) {
    dynamic data = [
      {'title': 'Home', 'icon': Icons.home, 'color': Colors.red},
      {'title': 'Search', 'icon': Icons.search, 'color': Colors.yellow},
      {'title': 'Cart', 'icon': Icons.shopping_cart, 'color': Colors.blue},
    ];
    return SizedBox(
      height: 300,
      width: 50,
      child: Consumer<EmperisProvider>(
        builder: (_, prov, __) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  prov.setActive(index);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                      color: data[index]['color'],
                      border: Border.all(
                        color: prov.active == index
                            ? Colors.white
                            : Colors.transparent,
                        width: 2,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(data[index]['icon']),
                      Text(data[index]['title']),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
