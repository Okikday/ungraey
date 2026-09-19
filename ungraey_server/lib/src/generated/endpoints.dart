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
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i1n3uhu0;
import 'package:ungraey_server/src/generated/bounty.dart' as _iymn45h4;
import 'package:ungraey_server/src/generated/material_category.dart'
    as _i8sopnk2;
import 'package:ungraey_server/src/generated/snap.dart' as _idr2u3mw;
import '../auth/email_idp_endpoint.dart' as _iuc1hd5t;
import '../auth/jwt_refresh_endpoint.dart' as _inwq3ztq;
import '../endpoints/bounty_endpoint.dart' as _iqrtlwz5;
import '../endpoints/handoff_endpoint.dart' as _in712qd3;
import '../endpoints/impact_endpoint.dart' as _ilxwsedw;
import '../endpoints/snap_endpoint.dart' as _its6ddlz;
import '../greetings/greeting_endpoint.dart' as _il624ik7;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'emailIdp': _iuc1hd5t.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _inwq3ztq.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'bounty': _iqrtlwz5.BountyEndpoint()
        ..initialize(
          server,
          'bounty',
          null,
        ),
      'handoff': _in712qd3.HandoffEndpoint()
        ..initialize(
          server,
          'handoff',
          null,
        ),
      'impact': _ilxwsedw.ImpactEndpoint()
        ..initialize(
          server,
          'impact',
          null,
        ),
      'snap': _its6ddlz.SnapEndpoint()
        ..initialize(
          server,
          'snap',
          null,
        ),
      'greeting': _il624ik7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint).login(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _is.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['jwtRefresh'] as _inwq3ztq.JwtRefreshEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['bounty'] = _is.EndpointConnector(
      name: 'bounty',
      endpoint: endpoints['bounty']!,
      methodConnectors: {
        'createBounty': _is.MethodConnector(
          name: 'createBounty',
          params: {
            'bounty': _is.ParameterDescription(
              name: 'bounty',
              type: _is.getType<_iymn45h4.Bounty>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['bounty'] as _iqrtlwz5.BountyEndpoint)
                  .createBounty(
                    session,
                    params['bounty'],
                  ),
        ),
        'listBounties': _is.MethodConnector(
          name: 'listBounties',
          params: {
            'lat': _is.ParameterDescription(
              name: 'lat',
              type: _is.getType<double?>(),
              nullable: true,
            ),
            'lon': _is.ParameterDescription(
              name: 'lon',
              type: _is.getType<double?>(),
              nullable: true,
            ),
            'radiusMiles': _is.ParameterDescription(
              name: 'radiusMiles',
              type: _is.getType<double?>(),
              nullable: true,
            ),
            'category': _is.ParameterDescription(
              name: 'category',
              type: _is.getType<_i8sopnk2.MaterialCategory?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['bounty'] as _iqrtlwz5.BountyEndpoint)
                  .listBounties(
                    session,
                    lat: params['lat'],
                    lon: params['lon'],
                    radiusMiles: params['radiusMiles'],
                    category: params['category'],
                  ),
        ),
        'getBounty': _is.MethodConnector(
          name: 'getBounty',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['bounty'] as _iqrtlwz5.BountyEndpoint).getBounty(
                    session,
                    params['id'],
                  ),
        ),
        'cancelBounty': _is.MethodConnector(
          name: 'cancelBounty',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['bounty'] as _iqrtlwz5.BountyEndpoint)
                  .cancelBounty(
                    session,
                    params['id'],
                  ),
        ),
      },
    );
    connectors['handoff'] = _is.EndpointConnector(
      name: 'handoff',
      endpoint: endpoints['handoff']!,
      methodConnectors: {
        'initiateHandoff': _is.MethodConnector(
          name: 'initiateHandoff',
          params: {
            'snapId': _is.ParameterDescription(
              name: 'snapId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'bountyId': _is.ParameterDescription(
              name: 'bountyId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'sellerId': _is.ParameterDescription(
              name: 'sellerId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['handoff'] as _in712qd3.HandoffEndpoint)
                  .initiateHandoff(
                    session,
                    snapId: params['snapId'],
                    bountyId: params['bountyId'],
                    sellerId: params['sellerId'],
                  ),
        ),
        'verifyAndCompleteHandoff': _is.MethodConnector(
          name: 'verifyAndCompleteHandoff',
          params: {
            'qrToken': _is.ParameterDescription(
              name: 'qrToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['handoff'] as _in712qd3.HandoffEndpoint)
                  .verifyAndCompleteHandoff(
                    session,
                    params['qrToken'],
                  ),
        ),
      },
    );
    connectors['impact'] = _is.EndpointConnector(
      name: 'impact',
      endpoint: endpoints['impact']!,
      methodConnectors: {
        'getUserImpact': _is.MethodConnector(
          name: 'getUserImpact',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['impact'] as _ilxwsedw.ImpactEndpoint)
                  .getUserImpact(
                    session,
                    params['userId'],
                  ),
        ),
        'getCommunityImpact': _is.MethodConnector(
          name: 'getCommunityImpact',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['impact'] as _ilxwsedw.ImpactEndpoint)
                  .getCommunityImpact(session),
        ),
      },
    );
    connectors['snap'] = _is.EndpointConnector(
      name: 'snap',
      endpoint: endpoints['snap']!,
      methodConnectors: {
        'submitSnap': _is.MethodConnector(
          name: 'submitSnap',
          params: {
            'snap': _is.ParameterDescription(
              name: 'snap',
              type: _is.getType<_idr2u3mw.Snap>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['snap'] as _its6ddlz.SnapEndpoint).submitSnap(
                    session,
                    params['snap'],
                  ),
        ),
        'analyze': _is.MethodConnector(
          name: 'analyze',
          params: {
            'base64Image': _is.ParameterDescription(
              name: 'base64Image',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['snap'] as _its6ddlz.SnapEndpoint).analyze(
                session,
                params['base64Image'],
              ),
        ),
        'findMatchesForSnap': _is.MethodConnector(
          name: 'findMatchesForSnap',
          params: {
            'snapId': _is.ParameterDescription(
              name: 'snapId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'radiusMiles': _is.ParameterDescription(
              name: 'radiusMiles',
              type: _is.getType<double>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['snap'] as _its6ddlz.SnapEndpoint)
                  .findMatchesForSnap(
                    session,
                    params['snapId'],
                    radiusMiles: params['radiusMiles'],
                  ),
        ),
        'streamNearbyBounties': _is.MethodStreamConnector(
          name: 'streamNearbyBounties',
          params: {},
          streamParams: {},
          returnType: _is.MethodStreamReturnType.streamType,
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
                Map<String, Stream> streamParams,
              ) => (endpoints['snap'] as _its6ddlz.SnapEndpoint)
                  .streamNearbyBounties(session),
        ),
      },
    );
    connectors['greeting'] = _is.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _is.MethodConnector(
          name: 'hello',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['greeting'] as _il624ik7.GreetingEndpoint).hello(
                    session,
                    params['name'],
                  ),
        ),
      },
    );
    modules['serverpod_auth'] = _i1n3uhu0.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeEndpoints(server);
  }
}
