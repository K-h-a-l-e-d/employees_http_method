import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/employee_model.dart';

class EmployeeService {
  //api endpoint
  String url = 'https://boringapi.com/api/v1/employees/';

  //this functions does the following:-
  //1- fetches data from the api as a string
  //2- converts
  Future<List<Employee>> getEmployees() async {
    List<Employee> employees = [];

    try {
      //fetching data from the api as a string
      http.Response responseAsString = await http.get(Uri.parse(url));
      //converting the string response to a json body which is a map of map of string:dynamic
      var responseAsJson = convert.jsonDecode(responseAsString.body);

      //we only need the list of employees Info which the is in the
      //the key ["employees"], then we loop through the list
      // and convert our json Map employee to our defined employee class model & then store it
      responseAsJson["employees"].forEach((map) {
        Employee employee = Employee.fromJson(map);
        employees.add(employee);
      });
      // catching any exception in case of any unsuccessful response
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return employees;
  }
}
