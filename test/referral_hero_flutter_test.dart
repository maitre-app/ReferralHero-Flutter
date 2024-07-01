import 'package:flutter_test/flutter_test.dart';
import 'package:referral_hero_flutter/models/rh_subscriber.dart';
import 'package:referral_hero_flutter/referral_hero_flutter.dart';
import 'package:referral_hero_flutter/referral_hero_flutter_platform_interface.dart';
import 'package:referral_hero_flutter/referral_hero_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockReferralHeroFlutterPlatform
    with MockPlatformInterfaceMixin
    implements ReferralHeroFlutterPlatform {
  @override
  Future<void> initialize(String apiKey, String uuid) async {}

  @override
  Future<Map<String, dynamic>> addSubscriber(
      Map<String, dynamic> subscriber) async {
    return {
      'data': {
        'id': 'sub_test',
        'name': 'Test User',
        'email': 'test@test.com',
        'phone_number': '1234567890',
        'crypto_wallet_address': '',
        'crypto_wallet_provider': '',
        'other_identifier_value': 'test',
        'extra_field': '',
        'extra_field_2': '',
        'extra_field_3': '',
        'extra_field_4': '',
        'option_field': '',
        'conversion_amount': 0.0,
        'code': 'test-1ce4',
        'position': 1,
        'referred': false,
        'referred_by': {},
        'pending_referrals': 0,
        'unconfirmed_referrals': 0,
        'people_referred': 0,
        'level_2_confirmed_referrals': 0,
        'level_3_confirmed_referrals': 0,
        'promoted': false,
        'promoted_at': null,
        'verified': true,
        'verified_at': DateTime.now().millisecondsSinceEpoch,
        'points': 0,
        'risk_level': 0,
        'host': 'test.com',
        'source': null,
        'device': null,
        'referral_link': 'test.com?mwr=test-1ce4',
        'created_at': DateTime.now().millisecondsSinceEpoch,
        'last_updated_at': DateTime.now().millisecondsSinceEpoch,
        'os_type': null,
        'screen_size': null,
        'ip_address': null,
        'universal_link':
            'https://app.referralhero.com/MFa32f21d442/universal_link?mwr=test-1ce4',
        'status': '',
        'response': 'subscriber_retrieved',
      }
    };
  }

  @override
  Future<Map<String, dynamic>> captureShare(
      String subscriberId, String social) async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> confirmReferral(String subscriberId) async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> createPendingReferral(
      Map<String, dynamic> referral) async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> deleteSubscriber(String subscriberId) async {
    return {'status': 'ok'};
  }

  @override
  Future<Map<String, dynamic>> getLeaderboard() async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> getMyReferrals(String subscriberId) async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> getReferrer(Map<String, dynamic> query) async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> getRewards(String subscriberId) async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> getSubscriberDetails(String subscriberId) async {
    return {
      'data': {
        'id': 'sub_test',
        'name': 'Test User',
        'email': 'test@test.com',
        'phone_number': '1234567890',
        'crypto_wallet_address': '',
        'crypto_wallet_provider': '',
        'other_identifier_value': 'test',
        'extra_field': '',
        'extra_field_2': '',
        'extra_field_3': '',
        'extra_field_4': '',
        'option_field': '',
        'conversion_amount': 0.0,
        'code': 'test-1ce4',
        'position': 1,
        'referred': false,
        'referred_by': {},
        'pending_referrals': 0,
        'unconfirmed_referrals': 0,
        'people_referred': 0,
        'level_2_confirmed_referrals': 0,
        'level_3_confirmed_referrals': 0,
        'promoted': false,
        'promoted_at': null,
        'verified': true,
        'verified_at': DateTime.now().millisecondsSinceEpoch,
        'points': 0,
        'risk_level': 0,
        'host': 'test.com',
        'source': null,
        'device': null,
        'referral_link': 'test.com?mwr=test-1ce4',
        'created_at': DateTime.now().millisecondsSinceEpoch,
        'last_updated_at': DateTime.now().millisecondsSinceEpoch,
        'os_type': null,
        'screen_size': null,
        'ip_address': null,
        'universal_link':
            'https://app.referralhero.com/MFa32f21d442/universal_link?mwr=test-1ce4',
        'status': '',
        'response': 'subscriber_retrieved',
      }
    };
  }

  @override
  Future<Map<String, dynamic>> organicTrackReferral(
      Map<String, dynamic> referral) async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> trackReferral(
      Map<String, dynamic> referral) async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> updateSubscriber(
      String subscriberId, Map<String, dynamic> updates) async {
    return {
      'data': {
        'id': 'sub_test',
        'name': 'Updated Name',
        'email': 'test@test.com',
        'phone_number': '1234567890',
        'crypto_wallet_address': '',
        'crypto_wallet_provider': '',
        'other_identifier_value': 'test',
        'extra_field': '',
        'extra_field_2': '',
        'extra_field_3': '',
        'extra_field_4': '',
        'option_field': '',
        'conversion_amount': 0.0,
        'code': 'test-1ce4',
        'position': 1,
        'referred': false,
        'referred_by': {},
        'pending_referrals': 0,
        'unconfirmed_referrals': 0,
        'people_referred': 0,
        'level_2_confirmed_referrals': 0,
        'level_3_confirmed_referrals': 0,
        'promoted': false,
        'promoted_at': null,
        'verified': true,
        'verified_at': DateTime.now().millisecondsSinceEpoch,
        'points': 0,
        'risk_level': 0,
        'host': 'test.com',
        'source': null,
        'device': null,
        'referral_link': 'test.com?mwr=test-1ce4',
        'created_at': DateTime.now().millisecondsSinceEpoch,
        'last_updated_at': DateTime.now().millisecondsSinceEpoch,
        'os_type': null,
        'screen_size': null,
        'ip_address': null,
        'universal_link':
            'https://app.referralhero.com/MFa32f21d442/universal_link?mwr=test-1ce4',
        'status': '',
        'response': 'subscriber_retrieved',
      }
    };
  }
}

void main() {
  final ReferralHeroFlutterPlatform initialPlatform =
      ReferralHeroFlutterPlatform.instance;

  test('$MethodChannelReferralHeroFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelReferralHeroFlutter>());
  });

  test('addSubscriber', () async {
    ReferralHeroFlutter referralHeroFlutterPlugin =
        ReferralHeroFlutter('apiKey', 'uuid');
    MockReferralHeroFlutterPlatform fakePlatform =
        MockReferralHeroFlutterPlatform();
    ReferralHeroFlutterPlatform.instance = fakePlatform;

    final RHSubscriber subscriber =
        await referralHeroFlutterPlugin.addSubscriber({
      'email': 'test24@gmail.com',
      'name': 'Test User 24',
      'phone_number': '9898989896',
    });
    expect(subscriber.email, 'test@test.com');
    expect(subscriber.name, 'Test User');
  });

  // Add more tests here similar to 'addSubscriber'
}
