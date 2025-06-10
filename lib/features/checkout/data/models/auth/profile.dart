import 'dart:convert';

import 'user.dart';

class Profile {
  int? id;
  User? user;
  DateTime? createdAt;
  bool? active;
  String? profileType;
  List<dynamic>? phones;
  List<dynamic>? companyEmails;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? postalCode;
  String? street;
  bool? emailNotification;
  dynamic orderRetrievalEndpoint;
  dynamic deliveryUpdateEndpoint;
  dynamic logoUrl;
  bool? isMobadra;
  String? sector;
  bool? is2faEnabled;
  String? otpSentTo;
  int? activationMethod;
  int? signedUpThrough;
  int? failedAttempts;
  dynamic username;
  String? primaryPhoneNumber;
  bool? primaryPhoneVerified;
  bool? isTempPassword;
  dynamic otp2faSentAt;
  dynamic otp2faAttempt;
  DateTime? otpSentAt;
  DateTime? otpValidatedAt;
  dynamic awbBanner;
  dynamic emailBanner;
  dynamic identificationNumber;
  String? deliveryStatusCallback;
  dynamic merchantExternalLink;
  int? merchantStatus;
  bool? deactivatedByBank;
  dynamic bankDeactivationReason;
  int? bankMerchantStatus;
  dynamic nationalId;
  dynamic superAgent;
  dynamic walletLimitProfile;
  dynamic address;
  dynamic commercialRegistration;
  dynamic commercialRegistrationArea;
  dynamic distributorCode;
  dynamic distributorBranchCode;
  bool? allowTerminalOrderId;
  bool? allowEncryptionBypass;
  dynamic walletPhoneNumber;
  int? suspicious;
  dynamic latitude;
  dynamic longitude;
  dynamic bankRejectionReason;
  bool? bankReceivedDocuments;
  int? bankMerchantDigitalStatus;
  dynamic bankDigitalRejectionReason;
  bool? filledBusinessData;
  String? dayStartTime;
  dynamic dayEndTime;
  bool? withholdTransfers;
  bool? manualSettlement;
  String? smsSenderName;
  dynamic withholdTransfersReason;
  dynamic withholdTransfersNotes;
  bool? canBillDepositWithCard;
  bool? canTopupMerchants;
  dynamic topupTransferId;
  bool? referralEligible;
  bool? isEligibleToBeRanger;
  bool? eligibleForManualRefunds;
  bool? isRanger;
  bool? isPoaching;
  bool? paymobAppMerchant;
  dynamic settlementFrequency;
  dynamic dayOfTheWeek;
  dynamic dayOfTheMonth;
  bool? allowTransactionNotifications;
  bool? allowTransferNotifications;
  int? sallefnyAmountWhole;
  int? sallefnyFeesWhole;
  dynamic paymobAppFirstLogin;
  dynamic paymobAppLastActivity;
  bool? payoutEnabled;
  bool? payoutTerms;
  bool? isBillsNew;
  bool? canProcessMultipleRefunds;
  int? settlementClassification;
  bool? instantSettlementEnabled;
  bool? instantSettlementTransactionOtpVerified;
  dynamic preferredLanguage;
  bool? ignoreFlashCallbacks;
  bool? receiveCallbackCardInfo;
  dynamic acqPartner;
  dynamic dom;
  dynamic bankRelated;
  List<dynamic>? permissions;

