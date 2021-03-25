import 'package:burc_rehberi/BurcListesi.dart';
import 'package:flutter/material.dart';

class BurcDetayi extends StatelessWidget {
  int index;
  BurcDetayi(this.index);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: true,
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          primary: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text('Burc Detayı'),
            background: Image.asset(
              'images/' + BurcListesi.data[index].burcBuyukResim,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            BurcListesi.data[index].burcDetayi,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        )
      ],
    );
  }
}
