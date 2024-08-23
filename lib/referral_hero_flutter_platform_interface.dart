import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'referral_hero_flutter_method_channel.dart';

/// An abstract class that defines the platform interface for the ReferralHero Flutter plugin.
///
/// This class is intended to be extended by platform-specific implementations
/// to provide the functionality for the ReferralHero Flutter plugin on each platform.
abstract class ReferralHeroFlutterPlatform extends PlatformInterface {
  /// Constructs a `ReferralHeroFlutterPlatform`.
  ///
  /// The constructor verifies the provided token to ensure that the platform
  /// interface is correctly implemented.
  ReferralHeroFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static ReferralHeroFlutterPlatform _instance =
      MethodChannelReferralHeroFlutter();

  /// The default instance of [ReferralHeroFlutterPlatform] to use.
  ///
  /// This defaults to the [MethodChannelReferralHeroFlutter] implementation.
  /// Platform-specific implementations should override this with their own
  /// platform-specific class that extends [ReferralHeroFlutterPlatform] when
  /// they register themselves.
  static ReferralHeroFlutterPlatform get instance => _instance;

  /// Sets the default instance of [ReferralHeroFlutterPlatform] to the provided instance.
  ///
  /// Platform-specific implementations should use this setter to register their
  /// platform-specific class that extends [ReferralHeroFlutterPlatform].
  static set instance(ReferralHeroFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Initializes the ReferralHero Flutter plugin with the provided [apiKey] and [uuid].
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the initialization process.
  Future<void> initialize(String apiKey, String uuid) {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  /// Adds a new subscriber with the provided [subscriber] details.
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the process of adding a subscriber.
  ///
  /// Returns a map containing the result of the operation.
  Future<Map<String, dynamic>> addSubscriber(Map<String, dynamic> subscriber) {
    throw UnimplementedError('addSubscriber() has not been implemented.');
  }

  /// Retrieves the details of a subscriber identified by [subscriberId].
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the process of fetching subscriber details.
  ///
  /// Returns a map containing the subscriber's details.
  Future<Map<String, dynamic>> getSubscriberDetails(String subscriberId) {
    throw UnimplementedError(
        'getSubscriberDetails() has not been implemented.');
  }

  /// Updates the subscriber identified by [subscriberId] with the provided [updates].
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the process of updating a subscriber's details.
  ///
  /// Returns a map containing the result of the operation.
  Future<Map<String, dynamic>> updateSubscriber(
      String subscriberId, Map<String, dynamic> updates) {
    throw UnimplementedError('updateSubscriber() has not been implemented.');
  }

  /// Deletes the subscriber identified by [subscriberId].
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the process of deleting a subscriber.
  ///
  /// Returns a map containing the result of the operation.
  Future<Map<String, dynamic>> deleteSubscriber(String subscriberId) {
    throw UnimplementedError('deleteSubscriber() has not been implemented.');
  }

  /// Tracks a referral event with the provided [referral] details.
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the process of tracking a referral event.
  ///
  /// Returns a map containing the result of the operation.
  Future<Map<String, dynamic>> trackReferral(Map<String, dynamic> referral) {
    throw UnimplementedError('trackReferral() has not been implemented.');
  }

  /// Captures a share event for the subscriber identified by [subscriberId] on the specified [social] platform.
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the process of capturing a share event.
  ///
  /// Returns a map containing the result of the operation.
  Future<Map<String, dynamic>> captureShare(
      String subscriberId, String social) {
    throw UnimplementedError('captureShare() has not been implemented.');
  }

  /// Retrieves all referrals for the subscriber identified by [subscriberId].
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the process of fetching referrals.
  ///
  /// Returns a map containing the subscriber's referrals.
  Future<Map<String, dynamic>> getMyReferrals(String subscriberId) {
    throw UnimplementedError('getMyReferrals() has not been implemented.');
  }

  /// Retrieves the leaderboard data for the current campaign.
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the process of fetching the leaderboard.
  ///
  /// Returns a map containing the leaderboard data.
  Future<Map<String, dynamic>> getLeaderboard() {
    throw UnimplementedError('getLeaderboard() has not been implemented.');
  }

  /// Creates a pending referral with the provided [referral] details.
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the process of creating a pending referral.
  ///
  /// Returns a map containing the result of the operation.
  Future<Map<String, dynamic>> createPendingReferral(
      Map<String, dynamic> referral) {
    throw UnimplementedError(
        'createPendingReferral() has not been implemented.');
  }

  /// Tracks an organic referral event with the provided [referral] details.
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the process of tracking an organic referral event.
  ///
  /// Returns a map containing the result of the operation.
  Future<Map<String, dynamic>> organicTrackReferral(
      Map<String, dynamic> referral) {
    throw UnimplementedError(
        'organicTrackReferral() has not been implemented.');
  }

  /// Confirms a referral for the subscriber identified by [subscriberId].
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the process of confirming a referral.
  ///
  /// Returns a map containing the result of the operation.
  Future<Map<String, dynamic>> confirmReferral(String subscriberId) {
    throw UnimplementedError('confirmReferral() has not been implemented.');
  }

  /// Retrieves the referrer details based on the provided [query].
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the process of fetching the referrer details.
  ///
  /// Returns a map containing the referrer data.
  Future<Map<String, dynamic>> getReferrer(Map<String, dynamic> query) {
    throw UnimplementedError('getReferrer() has not been implemented.');
  }

  /// Retrieves the rewards for the subscriber identified by [subscriberId].
  ///
  /// This method should be implemented by platform-specific classes to handle
  /// the process of fetching the subscriber's rewards.
  ///
  /// Returns a map containing the subscriber's rewards.
  Future<Map<String, dynamic>> getRewards(String subscriberId) {
    throw UnimplementedError('getRewards() has not been implemented.');
  }
}
