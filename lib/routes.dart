import 'package:dotenv/dotenv.dart';
import 'package:file/file.dart';
import 'package:galileo_framework/galileo_framework.dart';


///arquivo de rotas
GalileoConfigurer configureServer(FileSystem fileSystem) {
  return (Galileo app) async {
   
    app.get('/', (req, res) => res.write('cmpop Server API'));

    
    // Throw a 404 if no route matched the request.
    app.fallback((req, res) => throw GalileoHttpException.notFound());

    // Set our application up to handle different errors.
    //
    // Read the following for documentation:
    // * https://github.com/Galileo-dart/Galileo/wiki/Error-Handling

    final oldErrorHandler = app.errorHandler;
    app.errorHandler = (e, req, res) async {
      if (req.accepts('text/html', strict: true)) {
        if (e.statusCode == 404 && req.accepts('text/html', strict: true)) {
          await res
              .render('error', {'message': 'No file exists at ${req.uri}.'});
        } else {
          await res.render('error', {'message': e.message});
        }
      } else {
        return await oldErrorHandler(e, req, res);
      }
    };
  };
}
