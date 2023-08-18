import 'dart:async';
import 'package:flutter/material.dart';

class CommonButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final double radius;
  final Color bgColor;
  final Color textColor;
  final bool hasMore;
  final int typeBtn;
  const CommonButton.textBtn(
      {Key key,
      this.title = '',
      this.onPressed,
      this.radius = 0,
      this.bgColor = Colors.white,
      this.textColor,
      this.hasMore = false})
      : typeBtn = 0,
        super(key: key);
  const CommonButton.outlinedBtn(
      {Key key,
      this.title = '',
      this.onPressed,
      this.radius = 0,
      this.bgColor = Colors.white,
      this.textColor,
      this.hasMore = false})
      : typeBtn = 1,
        super(key: key);
  const CommonButton.elevatedBtn(
      {Key key,
      this.title = '',
      this.onPressed,
      this.radius = 0,
      this.bgColor = Colors.white,
      this.textColor,
      this.hasMore = false})
      : typeBtn = 2,
        super(key: key);
  const CommonButton.elevatedBtnIcon(
      {Key key,
      this.title = '',
      this.onPressed,
      this.radius = 0,
      this.bgColor = Colors.white,
      this.textColor,
      this.hasMore = false})
      : typeBtn = 3,
        super(key: key);

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  final EdgeInsetsGeometry _padding = const EdgeInsets.fromLTRB(20, 10, 20, 10);
  int _isDisable = 0;
  Timer _timer;
  TextStyle _textStyle;

  @override
  void initState() {
    super.initState();
    _textStyle = TextStyle(
        color: widget.textColor, fontSize: 16, fontWeight: FontWeight.bold);
    if (widget.typeBtn == 0) {
      _textStyle = _textStyle.copyWith(fontWeight: FontWeight.bold);
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (!mounted) return;
        _isDisable = 0;
      });
    });
  }

  @override
  void dispose() {
    if (_timer != null) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OutlinedBorder border = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)));
    final ButtonStyle textButtonStyle = TextButton.styleFrom(
        padding: _padding,
        shape: border,
        foregroundColor: widget.bgColor,
        shadowColor: Colors.transparent);
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
        padding: _padding,
        side: const BorderSide(width: 0.8, color: Color(0xFF838383)),
        foregroundColor: widget.bgColor,
        shadowColor: Colors.transparent);
    final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        shape: border,
        side: const BorderSide(width: 0.8, color: Color(0xFF838383)),
        foregroundColor: widget.bgColor,
        shadowColor: Colors.transparent);

    switch (widget.typeBtn) {
      case 0:
        return TextButton(
            onPressed: _onPressed, style: textButtonStyle, child: _child());
      case 1:
        return OutlinedButton(
            onPressed: _onPressed, style: outlineButtonStyle, child: _child());
      case 2:
        return ElevatedButton(
            onPressed: _onPressed,
            style: elevatedButtonStyle,
            child: _child());
      case 3:
        return ElevatedButton(
            onPressed: _onPressed,
            style: elevatedButtonStyle,
            child: _child());
      default:
        return const SizedBox();
    }
  }

  Widget _child() {
    if (_isDisable == 0) {
      return DefaultTextStyle(
          textAlign: TextAlign.left,
          style: _textStyle,
          child: Text(widget.title, textAlign: TextAlign.left));
    } else if (_isDisable == 1) {
      return Container(
        decoration: const BoxDecoration(),
        height: 20,
        width: 20,
        child: const CircularProgressIndicator(
          strokeWidth: 1,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      );
    }
    return const SizedBox();
  }

  void _onPressed() {
    if (widget.hasMore) {
      setState(() {
        if (_isDisable == 0) {
          _onAnimate();
        }
        if (!mounted) return;
        widget.onPressed();
      });
    } else {
      widget.onPressed();
    }
  }

  void _onAnimate() {
    setState(() {
      if (!mounted) return;
      _isDisable = 1;
    });
  }
}
