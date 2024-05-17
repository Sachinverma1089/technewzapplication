import 'package:flutter/material.dart';
import 'package:technewzapp/components/newsbox.dart';
import 'package:technewzapp/components/searchbar.dart';
import 'package:technewzapp/utils/constants.dart';
import 'package:technewzapp/utils/text.dart';

import '../backend/functions.dart';
import '../components/appbar.dart';
import '../utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<dynamic>> news;
  @override
  void initState() {
    super.initState();
    fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: appbar(),
      body: Column(
        children: [
          SearchBarPage(),
          Expanded(
              child: Container(
            width: w,
            child: FutureBuilder<List?>(
              future: fetchnews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return NewsBox(
                        url: snapshot.data![index]['url'],
                        imageurl: snapshot.data![index]['urlToImage'] != null
                            ? snapshot.data![index]['urlToImage']
                            : Constants.imageurl,
                        title: snapshot.data![index]['title'],
                        time: snapshot.data![index]['publishedAt'],
                        description:
                            snapshot.data![index]['description'].toString(),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                //By default,show a loading spinner.
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
