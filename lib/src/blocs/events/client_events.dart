import 'package:client_list_with_bloc/src/models/client.dart';

abstract class ClientEvent {}

class ClientLoadEvent extends ClientEvent {}

class ClientAddEvent extends ClientEvent {
  ClientAddEvent(this.client);

  final Client client;
}

class ClientDeleteEvent extends ClientEvent {
  ClientDeleteEvent(this.client);

  final Client client;
}
