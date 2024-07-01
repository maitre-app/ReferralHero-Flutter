import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'referral_hero_flutter_platform_interface.dart';

class MethodChannelReferralHeroFlutter extends ReferralHeroFlutterPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('referral_hero_flutter');

  String? _apiKey;
  String? _uuid;
  final String _baseUrl = "app.referralhero.com/api/sdk/v1/";

  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/vnd.referralhero.v1',
        'Authorization': _apiKey!,
      };

  @override
  Future<void> initialize(String apiKey, String uuid) async {
    _apiKey = apiKey;
    _uuid = uuid;
  }

  @override
  Future<Map<String, dynamic>> addSubscriber(
      Map<String, dynamic> subscriber) async {
    final response = await http.post(
      Uri.parse('https://$_baseUrl/lists/$_uuid/subscribers'),
      headers: headers,
      body: json.encode(subscriber),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add subscriber');
    }
    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> getSubscriberDetails(String subscriberId) async {
    final response = await http.get(
      Uri.parse('https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId'),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch subscriber details');
    }
    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> updateSubscriber(
      String subscriberId, Map<String, dynamic> updates) async {
    final response = await http.patch(
      Uri.parse('https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId'),
      headers: headers,
      body: json.encode(updates),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update subscriber');
    }
    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> deleteSubscriber(String subscriberId) async {
    final response = await http.delete(
      Uri.parse('https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId'),
      headers: headers,
    );
    // if (response.statusCode != 200) {
    //   throw Exception('Failed to delete subscriber');
    // }
    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> trackReferral(
      Map<String, dynamic> referral) async {
    final response = await http.post(
      Uri.parse(
          'https://$_baseUrl/lists/$_uuid/subscribers/track_referral_conversion_event'),
      headers: headers,
      body: json.encode(referral),
    );
    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> captureShare(
      String subscriberId, String social) async {
    final response = await http.post(
      Uri.parse(
          'https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId/click_capture'),
      headers: headers,
      body: json.encode({'social': social}),
    );
    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> getMyReferrals(String subscriberId) async {
    final response = await http.get(
      Uri.parse(
          'https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId/referrals_data'),
      headers: headers,
    );
    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> getLeaderboard() async {
    final response = await http.get(
      Uri.parse('https://$_baseUrl/lists/$_uuid/leaderboard'),
      headers: headers,
    );
    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> createPendingReferral(
      Map<String, dynamic> referral) async {
    final response = await http.post(
      Uri.parse('https://$_baseUrl/lists/$_uuid/subscribers/pending_referral'),
      headers: headers,
      body: json.encode(referral),
    );
    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> organicTrackReferral(
      Map<String, dynamic> referral) async {
    final response = await http.post(
      Uri.parse(
          'https://$_baseUrl/lists/$_uuid/subscribers/organic_track_referral'),
      headers: headers,
      body: json.encode(referral),
    );
    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> confirmReferral(String subscriberId) async {
    final response = await http.post(
      Uri.parse(
          'https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId/confirm'),
      headers: headers,
    );
    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> getReferrer(Map<String, dynamic> query) async {
    final uri = Uri.parse(
        'https://$_baseUrl/lists/$_uuid/subscribers/referrer?${Uri(queryParameters: query).query}');

    final response = await http.get(uri, headers: headers);

    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> getRewards(String subscriberId) async {
    final response = await http.get(
      Uri.parse(
          'https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId/rewards'),
      headers: headers,
    );
    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }
}
