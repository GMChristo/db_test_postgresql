import 'package:fluent_query_builder/fluent_query_builder.dart';
import 'package:visitacao_server/db_config.dart';

var db;

Future<void> dbConnect() async {
  try {
    print('dbConnect()');
    db = await DbLayer().connect(pgsqlComInfo);
  } catch (e, s) {
    print('catch connect $e $s');
  }
}

Future get getDb async {
  if(db != null){
    return db;
  }
  await dbConnect();
  return db;
}
