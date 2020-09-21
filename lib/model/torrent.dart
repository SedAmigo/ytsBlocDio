class Torrent {
  String url;
  String hash;
  Quality quality;
  int seeds;
  int peers;
  String size;
  int sizeBytes;
  String dateUploaded;
  int dateUploadedUnix;

  Torrent({
    this.url,
    this.hash,
    this.quality,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) => Torrent(
        url: json["url"],
        hash: json["hash"],
        quality: qualityValues.map[json["quality"]],
        seeds: json["seeds"],
        peers: json["peers"],
        size: json["size"],
        sizeBytes: json["size_bytes"],
        dateUploaded: json["date_uploaded"],
        dateUploadedUnix: json["date_uploaded_unix"],
      );
}

enum Quality { THE_720_P, THE_1080_P }

final qualityValues =
    EnumValues({"1080p": Quality.THE_1080_P, "720p": Quality.THE_720_P});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
