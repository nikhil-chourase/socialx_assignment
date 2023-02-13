import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialx/components/customListTile.dart';
import 'package:socialx/model/article_model.dart';
import 'package:socialx/services/api_service.dart';

class NewsScreen extends StatefulWidget {
  static String id = 'NewsScreen';

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final _auth = FirebaseAuth.instance;


  ApiService client  = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout_sharp),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);

                //Implement logout functionality
              }),

        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles


             List<Article>? articles = snapshot.data;

            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

    );
  }
}
