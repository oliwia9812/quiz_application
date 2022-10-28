import 'package:html_unescape/html_unescape_small.dart';

extension StringExtension on String {
  String encodeText() => HtmlUnescape().convert(this);
}
