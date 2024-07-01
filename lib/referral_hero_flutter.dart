import 'models/rh_subscriber.dart';
import 'referral_hero_flutter_platform_interface.dart';

class ReferralHeroFlutter {
  final String apiKey;
  final String uuid;

  ReferralHeroFlutter(this.apiKey, this.uuid) {
    ReferralHeroFlutterPlatform.instance.initialize(apiKey, uuid);
  }

  Future<RHSubscriber> addSubscriber(Map<String, dynamic> subscriber) async {
    final result =
        await ReferralHeroFlutterPlatform.instance.addSubscriber(subscriber);
    return RHSubscriber.fromJson(result['data']);
  }

  Future<RHSubscriber> getSubscriberDetails(String subscriberId) async {
    final result = await ReferralHeroFlutterPlatform.instance
        .getSubscriberDetails(subscriberId);
    return RHSubscriber.fromJson(result['data']);
  }

  Future<RHSubscriber> updateSubscriber(
      String subscriberId, Map<String, dynamic> updates) async {
    final result = await ReferralHeroFlutterPlatform.instance
        .updateSubscriber(subscriberId, updates);
    return RHSubscriber.fromJson(result['data']);
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

  Future<Map<String, dynamic>> getMyReferrals(String subscriberId) {
    return ReferralHeroFlutterPlatform.instance.getMyReferrals(subscriberId);
  }

  Future<Map<String, dynamic>> getLeaderboard() {
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

  Future<Map<String, dynamic>> getReferrer(Map<String, dynamic> query) {
    return ReferralHeroFlutterPlatform.instance.getReferrer(query);
  }

  Future<Map<String, dynamic>> getRewards(String subscriberId) {
    return ReferralHeroFlutterPlatform.instance.getRewards(subscriberId);
  }
}
