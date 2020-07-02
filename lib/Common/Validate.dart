import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constant.dart';

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
}