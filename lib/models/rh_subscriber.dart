class RHSubscriber {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String cryptoWalletAddress;
  final String cryptoWalletProvider;
  final String otherIdentifierValue;
  final String extraField;
  final String extraField2;
  final String extraField3;
  final String extraField4;
  final String optionField;
  final double conversionAmount;
  final String code;
  final int position;
  final bool referred;
  final Map<String, dynamic> referredBy;
  final int pendingReferrals;
  final int unconfirmedReferrals;
  final int peopleReferred;
  final int level2ConfirmedReferrals;
  final int level3ConfirmedReferrals;
  final bool promoted;
  final DateTime? promotedAt;
  final bool verified;
  final DateTime verifiedAt;
  final int points;
  final int riskLevel;
  final String host;
  final String? source;
  final String? device;
  final String referralLink;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;
  final String? osType;
  final String? screenSize;
  final String? ipAddress;
  final String universalLink;
  final String status;
  final String response;

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
      referredBy: json['referred_by'],
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
      verifiedAt: DateTime.fromMillisecondsSinceEpoch(json['verified_at']),
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
