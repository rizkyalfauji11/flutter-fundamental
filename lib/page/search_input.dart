import 'package:flutter/material.dart';

class SearchInputPage extends StatefulWidget {
  static const routeName = "/search_input";

  @override
  _SearchInputPageState createState() => _SearchInputPageState();
}

class _SearchInputPageState extends State<SearchInputPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading:Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      Navigator.pop(context, controller.value.text.toString());
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
