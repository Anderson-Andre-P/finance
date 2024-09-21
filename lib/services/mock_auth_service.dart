// import 'package:finance/common/models/user_model.dart';
// import 'package:finance/services/auth_service.dart';

// class MockAuthService implements AuthService {
//   @override
//   Future<UserModel> signIn({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       await Future.delayed(const Duration(seconds: 2));
//       if (password.startsWith('123')) {
//         throw Exception();
//       }

//       return UserModel(
//         id: email.hashCode.toString(),
//         email: email,
//       );
//     } catch (e) {
//       if (password.startsWith('123')) {
//         throw 'Erro ao logar. Tente novamente.';
//       }

//       throw 'Não foi possível realizar login nesse momento. Tente mais tarde.';
//     }
//   }

//   @override
//   Future<UserModel> signUp({
//     String? name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       await Future.delayed(const Duration(seconds: 2));
//       if (password.startsWith('123')) {
//         throw Exception();
//       }

//       return UserModel(
//         id: email.hashCode.toString(),
//         name: name,
//         email: email,
//       );
//     } catch (e) {
//       if (password.startsWith('123')) {
//         throw 'Senha insegura, tente uma senha forte.';
//       }

//       throw 'Não foi possível criar sua conta. Tente novamente depois.';
//     }
//   }
// }
