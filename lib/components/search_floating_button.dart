import 'package:bshare/pages/search_page.dart';
import 'package:flutter/material.dart';

class SearchFloatingButton extends StatefulWidget {
  @override
  _SearchFloatingButtonState createState() => _SearchFloatingButtonState();
}

class _SearchFloatingButtonState extends State<SearchFloatingButton> {
  final TextEditingController _controller = TextEditingController();
  String search;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text(
        'Search',
        style: TextStyle(color: Colors.black87),
      ),
      icon: Icon(
        Icons.search,
        color: Colors.black87,
      ),
      backgroundColor: Colors.yellowAccent,
      onPressed: () async {
        await showDialog<String>(
          context: context,
          child: new AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            content: new Row(
              children: <Widget>[
                new Expanded(
                  child: new TextField(
                    controller: _controller,
                    onChanged: (data) {
                      setState(() {
                        search = data; 
                      });
                    },
                    autofocus: true,
                    decoration: new InputDecoration(
                        labelText: 'Search Film', hintText: 'eg. The Matrix'),
                  ),
                )
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new FlatButton(
                  child: const Text('SEARCH'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(search),
                        ));
                  })
            ],
          ),
        );
      },
    );
  }
}
