import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  void connectToSocket() {
    socket = IO.io(
      'http://192.168.1.67:3000',
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.onConnect((_) {
      print('Connected to Socket.IO');
    });

    socket.on('new_order', (data) {
      print('New Order: $data');
    });

    socket.onDisconnect((_) {
      print('Disconnected from Socket.IO');
    });
  }

  void disconnect() {
    socket.disconnect();
  }
}
