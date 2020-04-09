import 'package:chatr/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:chatr/features/chat/domain/usecases/delete_message.dart';
import 'package:chatr/features/chat/domain/usecases/get_messages.dart';
import 'package:chatr/features/chat/domain/usecases/send_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/chat/data/datasources/firebase_chat_repository.dart';
import 'features/chat/domain/repositories/chat_repository.dart';
import 'features/chat/presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(
    () => ChatBloc(
      sendMessage: sl(),
      getMessages: sl(),
      deleteMessage: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => SendMessage(sl()));
  sl.registerLazySingleton(() => DeleteMessage(sl()));
  sl.registerLazySingleton(() => GetMessages(sl()));

  // Data sources
  sl.registerLazySingleton(
    () => FirebaseChatRepository(
      sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(firebaseChatRepository: sl(), networkInfo: sl()),
  );

  //! Core
  // sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => Firestore());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => DataConnectionChecker());
}
