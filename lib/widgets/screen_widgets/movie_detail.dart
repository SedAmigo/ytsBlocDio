import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:ytsbloc/model/movies.dart';
import 'package:ytsbloc/utils/appcolor.dart';
import 'package:ytsbloc/widgets/custom_widgets/custom_text.dart';
import '../../utils/number_extensions.dart';

class MovieDetail extends StatefulWidget {
  final Movies movie;

  MovieDetail({Key key, this.movie}) : super(key: key);
  @override
  _MovieDetailState createState() => _MovieDetailState(movie);
}

class _MovieDetailState extends State<MovieDetail> {
  final Movies movie;
  _MovieDetailState(this.movie);

  YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: movie.ytTrailerCode,
        flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ));
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

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: AppColor.mainColor,
            title: Text(
              movie.title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 0.0,
                left: 25.0,
                right: 25.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    movie.mediumCoverImage,
                  ),
                  30.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        txt: 'Information',
                        txtSize: 20.flexibleFontSize,
                        txtColor: Colors.white,
                      ),
                      10.horizontalSpace,
                      Icon(
                        EvaIcons.arrowDown,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Container(
                    height: 120.flexibleHeight,
                    child: Card(
                      color: AppColor.mainColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  txt: 'Title',
                                  txtSize: 14.flexibleFontSize,
                                  txtColor: Colors.white,
                                ),
                                10.horizontalSpace,
                                Icon(
                                  EvaIcons.arrowRight,
                                  size: 15.0,
                                  color: Colors.white,
                                ),
                                20.verticalSpace,
                                Flexible(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    strutStyle: StrutStyle(
                                        fontSize: 14.0.flexibleFontSize),
                                    text: TextSpan(
                                        style: GoogleFonts.workSans(
                                          textStyle: TextStyle(
                                            fontSize: 14.flexibleFontSize,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        text: movie.title),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  txt: 'Genre',
                                  txtSize: 14.flexibleFontSize,
                                  txtColor: Colors.white,
                                ),
                                10.horizontalSpace,
                                Icon(
                                  EvaIcons.arrowRight,
                                  size: 15.0,
                                  color: Colors.white,
                                ),
                                20.verticalSpace,
                                CustomText(
                                  txt:
                                      '${movie.genres[0]}',
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  txt: 'Released',
                                  txtSize: 14.flexibleFontSize,
                                  txtColor: Colors.white,
                                ),
                                10.horizontalSpace,
                                Icon(
                                  EvaIcons.arrowRight,
                                  size: 15.0,
                                  color: Colors.white,
                                ),
                                20.verticalSpace,
                                CustomText(
                                  txt: movie.year.toString(),
                                  txtSize: 14.flexibleFontSize,
                                  txtColor: Colors.white,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  FontAwesomeIcons.imdb,
                                  size: 25.0,
                                  color: Colors.yellow,
                                ),
                                10.horizontalSpace,
                                Icon(
                                  EvaIcons.arrowRight,
                                  size: 15.0,
                                  color: Colors.white,
                                ),
                                20.verticalSpace,
                                CustomText(
                                  txt: '${movie.rating} / 10',
                                  txtSize: 14.flexibleFontSize,
                                  txtColor: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        txt: 'Traier(don\'t full screen)',
                        txtSize: 20.flexibleFontSize,
                      ),
                      10.horizontalSpace,
                      Icon(
                        EvaIcons.arrowDown,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      shape: BoxShape.rectangle,
                    ),
                    child: YoutubePlayer(
                      controller: _controller == null
                          ? Image.asset('assets/img/placeholder.jpg')
                          : _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: AppColor.mainColor,
                    ),
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        txt: 'Description',
                        txtSize: 20.flexibleFontSize,
                      ),
                      10.horizontalSpace,
                      Icon(
                        EvaIcons.arrowDown,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Text(
                    movie.descriptionFull == null
                        ? Text(
                            'The description of Movie is not available!!!',
                            style: TextStyle(color: Colors.white),
                          )
                        : movie.descriptionFull,
                    style: GoogleFonts.alice(
                      textStyle: TextStyle(
                        fontSize: 14.flexibleFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  40.verticalSpace,
                  SizedBox(
                    width: 327.flexibleWidth,
                    height: 48.flexibleHeight,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: AppColor.mainColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            EvaIcons.downloadOutline,
                            color: Colors.white,
                          ),
                          10.horizontalSpace,
                          Text(
                            'Download',
                            style: GoogleFonts.workSans(
                              textStyle: TextStyle(
                                  fontSize: 14.flexibleFontSize,
                                  color: Colors.white),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 230,
                              color: AppColor.mainColor,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  top: 20.0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: GoogleFonts.workSans(
                                          textStyle: TextStyle(
                                            fontSize: 12.flexibleFontSize,
                                          ),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'You must have ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.flexibleFontSize,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          TextSpan(
                                              text: 'µTorrent',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 18.flexibleFontSize,
                                                fontWeight: FontWeight.w800,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  print('µTorrent');
                                                }),
                                          TextSpan(
                                            text: ' or ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.flexibleFontSize,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          TextSpan(
                                              text: 'BitTorrent',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18.flexibleFontSize,
                                                fontWeight: FontWeight.w800,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  print('BitTorrent');
                                                }),
                                          TextSpan(
                                            text: ' installed in your phone. ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.flexibleFontSize,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    30.verticalSpace,
                                    Center(
                                      child: Text(
                                        'Download(${movie.title})',
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    20.verticalSpace,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RaisedButton(
                                          child: Text(
                                            '720P',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          color: Colors.redAccent,
                                          onPressed: () async {
                                            String url =
                                                '${movie.torrents[0].url}';
                                            if (await canLaunch(url)) {
                                              await launch(url,
                                                  forceSafariVC: false);
                                            } else {
                                              throw Exception(
                                                  'No Internet Connection');
                                            }
                                          },
                                        ),
                                        RaisedButton(
                                            child: Text(
                                              '1080P',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: Colors.redAccent,
                                            onPressed: () async {
                                              String url =
                                                  '${movie.torrents[1].url}';
                                              if (await canLaunch(url)) {
                                                await launch(url,
                                                    forceSafariVC: false);
                                              } else {
                                                throw Exception(
                                                    'No Internet Connection');
                                              }
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
