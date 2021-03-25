import 'package:burc_rehberi/BurcListesi.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetayi extends StatefulWidget {
  int index;
  BurcDetayi(this.index);
  @override
  _BurcDetayiState createState() => _BurcDetayiState();
}

class _BurcDetayiState extends State<BurcDetayi> {
  PaletteGenerator value;
  Color baskinRenk;

  getPaletteGenerator() async {
    value = await PaletteGenerator.fromImageProvider(
        AssetImage('images/' + BurcListesi.data[widget.index].burcBuyukResim));
    setState(() {
      baskinRenk = value.dominantColor.color;
      debugPrint(baskinRenk.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getPaletteGenerator();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: true,
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          primary: true,
          pinned: true,
          backgroundColor: baskinRenk == null ? Colors.indigo : baskinRenk,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text('Burc Detayı'),
            background: Image.asset(
              'images/' + BurcListesi.data[widget.index].burcBuyukResim,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            BurcListesi.data[widget.index].burcDetayi,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        )
      ],
    );
  }
}
