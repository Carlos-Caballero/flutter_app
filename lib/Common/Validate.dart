import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constant.dart';
typedef void VoidCallBackParam(Map parameters);

class Validate{
  static Widget errorWidget(String error,{String content=""}){
  switch(error){
    case Constant.CONNECTION_DISABLED:
      return textError('Error en la conexion $content');
      break;
    case Constant.WIFI_DISABLED:
      return textError('Error en la conexion wifi$content');
      break;
    case Constant.SERVER_ERROR:
      return textError('Error en el servidor $content');
      break;
    case Constant.MESSAGE:
      return textError(content);
      break;

  }
  }

  static textError(text){
    return Text(text,style: TextStyle(color: Colors.black, fontSize: 40),);
  }

  static emptyMap(parameters){
    return parameters.toString()=="[]"?null:parameters;
  }

  static connectionError({VoidCallback method,VoidCallBackParam methodParam,Map parameters}) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult== ConnectivityResult.none){
      return errorWidget(Constant.CONNECTION_DISABLED);
    }else{
      return (emptyMap(parameters)!=null)?methodParam(parameters):method();
    }
  }
}