  Profile({
    this.id,
    this.user,
    this.createdAt,
    this.active,
    this.profileType,
    this.phones,
    this.companyEmails,
    this.companyName,
    this.state,
    this.country,
    this.city,
    this.postalCode,
    this.street,
    this.emailNotification,
    this.orderRetrievalEndpoint,
    this.deliveryUpdateEndpoint,
    this.logoUrl,
    this.isMobadra,
    this.sector,
    this.is2faEnabled,
    this.otpSentTo,
    this.activationMethod,
    this.signedUpThrough,
    this.failedAttempts,
    this.username,
    this.primaryPhoneNumber,
    this.primaryPhoneVerified,
    this.isTempPassword,
    this.otp2faSentAt,
    this.otp2faAttempt,
    this.otpSentAt,
    this.otpValidatedAt,
    this.awbBanner,
    this.emailBanner,
    this.identificationNumber,
    this.deliveryStatusCallback,
    this.merchantExternalLink,
    this.merchantStatus,
    this.deactivatedByBank,
    this.bankDeactivationReason,
    this.bankMerchantStatus,
    this.nationalId,
    this.superAgent,
    this.walletLimitProfile,
    this.address,
    this.commercialRegistration,
    this.commercialRegistrationArea,
    this.distributorCode,
    this.distributorBranchCode,
    this.allowTerminalOrderId,
    this.allowEncryptionBypass,
    this.walletPhoneNumber,
    this.suspicious,
    this.latitude,
    this.longitude,
    this.bankRejectionReason,
    this.bankReceivedDocuments,
    this.bankMerchantDigitalStatus,
    this.bankDigitalRejectionReason,
    this.filledBusinessData,
    this.dayStartTime,
    this.dayEndTime,
    this.withholdTransfers,
    this.manualSettlement,
    this.smsSenderName,
    this.withholdTransfersReason,
    this.withholdTransfersNotes,
    this.canBillDepositWithCard,
    this.canTopupMerchants,
    this.topupTransferId,
    this.referralEligible,
    this.isEligibleToBeRanger,
    this.eligibleForManualRefunds,
    this.isRanger,
    this.isPoaching,
    this.paymobAppMerchant,
    this.settlementFrequency,
    this.dayOfTheWeek,
    this.dayOfTheMonth,
    this.allowTransactionNotifications,
    this.allowTransferNotifications,
    this.sallefnyAmountWhole,
    this.sallefnyFeesWhole,
    this.paymobAppFirstLogin,
    this.paymobAppLastActivity,
    this.payoutEnabled,
    this.payoutTerms,
    this.isBillsNew,
    this.canProcessMultipleRefunds,
    this.settlementClassification,
    this.instantSettlementEnabled,
    this.instantSettlementTransactionOtpVerified,
    this.preferredLanguage,
    this.ignoreFlashCallbacks,
    this.receiveCallbackCardInfo,
    this.acqPartner,
    this.dom,
    this.bankRelated,
    this.permissions,
  });

