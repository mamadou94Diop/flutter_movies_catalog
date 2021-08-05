// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:first_flutter_app/data/model/movies_entity.dart';
import 'package:first_flutter_app/generated/json/movies_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
		switch (type) {
			case MovieEntity:
				return moviesEntityFromJson(data as MovieEntity, json) as T;    }
		return data as T;
	}

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case MovieEntity:
				return moviesEntityToJson(data as MovieEntity);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (MovieEntity).toString()){
			return MovieEntity().fromJson(json);
		}

		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<MovieEntity>[] is M){
			return data.map<MovieEntity>((e) => MovieEntity().fromJson(e)).toList() as M;
		}

		throw Exception("not found");
	}

  static M fromJsonAsT<M>(json) {
		if (json is List) {
			return _getListChildType<M>(json);
		} else {
			return _fromJsonSingle<M>(json) as M;
		}
	}
}