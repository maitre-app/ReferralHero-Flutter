# Changelog

All notable changes to this project will be documented in this file.

## [0.0.3] - 2024-08-23
### Fixed
- Updated the IP address retrieval module to correctly fetch the public IP address instead of the local IP address.


## [0.0.2] - 2024-07-02
### Added
- Introduced DeviceInfo for tracking device-related information.
- Added support for fetching device type, IP address, operating system type, and screen size.

### Changed
- Updated parameter host_url to domain in addSubscriber and updateSubscriber methods.

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- N/A

### Security
- N/A

## [0.0.1] - 2024-06-26
### Added
- Initial release of `referral_hero_flutter`.
- Added support for:
    - Adding a subscriber with `addSubscriber`.
    - Fetching subscriber details with `getSubscriberDetails`.
    - Updating subscriber information with `updateSubscriber`.
    - Deleting a subscriber with `deleteSubscriber`.
    - Tracking referrals with `trackReferral`.
    - Capturing share events with `captureShare`.
    - Retrieving referrals with `getMyReferrals`.
    - Fetching the leaderboard with `getLeaderboard`.
    - Creating pending referrals with `createPendingReferral`.
    - Tracking organic referrals with `organicTrackReferral`.
    - Confirming referrals with `confirmReferral`.
    - Fetching referrer data with `getReferrer`.
    - Retrieving rewards with `getRewards`.

### Changed
- N/A

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- N/A

### Security
- N/A