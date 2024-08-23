/// Represents a subscriber in the ReferralHero system.
///
/// This class encapsulates all the necessary details about a subscriber,
/// including personal information, referral status, and associated metadata.
class RHSubscriber {
  /// The unique identifier of the subscriber.
  final String id;

  /// The name of the subscriber.
  final String name;

  /// The email address of the subscriber.
  final String email;

  /// The phone number of the subscriber.
  final String phoneNumber;

  /// The crypto wallet address of the subscriber.
  final String cryptoWalletAddress;

  /// The provider of the subscriber's crypto wallet.
  final String cryptoWalletProvider;

  /// The value of any additional identifier associated with the subscriber.
  final String otherIdentifierValue;

  /// An extra field associated with the subscriber.
  final String extraField;

  /// A second extra field associated with the subscriber.
  final String extraField2;

  /// A third extra field associated with the subscriber.
  final String extraField3;

  /// A fourth extra field associated with the subscriber.
  final String extraField4;

  /// An optional field associated with the subscriber.
  final String optionField;

  /// The monetary conversion amount associated with the subscriber.
  final double conversionAmount;

  /// The referral code associated with the subscriber.
  final String code;

  /// The subscriber's position in a leaderboard or ranking system.
  final int position;

  /// Whether the subscriber has been referred by another user.
  final bool referred;

  /// A map containing information about the subscriber's referrer, if any.
  final Map<String, dynamic>? referredBy;

  /// The number of pending referrals for the subscriber.
  final int pendingReferrals;

  /// The number of unconfirmed referrals for the subscriber.
  final int unconfirmedReferrals;

  /// The number of people referred by the subscriber.
  final int peopleReferred;

  /// The number of confirmed level 2 referrals.
  final int level2ConfirmedReferrals;

  /// The number of confirmed level 3 referrals.
  final int level3ConfirmedReferrals;

  /// Whether the subscriber has been promoted in the system.
  final bool promoted;

  /// The date and time when the subscriber was promoted.
  final DateTime? promotedAt;

  /// Whether the subscriber has been verified in the system.
  final bool verified;

  /// The date and time when the subscriber was verified.
  final DateTime? verifiedAt;

  /// The number of points accumulated by the subscriber.
  final int points;

  /// The risk level associated with the subscriber.
  final int riskLevel;

  /// The host associated with the subscriber.
  final String host;

  /// The source through which the subscriber was acquired.
  final String? source;

  /// The device used by the subscriber.
  final String? device;

  /// The referral link associated with the subscriber.
  final String referralLink;

  /// The date and time when the subscriber was created.
  final DateTime createdAt;

  /// The date and time when the subscriber's information was last updated.
  final DateTime lastUpdatedAt;

  /// The operating system type of the subscriber's device.
  final String? osType;

  /// The screen size of the subscriber's device.
  final String? screenSize;

  /// The IP address of the subscriber's device.
  final String? ipAddress;

  /// The universal link associated with the subscriber.
  final String universalLink;

  /// The status of the subscriber in the system.
  final String status;

  /// The response received after processing the subscriber's data.
  final String response;

  /// Creates a new `RHSubscriber` instance with the specified details.
  RHSubscriber({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.cryptoWalletAddress,
    required this.cryptoWalletProvider,
    required this.otherIdentifierValue,
    required this.extraField,
    required this.extraField2,
    required this.extraField3,
    required this.extraField4,
    required this.optionField,
    required this.conversionAmount,
    required this.code,
    required this.position,
    required this.referred,
    required this.referredBy,
    required this.pendingReferrals,
    required this.unconfirmedReferrals,
    required this.peopleReferred,
    required this.level2ConfirmedReferrals,
    required this.level3ConfirmedReferrals,
    required this.promoted,
    this.promotedAt,
    required this.verified,
    required this.verifiedAt,
    required this.points,
    required this.riskLevel,
    required this.host,
    this.source,
    this.device,
    required this.referralLink,
    required this.createdAt,
    required this.lastUpdatedAt,
    this.osType,
    this.screenSize,
    this.ipAddress,
    required this.universalLink,
    required this.status,
    required this.response,
  });

  /// Creates a new `RHSubscriber` instance from a JSON object.
  factory RHSubscriber.fromJson(Map<String, dynamic> json) {
    return RHSubscriber(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      cryptoWalletAddress: json['crypto_wallet_address'],
      cryptoWalletProvider: json['crypto_wallet_provider'],
      otherIdentifierValue: json['other_identifier_value'],
      extraField: json['extra_field'],
      extraField2: json['extra_field_2'],
      extraField3: json['extra_field_3'],
      extraField4: json['extra_field_4'],
      optionField: json['option_field'],
      conversionAmount: json['conversion_amount'],
      code: json['code'],
      position: json['position'],
      referred: json['referred'],
      referredBy: json['referred_by'] != null
          ? Map<String, dynamic>.from(json['referred_by'])
          : null,
      pendingReferrals: json['pending_referrals'],
      unconfirmedReferrals: json['unconfirmed_referrals'],
      peopleReferred: json['people_referred'],
      level2ConfirmedReferrals: json['level_2_confirmed_referrals'],
      level3ConfirmedReferrals: json['level_3_confirmed_referrals'],
      promoted: json['promoted'],
      promotedAt: json['promoted_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['promoted_at'])
          : null,
      verified: json['verified'],
      verifiedAt: json['verified_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['verified_at'])
          : null,
      points: json['points'],
      riskLevel: json['risk_level'],
      host: json['host'],
      source: json['source'],
      device: json['device'],
      referralLink: json['referral_link'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at']),
      lastUpdatedAt:
          DateTime.fromMillisecondsSinceEpoch(json['last_updated_at']),
      osType: json['os_type'],
      screenSize: json['screen_size'],
      ipAddress: json['ip_address'],
      universalLink: json['universal_link'],
      status: json['status'],
      response: json['response'],
    );
  }
}
