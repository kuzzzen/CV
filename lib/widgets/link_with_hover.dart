import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkWithHover extends StatefulWidget {
  const LinkWithHover(
    this.label, {
    super.key,
    required this.style,
    required this.link,
  });

  final String label;
  final TextStyle style;
  final String link;

  @override
  LinkWithHoverState createState() => LinkWithHoverState();
}

class LinkWithHoverState extends State<LinkWithHover> {
  TextStyle? _textStyle;

  @override
  void initState() {
    _textStyle = widget.style;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onHover: (isHovered) {
        setState(() {
          _textStyle = TextStyle(
            fontSize: widget.style.fontSize,
            fontFamily: widget.style.fontFamily,
            color: isHovered ? Color(0xff10069F) : Colors.black,
          );
        });
      },
      onTap: () => launchUrlString(widget.link),
      child: Text(widget.label, style: _textStyle),
    );
  }
}
