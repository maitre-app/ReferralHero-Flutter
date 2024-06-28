# ReferralHero Flutter SDK

The ReferralHero Flutter SDK provides a simple way to integrate referral and contest functionality into your Flutter application. This SDK enables you to refer friends, track referrals, and incentivize user engagement.

## Features

- Add and manage subscribers
- Track referrals and conversion events
- Capture share events
- Retrieve referral and leaderboard data
- Create and manage pending referrals
- Confirm referrals
- Track organic referrals
- Retrieve rewards and referrer details

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  referral_hero_flutter:
    path: ../referral_hero_flutter # Adjust the path as needed
  http: ^0.13.3
```

Then run:
```shell
flutter pub get
```

## Usage 

### Initialization 

To use the SDK, you need to initialize it with your API key and UUID:

```dart
import 'package:referral_hero_flutter/referral_hero_flutter.dart';

final referralHeroService = ReferralHeroFlutter('your-api-key', 'your-uuid');
```

## Methods

### Add Subscriber

Adds a new subscriber.

```dart
final subscriber = {
  'email': 'test24@gmail.com',
  'name': 'Test User 24',
  'phone_number': '9898989896',
  // Add other fields as necessary
};
await referralHeroService.addSubscriber(subscriber);
```

### Get Subscriber Details

Fetches the details of a specific subscriber.

```dart
final details = await referralHeroService.getSubscriberDetails('subscriberId');
```

### Update Subscriber

Updates the details of a specific subscriber.

```dart
final updates = {
'name': 'Updated Name',
// Add other fields as necessary
};
await referralHeroService.updateSubscriber('subscriberId', updates);
```

### Delete Subscriber

Deletes a specific subscriber.

```dart
await referralHeroService.deleteSubscriber('subscriberId');
```

### Track Referral

Tracks a referral conversion event.

```dart
final referral = {
'email': 'test17@gmail.com',
'name': 'Test name updated',
// Add other fields as necessary
};
await referralHeroService.trackReferral(referral);
```

### Capture Share

Captures a share event for a subscriber.

```dart
await referralHeroService.captureShare('subscriberId', 'facebook');
```

### Get My Referrals

Retrieves all referrals for a specific subscriber.

```dart
final referrals = await referralHeroService.getMyReferrals('subscriberId');
```

### Get Leaderboard

Fetches the campaign leaderboard.

```dart
final leaderboard = await referralHeroService.getLeaderboard();
```

### Create Pending Referral

Creates a pending referral.

```dart
final referral = {
'email': 'pending@example.com',
'name': 'Pending User',
// Add other fields as necessary
};
await referralHeroService.createPendingReferral(referral);
```

### Organic Track Referral

Tracks an organic referral event.

```dart
final referral = {
'email': 'organic@example.com',
'name': 'Organic User',
// Add other fields as necessary
};
await referralHeroService.organicTrackReferral(referral);
```

### Confirm Referral

Confirms a referral.

```dart
await referralHeroService.confirmReferral('subscriberId');
```

### Get Referrer

Retrieves the referrer details based on a query.

```dart
final query = {
'os_type': 'ios',
'device': 'iPhone',
'ip_address': '192.168.0.1',
'screen_size': '1200x1800'
};
final referrer = await referralHeroService.getReferrer(query);
```

### Get Rewards

Fetches the rewards for a specific subscriber.

```dart
final rewards = await referralHeroService.getRewards('subscriberId');
```

## Example

See the full example in example/lib/main.dart for a complete usage demonstration.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Support

For any issues or feature requests, please open an issue on the [GitHub repository](https://github.com/maitre-app/ReferralHero-Flutter).
For documentation and additional support, visit the [ReferralHero Support](https://support.referralhero.com/).
