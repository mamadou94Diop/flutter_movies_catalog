
import 'package:first_flutter_app/data/model/movies_entity.dart';

moviesEntityFromJson(MovieEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['year'] != null) {
		data.year = json['year'].toString();
	}
	if (json['genres'] != null) {
		data.genres = (json['genres'] as List).map((v) => v.toString()).toList().cast<String>();
	}
	if (json['ratings'] != null) {
		data.ratings = (json['ratings'] as List).map((v) => v is String
				? int.tryParse(v)
				: v.toInt()).toList().cast<int>();
	}
	if (json['poster'] != null) {
		data.poster = json['poster'].toString();
	}
	if (json['contentRating'] != null) {
		data.contentRating = json['contentRating'].toString();
	}
	if (json['duration'] != null) {
		data.duration = json['duration'].toString();
	}
	if (json['releaseDate'] != null) {
		data.releaseDate = json['releaseDate'].toString();
	}
	if (json['averageRating'] != null) {
		data.averageRating = json['averageRating'] is String
				? int.tryParse(json['averageRating'])
				: json['averageRating'].toInt();
	}
	if (json['originalTitle'] != null) {
		data.originalTitle = json['originalTitle'].toString();
	}
	if (json['storyline'] != null) {
		data.storyline = json['storyline'].toString();
	}
	if (json['actors'] != null) {
		data.actors = (json['actors'] as List).map((v) => v.toString()).toList().cast<String>();
	}
	if (json['imdbRating'] != null) {
		data.imdbRating = json['imdbRating'].toString();
	}
	if (json['posterurl'] != null) {
		data.posterurl = json['posterurl'].toString();
	}
	return data;
}

Map<String, dynamic> moviesEntityToJson(MovieEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['year'] = entity.year;
	data['genres'] = entity.genres;
	data['ratings'] = entity.ratings;
	data['poster'] = entity.poster;
	data['contentRating'] = entity.contentRating;
	data['duration'] = entity.duration;
	data['releaseDate'] = entity.releaseDate;
	data['averageRating'] = entity.averageRating;
	data['originalTitle'] = entity.originalTitle;
	data['storyline'] = entity.storyline;
	data['actors'] = entity.actors;
	data['imdbRating'] = entity.imdbRating;
	data['posterurl'] = entity.posterurl;
	return data;
}