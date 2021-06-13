import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:materialDrawer/new_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.amber,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[50]
              : null),
      home: new HomePage(),
      // routes: <String, WidgetBuilder>{
      //   "/a": (BuildContext context) => new NewPage("New Page"),
      // }
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Material Drawer"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName: new Text("Usama Rafay"),
              accountEmail: new Text("usama.rafay@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.red,
                child: new Text("UR"),
              ),
              otherAccountsPictures: [
                new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text("R"),
                )
              ],
            ),
            new ListTile(
              title: new Text("Page One"),
              trailing: new Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new NewPage("Page One")));
              },
            ),
            new ListTile(
                title: new Text("Page Two"),
                trailing: new Icon(Icons.shopping_basket),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new NewPage("Page Two")));
                }),
            new Divider(),
            new ListTile(
              title: new Text("Page Close"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Home page"),
        ),
      ),
    );
  }
}
