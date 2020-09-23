import 'package:ytsbloc/model/torrent.dart';

class Movies {
 int id;
    String url;
    String imdbCode;
    String title;
    String titleEnglish;
    String titleLong;
    String slug;
    int year;
    double rating;
    int runtime;
    List<String> genres;
    String summary;
    String descriptionFull;
    String synopsis;
    String ytTrailerCode;
    String language;
    String backgroundImage;
    String backgroundImageOriginal;
    String smallCoverImage;
    String mediumCoverImage;
    String largeCoverImage;
    List<Torrent> torrents;
    String dateUploaded;
    int dateUploadedUnix;

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
        this.language,
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
        genres = List<String>.from(json["genres"].map((x) => x)),
        summary = json["summary"],
        descriptionFull = json["description_full"],
        synopsis = json["synopsis"],
        ytTrailerCode = json["yt_trailer_code"],
        backgroundImage = json["background_image"],
        backgroundImageOriginal = json["background_image_original"],
        smallCoverImage = json["small_cover_image"],
        mediumCoverImage = json["medium_cover_image"],
        largeCoverImage = json["large_cover_image"],
        torrents = List<Torrent>.from(json["torrents"].map((x) => Torrent.fromJson(x))),
        dateUploaded = json["date_uploaded"],
        dateUploadedUnix = json["date_uploaded_unix"];
}
