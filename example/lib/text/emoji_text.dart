import 'package:extended_text_library/extended_text_library.dart';
import 'package:flutter/material.dart';

///emoji/image text
class EmojiText extends SpecialText {
  EmojiText(TextStyle textStyle, {this.start})
      : super(EmojiText.flag, ']', textStyle);
  static const String flag = '[';
  final int? start;
  @override
  InlineSpan finishText() {
    final String key = getContent();

    /// widget span is not working on web
    if (EmojiUitl.instance.emojiMap.containsKey(key)) {
      //fontsize id define image height
      //size = 30.0/26.0 * fontSize
      const double size = 20.0;

      ///fontSize 26 and text height =30.0
      //final double fontSize = 26.0;
      return ImageSpan(
        AssetImage(
          EmojiUitl.instance.emojiMap[key]!,
        ),
        actualText: key,
        imageWidth: size,
        imageHeight: size,
        start: start!,
        fit: BoxFit.fill,
        margin: const EdgeInsets.only(left: 2.0, top: 2.0, right: 2.0),
        alignment: PlaceholderAlignment.middle,
      );
    }

    return TextSpan(text: toString(), style: textStyle);
  }
}

class EmojiUitl {
  EmojiUitl._() {
    _emojiMap['love'] = '$_emojiFilePath/love.png';
    _emojiMap['sun_glasses'] = '$_emojiFilePath/sun_glasses.png';
  }

  final Map<String, String> _emojiMap = <String, String>{};

  Map<String, String> get emojiMap => _emojiMap;

  final String _emojiFilePath = 'assets';

  static EmojiUitl? _instance;
  static EmojiUitl get instance => _instance ??= EmojiUitl._();
}
