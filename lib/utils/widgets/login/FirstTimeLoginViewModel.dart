import 'package:ems_app/repository/AccountRepository.dart';
import 'package:flutter/cupertino.dart';

enum LoginStep {
  stepOne(0),
  stepTwo(1),
  stepThree(2),
  stepNone(3);

  final int value;
  const LoginStep(this.value);
}

enum StepUIState { notFinish, currentStep, finishStep, noneState }

class FirstTimeLoginViewModel {
  LoginStep currentStep = LoginStep.stepOne;

  String defaultPassword = '';

  String newPassWord = '';

  AccountRepository accountRepository = AccountRepository.instance;

  FocusNode defaultPasswordFocusNode = FocusNode();

  FocusNode newPasswordFocusNode = FocusNode();

  var isDefautPasswordFieldVisible = false;

  var isNewPasswordFieldVisible = false;

  var isLoginError = false;

  void setDefaultPassword(String password) {
    defaultPassword = password;
  }

  void setNewPassWord(String password) {
    newPassWord = password;
  }

  void nextStep(Function callBack) {
    switch (currentStep) {
      case LoginStep.stepOne:
        currentStep = LoginStep.stepTwo;
      case LoginStep.stepTwo:
        currentStep = LoginStep.stepThree;
      case LoginStep.stepThree:
        currentStep = LoginStep.stepNone;
      case LoginStep.stepNone:
        print('not case anyway');
    }
    print('Next currentStep:$currentStep');
    callBack();
  }

  StepUIState getUIStepState(LoginStep step) {
    if (step == currentStep) {
      return StepUIState.notFinish;
    } else if (step.value > currentStep.value) {
      return StepUIState.currentStep;
    } else if (step.value < currentStep.value) {
      return StepUIState.finishStep;
    } else {
      return StepUIState.noneState;
    }
  }

  void gooleLogin() {
    accountRepository.googleSignIn();
  }

  void appleLogin() {
    accountRepository.appleIDUserLogin();
  }
}
