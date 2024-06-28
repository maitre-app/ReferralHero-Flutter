import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'referral_hero_flutter_platform_interface.dart';

class MethodChannelReferralHeroFlutter extends ReferralHeroFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('referral_hero_flutter');

  String? _apiKey;
  String? _uuid;

  @override
  Future<void> initialize(String apiKey, String uuid) async {
    _apiKey = apiKey;
    _uuid = uuid;
  }

  @override
  Future<void> addSubscriber(Map<String, dynamic> subscriber) async {
    await methodChannel.invokeMethod('addSubscriber', {
      'apiKey': _apiKey,
      'uuid': _uuid,
      'subscriber': subscriber,
    });
  }

  @override
  Future<Map<String, dynamic>> getSubscriberDetails(String subscriberId) async {
    final result =
        await methodChannel.invokeMethod<Map>('getSubscriberDetails', {
      'apiKey': _apiKey,
      'uuid': _uuid,
      'subscriberId': subscriberId,
    });
    return Map<String, dynamic>.from(result!);
  }

  @override
  Future<void> updateSubscriber(
      String subscriberId, Map<String, dynamic> updates) async {
    await methodChannel.invokeMethod('updateSubscriber', {
      'apiKey': _apiKey,
      'uuid': _uuid,
      'subscriberId': subscriberId,
      'updates': updates,
    });
  }

  @override
  Future<void> deleteSubscriber(String subscriberId) async {
    await methodChannel.invokeMethod('deleteSubscriber', {
      'apiKey': _apiKey,
      'uuid': _uuid,
      'subscriberId': subscriberId,
    });
  }

  @override
  Future<void> trackReferral(Map<String, dynamic> referral) async {
    await methodChannel.invokeMethod('trackReferral', {
      'apiKey': _apiKey,
      'uuid': _uuid,
      'referral': referral,
    });
  }

  @override
  Future<void> captureShare(String subscriberId, String social) async {
    await methodChannel.invokeMethod('captureShare', {
      'apiKey': _apiKey,
      'uuid': _uuid,
      'subscriberId': subscriberId,
      'social': social,
    });
  }

  @override
  Future<List<dynamic>> getMyReferrals(String subscriberId) async {
    final result = await methodChannel.invokeMethod<List>('getMyReferrals', {
      'apiKey': _apiKey,
      'uuid': _uuid,
      'subscriberId': subscriberId,
    });
    return List<dynamic>.from(result!);
  }

  @override
  Future<List<dynamic>> getLeaderboard() async {
    final result = await methodChannel.invokeMethod<List>('getLeaderboard', {
      'apiKey': _apiKey,
      'uuid': _uuid,
    });
    return List<dynamic>.from(result!);
  }

  @override
  Future<void> createPendingReferral(Map<String, dynamic> referral) async {
    await methodChannel.invokeMethod('createPendingReferral', {
      'apiKey': _apiKey,
      'uuid': _uuid,
      'referral': referral,
    });
  }

  @override
  Future<void> organicTrackReferral(Map<String, dynamic> referral) async {
    await methodChannel.invokeMethod('organicTrackReferral', {
      'apiKey': _apiKey,
      'uuid': _uuid,
      'referral': referral,
    });
  }

  @override
  Future<void> confirmReferral(String subscriberId) async {
    await methodChannel.invokeMethod('confirmReferral', {
      'apiKey': _apiKey,
      'uuid': _uuid,
      'subscriberId': subscriberId,
    });
  }

  @override
  Future<List<dynamic>> getReferrer(Map<String, dynamic> query) async {
    final result = await methodChannel.invokeMethod<List>('getReferrer', {
      'apiKey': _apiKey,
      'uuid': _uuid,
      'query': query,
    });
    return List<dynamic>.from(result!);
  }

  @override
  Future<List<dynamic>> getRewards(String subscriberId) async {
    final result = await methodChannel.invokeMethod<List>('getRewards', {
      'apiKey': _apiKey,
      'uuid': _uuid,
      'subscriberId': subscriberId,
    });
    return List<dynamic>.from(result!);
  }
}
