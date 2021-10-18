import 'package:dotenv/dotenv.dart' show env;
import 'package:fluent_query_builder/fluent_query_builder.dart';

class DbConfig {
  DbConfig({this.username, this.password, this.host, this.port, this.database});
  String username;
  String password;
  String host;
  int port;
  String database;
}

final mongodbConInfo = DbConfig(
  database: env['DB_NAME'],
  username: env['DB_USERNAME'],
  password: env['DB_PASSWORD'],
  host: env['DB_HOST'],
  port: int.tryParse(env['DB_PORT']),
);

final pgsqlComInfo = DBConnectionInfo(
    enablePsqlAutoSetSearchPath: true,
    reconnectIfConnectionIsNotOpen: true,
    host: 'localhost', //192.168.133.13
    database: 'teste',
    driver: ConnectionDriver.pgsql,
    port: 5432,
    username: 'postgres',
    password: 's1sadm1n',
    charset: 'utf8',
    schemes: ['public'],
    setNumberOfProcessorsFromPlatform: false,
    numberOfProcessors: 8,
  );
