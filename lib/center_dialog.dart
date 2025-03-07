library center_dialog;

import 'package:flutter/material.dart';



 showCenterDialog(
    BuildContext context, {
    String? titleText = "",
    String? contentText = "",
    String? leftText,
    String? rightText,
    Function? onLeftCallback,
    Function? onRightCallback,
    Function? onDismissCallback,
    bool? isBarrierDismissible,
  }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    showDialog(
      barrierColor: Colors.black.withOpacity(0.4),
      context: context,
      barrierDismissible: isBarrierDismissible ?? false,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: screenWidth - 60, // 设置对话框的宽度
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //标题
                titleText!.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(
                            20, 20, 20, contentText!.isNotEmpty ? 20 : 10),
                        child: Text(
                          titleText,
                          style: const TextStyle(
                            fontFamily: 'LatoBlackFont',
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const SizedBox(),
                //内容
                contentText!.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(
                          20,
                          titleText.isNotEmpty ? 0 : 24,
                          20,
                          titleText.isNotEmpty ? 0 : 8,
                        ),
                        child: Text(
                          contentText,
                          style: TextStyle(
                            fontFamily: 'LatoBlackFont',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const SizedBox(),

                //间距
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //左边按钮
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          if (onLeftCallback != null) {
                            onLeftCallback();
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                              left: 20, top: 14, right: 20, bottom: 14),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12, width: 0),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.transparent,
                          ),
                          child: Text(
                            leftText ?? "Cancel",
                            style: TextStyle(
                              fontFamily: 'LatoBlackFont',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ),
                      )),
                      const SizedBox(width: 13,),
                      //右边按钮
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          if (onRightCallback != null) {
                            onRightCallback();
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(16),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xffFF004F),
                                  Color(0xffFF416E)
                                ]),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                              left: 20,
                              top: 14,
                              right: 20,
                              bottom: 14),
                          child: Text(
                            rightText ?? "Confirm",
                            style:  const TextStyle(
                              fontFamily: 'LatoBlackFont',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    ).then((value) {
      if (onDismissCallback != null) {
        onDismissCallback();
      }
    });
  }

