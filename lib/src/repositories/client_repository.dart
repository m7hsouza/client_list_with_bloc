import 'package:client_list_with_bloc/src/models/client.dart';

class ClientRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      const Client(id: 1, name: 'Anny Beatriz'),
      const Client(id: 2, name: 'Talita Raquel'),
      const Client(id: 3, name: 'Carla Evellyn'),
      const Client(id: 4, name: 'Fernanda Indres'),
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
