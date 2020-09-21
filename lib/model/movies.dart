import 'package:ytsbloc/model/torrent.dart';

class Movies {
 final int id;
 final String url;
 final String imdbCode;
 final String title;
 final String titleEnglish;
 final String titleLong;
 final String slug;
 final int year;
 final double rating;
 final int runtime;
 List<String> genres;
 final String summary;
 final String descriptionFull;
 final String synopsis;
 final String ytTrailerCode;
 final String backgroundImage;
 final String backgroundImageOriginal;
 final String smallCoverImage;
 final String mediumCoverImage;
 final String largeCoverImage;
 final Torrent torrents;
 final String dateUploaded;
 final int dateUploadedUnix;

  Movies({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  Movies.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        url = json["url"],
        imdbCode = json["imdb_code"],
        title = json["title"],
        titleEnglish = json["title_english"],
        titleLong = json["title_long"],
        slug = json["slug"],
        year = json["year"],
        rating = json["rating"].toDouble(),
        runtime = json["runtime"],
        summary = json["summary"],
        descriptionFull = json["description_full"],
        synopsis = json["synopsis"],
        ytTrailerCode = json["yt_trailer_code"],
        backgroundImage = json["background_image"],
        backgroundImageOriginal = json["background_image_original"],
        smallCoverImage = json["small_cover_image"],
        mediumCoverImage = json["medium_cover_image"],
        largeCoverImage = json["large_cover_image"],
        torrents = Torrent.fromJson(json["torrents"]),
        dateUploaded = json["date_uploaded"],
        dateUploadedUnix = json["date_uploaded_unix"];
}
