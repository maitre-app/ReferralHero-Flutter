import 'models/device_info.dart';
import 'models/rh_subscriber.dart';
import 'referral_hero_flutter_platform_interface.dart';

/// The `ReferralHeroFlutter` class provides methods to interact with the ReferralHero service.
/// It allows you to manage subscribers, track referrals, capture share events, and retrieve various types of data related to referrals.
class ReferralHeroFlutter {
  /// The API key used to authenticate with the ReferralHero service.
  final String apiKey;

  /// The UUID associated with the ReferralHero account.
  final String uuid;

  /// An instance of `DeviceInfo` used to retrieve device-specific information.
  final DeviceInfo deviceInfo = DeviceInfo();

  /// Initializes a new instance of the `ReferralHeroFlutter` class.
  ///
  /// The [apiKey] and [uuid] are required to initialize the ReferralHero service.
  ReferralHeroFlutter(this.apiKey, this.uuid) {
    ReferralHeroFlutterPlatform.instance.initialize(apiKey, uuid);
  }

  /// Adds a new subscriber to the ReferralHero service.
  ///
  /// The [subscriber] parameter is a map containing the subscriber's details.
  /// This method automatically updates the 'domain' parameter to 'host_url' if present.
  ///
  /// Returns an `RHSubscriber` object representing the newly added subscriber.
  Future<RHSubscriber> addSubscriber(Map<String, dynamic> subscriber) async {
    if (subscriber.containsKey('domain')) {
      subscriber['host_url'] = subscriber.remove('domain');
    }
    final result =
        await ReferralHeroFlutterPlatform.instance.addSubscriber(subscriber);
    return RHSubscriber.fromJson(result['data']);
  }

  /// Retrieves the details of a specific subscriber by their [subscriberId].
  ///
  /// Returns an `RHSubscriber` object containing the subscriber's details.
  Future<RHSubscriber> getSubscriberDetails(String subscriberId) async {
    final result = await ReferralHeroFlutterPlatform.instance
        .getSubscriberDetails(subscriberId);
    return RHSubscriber.fromJson(result['data']);
  }

  /// Updates the details of an existing subscriber identified by [subscriberId].
  ///
  /// The [updates] parameter is a map containing the updated subscriber details.
  /// This method automatically updates the 'domain' parameter to 'host_url' if present.
  ///
  /// Returns an `RHSubscriber` object containing the updated subscriber details.
  Future<RHSubscriber> updateSubscriber(
      String subscriberId, Map<String, dynamic> updates) async {
    if (updates.containsKey('domain')) {
      updates['host_url'] = updates.remove('domain');
    }
    final result = await ReferralHeroFlutterPlatform.instance
        .updateSubscriber(subscriberId, updates);
    return RHSubscriber.fromJson(result['data']);
  }

  /// Deletes a specific subscriber by their [subscriberId].
  ///
  /// Returns a map containing the result of the deletion operation.
  Future<Map<String, dynamic>> deleteSubscriber(String subscriberId) {
    return ReferralHeroFlutterPlatform.instance.deleteSubscriber(subscriberId);
  }

  /// Tracks a referral conversion event.
  ///
  /// The [referral] parameter is a map containing the details of the referral event.
  ///
  /// Returns a map containing the result of the referral tracking operation.
  Future<Map<String, dynamic>> trackReferral(Map<String, dynamic> referral) {
    return ReferralHeroFlutterPlatform.instance.trackReferral(referral);
  }

  /// Captures a share event for a subscriber.
  ///
  /// The [subscriberId] is the ID of the subscriber, and [social] is the social platform used for sharing.
  ///
  /// Returns a map containing the result of the capture share operation.
  Future<Map<String, dynamic>> captureShare(
      String subscriberId, String social) {
    return ReferralHeroFlutterPlatform.instance
        .captureShare(subscriberId, social);
  }

  /// Retrieves all referrals for a specific subscriber by their [subscriberId].
  ///
  /// Returns a map containing the subscriber's referrals.
  Future<Map<String, dynamic>> getMyReferrals(String subscriberId) {
    return ReferralHeroFlutterPlatform.instance.getMyReferrals(subscriberId);
  }

  /// Fetches the campaign leaderboard.
  ///
  /// Returns a map containing the leaderboard data.
  Future<Map<String, dynamic>> getLeaderboard() {
    return ReferralHeroFlutterPlatform.instance.getLeaderboard();
  }

  /// Creates a pending referral.
  ///
  /// The [referral] parameter is a map containing the details of the pending referral.
  /// This method automatically updates the 'domain' parameter to 'host_url' if present.
  ///
  /// Returns a map containing the result of the create pending referral operation.
  Future<Map<String, dynamic>> createPendingReferral(
      Map<String, dynamic> referral) {
    if (referral.containsKey('domain')) {
      referral['host_url'] = referral.remove('domain');
    }
    return ReferralHeroFlutterPlatform.instance.createPendingReferral(referral);
  }

  /// Tracks an organic referral event.
  ///
  /// The [referral] parameter is a map containing the details of the organic referral event.
  /// This method automatically updates the 'domain' parameter to 'host_url' if present.
  ///
  /// Returns a map containing the result of the organic track referral operation.
  Future<Map<String, dynamic>> organicTrackReferral(
      Map<String, dynamic> referral) {
    if (referral.containsKey('domain')) {
      referral['host_url'] = referral.remove('domain');
    }
    return ReferralHeroFlutterPlatform.instance.organicTrackReferral(referral);
  }

  /// Confirms a referral for a specific subscriber identified by [subscriberId].
  ///
  /// Returns a map containing the result of the confirm referral operation.
  Future<Map<String, dynamic>> confirmReferral(String subscriberId) {
    return ReferralHeroFlutterPlatform.instance.confirmReferral(subscriberId);
  }

  /// Retrieves the referrer details based on a query.
  ///
  /// The [query] parameter is a map containing the query details.
  ///
  /// Returns a map containing the referrer data.
  Future<Map<String, dynamic>> getReferrer(Map<String, dynamic> query) {
    return ReferralHeroFlutterPlatform.instance.getReferrer(query);
  }

  /// Fetches the rewards for a specific subscriber by their [subscriberId].
  ///
  /// Returns a map containing the subscriber's rewards.
  Future<Map<String, dynamic>> getRewards(String subscriberId) {
    return ReferralHeroFlutterPlatform.instance.getRewards(subscriberId);
  }
}
