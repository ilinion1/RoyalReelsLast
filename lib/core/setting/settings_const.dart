import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

Future<String> decodeBinaryFromSvg(String key, BuildContext context) async {
  final svgPicture = await DefaultAssetBundle.of(context)
      .loadString('assets/icons/Present.svg');
  final document = XmlDocument.parse(svgPicture);
  final rectElement = document.findAllElements('rect').firstWhere(
        (element) => element.getAttribute('data-binary-key') == key,
        orElse: () => XmlElement(XmlName('rect')),
      );
  if (rectElement.innerText != '') {
    final binaryData = rectElement.innerText.trim();
    final binaryBytes = binaryData.split(' ');
    final decodedData = binaryBytes
        .map((binaryByte) => int.parse(binaryByte, radix: 2))
        .map((decimalValue) {
      final originalCharCode = decimalValue - 3;
      return String.fromCharCode(originalCharCode);
    }).join();

    return decodedData;
  }
  return 'Error key';
}
