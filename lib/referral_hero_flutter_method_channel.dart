import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'referral_hero_flutter_platform_interface.dart';

/// An implementation of [ReferralHeroFlutterPlatform] that uses method channels
/// to communicate with the native platform.
///
/// This class handles the API calls to the ReferralHero backend via HTTP requests.
class MethodChannelReferralHeroFlutter extends ReferralHeroFlutterPlatform {
  /// The method channel used to interact with the native platform.
  ///
  /// This channel is responsible for sending and receiving messages to and from
  /// the native platform to handle various operations. The channel name is
  /// 'referral_hero_flutter'.
  ///
  /// This field is marked with `@visibleForTesting` to indicate that it is
  /// exposed for testing purposes and should not be accessed directly in
  /// production code.
  @visibleForTesting
  final methodChannel = const MethodChannel('referral_hero_flutter');

  String? _apiKey;
  String? _uuid;
  final String _baseUrl = "app.referralhero.com/api/sdk/v1/";

  /// Returns the headers used for API requests.
  ///
  /// The headers include the content type, API version, and authorization token.
  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/vnd.referralhero.v1',
        'Authorization': _apiKey!,
      };

  /// Initializes the ReferralHero Flutter plugin with the provided [apiKey] and [uuid].
  ///
  /// This method sets up the API key and UUID for future requests.
  @override
  Future<void> initialize(String apiKey, String uuid) async {
    _apiKey = apiKey;
    _uuid = uuid;
  }

  /// Adds a new subscriber to the ReferralHero service.
  ///
  /// The [subscriber] parameter is a map containing the subscriber's details.
  /// Returns a map containing the result of the operation.
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

  /// Retrieves the details of a specific subscriber by their [subscriberId].
  ///
  /// Returns a map containing the subscriber's details.
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

  /// Updates the details of an existing subscriber identified by [subscriberId].
  ///
  /// The [updates] parameter is a map containing the updated subscriber details.
  /// Returns a map containing the result of the operation.
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

  /// Deletes a specific subscriber by their [subscriberId].
  ///
  /// Returns a map containing the result of the deletion operation.
  @override
  Future<Map<String, dynamic>> deleteSubscriber(String subscriberId) async {
    final response = await http.delete(
      Uri.parse('https://$_baseUrl/lists/$_uuid/subscribers/$subscriberId'),
      headers: headers,
    );
    final result = json.decode(response.body);
    if (result['status'] == 'error') {
      throw Exception('${result['message']}');
    }
    return result;
  }

  /// Tracks a referral conversion event with the provided [referral] details.
  ///
  /// Returns a map containing the result of the operation.
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

  /// Captures a share event for a subscriber on the specified [social] platform.
  ///
  /// The [subscriberId] is the ID of the subscriber.
  /// Returns a map containing the result of the operation.
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

  /// Retrieves all referrals for a specific subscriber by their [subscriberId].
  ///
  /// Returns a map containing the subscriber's referrals.
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

  /// Fetches the leaderboard data for the current campaign.
  ///
  /// Returns a map containing the leaderboard data.
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

  /// Creates a pending referral with the provided [referral] details.
  ///
  /// Returns a map containing the result of the operation.
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

  /// Tracks an organic referral event with the provided [referral] details.
  ///
  /// Returns a map containing the result of the operation.
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

  /// Confirms a referral for the subscriber identified by [subscriberId].
  ///
  /// Returns a map containing the result of the operation.
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

  /// Retrieves the referrer details based on the provided [query].
  ///
  /// Returns a map containing the referrer data.
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

  /// Retrieves the rewards for a specific subscriber by their [subscriberId].
  ///
  /// Returns a map containing the subscriber's rewards.
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