  factory Profile.fromMap(Map<String, dynamic> data) => Profile(
        id: data['id'] as int?,
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        active: data['active'] as bool?,
        profileType: data['profile_type'] as String?,
        phones: data['phones'] as List<dynamic>?,
        companyEmails: data['company_emails'] as List<dynamic>?,
        companyName: data['company_name'] as String?,
        state: data['state'] as String?,
        country: data['country'] as String?,
        city: data['city'] as String?,
        postalCode: data['postal_code'] as String?,
        street: data['street'] as String?,
        emailNotification: data['email_notification'] as bool?,
        orderRetrievalEndpoint: data['order_retrieval_endpoint'] as dynamic,
        deliveryUpdateEndpoint: data['delivery_update_endpoint'] as dynamic,
        logoUrl: data['logo_url'] as dynamic,
        isMobadra: data['is_mobadra'] as bool?,
        sector: data['sector'] as String?,
        is2faEnabled: data['is_2fa_enabled'] as bool?,
        otpSentTo: data['otp_sent_to'] as String?,
        activationMethod: data['activation_method'] as int?,
        signedUpThrough: data['signed_up_through'] as int?,
        failedAttempts: data['failed_attempts'] as int?,
        username: data['username'] as dynamic,
        primaryPhoneNumber: data['primary_phone_number'] as String?,
        primaryPhoneVerified: data['primary_phone_verified'] as bool?,
        isTempPassword: data['is_temp_password'] as bool?,
        otp2faSentAt: data['otp_2fa_sent_at'] as dynamic,
        otp2faAttempt: data['otp_2fa_attempt'] as dynamic,
        otpSentAt: data['otp_sent_at'] == null
            ? null
            : DateTime.parse(data['otp_sent_at'] as String),
        otpValidatedAt: data['otp_validated_at'] == null
            ? null
            : DateTime.parse(data['otp_validated_at'] as String),
        awbBanner: data['awb_banner'] as dynamic,
        emailBanner: data['email_banner'] as dynamic,
        identificationNumber: data['identification_number'] as dynamic,
        deliveryStatusCallback: data['delivery_status_callback'] as String?,
        merchantExternalLink: data['merchant_external_link'] as dynamic,
        merchantStatus: data['merchant_status'] as int?,
        deactivatedByBank: data['deactivated_by_bank'] as bool?,
        bankDeactivationReason: data['bank_deactivation_reason'] as dynamic,
        bankMerchantStatus: data['bank_merchant_status'] as int?,
        nationalId: data['national_id'] as dynamic,
        superAgent: data['super_agent'] as dynamic,
        walletLimitProfile: data['wallet_limit_profile'] as dynamic,
        address: data['address'] as dynamic,
        commercialRegistration: data['commercial_registration'] as dynamic,
        commercialRegistrationArea:
            data['commercial_registration_area'] as dynamic,
        distributorCode: data['distributor_code'] as dynamic,
        distributorBranchCode: data['distributor_branch_code'] as dynamic,
        allowTerminalOrderId: data['allow_terminal_order_id'] as bool?,
        allowEncryptionBypass: data['allow_encryption_bypass'] as bool?,
        walletPhoneNumber: data['wallet_phone_number'] as dynamic,
        suspicious: data['suspicious'] as int?,
        latitude: data['latitude'] as dynamic,
        longitude: data['longitude'] as dynamic,
        bankRejectionReason: data['bank_rejection_reason'] as dynamic,
        bankReceivedDocuments: data['bank_received_documents'] as bool?,
        bankMerchantDigitalStatus: data['bank_merchant_digital_status'] as int?,
        bankDigitalRejectionReason:
            data['bank_digital_rejection_reason'] as dynamic,
        filledBusinessData: data['filled_business_data'] as bool?,
        dayStartTime: data['day_start_time'] as String?,
        dayEndTime: data['day_end_time'] as dynamic,
        withholdTransfers: data['withhold_transfers'] as bool?,
        manualSettlement: data['manual_settlement'] as bool?,
        smsSenderName: data['sms_sender_name'] as String?,
        withholdTransfersReason: data['withhold_transfers_reason'] as dynamic,
        withholdTransfersNotes: data['withhold_transfers_notes'] as dynamic,
        canBillDepositWithCard: data['can_bill_deposit_with_card'] as bool?,
        canTopupMerchants: data['can_topup_merchants'] as bool?,
        topupTransferId: data['topup_transfer_id'] as dynamic,
        referralEligible: data['referral_eligible'] as bool?,
        isEligibleToBeRanger: data['is_eligible_to_be_ranger'] as bool?,
        eligibleForManualRefunds: data['eligible_for_manual_refunds'] as bool?,
        isRanger: data['is_ranger'] as bool?,
        isPoaching: data['is_poaching'] as bool?,
        paymobAppMerchant: data['paymob_app_merchant'] as bool?,
        settlementFrequency: data['settlement_frequency'] as dynamic,
        dayOfTheWeek: data['day_of_the_week'] as dynamic,
        dayOfTheMonth: data['day_of_the_month'] as dynamic,
        allowTransactionNotifications:
            data['allow_transaction_notifications'] as bool?,
        allowTransferNotifications:
            data['allow_transfer_notifications'] as bool?,
        sallefnyAmountWhole: data['sallefny_amount_whole'] as int?,
        sallefnyFeesWhole: data['sallefny_fees_whole'] as int?,
        paymobAppFirstLogin: data['paymob_app_first_login'] as dynamic,
        paymobAppLastActivity: data['paymob_app_last_activity'] as dynamic,
        payoutEnabled: data['payout_enabled'] as bool?,
        payoutTerms: data['payout_terms'] as bool?,
        isBillsNew: data['is_bills_new'] as bool?,
        canProcessMultipleRefunds:
            data['can_process_multiple_refunds'] as bool?,
        settlementClassification: data['settlement_classification'] as int?,
        instantSettlementEnabled: data['instant_settlement_enabled'] as bool?,
        instantSettlementTransactionOtpVerified:
            data['instant_settlement_transaction_otp_verified'] as bool?,
        preferredLanguage: data['preferred_language'] as dynamic,
        ignoreFlashCallbacks: data['ignore_flash_callbacks'] as bool?,
        receiveCallbackCardInfo: data['receive_callback_card_info'] as bool?,
        acqPartner: data['acq_partner'] as dynamic,
        dom: data['dom'] as dynamic,
        bankRelated: data['bank_related'] as dynamic,
        permissions: data['permissions'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user': user?.toMap(),
        'created_at': createdAt?.toIso8601String(),
        'active': active,
        'profile_type': profileType,
        'phones': phones,
        'company_emails': companyEmails,
        'company_name': companyName,
        'state': state,
        'country': country,
        'city': city,
        'postal_code': postalCode,
        'street': street,
        'email_notification': emailNotification,
        'order_retrieval_endpoint': orderRetrievalEndpoint,
        'delivery_update_endpoint': deliveryUpdateEndpoint,
        'logo_url': logoUrl,
        'is_mobadra': isMobadra,
        'sector': sector,
        'is_2fa_enabled': is2faEnabled,
        'otp_sent_to': otpSentTo,
        'activation_method': activationMethod,
        'signed_up_through': signedUpThrough,
        'failed_attempts': failedAttempts,
        'username': username,
        'primary_phone_number': primaryPhoneNumber,
        'primary_phone_verified': primaryPhoneVerified,
        'is_temp_password': isTempPassword,
        'otp_2fa_sent_at': otp2faSentAt,
        'otp_2fa_attempt': otp2faAttempt,
        'otp_sent_at': otpSentAt?.toIso8601String(),
        'otp_validated_at': otpValidatedAt?.toIso8601String(),
        'awb_banner': awbBanner,
        'email_banner': emailBanner,
        'identification_number': identificationNumber,
        'delivery_status_callback': deliveryStatusCallback,
        'merchant_external_link': merchantExternalLink,
        'merchant_status': merchantStatus,
        'deactivated_by_bank': deactivatedByBank,
        'bank_deactivation_reason': bankDeactivationReason,
        'bank_merchant_status': bankMerchantStatus,
        'national_id': nationalId,
        'super_agent': superAgent,
        'wallet_limit_profile': walletLimitProfile,
        'address': address,
        'commercial_registration': commercialRegistration,
        'commercial_registration_area': commercialRegistrationArea,
        'distributor_code': distributorCode,
        'distributor_branch_code': distributorBranchCode,
        'allow_terminal_order_id': allowTerminalOrderId,
        'allow_encryption_bypass': allowEncryptionBypass,
        'wallet_phone_number': walletPhoneNumber,
        'suspicious': suspicious,
        'latitude': latitude,
        'longitude': longitude,
        'bank_rejection_reason': bankRejectionReason,
        'bank_received_documents': bankReceivedDocuments,
        'bank_merchant_digital_status': bankMerchantDigitalStatus,
        'bank_digital_rejection_reason': bankDigitalRejectionReason,
        'filled_business_data': filledBusinessData,
        'day_start_time': dayStartTime,
        'day_end_time': dayEndTime,
        'withhold_transfers': withholdTransfers,
        'manual_settlement': manualSettlement,
        'sms_sender_name': smsSenderName,
        'withhold_transfers_reason': withholdTransfersReason,
        'withhold_transfers_notes': withholdTransfersNotes,
        'can_bill_deposit_with_card': canBillDepositWithCard,
        'can_topup_merchants': canTopupMerchants,
        'topup_transfer_id': topupTransferId,
        'referral_eligible': referralEligible,
        'is_eligible_to_be_ranger': isEligibleToBeRanger,
        'eligible_for_manual_refunds': eligibleForManualRefunds,
        'is_ranger': isRanger,
        'is_poaching': isPoaching,
        'paymob_app_merchant': paymobAppMerchant,
        'settlement_frequency': settlementFrequency,
        'day_of_the_week': dayOfTheWeek,
        'day_of_the_month': dayOfTheMonth,
        'allow_transaction_notifications': allowTransactionNotifications,
        'allow_transfer_notifications': allowTransferNotifications,
        'sallefny_amount_whole': sallefnyAmountWhole,
        'sallefny_fees_whole': sallefnyFeesWhole,
        'paymob_app_first_login': paymobAppFirstLogin,
        'paymob_app_last_activity': paymobAppLastActivity,
        'payout_enabled': payoutEnabled,
        'payout_terms': payoutTerms,
        'is_bills_new': isBillsNew,
        'can_process_multiple_refunds': canProcessMultipleRefunds,
        'settlement_classification': settlementClassification,
        'instant_settlement_enabled': instantSettlementEnabled,
        'instant_settlement_transaction_otp_verified':
            instantSettlementTransactionOtpVerified,
        'preferred_language': preferredLanguage,
        'ignore_flash_callbacks': ignoreFlashCallbacks,
        'receive_callback_card_info': receiveCallbackCardInfo,
        'acq_partner': acqPartner,
        'dom': dom,
        'bank_related': bankRelated,
        'permissions': permissions,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Profile].
  factory Profile.fromJson(String data) {
    return Profile.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Profile] to a JSON string.
  String toJson() => json.encode(toMap());
}
