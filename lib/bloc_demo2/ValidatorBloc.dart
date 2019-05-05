
import 'dart:async';

import 'package:flutter_app/bloc_demo2/Validators.dart';

    // with must be come after extend so we extends Object
class ValidatorBloc extends Object with Validators{
  Validators v;
  final _emailController = StreamController<String>();
  final _passController = StreamController<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passController.sink.add;

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get pass => _passController.stream.transform(validatePass);

  dispose(){
    _emailController.close();
    _passController.close();
  }
}
// create single insance that will be shared to all classes
final myBloc = ValidatorBloc();