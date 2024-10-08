# ReferralHero Flutter SDK

The **ReferralHero Flutter SDK** provides a simple way to integrate referral and contest functionality into your Flutter application. This SDK enables you to refer friends, track referrals, and incentivize user engagement.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
    - [Initialization](#initialization)
    - [Tracking Referrals](#tracking-referrals)
- [Methods](#methods)
    - [Add Subscriber](#add-subscriber)
    - [Get Subscriber Details](#get-subscriber-details)
    - [Update Subscriber](#update-subscriber)
    - [Delete Subscriber](#delete-subscriber)
    - [Track Referral](#track-referral)
    - [Capture Share](#capture-share)
    - [Get My Referrals](#get-my-referrals)
    - [Get Leaderboard](#get-leaderboard)
    - [Create Pending Referral](#create-pending-referral)
    - [Organic Track Referral](#organic-track-referral)
    - [Confirm Referral](#confirm-referral)
    - [Get Referrer](#get-referrer)
    - [Get Rewards](#get-rewards)
- [Example](#example)
- [License](#license)
- [Support](#support)


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
  referral_hero_flutter: ^0.0.4 # Use the appropriate version from pub.dev
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

### Tracking Referrals

Now that you have implemented the SDK, you can start identifying and tracking referrals!

For that, you will need 2 things:
- Universal Link
- Your Integrated App
The RH SDK pulls information from your device, like this:
```dart
final referralParams = {
  'email': 'user@example.com', // Capture this from user
  'domain': 'https://a.domain.co/', // Optional value, and set as default by admin
  'name': 'User Name', // Capture this from user
  'referrer': 'referrerCode', // Optional value, only necessary if you want to capture the referrer code from user
  'uuid': 'MFcd4113d4bf', // Get this from RH Dashboard
  'device': await referralHeroService.deviceInfo.getDeviceType(), // Get device type
  'ip_address': await referralHeroService.deviceInfo.getIpAddress(), // Get IP address
  'os_type': await referralHeroService.deviceInfo.getOperatingSystem(), // Get operating system type
  'screen_size': await referralHeroService.deviceInfo.getDeviceScreenSize() // Get screen size
};
```
The format for screen sizes is not native to RH, and the format should be parsed to RH accepted, such as:
```dart
String transformResolution(String input) {
  final dimensions = input.split('*').map((e) => e.trim()).toList();
  return '${dimensions[0]} x ${dimensions[1]}';
}
```
With this information, you should be able to add the subscriber data, with the Get Referrer, Add Subscriber, Create Pending Referral, or Track Referral methods to automatically identify or track a referral:
```dart
void formSubmit() {
  referralHeroService.addSubscriber(referralParams);
}
```
To further understand the implementation of these methods, please check the Public Methods section and our GitHub Sample Project.


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
Request Body
| Name | Type | Description |
|----------|----------|----------|
| email* | String | The email of the subscriber. Required if email is the unique identifier for the campaign. |
| name | String | The name of the subscriber |
| crypto_wallet_address* | String | The crypto wallet address. Required if it is the unique identifier for the campaign. |
| phone_number* | String | The phone number of the subscriber. Required if phone number is the unique identifier for the campaign. |
| extra_field | String | The extra field value of the subscriber |
| extra_field_2 | String | The extra field 2 value of the subscriber |
| referrer | String | The referral code or email of the referrer |
| lifetime_spend | Number | Lifetime spend of the subscriber |
| subscribe_page_url | String | Subscribe Page URL of the Subscriber |
| landing_page_url | String | Landing Page URL of the Subscriber |
| is_quick_add_referral | Boolean | Send True only if you want to add the referral as Quick Add Referral otherwise False |
| option_field_value | String | Option field value of the subscriber |
| other_identifier_value* | String | The other identifier value (Required if other identifier enabled as unique identifier) |
| double_optin | Boolean | Send True if you want to send verification method before adding otherwise False |
| points | Integer | Points of the subscriber |
| crypto_wallet_provider | String | The crypto wallet provider |
| screen_size | String | The screen size of device used by subscriber when the referral link was clicked |
| ip_address | String | The IP address used by subscriber when the referral link was clicked |
| device | String | The device used by subscriber when the referral link was clicked |
| os_type | String | The Type of Operating system used by subscriber when the referral link was clicked |
| source | String | The source of the subscriber. |
| domain | String | URL used to generate the referral link. |
| transaction_id | String | The unique ID of the transaction. Useful when tracking purchases. |
| conversion_category | String | The type of subscriber. Useful for creating reports or segmenting subscribers. |
| conversion_value | Number | The monetary conversion value of the subscriber |


### Get Subscriber Details

Fetches the details of a specific subscriber.

```dart
final details = await referralHeroService.getSubscriberDetails('subscriberId');
```

### Update Subscriber

Updates the details of a specific subscriber. You can reference the parameters from the "Add Subscriber" section for available fields.

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
