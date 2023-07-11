import 'dart:convert';

import 'package:http/http.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/models/model_user.dart';

abstract class IDataSource {
  Future<List<FetchModel>> fetch(String text);
}

class FetchUsersGitHub extends IDataSource {
  final Client http;

  FetchUsersGitHub(
    this.http,
  );

  final url = "https://api.github.com/search/users?q=";

  @override
  Future<List<FetchModel>> fetch(String text) async {
    try {
      final url = Uri().resolve(this.url + text);
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Failure(
          message: "Failed to fetch",
          stackTrace: StackTrace.current,
        );
      }

      final map = json.decode(response.body) as Map<String, dynamic>;

      final users = (map["items"] as List)
          .map((model) => FetchModel(
              avatar_url: model["avatar_url"] as String,
              location: model["html_url"],
              name: model["login"] as String))
          .toList();

      return users;
    } catch (e, stackTrace) {
      throw Failure(message: e.toString(), stackTrace: stackTrace);
    }
  }
}
