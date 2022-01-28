import 'dart:async';
import 'dart:io';

import 'package:cbor/cbor.dart';
import 'package:coap/coap.dart';
import 'package:location/location.dart';
import 'package:riot_disaster_recovery_app/datatypes/status.dart';
import 'package:riot_disaster_recovery_app/util/toolbox.dart';

import '../config/coap_config_all.dart';

class CoAP {
  
  var host = '[fe80::827d:3aff:feb7:9699]'; // TODO make it dynamic macToLL()
  final cbor = Cbor();
  CoapClient? client;

  static final CoAP _coap = CoAP._internal();
  CoAP._internal();

  factory CoAP() {
    final conf = CoapConfigAll();
    final uri = Uri(scheme: 'coap', host: _coap.host, port: conf.defaultPort);
    _coap.client = CoapClient(uri, conf);
    _coap.client!.addressType = InternetAddressType.IPv6;
    _coap.client!.timeout = 10000;
    return _coap;
  }


  FutureOr<void> sendStatus(Status status) async {
    final request = CoapRequest.newPost();
    request.addUriPath('status');
    client!.request = request;

    await _encodeStatusPayload(status);

    final response = await client!.postBytePayload(cbor.rawOutput.getData(), CoapMediaType.any);
    print('Received response: ');
    print(response.payloadSize);
    print(response.payload);
  }

  FutureOr<void> sendNote(String note) async {
    final request = CoapRequest.newPost();
    request.addUriPath('note');
    client!.request = request;

    await _encodeNotePayload(note);

    final response = await client!.postBytePayload(cbor.rawOutput.getData(), CoapMediaType.any);
    print('Received response: ');
  }

  FutureOr<void> getPersons() async {
    final request = CoapRequest.newGet();
    request.addUriPath('persons');
    client!.request = request;

    final response = await client!.get();
    print('Received response: ');
    print(response.payload);
  }

  Future<void> _encodeStatusPayload(Status status) async {
    String id = await getDeviceID();
    LocationData location = await getDeviceLocation();
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    cbor.clearEncodedOutput();
    final encoder = cbor.encoder;
    encoder.writeMap(<String, Object>{
      "id": id,
      "status": status.value,
      "lat": location.latitude?.toDouble() ?? 0,
      "long": location.longitude?.toDouble() ?? 0,
      "timestamp": timestamp,
    });
  }

  Future<void> _encodeNotePayload(String note) async {
    String id = await getDeviceID();
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    cbor.clearEncodedOutput();
    final encoder = cbor.encoder;

    encoder.writeMap(<String, Object>{
      "id": id,
      "content": note,
      "timestamp": timestamp,
    });
  }

  FutureOr<void> get(String uriPath) async {
    final request = CoapRequest.newGet();
    request.addUriPath('persons');
    client!.request = request;

    final response = await client!.get();

    print('EXAMPLE - response received');
    print(response.payloadSize);
    print(response.payload);

    print(response.payloadString);
    print(response.statusCodeString);

    // Clean up
    client!.close();
  }

}
