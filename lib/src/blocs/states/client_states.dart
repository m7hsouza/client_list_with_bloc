import 'package:client_list_with_bloc/src/models/client.dart';

abstract class ClientState {
  const ClientState({required this.clients});

  final List<Client> clients;
}

class ClientIdleState extends ClientState {
  const ClientIdleState() : super(clients: const []);
}

class ClientLoadState extends ClientState {
  const ClientLoadState() : super(clients: const []);
}

class ClientSuccessState extends ClientState {
  const ClientSuccessState({required List<Client> clients}) : super(clients: clients);
}
