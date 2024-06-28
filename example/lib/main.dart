import 'package:flutter/material.dart';
import 'package:referral_hero_flutter/referral_hero_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Referral Hero Flutter Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ReferralHeroFlutter _referralHeroService;

  @override
  void initState() {
    super.initState();
    _referralHeroService = ReferralHeroFlutter('your-api-key', 'your-uuid');
  }

  Future<void> _addSubscriber() async {
    final subscriber = {
      'email': 'test24@gmail.com',
      'name': 'Test User 24',
      'phone_number': '9898989896',
    };
    try {
      await _referralHeroService.addSubscriber(subscriber);
      debugPrint('Subscriber added successfully');
    } catch (error) {
      debugPrint('Failed to add subscriber: $error');
    }
  }

  Future<void> _getSubscriberDetails() async {
    try {
      final details =
          await _referralHeroService.getSubscriberDetails('subscriberId');
      debugPrint('Subscriber details: $details');
    } catch (error) {
      debugPrint('Failed to fetch subscriber details: $error');
    }
  }

  Future<void> _updateSubscriber() async {
    final updates = {
      'name': 'Updated Name',
    };
    try {
      await _referralHeroService.updateSubscriber('subscriberId', updates);
      debugPrint('Subscriber updated successfully');
    } catch (error) {
      debugPrint('Failed to update subscriber: $error');
    }
  }

  Future<void> _deleteSubscriber() async {
    try {
      await _referralHeroService.deleteSubscriber('subscriberId');
      debugPrint('Subscriber deleted successfully');
    } catch (error) {
      debugPrint('Failed to delete subscriber: $error');
    }
  }

  Future<void> _trackReferral() async {
    final referral = {
      'email': 'test17@gmail.com',
      'name': 'Test name updated',
    };
    try {
      await _referralHeroService.trackReferral(referral);
      debugPrint('Referral tracked successfully');
    } catch (error) {
      debugPrint('Failed to track referral: $error');
    }
  }

  Future<void> _captureShare() async {
    try {
      await _referralHeroService.captureShare('subscriberId', 'facebook');
      debugPrint('Share captured successfully');
    } catch (error) {
      debugPrint('Failed to capture share: $error');
    }
  }

  Future<void> _getMyReferrals() async {
    try {
      final referrals =
          await _referralHeroService.getMyReferrals('subscriberId');
      debugPrint('Referrals: $referrals');
    } catch (error) {
      debugPrint('Failed to fetch referrals: $error');
    }
  }

  Future<void> _getLeaderboard() async {
    try {
      final leaderboard = await _referralHeroService.getLeaderboard();
      debugPrint('Leaderboard: $leaderboard');
    } catch (error) {
      debugPrint('Failed to fetch leaderboard: $error');
    }
  }

  Future<void> _createPendingReferral() async {
    final referral = {
      'email': 'pending@example.com',
      'name': 'Pending User',
    };
    try {
      await _referralHeroService.createPendingReferral(referral);
      debugPrint('Pending referral created successfully');
    } catch (error) {
      debugPrint('Failed to create pending referral: $error');
    }
  }

  Future<void> _organicTrackReferral() async {
    final referral = {
      'email': 'organic@example.com',
      'name': 'Organic User',
    };
    try {
      await _referralHeroService.organicTrackReferral(referral);
      debugPrint('Organic referral tracked successfully');
    } catch (error) {
      debugPrint('Failed to track organic referral: $error');
    }
  }

  Future<void> _confirmReferral() async {
    try {
      await _referralHeroService.confirmReferral('subscriberId');
      debugPrint('Referral confirmed successfully');
    } catch (error) {
      debugPrint('Failed to confirm referral: $error');
    }
  }

  Future<void> _getReferrer() async {
    final query = {
      'os_type': 'ios',
      'device': 'iPhone',
      'ip_address': '192.168.0.1',
      'screen_size': '1200x1800'
    };
    try {
      final referrer = await _referralHeroService.getReferrer(query);
      debugPrint('Referrer: $referrer');
    } catch (error) {
      debugPrint('Failed to get referrer: $error');
    }
  }

  Future<void> _getRewards() async {
    try {
      final rewards = await _referralHeroService.getRewards('subscriberId');
      debugPrint('Rewards: $rewards');
    } catch (error) {
      debugPrint('Failed to fetch rewards: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Referral Hero Flutter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _addSubscriber,
              child: const Text('Add Subscriber'),
            ),
            ElevatedButton(
              onPressed: _getSubscriberDetails,
              child: const Text('Get Subscriber Details'),
            ),
            ElevatedButton(
              onPressed: _updateSubscriber,
              child: const Text('Update Subscriber'),
            ),
            ElevatedButton(
              onPressed: _deleteSubscriber,
              child: const Text('Delete Subscriber'),
            ),
            ElevatedButton(
              onPressed: _trackReferral,
              child: const Text('Track Referral'),
            ),
            ElevatedButton(
              onPressed: _captureShare,
              child: const Text('Capture Share'),
            ),
            ElevatedButton(
              onPressed: _getMyReferrals,
              child: const Text('Get My Referrals'),
            ),
            ElevatedButton(
              onPressed: _getLeaderboard,
              child: const Text('Get Leaderboard'),
            ),
            ElevatedButton(
              onPressed: _createPendingReferral,
              child: const Text('Create Pending Referral'),
            ),
            ElevatedButton(
              onPressed: _organicTrackReferral,
              child: const Text('Organic Track Referral'),
            ),
            ElevatedButton(
              onPressed: _confirmReferral,
              child: const Text('Confirm Referral'),
            ),
            ElevatedButton(
              onPressed: _getReferrer,
              child: const Text('Get Referrer'),
            ),
            ElevatedButton(
              onPressed: _getRewards,
              child: const Text('Get Rewards'),
            ),
          ],
        ),
      ),
    );
  }
}
