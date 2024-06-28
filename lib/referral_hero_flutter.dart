import 'referral_hero_flutter_platform_interface.dart';

class ReferralHeroFlutter {
  final String apiKey;
  final String uuid;

  ReferralHeroFlutter(this.apiKey, this.uuid) {
    // Initialize the platform with the apiKey and uuid
    ReferralHeroFlutterPlatform.instance.initialize(apiKey, uuid);
  }

  static ReferralHeroFlutterPlatform get _platform =>
      ReferralHeroFlutterPlatform.instance;

  Future<void> addSubscriber(Map<String, dynamic> subscriber) {
    return _platform.addSubscriber(subscriber);
  }

  Future<Map<String, dynamic>> getSubscriberDetails(String subscriberId) {
    return _platform.getSubscriberDetails(subscriberId);
  }

  Future<void> updateSubscriber(
      String subscriberId, Map<String, dynamic> updates) {
    return _platform.updateSubscriber(subscriberId, updates);
  }

  Future<void> deleteSubscriber(String subscriberId) {
    return _platform.deleteSubscriber(subscriberId);
  }

  Future<void> trackReferral(Map<String, dynamic> referral) {
    return _platform.trackReferral(referral);
  }

  Future<void> captureShare(String subscriberId, String social) {
    return _platform.captureShare(subscriberId, social);
  }

  Future<List<dynamic>> getMyReferrals(String subscriberId) {
    return _platform.getMyReferrals(subscriberId);
  }

  Future<List<dynamic>> getLeaderboard() {
    return _platform.getLeaderboard();
  }

  Future<void> createPendingReferral(Map<String, dynamic> referral) {
    return _platform.createPendingReferral(referral);
  }

  Future<void> organicTrackReferral(Map<String, dynamic> referral) {
    return _platform.organicTrackReferral(referral);
  }

  Future<void> confirmReferral(String subscriberId) {
    return _platform.confirmReferral(subscriberId);
  }

  Future<List<dynamic>> getReferrer(Map<String, dynamic> query) {
    return _platform.getReferrer(query);
  }

  Future<List<dynamic>> getRewards(String subscriberId) {
    return _platform.getRewards(subscriberId);
  }
}
