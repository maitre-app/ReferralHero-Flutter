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
  Future<void> addSubscriber(Map<String, dynamic> subscriber) async {
    final response = await http.post(
      Uri.parse('https://$_baseUrl/lists/$_uuid/subscribers'),
      headers: headers,
      body: json.encode(subscriber),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add subscriber');
    }
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
    return json.decode(response.body);
  }

  @override
  Future<void> updateSubscriber(
      String subscriberId, Map<String, dynamic> updates) async {
    final response = await http.patch(
      Uri.parse('https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId'),
      headers: headers,
      body: json.encode(updates),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update subscriber');
    }
  }

  @override
  Future<void> deleteSubscriber(String subscriberId) async {
    final response = await http.delete(
      Uri.parse('https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId'),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete subscriber');
    }
  }

  @override
  Future<void> trackReferral(Map<String, dynamic> referral) async {
    final response = await http.post(
      Uri.parse(
          'https://$_baseUrl/lists/$_uuid/subscribers/track_referral_conversion_event'),
      headers: headers,
      body: json.encode(referral),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to track referral');
    }
  }

  @override
  Future<void> captureShare(String subscriberId, String social) async {
    final response = await http.post(
      Uri.parse(
          'https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId/click_capture'),
      headers: headers,
      body: json.encode({'social': social}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to capture share');
    }
  }

  @override
  Future<List<dynamic>> getMyReferrals(String subscriberId) async {
    final response = await http.get(
      Uri.parse(
          'https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId/referrals_data'),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch referrals');
    }
    return json.decode(response.body);
  }

  @override
  Future<List<dynamic>> getLeaderboard() async {
    final response = await http.get(
      Uri.parse('https://$_baseUrl/lists/$_uuid/leaderboard'),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch leaderboard');
    }
    return json.decode(response.body);
  }

  @override
  Future<void> createPendingReferral(Map<String, dynamic> referral) async {
    final response = await http.post(
      Uri.parse('https://$_baseUrl/lists/$_uuid/subscribers/pending_referral'),
      headers: headers,
      body: json.encode(referral),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to create pending referral');
    }
  }

  @override
  Future<void> organicTrackReferral(Map<String, dynamic> referral) async {
    final response = await http.post(
      Uri.parse(
          'https://$_baseUrl/lists/$_uuid/subscribers/organic_track_referral'),
      headers: headers,
      body: json.encode(referral),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to track organic referral');
    }
  }

  @override
  Future<void> confirmReferral(String subscriberId) async {
    final response = await http.post(
      Uri.parse(
          'https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId/confirm'),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to confirm referral');
    }
  }

  @override
  Future<List<dynamic>> getReferrer(Map<String, dynamic> query) async {
    final uri = Uri.https(_baseUrl.replaceAll("https://", ""),
        '/lists/$_uuid/subscribers/referrer', query);

    final response = await http.get(uri, headers: headers);
    if (response.statusCode != 200) {
      throw Exception('Failed to get referrer');
    }
    return json.decode(response.body);
  }

  @override
  Future<List<dynamic>> getRewards(String subscriberId) async {
    final response = await http.get(
      Uri.parse(
          'https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId/rewards'),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to get rewards');
    }
    return json.decode(response.body);
  }
}
