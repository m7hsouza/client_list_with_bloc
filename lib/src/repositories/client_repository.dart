import 'package:client_list_with_bloc/src/models/client.dart';

class ClientRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      const Client(name: 'Matheus Lucas'),
    ]);

    return _clients;
  }

  List<Client> addClient(Client client) {
    _clients.add(client);

    return _clients;
  }

  List<Client> removeClient(Client client) {
    _clients.remove(client);

    return _clients;
  }
}
