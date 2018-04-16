import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Super Best Friends Selector',
      theme: ThemeData.dark(),
      home: new SelectedFriends(),
    );
  }
}

class SelectedFriends extends StatefulWidget {
  @override
  createState() => new SelectedFriendsState();
}

class SelectedFriendsState extends State<SelectedFriends> {
  final _friends = <Friend>[
    // INSERT PEOPLE HERE!
    new Friend("Naomi", "Jennings", "Ace", "images/person1.jpg"),
    new Friend("Ernest", "Bishop", "JD", "images/person2.jpgg"),
    new Friend("Ernest", "Williams", "Doodlebug", "images/person3.jpg"),

  ];
  final _saved = <Friend>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Select Your Super Best Friends'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.arrow_forward), onPressed: _pushSaved),
        ],
      ),
      body: _buildFriendsList(),
    );
  }

  Widget _buildFriendsList() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _friends.length,
        itemBuilder: (context, i) {
          new Divider();
          return (_buildRow(_friends[i]));
        });
  }

  Widget _buildRow(Friend friend) {
    final alreadySaved = _saved.contains(friend);
    return new ListTile(
        title: new Text(friend.firstName, style: _biggerFont),
        trailing: new Icon(
            alreadySaved ? Icons.check_box : Icons.check_box_outline_blank),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(friend);
            } else {
              _saved.add(friend);
            }
          });
        });
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (friend) {
              return new ListTile(
                title: new Text(friend.firstName, style: _biggerFont),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
                context: context,
                tiles: tiles,
              )
              .toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Your Selected SBFs"),
              actions: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.arrow_forward),
                    onPressed: _pushResult),
              ],
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  void _pushResult() {
    _saved.shuffle();
    final Friend result = _saved[0];
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
              appBar: new AppBar(title: new Text('The Chosen One is...')),
              body: new ListView(
                padding: const EdgeInsets.all(25.0),
                children: [
                  new Image.asset(
                    result.image,
                    width: 600.0,
                    height: 450.0,
                    fit: BoxFit.cover,
                  ),
                  _buildResult(result)
                ],
              ));
        },
      ),
    );
  }

  Widget _buildResult(Friend result) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Center(
                    child: new Text(
                      "${result.firstName}  '${result.nickname}'  ${result.lastName}",
                      style: new TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20.00),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Friend {
  Friend(this.firstName, this.lastName, this.nickname, this.image);
  final String firstName;
  final String lastName;
  final String nickname;
  final String image;
}
