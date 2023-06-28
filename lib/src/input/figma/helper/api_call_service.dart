import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http2/http2.dart';
import 'package:pbdl/src/input/figma/entities/figma_key.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:quick_log/quick_log.dart';

import 'api_exceptions.dart';

class APICallService {
  APICallService();
  static var log = Logger('API Call Service');
  static String HTTP_STATUS_KEY = ':status';

  /// Returns [FigmaNodes] with UUIDs specified in [ids]
  /// from [fileId]. Requires a [FigmaKey].
  static Future<List<FigmaNode>> getFileNodes(
      String? fileId, Iterable<String> ids, FigmaKey? key) async {
    if (ids == null || ids.isEmpty) {
      return [];
    }
    final flatIds = ids.join(',');
    final url = 'https://api.figma.com/v1/files/$fileId/nodes?ids=$flatIds';

    final apiResult = await makeAPICall(url, key!);
    final figmaNodes = <FigmaNode>[];

    if (apiResult is Map<String, dynamic> && apiResult.containsKey('nodes')) {
      for (Map<String, dynamic> node in apiResult['nodes'].values) {
        if (node.containsKey('document')) {
          figmaNodes.add(FigmaNode.fromJson(node['document']));
        }
      }
      return figmaNodes;
    }
    return [];
  }

  /// Makes a GET call to figma using `url` and `token`
  static Future<dynamic> makeAPICall(
    String url,
    FigmaKey key,
  ) async {
    var uri = Uri.parse(url);

    /// The following request must be done using http2. The reason is
    /// that the Figma API enforces http2, so using regular http will
    /// not work.
    try {
      var transport = ClientTransportConnection.viaSocket(
        await SecureSocket.connect(
          uri.host,
          uri.port,
          supportedProtocols: ['h2'],
        ),
      );

      var stream = transport.makeRequest(
        [
          Header.ascii(':method', 'GET'),
          Header.ascii(
              ':path', uri.path + (uri.query.isEmpty ? '' : '?${uri.query}')),
          Header.ascii(':scheme', uri.scheme),
          Header.ascii(':authority', uri.host),
          key.type == FIGMA_KEY_TYPE.PERSONAL_ACCESS_TOKEN
              ? Header.ascii('x-figma-token', key.keyStr)
              : Header.ascii('authorization', key.keyStr),
        ],
        endStream: true,
      );
      Stream<StreamMessage?> broadcast = stream.incomingMessages.asBroadcastStream();

      HeadersStreamMessage? header = await (broadcast.firstWhere(
          (event) => event is HeadersStreamMessage,
          orElse: () => null) as FutureOr<HeadersStreamMessage?>);

      /// Fetching the status code of the request
      if (header != null) {
        var header_status = header.headers.firstWhere(
            (header) => utf8.decode(header.name) == HTTP_STATUS_KEY);
        var status_code = int.parse(utf8.decode(header_status.value));
        _returnResponse(status_code);
      } else {
        _returnResponse(500);
      }

      /// Decoding the data coming in from the API
      var decoded_data = await broadcast
          .where((event) => event is DataStreamMessage)
          .map((event) => (event as DataStreamMessage).bytes)
          .transform(utf8.decoder)
          .join()
          .then((jsonString) => json.decode(jsonString))
          .onError((dynamic error, stackTrace) {
        log.error(error.toString());

        _returnResponse(500);
      });

      await transport.finish();
      return decoded_data;
    } catch (e, stackTrace) {
      print(e);
    }
  }

  static dynamic _returnResponse(int status) {
    switch (status) {
      case 200:
        // TODO: Only print when verbose flag is active
        // log.debug('API call went successfully : ${status}');
        break;
      case 400:
        log.error('BadRequestException : $status');
        throw BadRequestException();
        break;
      case 401:
      case 403:
        log.error('UnauthorizedException : $status');
        throw UnauthorisedException();
        break;
      case 500:
      default:
        log.error(
            'Error occured while Communication with Server with StatusCode : $status');
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : $status');
        break;
    }
  }
}
