import 'package:objectbox/objectbox.dart';

@Entity()
class HomeSearchModel {
  HomeSearchModel({
    required this.id,
    required this.name,
    required this.artist,
    required this.summary,
    required this.category,
    required this.icon,
    required this.appId,
    this.averageUserRatingForCurrentVersion,
    this.userRatingCountForCurrentVersion,
  });

  @Id()
  int id;

  @Index()
  String appId;

  String name;
  String artist;
  String summary;
  String category;
  String icon;

  double? averageUserRatingForCurrentVersion;
  int? userRatingCountForCurrentVersion;

  HomeSearchModel copyWith({
    int? id,
    String? name,
    String? artist,
    String? summary,
    String? category,
    String? icon,
    double? averageUserRatingForCurrentVersion,
    int? userRatingCountForCurrentVersion,
    String? appId,
  }) {
    return HomeSearchModel(
      id: id ?? this.id,
      name: name ?? this.name,
      artist: artist ?? this.artist,
      summary: summary ?? this.summary,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      averageUserRatingForCurrentVersion: averageUserRatingForCurrentVersion ??
          this.averageUserRatingForCurrentVersion,
      userRatingCountForCurrentVersion: userRatingCountForCurrentVersion ??
          this.userRatingCountForCurrentVersion,
      appId: appId ?? this.appId,
    );
  }
}
