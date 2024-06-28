# ReferralHero Flutter SDK Sample

This project provides a sample Flutter application demonstrating how to integrate and use the ReferralHero Flutter SDK. The SDK enables you to refer friends, track referrals, and incentivize user engagement within your Flutter application.

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
  referral_hero_flutter: ^0.0.1 # Use the appropriate version from pub.dev
  http: ^0.13.3
```

Then run

```shell
flutter pub get
```

## Usage

# Initialization

To use the SDK, you need to initialize it with your API key and UUID:

```dart
import 'package:referral_hero_flutter/referral_hero_flutter.dart';

final referralHeroService = ReferralHeroFlutter('your-api-key', 'your-uuid');
```

For detailed usage and examples, refer to the [documentation](https://support.referralhero.com/integrate/mobile-sdks/flutter).

## Example

See the full example in example/lib/main.dart for a complete usage demonstration.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Support

For any issues or feature requests, please open an issue on the [GitHub repository](https://github.com/maitre-app/ReferralHero-Flutter).
For documentation and additional support, visit the [ReferralHero Support](https://support.referralhero.com/).
