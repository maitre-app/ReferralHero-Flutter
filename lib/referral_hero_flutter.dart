import 'referral_hero_flutter_platform_interface.dart';

class ReferralHeroFlutter {
  final String apiKey;
  final String uuid;

  ReferralHeroFlutter(this.apiKey, this.uuid) {
    ReferralHeroFlutterPlatform.instance.initialize(apiKey, uuid);
  }

  Future<Map<String, dynamic>> addSubscriber(Map<String, dynamic> subscriber) {
    return ReferralHeroFlutterPlatform.instance.addSubscriber(subscriber);
  }

  Future<Map<String, dynamic>> getSubscriberDetails(String subscriberId) {
    return ReferralHeroFlutterPlatform.instance
        .getSubscriberDetails(subscriberId);
  }

  Future<Map<String, dynamic>> updateSubscriber(
      String subscriberId, Map<String, dynamic> updates) {
    return ReferralHeroFlutterPlatform.instance
        .updateSubscriber(subscriberId, updates);
  }

  Future<Map<String, dynamic>> deleteSubscriber(String subscriberId) {
    return ReferralHeroFlutterPlatform.instance.deleteSubscriber(subscriberId);
  }

  Future<Map<String, dynamic>> trackReferral(Map<String, dynamic> referral) {
    return ReferralHeroFlutterPlatform.instance.trackReferral(referral);
  }

  Future<Map<String, dynamic>> captureShare(
      String subscriberId, String social) {
    return ReferralHeroFlutterPlatform.instance
        .captureShare(subscriberId, social);
  }

  Future<List<dynamic>> getMyReferrals(String subscriberId) {
    return ReferralHeroFlutterPlatform.instance.getMyReferrals(subscriberId);
  }

  Future<List<dynamic>> getLeaderboard() {
    return ReferralHeroFlutterPlatform.instance.getLeaderboard();
  }

  Future<Map<String, dynamic>> createPendingReferral(
      Map<String, dynamic> referral) {
    return ReferralHeroFlutterPlatform.instance.createPendingReferral(referral);
  }

  Future<Map<String, dynamic>> organicTrackReferral(
      Map<String, dynamic> referral) {
    return ReferralHeroFlutterPlatform.instance.organicTrackReferral(referral);
  }

  Future<Map<String, dynamic>> confirmReferral(String subscriberId) {
    return ReferralHeroFlutterPlatform.instance.confirmReferral(subscriberId);
  }

  Future<List<dynamic>> getReferrer(Map<String, dynamic> query) {
    return ReferralHeroFlutterPlatform.instance.getReferrer(query);
  }

  Future<List<dynamic>> getRewards(String subscriberId) {
    return ReferralHeroFlutterPlatform.instance.getRewards(subscriberId);
  }
}
