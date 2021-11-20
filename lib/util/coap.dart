import 'dart:async';
import 'dart:io';

import 'package:cbor/cbor.dart';
import 'package:coap/coap.dart';
import 'package:riot_disaster_recovery_app/datatypes/status.dart';

import '../config/coap_config_all.dart';

class CoAP {

  static FutureOr<void> sendStatus(Status status) async {
    // Create a configuration class. Logging levels can be specified in
    // the configuration file
    final conf = CoapConfigAll();
    // Build the request uri, note that the request paths/query parameters can be changed
    // on the request anytime after this initial setup.
    const host = '[fe80::a6cf:12ff:fe9a:1f75]';
    // const host = 'coap.me';
    final uri = Uri(scheme: 'coap', host: host, port: conf.defaultPort);
    // Create the client.
    // The method we are using creates its own request so we do not
    // need to supply one.
    // The current request is always available from the client.
    final client = CoapClient(uri, conf);
    client.addressType = InternetAddressType.IPv6;
    // Adjust the response timeout if needed, defaults to 32767 milliseconds
    client.timeout = 10000;
    // Create the request for the get request
    // final request = CoapRequest.newGet();
    final request = CoapRequest.newPost();
    // request.addUriPath('riot/board');
    request.addUriPath('status');
    client.request = request;
    // print('EXAMPLE - Sending get request to $host, waiting for response....');
    // print('EXAMPLE - Sending get request to $uri, waiting for response....');
    // print('EXAMPLE - Sending get request to ${client.endpoint}., waiting for response....');
    // print('EXAMPLE - Sending get request to ${request.codeString}., waiting for response....');

    // mac - status - lat - long
    String mac = "FF:FF:FF:FF:FF";
    double lat = 53.557030;
    double long = 10.023090;

    final inst = Cbor();
    final encoder = inst.encoder;
    encoder.writeString(mac);
    encoder.writeInt(status.value);
    encoder.writeFloat(lat);
    encoder.writeFloat(long);

    // final response = await client.get();
    // final response = await client.post(mac); // + ',' + status + ',' + lat + ',' + long);
    final response = await client.postBytePayload(inst.rawOutput.getData(), CoapMediaType.any);
    print('EXAMPLE - response received');
    print(response.payloadString);
    print(response.statusCodeString);

    // final pingok = await client.ping(10000);
    // print(pingok);


    // Clean up
    client.close();
  }
}
