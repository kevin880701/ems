import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_texts.dart';
import '../../../viewModel/AccountViewModel.dart';
import '../widget/DialogTitleBar.dart';

class ChangeUserNameDialog extends StatefulWidget {
  const ChangeUserNameDialog({
    super.key,
  });

  @override
  _ChangeUserNameDialog createState() => _ChangeUserNameDialog();
}

class _ChangeUserNameDialog extends State<ChangeUserNameDialog> {
  AccountViewModel accountViewModel = AccountViewModel.instance;
  late TextEditingController _controller;
  String editText = "";

  @override
  void initState(){
    _controller = TextEditingController(text: editText);
  }

  @override
  void dispose() {
    // 清除控制器的資源
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      insetPadding: EdgeInsets.symmetric(horizontal: 48.sp),
      child: Container(
        padding: EdgeInsets.fromLTRB(16.sp, 16.sp, 16.sp, 20.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
        ),
        child: SingleChildScrollView(
            child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DialogTitleBar(
                title: AppTexts.editName,
              ),
              SizedBox(
                height: 4.sp,
              ),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: AppTexts.enterNewName,
                ),
                onChanged: (text) {
                  print('Typed text: $text');
                  setState(() {
                    editText = text;
                    var matches = containsEmoji(editText);
                    if (matches.isNotEmpty) {
                      for (var match in matches) {
                        int start = match.start;
                        int end = match.end;
                        // 移除匹配到的表情符號
                        editText = editText.replaceRange(start, end, '');
                      }
                      _controller.text = editText;
                      // 移動游標到最後一個字符的位置
                      _controller.selection = TextSelection.fromPosition(TextPosition(offset: editText.length));
                      showToast(
                          context: context,
                          text: AppTexts.emojiNotAllow,
                          backgroundColor: AppColors.red,
                          textColor: AppColors.white);
                      print("文字中包含表情符號！");
                    } else {
                      print("文字中沒有包含表情符號。");
                    }
                  });
                },
              ),
              SizedBox(
                height: 16.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: getText(AppTexts.cancel, fontSize: 16.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(_controller.text.isEmpty){
                        showToast(
                            context: context,
                            text: AppTexts.pleaseEnterName,
                            backgroundColor: AppColors.red,
                            textColor: AppColors.white);
                      }else{
                        accountViewModel.changeUserName(_controller.text).then((isChangeNameSuccess){
                          if (isChangeNameSuccess) {
                            Navigator.of(context).pop();
                          } else {
                            showToast(
                                context: context,
                                text: AppTexts.changeNameFailed,
                                backgroundColor: AppColors.red,
                                textColor: AppColors.white);
                          }
                        });
                      }
                    },
                    child: getText(AppTexts.confirm, fontSize: 16.sp, color: AppColors.lightBlue),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
