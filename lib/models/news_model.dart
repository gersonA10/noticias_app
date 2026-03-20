import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
    final String status;
    final int totalResults;
    final List<NewsResultModel> results;
    final String nextPage;

    NewsModel({
        required this.status,
        required this.totalResults,
        required this.results,
        required this.nextPage,
    });

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        results: List<NewsResultModel>.from(json["results"].map((x) => NewsResultModel.fromJson(x))),
        nextPage: json["nextPage"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "nextPage": nextPage,
    };
}
class NewsResultModel {
    final String articleId;
    final String link;
    final String title;
    final String description;
    final List<String>? keywords;
    final List<String>? creator;                    
    final List<String> country;
    final DateTime pubDate;
    final DateTime fetchedAt;
    final String imageUrl;
    final dynamic videoUrl;
    final String sourceId;
    final String sourceName;
    final int sourcePriority;
    final String sourceUrl;
    final String? sourceIcon;

    final bool duplicate;

    NewsResultModel({
        required this.articleId,
        required this.link,
        required this.title,
        required this.description,
        required this.keywords,
        required this.creator,
        required this.country,
        required this.pubDate,
        required this.fetchedAt,
        required this.imageUrl,
        required this.videoUrl,
        required this.sourceId,
        required this.sourceName,
        required this.sourcePriority,
        required this.sourceUrl,
        required this.sourceIcon,
        required this.duplicate,
    });

    factory NewsResultModel.fromJson(Map<String, dynamic> json) => NewsResultModel(
        articleId: json["article_id"],
        link: json["link"],
        title: json["title"],
        description: json["description"] ?? '',
        keywords: json["keywords"] == null ? [] : List<String>.from(json["keywords"]!.map((x) => x)),
        creator: json["creator"] == null ? [] : List<String>.from(json["creator"]!.map((x) => x)),
        country: List<String>.from(json["country"].map((x) => x)),
        pubDate: DateTime.parse(json["pubDate"]),
        fetchedAt: DateTime.parse(json["fetched_at"]),
        imageUrl: json["image_url"] ?? 'https://static.vecteezy.com/system/resources/previews/022/059/000/non_2x/no-image-available-icon-vector.jpg',
        videoUrl: json["video_url"],
        sourceId: json["source_id"],
        sourceName: json["source_name"],
        sourcePriority: json["source_priority"],
        sourceUrl: json["source_url"],
        sourceIcon: json["source_icon"],

        duplicate: json["duplicate"],
    );

    Map<String, dynamic> toJson() => {
        "article_id": articleId,
        "link": link,
        "title": title,
        "description": description,
        "keywords": keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
        "creator": creator == null ? [] : List<dynamic>.from(creator!.map((x) => x)),
        "country": List<dynamic>.from(country.map((x) => x)),
        "pubDate": pubDate.toIso8601String(),
        "fetched_at": fetchedAt.toIso8601String(),
        "image_url": imageUrl,
        "video_url": videoUrl,
        "source_id": sourceId,
        "source_name": sourceName,
        "source_priority": sourcePriority,
        "source_url": sourceUrl,
        "source_icon": sourceIcon,
        "duplicate": duplicate,
    };
}