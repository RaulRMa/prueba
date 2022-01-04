import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Usuario extends Equatable {
  final String? email;
  final String? contrasena;

  const Usuario({this.email, this.contrasena}) : assert(email != null);

  //static const empty = Usuario(email: '', pass1 '', pass2: '');

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

  String? get user_email {
    return email;
  }

  String? get user_password {
    return contrasena;
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'contrasena': contrasena};
  }
}
