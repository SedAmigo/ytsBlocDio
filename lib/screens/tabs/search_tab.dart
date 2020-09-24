import 'dart:math';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ytsbloc/bloc/search_bloc.dart';
import 'package:ytsbloc/elements/error_element.dart';
import 'package:ytsbloc/elements/loader_element.dart';
import 'package:ytsbloc/model/data_model.dart';
import 'package:ytsbloc/model/movieresponse.dart';
import 'package:ytsbloc/model/movies.dart';
import 'package:ytsbloc/utils/appcolor.dart';
import 'package:ytsbloc/widgets/screen_widgets/movie_detail.dart';
import '../../utils/number_extensions.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final _searchController = TextEditingController();

  Random rnd =  Random();
  var list = [
    'iron man',
    'your name',
    'batman',
    'naruto',
    'pulp fiction',
    'The Avengers',
    'the good the bad and the ugly',
    'a silent voice',
    'spirited away',
    'social network',
    'forest gump',
    'star wars',
    'the hobbit',
    'harry potter',
    'lord of the rings',
    '3 idiots',
    'curious case of benjamin button',
    'inception',
    'the prestige',
    'mission impossible',
    'the irishman',
    'the godfather',
    'deadpool',
    'spiderman',
    'up',
    'inside out',
    'cars',
    'pirates of the caribbean',
    'coco',
    'wall-e',
    'Spider-Man: Into the Spider-Verse',
    'mulan',
    'moana',
    'frozen'
    'Minions'
  ];
  @override
  void initState() {
    var element = list[rnd.nextInt(list.length)];
    searchBloc.search('$element');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            controller: _searchController,
            onChanged: (changed) {
              searchBloc.search(_searchController.text);
            },
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: Colors.grey[100],
              suffix: _searchController.text.length > 0
                  ? IconButton(
                      icon: Icon(EvaIcons.backspaceOutline),
                      onPressed: () {
                        setState(() {
                          //FocusScope.of(context).requestFocus(FocusNode());
                          _searchController.clear();
                          searchBloc.search(_searchController.text);
                        });
                      },
                    )
                  : Icon(
                      EvaIcons.searchOutline,
                      color: Colors.grey[500],
                      size: 16.0,
                    ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[100].withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[100].withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              contentPadding: EdgeInsets.only(
                left: 15.0,
                right: 10.0,
              ),
              labelText: 'Search...',
              hintStyle: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              labelStyle: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            autocorrect: false,
            // ignore: deprecated_member_use
            autovalidate: true,
          ),
        ),
        Expanded(
          child: StreamBuilder<MovieResponce>(
            stream: searchBloc.subject.stream,
            builder: (context, AsyncSnapshot<MovieResponce> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.error != null &&
                    snapshot.data.error.length > 0) {
                  return buildErrorWidget(snapshot.data.error);
                }
                return _buildSearchedNews(snapshot.data);
              } else if (snapshot.hasError) {
                return buildErrorWidget(snapshot.error);
              } else {
                return buildLoadingWidget();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchedNews(MovieResponce data) {
    Data movies = data.data;
    if (movies.movieCount == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('No Movies'),
          ],
        ),
      );
    } else {
      List<Movies> movie = movies.movies;
      return ListView.builder(
        shrinkWrap: true,
        itemCount: movie.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                child: Card(
                  color: AppColor.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetail(
                            movie: movie[index],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          // child: Image.network(movie[index].largeCoverImage) ==
                          //         null
                          //     ? 'https://i0.wp.com/www.cluba.rs/wp-content/uploads/2019/11/placeholder.png?ssl=1'
                          //     : Image.network(movie[index].largeCoverImage),
                        ),
                        Divider(
                          color: Colors.black,
                          height: 40,
                          thickness: 5,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
            ],
          );
        },
      );
    }
  }
}
