import 'package:flutter/material.dart';

class BackGroundModal extends StatelessWidget {
  final String title;
  final Widget content;
  final Widget command;
  const BackGroundModal({Key key, this.title, this.content, this.command})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Material(
        color: Colors.transparent,
        animationDuration: const Duration(seconds: 5),
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // head
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            )),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(width: 12),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                      text: title,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                  width: 32,
                                  height: 32,
                                  child: InkWell(
                                      child: const Icon(Icons.close,
                                          color: Colors.black87, size: 24),
                                      onTap: () => Navigator.pop(context))),
                            ])),
                    const SizedBox(height: 20),
                    // body
                    content,
                    const SizedBox(height: 20),
                    // button
                    command,
                    const SizedBox(height: 12)
                  ]),
            )),
      ),
    ));
  }
}
