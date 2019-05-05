
import 'dart:async';

class Validators {
                                         // input is string and output is string
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains('@')){
        sink.add(email+"9");
      }else {
        sink.addError('Enter a valid email');
      }
    }
  );

  final validatePass = StreamTransformer<String, String>.fromHandlers(
    handleData: (pass, sink) {
      if (pass.length > 3) {
        sink.add(pass);
      } else {
        sink.addError('Password must be at least 4 chars');
      }
    }
  );

}