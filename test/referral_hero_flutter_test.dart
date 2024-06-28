import 'package:flutter_test/flutter_test.dart';
import 'package:referral_hero_flutter/referral_hero_flutter_platform_interface.dart';
import 'package:referral_hero_flutter/referral_hero_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockReferralHeroFlutterPlatform
    with MockPlatformInterfaceMixin
    implements ReferralHeroFlutterPlatform {
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> initialize(String apiKey, String uuid) {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<void> addSubscriber(Map<String, dynamic> subscriber) {
    // TODO: implement addSubscriber
    throw UnimplementedError();
  }

  @override
  Future<void> captureShare(String subscriberId, String social) {
    // TODO: implement captureShare
    throw UnimplementedError();
  }

  @override
  Future<void> confirmReferral(String subscriberId) {
    // TODO: implement confirmReferral
    throw UnimplementedError();
  }

  @override
  Future<void> createPendingReferral(Map<String, dynamic> referral) {
    // TODO: implement createPendingReferral
    throw UnimplementedError();
  }

  @override
  Future<void> deleteSubscriber(String subscriberId) {
    // TODO: implement deleteSubscriber
    throw UnimplementedError();
  }

  @override
  Future<List> getLeaderboard() {
    // TODO: implement getLeaderboard
    throw UnimplementedError();
  }

  @override
  Future<List> getMyReferrals(String subscriberId) {
    // TODO: implement getMyReferrals
    throw UnimplementedError();
  }

  @override
  Future<List> getReferrer(Map<String, dynamic> query) {
    // TODO: implement getReferrer
    throw UnimplementedError();
  }

  @override
  Future<List> getRewards(String subscriberId) {
    // TODO: implement getRewards
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getSubscriberDetails(String subscriberId) {
    // TODO: implement getSubscriberDetails
    throw UnimplementedError();
  }

  @override
  Future<void> organicTrackReferral(Map<String, dynamic> referral) {
    // TODO: implement organicTrackReferral
    throw UnimplementedError();
  }

  @override
  Future<void> trackReferral(Map<String, dynamic> referral) {
    // TODO: implement trackReferral
    throw UnimplementedError();
  }

  @override
  Future<void> updateSubscriber(
      String subscriberId, Map<String, dynamic> updates) {
    // TODO: implement updateSubscriber
    throw UnimplementedError();
  }
}

void main() {
  final ReferralHeroFlutterPlatform initialPlatform =
      ReferralHeroFlutterPlatform.instance;

  test('$MethodChannelReferralHeroFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelReferralHeroFlutter>());
  });

  test('getPlatformVersion', () async {
    // ReferralHeroFlutter referralHeroFlutterPlugin = ReferralHeroFlutter();
    MockReferralHeroFlutterPlatform fakePlatform =
        MockReferralHeroFlutterPlatform();
    ReferralHeroFlutterPlatform.instance = fakePlatform;

    // expect(await referralHeroFlutterPlugin.getPlatformVersion(), '42');
  });
}
