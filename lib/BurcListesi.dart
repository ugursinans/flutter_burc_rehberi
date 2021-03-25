import 'package:burc_rehberi/utils/strings.dart';
import 'package:flutter/material.dart';

import 'models/burc.dart';

void main() {
  runApp(BurcListesi());
}

class BurcListesi extends StatelessWidget {
  static List<Burc> data = [];
  @override
  Widget build(BuildContext context) {
    data = getDatas();
    return Scaffold(
      appBar: AppBar(
        title: Text('Burc Rehberi A.Ş.'),
      ),
      body: ListeyiOlustur(),
    );
  }

  List<Burc> getDatas() {
    List<Burc> burclar = [];
    for (int i = 0; i < Strings.BURC_ADLARI.length; i++) {
      Burc burc = new Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          (Strings.BURC_ADLARI[i] + (i + 1).toString() + '.png').toLowerCase(),
          (Strings.BURC_ADLARI[i] + "_buyuk" + (i + 1).toString() + '.png')
              .toLowerCase());
      burclar.add(burc);
    }
    debugPrint('1');
    return burclar;
  }

  Widget ListeyiOlustur() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListItem(context, index);
      },
      itemCount: Strings.BURC_ADLARI.length,
    );
  }

  Widget ListItem(BuildContext context, int index) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: Image.asset(
            'images/${data[index].burcKucukResim}',
            width: 128,
            height: 128,
            repeat: ImageRepeat.repeatY,
          ),
          title: Text(
            data[index].burcAdi,
            style: TextStyle(fontSize: 24, color: Colors.indigo),
          ),
          subtitle: Text(
            data[index].burcTarihi,
          ),
          trailing: Icon(Icons.add_to_home_screen_sharp),
          dense: false,
          onTap: () {
            Navigator.pushNamed(context, '/burcDetayi/$index');
          },
        ),
      ),
    );
  }
}
