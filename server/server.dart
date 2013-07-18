import '../packages/fukiya/fukiya.dart';
import 'dart:io';
import 'dart:json';

main() {

  new Fukiya()
  ..get('/', getHandler)
  ..put('/', putHandler)
  ..delete('/', deleteHandler)
  ..post('/', postHandler)
  ..get('/testing', (FukiyaContext context) {
    context.send("This is testing.");
  })
  ..get('/users/:userid', getDynamicHandler)
  ..staticFiles('web')
  ..use(new FukiyaFormParser())
  ..use(new FukiyaJsonParser())
  ..listen('127.0.0.1', 8080);

}

void getHandler(FukiyaContext context) {
  context.send("GET OK");
}
void putHandler(FukiyaContext context) {
  context.send("PUT OK");
}
void deleteHandler(FukiyaContext context) {
  context.send("DELETE OK");
}
void postHandler(FukiyaContext context) {
  context.send("POST OK");
}
void getDynamicHandler(FukiyaContext context) {
  context.send("Dynamic GET OK ${context.params['userid']}");
}


