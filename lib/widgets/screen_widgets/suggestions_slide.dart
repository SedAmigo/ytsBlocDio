import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ytsbloc/bloc/get_suggestions_bloc.dart';
import 'package:ytsbloc/elements/error_element.dart';
import 'package:ytsbloc/elements/loader_element.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ytsbloc/model/movieresponse.dart';
import 'package:ytsbloc/model/movies.dart';
import 'package:ytsbloc/widgets/custom_widgets/custom_text.dart';
import 'package:ytsbloc/widgets/screen_widgets/movie_detail.dart';
import '../../utils/number_extensions.dart';

class MaterialSlider extends StatefulWidget {
  @override
  _MaterialSliderState createState() => _MaterialSliderState();
}

class _MaterialSliderState extends State<MaterialSlider> {
  @override
  void initState() {
    suggetionBloc.getSug();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375,
      height: 812,
      allowFontScaling: false,
    );
    return StreamBuilder<MovieResponce>(
      stream: suggetionBloc.subject.stream,
      // ignore: missing_return
      builder: (context, AsyncSnapshot<MovieResponce> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return buildErrorWidget(snapshot.data.error);
          }
          return _suggestionSlider(snapshot.data);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error);
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }

  Widget _suggestionSlider(MovieResponce data) {
    List<Movies> movies = data.data.movies;
    return Container(
      width: 200.flexibleWidth,
      height: 200.flexibleHeight,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: false,
          height: 200.0.flexibleHeight,
          viewportFraction: 0.9,
        ),
        items: getExpenseSliders(movies),
      ),
    );
  }

  getExpenseSliders(List<Movies> movies) {
    return movies
        .map((movie) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetail(
                      movie: movie,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.only(
                  left: 3.0,
                  right: 5.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: movie.backgroundImage == null
                              ? AssetImage('assets/img/placeholder.jpg')
                              : NetworkImage(movie.backgroundImage),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [
                            0.1,
                            0.9,
                          ],
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30.0,
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          children: [
                            CustomText(
                              txt: movie.title,
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    Positioned(
                      bottom: 18.0,
                      left: 10.0,
                      child: CustomText(
                        txt: movie.genres[0],
                        txtSize: 9.flexibleFontSize,
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      right: 10.0,
                      child: Text(
                        timeAgo(
                          DateTime.parse(movie.dateUploaded),
                        ),
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 9.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }

  String timeAgo(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
