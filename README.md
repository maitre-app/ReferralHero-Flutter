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

