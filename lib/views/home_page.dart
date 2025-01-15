import 'package:flutter/material.dart';
import '../models/employee_model.dart';
import '../services/employee_service.dart';
import 'employees_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Employee> employees = [];
  bool isEmployeesHidden = true;

  //calling the function which returns the employees list of class model instances
  //and storing it in in employees list
  //for further details look up employees_service.dart page
  Future<void> getMyEmployees() async {
    employees = await EmployeeService().getEmployees();
    setState(() {});
  }

  //initiating the function once the UI is built
  @override
  void initState() {
    super.initState();
    getMyEmployees();
  }

  // a button for toggling the hidden status of the employees
  void toggleEmployeesHiddenState() {
    setState(() {
      isEmployeesHidden = !isEmployeesHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
            heightFactor: 1.5,
            child: FilledButton(
              onPressed: () => toggleEmployeesHiddenState(),
              child: Text('Show/Hide Employees'),
            ),
          ),
          isEmployeesHidden
              ? employees.isEmpty
                  ? Expanded(child: Center(child: CircularProgressIndicator()))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: employees.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmployeeDetails(
                                      employee: employees[index]),
                                )),
                            child: ListTile(
                              leading: Text(employees[index].id.toString()),
                              title: Text(
                                  '${employees[index].firstName} ${employees[index].lastName}'),
                              subtitle: Text(
                                  '${employees[index].department} | Salary: \$${employees[index].salary}'),
                              trailing: Icon(Icons.person),
                            ),
                          );
                        },
                      ),
                    )
              : Text('Click the button to show Employees Data!')
        ],
      ),
    );
  }
}
