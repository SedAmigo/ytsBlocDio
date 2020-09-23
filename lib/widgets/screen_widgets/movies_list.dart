import 'package:flutter/material.dart';
import 'package:ytsbloc/bloc/get_movies_bloc.dart';
import 'package:ytsbloc/elements/error_element.dart';
import 'package:ytsbloc/elements/loader_element.dart';
import 'package:ytsbloc/model/movieresponse.dart';
import 'package:ytsbloc/model/movies.dart';
import 'package:ytsbloc/utils/appcolor.dart';
import 'package:ytsbloc/widgets/custom_widgets/custom_text.dart';
import 'package:ytsbloc/widgets/screen_widgets/movie_detail.dart';
import '../../utils/number_extensions.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    getMovieBoc.getMov();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponce>(
      stream: getMovieBoc.subject.stream,
      builder: (BuildContext context, AsyncSnapshot<MovieResponce> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return buildErrorWidget(snapshot.data.error);
          }
          return _buildMovieList(snapshot.data);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error);
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildMovieList(MovieResponce data) {
    List<Movies> movies = data.data.movies;
    if (movies.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CustomText(txt: 'No Movies'),
          ],
        ),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: movies.length,
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
                              movie: movies[index],
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
                            child: Image.network(movies[index].largeCoverImage) == null
                                ? Image.asset('assets/img/yts.jpg')
                                : Image.network(movies[index].largeCoverImage),
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
          });
    }
  }
}
