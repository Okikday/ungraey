/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _ida;
import 'package:http/http.dart' as _i85jenna;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i312scxx;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'package:ungraey_client/src/protocol/bounty.dart' as _ia79p7gr;
import 'package:ungraey_client/src/protocol/eco_impact.dart' as _i3nwor1d;
import 'package:ungraey_client/src/protocol/greetings/greeting.dart'
    as _i9fo1z21;
import 'package:ungraey_client/src/protocol/handoff_transaction.dart'
    as _iwjfyrh2;
import 'package:ungraey_client/src/protocol/material_analysis_result.dart'
    as _ijom8t7p;
import 'package:ungraey_client/src/protocol/material_category.dart'
    as _iv2qm0wr;
import 'package:ungraey_client/src/protocol/snap.dart' as _icssktmw;
import 'protocol.dart' as _il2as5qe;

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _iaic.EndpointEmailIdpBase {
  EndpointEmailIdp(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<_iacc.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _ida.Future<_isc.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _ida.Future<String> verifyRegistrationCode({
    required _isc.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _ida.Future<_iacc.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _ida.Future<_isc.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _ida.Future<String> verifyPasswordResetCode({
    required _isc.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _ida.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _iacc.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// If [refreshToken] is omitted, cookie-mode web clients fall back to the
  /// configured HttpOnly refresh cookie. When neither source is present this
  /// throws [RefreshTokenNotFoundException], the same public "no usable refresh
  /// credential" exception used for unknown refresh tokens.
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _ida.Future<_iacc.AuthSuccess> refreshAccessToken({String? refreshToken}) =>
      caller.callServerEndpoint<_iacc.AuthSuccess>(
        'jwtRefresh',
        'refreshAccessToken',
        {'refreshToken': refreshToken},
        authenticated: false,
      );
}

/// Endpoint managing demand-side bounties for upcyclable commodities.
/// {@category Endpoint}
class EndpointBounty extends _isc.EndpointRef {
  EndpointBounty(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'bounty';

  /// Posts a new commodity bounty.
  _ida.Future<_ia79p7gr.Bounty> createBounty(_ia79p7gr.Bounty bounty) =>
      caller.callServerEndpoint<_ia79p7gr.Bounty>(
        'bounty',
        'createBounty',
        {'bounty': bounty},
      );

  /// Lists active bounties, optionally filtered by proximity and category.
  _ida.Future<List<_ia79p7gr.Bounty>> listBounties({
    double? lat,
    double? lon,
    double? radiusMiles,
    _iv2qm0wr.MaterialCategory? category,
  }) => caller.callServerEndpoint<List<_ia79p7gr.Bounty>>(
    'bounty',
    'listBounties',
    {
      'lat': lat,
      'lon': lon,
      'radiusMiles': radiusMiles,
      'category': category,
    },
  );

  /// Retrieves a specific bounty by [id].
  _ida.Future<_ia79p7gr.Bounty?> getBounty(int id) =>
      caller.callServerEndpoint<_ia79p7gr.Bounty?>(
        'bounty',
        'getBounty',
        {'id': id},
      );

  /// Cancels an active bounty.
  _ida.Future<bool> cancelBounty(int id) => caller.callServerEndpoint<bool>(
    'bounty',
    'cancelBounty',
    {'id': id},
  );
}

/// Endpoint managing the physical QR handoff and value exchange settlement.
/// {@category Endpoint}
class EndpointHandoff extends _isc.EndpointRef {
  EndpointHandoff(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'handoff';

  /// Initiates a handoff transaction and returns a cryptographically unique QR token.
  _ida.Future<_iwjfyrh2.HandoffTransaction> initiateHandoff({
    required int snapId,
    required int bountyId,
    required int sellerId,
  }) => caller.callServerEndpoint<_iwjfyrh2.HandoffTransaction>(
    'handoff',
    'initiateHandoff',
    {
      'snapId': snapId,
      'bountyId': bountyId,
      'sellerId': sellerId,
    },
  );

  /// Verifies a scanned QR token, atomically completing the handoff and crediting eco-impact.
  _ida.Future<_iwjfyrh2.HandoffTransaction?> verifyAndCompleteHandoff(
    String qrToken,
  ) => caller.callServerEndpoint<_iwjfyrh2.HandoffTransaction?>(
    'handoff',
    'verifyAndCompleteHandoff',
    {'qrToken': qrToken},
  );
}

/// Endpoint for fetching user-level and community-wide environmental metrics.
/// {@category Endpoint}
class EndpointImpact extends _isc.EndpointRef {
  EndpointImpact(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'impact';

  /// Fetches the authenticated user's personal ecological savings.
  _ida.Future<_i3nwor1d.EcoImpact> getUserImpact(int userId) =>
      caller.callServerEndpoint<_i3nwor1d.EcoImpact>(
        'impact',
        'getUserImpact',
        {'userId': userId},
      );

  /// Aggregates community-wide impact for the global live counter.
  _ida.Future<_i3nwor1d.EcoImpact> getCommunityImpact() =>
      caller.callServerEndpoint<_i3nwor1d.EcoImpact>(
        'impact',
        'getCommunityImpact',
        {},
      );
}

/// Endpoint for handling supply-side waste pile snaps and localized matching.
/// {@category Endpoint}
class EndpointSnap extends _isc.EndpointRef {
  EndpointSnap(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'snap';

  /// Records a new snapped waste pile.
  _ida.Future<_icssktmw.Snap> submitSnap(_icssktmw.Snap snap) =>
      caller.callServerEndpoint<_icssktmw.Snap>(
        'snap',
        'submitSnap',
        {'snap': snap},
      );

  /// Analyzes a base64 encoded image to determine its material category and estimated value.
  _ida.Future<_ijom8t7p.MaterialAnalysisResult> analyze(String base64Image) =>
      caller.callServerEndpoint<_ijom8t7p.MaterialAnalysisResult>(
        'snap',
        'analyze',
        {'base64Image': base64Image},
      );

  /// Finds all active bounties matching the snap's detected materials within [radiusMiles].
  _ida.Future<List<_ia79p7gr.Bounty>> findMatchesForSnap(
    int snapId, {
    required double radiusMiles,
  }) => caller.callServerEndpoint<List<_ia79p7gr.Bounty>>(
    'snap',
    'findMatchesForSnap',
    {
      'snapId': snapId,
      'radiusMiles': radiusMiles,
    },
  );

  /// Real-time stream of nearby bounty alerts.
  _ida.Stream<_ia79p7gr.Bounty> streamNearbyBounties() =>
      caller.callStreamingServerEndpoint<
        _ida.Stream<_ia79p7gr.Bounty>,
        _ia79p7gr.Bounty
      >(
        'snap',
        'streamNearbyBounties',
        {},
        {},
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _isc.EndpointRef {
  EndpointGreeting(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _ida.Future<_i9fo1z21.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i9fo1z21.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i312scxx.Caller(client);
    serverpod_auth_idp = _iaic.Caller(client);
    serverpod_auth_core = _iacc.Caller(client);
  }

  late final _i312scxx.Caller auth;

  late final _iaic.Caller serverpod_auth_idp;

  late final _iacc.Caller serverpod_auth_core;
}

class Client extends _isc.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _isc.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_isc.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
    _i85jenna.Client? httpClientOverride,
  }) : super(
         host,
         _il2as5qe.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
         httpClientOverride: httpClientOverride,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    bounty = EndpointBounty(this);
    handoff = EndpointHandoff(this);
    impact = EndpointImpact(this);
    snap = EndpointSnap(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointBounty bounty;

  late final EndpointHandoff handoff;

  late final EndpointImpact impact;

  late final EndpointSnap snap;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _isc.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'bounty': bounty,
    'handoff': handoff,
    'impact': impact,
    'snap': snap,
    'greeting': greeting,
  };

  @override
  Map<String, _isc.ModuleEndpointCaller> get moduleLookup => {
    'auth': modules.auth,
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
