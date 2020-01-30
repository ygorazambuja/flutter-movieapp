import 'package:bshare/components/film_card.dart';
import 'package:bshare/components/search_floating_button.dart';
import 'package:bshare/model/film.dart';
import 'package:bshare/provider/api.dart';
import 'package:flutter/material.dart';

class GenrePage extends StatelessWidget {
  final int id;
  final String name;
  final api = Api();
  GenrePage(this.id, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text('$name'),
      ),
      body: Center(
        child: FutureBuilder<List<Film>>(
          future: api.getFilmByGenre(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2.0,
                    crossAxisCount: 2,
                    childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  return FilmCard(
                    context,
                    (snapshot.data[index]),
                  );
                },
                itemCount: snapshot.data.length,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: SearchFloatingButton(),
      backgroundColor: Colors.black87,
    );
  }
}
