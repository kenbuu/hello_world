import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Trailer Name'),
    );
  }
}

class DataTableExample extends StatefulWidget {
  const DataTableExample({Key key, this.title, this.active}) : super(key: key);

  final String title;
  final bool active;
  @override
  _DataTableExampleState createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: Text(widget.title),
        headingRowHeight: 20,
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: const <int>[5, 10, 20],
        onRowsPerPageChanged: (int value) {
          setState(() {
            _rowsPerPage = value;
          });
        },
        columns: widget.active ? kTableColumnActives : kTableColumnRequests,
        source: widget.active
            ? WorkInstructionActiveDataSource()
            : WorkInstructionRequestDataSource(),
        showCheckboxColumn: false,
      ),
    );
  }
}

////// ColumnActives in table.
const kTableColumnActives = <DataColumn>[
  DataColumn(
    label: Text('ATime'),
  ),
  DataColumn(
    label: Text('PTime'),
    numeric: false,
  ),
  DataColumn(
    label: Text('CntrNo'),
    numeric: false,
  ),
  DataColumn(
    label: Text('F/E'),
    numeric: false,
  ),
  DataColumn(
    label: Text('CntrType'),
  ),
  DataColumn(
    label: Text('Agent'),
    numeric: false,
  ),
  DataColumn(
    label: Text('Grade'),
    numeric: false,
  ),
  DataColumn(
    label: Text('From'),
    numeric: false,
  ),
  DataColumn(
    label: Text('To'),
    numeric: false,
  ),
];

////// DataWorkInstructionActive class.
class WorkInstructionActive {
  WorkInstructionActive(this.aTime, this.pTime, this.cntrNo, this.fe,
      this.cntrType, this.agent, this.grade, this.from, this.to);
  final String aTime;
  final String pTime;
  final String cntrNo;
  final String fe;
  final String cntrType;
  final String agent;
  final String grade;
  final String from;
  final String to;
  bool selected = false;
}

////// WorkInstructionActiveDataSource class for obtaining row data for PaginatedDataTable.
class WorkInstructionActiveDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<WorkInstructionActive> _workInstructionActive =
      <WorkInstructionActive>[
    WorkInstructionActive('10:15', '10:25', 'TTOS22000001', '2200E', 'Lạnh',
        'APL', 'BB', 'Y - B02 09 01 01', 'Y - B03 09 01 10'),
    WorkInstructionActive('10:15', '10:25', 'TTOS22000001', '2200E', 'Lạnh',
        'APL', 'BB', 'Y - B02 09 01 01', 'Y - B03 09 01 10'),
    WorkInstructionActive('10:15', '10:25', 'TTOS22000001', '2200E', 'Lạnh',
        'APL', 'BB', 'Y - B02 09 01 01', 'Y - B03 09 01 10'),
    WorkInstructionActive('10:15', '10:25', 'TTOS22000001', '2200E', 'Lạnh',
        'APL', 'BB', 'Y - B02 09 01 01', 'Y - B03 09 01 10'),
    WorkInstructionActive('10:15', '10:25', 'TTOS22000001', '2200E', 'Lạnh',
        'APL', 'BB', 'Y - B02 09 01 01', 'Y - B03 09 01 10'),
    WorkInstructionActive('10:15', '10:25', 'TTOS22000001', '2200E', 'Lạnh',
        'APL', 'BB', 'Y - B02 09 01 01', 'Y - B03 09 01 10'),
  ];

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _workInstructionActive.length) return null;
    final WorkInstructionActive workInstructionActive =
        _workInstructionActive[index];
    return DataRow.byIndex(
        index: index,
        selected: workInstructionActive.selected,
        onSelectChanged: (bool value) {
          // if (dessert.selected != value) {
          //   _selectedCount += value ? 1 : -1;
          //   assert(_selectedCount >= 0);
          //   dessert.selected = value;
          //   notifyListeners();
          // }
        },
        cells: <DataCell>[
          DataCell(Text(workInstructionActive.aTime)),
          DataCell(Text(workInstructionActive.pTime)),
          DataCell(Text(workInstructionActive.cntrNo)),
          DataCell(Text(workInstructionActive.fe)),
          DataCell(Text(workInstructionActive.cntrType)),
          DataCell(Text(workInstructionActive.agent)),
          DataCell(Text(workInstructionActive.grade)),
          DataCell(Text(workInstructionActive.from)),
          DataCell(Text(workInstructionActive.to)),
        ]);
  }

  @override
  int get rowCount => _workInstructionActive.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

