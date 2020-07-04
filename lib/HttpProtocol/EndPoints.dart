import 'package:flutterapp/Common/Constant.dart';
import 'package:flutterapp/HttpProtocol/HttpExecute.dart';

class EndPoints{

  static getUser(id){
    return HttpExecute(generateEndPoint("/users/$id")).get();
  }

  static getPosts(){
    return HttpExecute(generateEndPoint("/posts")).get();
  }

  static insertPost(parameters){
    return HttpExecute(generateEndPoint("/posts")).post(parameters);
  }

  static updatePost(parameters){
    return HttpExecute(generateEndPoint("/posts/${parameters['id']}")).put(parameters);
  }

  static deletePost(id){
    return HttpExecute(generateEndPoint("/posts/$id")).delete();
  }

  static generateEndPoint(resource)=>Constant.DOMAIN+ "${Constant.PATH}$resource";
}