import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'referral_hero_flutter_method_channel.dart';

abstract class ReferralHeroFlutterPlatform extends PlatformInterface {
  /// Constructs a ReferralHeroFlutterPlatform.
  ReferralHeroFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static ReferralHeroFlutterPlatform _instance =
      MethodChannelReferralHeroFlutter();

  /// The default instance of [ReferralHeroFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelReferralHeroFlutter].
  static ReferralHeroFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ReferralHeroFlutterPlatform] when
  /// they register themselves.
  static set instance(ReferralHeroFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initialize(String apiKey, String uuid) {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  Future<void> addSubscriber(Map<String, dynamic> subscriber) {
    throw UnimplementedError('addSubscriber() has not been implemented.');
  }

  Future<Map<String, dynamic>> getSubscriberDetails(String subscriberId) {
    throw UnimplementedError(
        'getSubscriberDetails() has not been implemented.');
  }

  Future<void> updateSubscriber(
      String subscriberId, Map<String, dynamic> updates) {
    throw UnimplementedError('updateSubscriber() has not been implemented.');
  }

  Future<void> deleteSubscriber(String subscriberId) {
    throw UnimplementedError('deleteSubscriber() has not been implemented.');
  }

  Future<void> trackReferral(Map<String, dynamic> referral) {
    throw UnimplementedError('trackReferral() has not been implemented.');
  }

  Future<void> captureShare(String subscriberId, String social) {
    throw UnimplementedError('captureShare() has not been implemented.');
  }

  Future<List<dynamic>> getMyReferrals(String subscriberId) {
    throw UnimplementedError('getMyReferrals() has not been implemented.');
  }

  Future<List<dynamic>> getLeaderboard() {
    throw UnimplementedError('getLeaderboard() has not been implemented.');
  }

  Future<void> createPendingReferral(Map<String, dynamic> referral) {
    throw UnimplementedError(
        'createPendingReferral() has not been implemented.');
  }

  Future<void> organicTrackReferral(Map<String, dynamic> referral) {
    throw UnimplementedError(
        'organicTrackReferral() has not been implemented.');
  }

  Future<void> confirmReferral(String subscriberId) {
    throw UnimplementedError('confirmReferral() has not been implemented.');
  }

  Future<List<dynamic>> getReferrer(Map<String, dynamic> query) {
    throw UnimplementedError('getReferrer() has not been implemented.');
  }

  Future<List<dynamic>> getRewards(String subscriberId) {
    throw UnimplementedError('getRewards() has not been implemented.');
  }
}