////// ColumnRequests in table.
const kTableColumnRequests = <DataColumn>[
  DataColumn(
    label: Text('ATime'),
  ),
  DataColumn(
    label: Text('CntrNo'),
    numeric: false,
  ),
  DataColumn(
    label: Text('F/E'),
    numeric: false,
  ),
  DataColumn(
    label: Text('Agent'),
    numeric: false,
  ),
  DataColumn(
    label: Text('Grade'),
    numeric: false,
  ),
  DataColumn(
    label: Text('From'),
    numeric: false,
  ),
  DataColumn(
    label: Text('To'),
    numeric: false,
  ),
];

////// WorkInstructionRequest class.
class WorkInstructionRequest {
  WorkInstructionRequest(this.aTime, this.cntrNo, this.fe, this.agent,
      this.grade, this.from, this.to);
  final String aTime;
  final String cntrNo;
  final String fe;
  final String agent;
  final String grade;
  final String from;
  final String to;
  bool selected = false;
}

////// WorkInstructionRequestDataSource class for obtaining row data for PaginatedDataTable.
class WorkInstructionRequestDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<WorkInstructionRequest> _workInstructionRequest =
      <WorkInstructionRequest>[
    WorkInstructionRequest('10:15', 'TTOS22000002', '2200E', 'APL', 'BB',
        'Y - B02 09 01 01', 'Y - B03 09 01 10'),
    WorkInstructionRequest('10:15', 'TTOS22000002', '2200E', 'APL', 'BB',
        'Y - B02 09 01 01', 'Y - B03 09 01 10'),
    WorkInstructionRequest('10:15', 'TTOS22000002', '2200E', 'APL', 'BB',
        'Y - B02 09 01 01', 'Y - B03 09 01 10'),
    WorkInstructionRequest('10:15', 'TTOS22000002', '2200E', 'APL', 'BB',
        'Y - B02 09 01 01', 'Y - B03 09 01 10'),
    WorkInstructionRequest('10:15', 'TTOS22000002', '2200E', 'APL', 'BB',
        'Y - B02 09 01 01', 'Y - B03 09 01 10'),
    WorkInstructionRequest('10:15', 'TTOS22000002', '2200E', 'APL', 'BB',
        'Y - B02 09 01 01', 'Y - B03 09 01 10'),
  ];

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _workInstructionRequest.length) return null;
    final WorkInstructionRequest workInstructionRequest =
        _workInstructionRequest[index];
    return DataRow.byIndex(
        index: index,
        selected: workInstructionRequest.selected,
        onSelectChanged: (bool value) {
          // if (dessert.selected != value) {
          //   _selectedCount += value ? 1 : -1;
          //   assert(_selectedCount >= 0);
          //   dessert.selected = value;
          //   notifyListeners();
          // }
        },
        cells: <DataCell>[
          DataCell(Text(workInstructionRequest.aTime)),
          DataCell(Text(workInstructionRequest.cntrNo)),
          DataCell(Text(workInstructionRequest.fe)),
          DataCell(Text(workInstructionRequest.agent)),
          DataCell(Text(workInstructionRequest.grade)),
          DataCell(Text(workInstructionRequest.from)),
          DataCell(Text(workInstructionRequest.to)),
        ]);
  }

  @override
  int get rowCount => _workInstructionRequest.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        toolbarHeight: 50, // Set this height
      ),
      body: Container(
        padding: const EdgeInsets.all(5.0),
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 50,
              child: Container(
                color: Colors.blue,
                width: 100,
                child: DataTableExample(
                  title: "Danh sách Wis Active",
                  active: true,
                ),
              ),
            ),
            Expanded(
              flex: 50,
              child: Container(
                color: Colors.yellow,
                width: 100,
                child: DataTableExample(
                  title: "Danh sách Wis Request",
                  active: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
