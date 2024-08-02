// import 'dart:io';

// import 'package:excel/excel.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

// class ExcelExample extends StatefulWidget {
//   @override
//   _ExcelExampleState createState() => _ExcelExampleState();
// }

// class _ExcelExampleState extends State<ExcelExample> {
//   Future<void> _createAndSaveExcel() async {
//     // Create a new Excel document
//     var excel = Excel.createExcel();
//     Sheet sheetObject = excel['Sheet1'];

//     // Adding data to cells
//     sheetObject.cell(CellIndex.indexByString("A1")).value =
//         "Name" as CellValue?;
//     sheetObject.cell(CellIndex.indexByString("B1")).value = "Age" as CellValue?;

//     sheetObject.cell(CellIndex.indexByString("A2")).value =
//         "John Doe" as CellValue?;
//     sheetObject.cell(CellIndex.indexByString("B2")).value = 30 as CellValue?;

//     // Save the file to the application's document directory
//     var fileBytes = excel.save();

//     final directory = await getApplicationDocumentsDirectory();
//     String filePath = "${directory.path}/output_excel.xlsx";

//     File(filePath)
//       ..createSync(recursive: true)
//       ..writeAsBytesSync(fileBytes!);

//     print('Excel file saved at $filePath');
//   }

//   Future<void> _readExcel() async {
//     final directory = await getApplicationDocumentsDirectory();
//     String filePath = "${directory.path}/output_excel.xlsx";

//     var bytes = File(filePath).readAsBytesSync();
//     var excel = Excel.decodeBytes(bytes);

//     for (var table in excel.tables.keys) {
//       print('Sheet: $table');
//       print('Max Columns: ${excel.tables[table]!.maxColumns}');
//       print('Max Rows: ${excel.tables[table]!.maxRows}');

//       for (var row in excel.tables[table]!.rows) {
//         print('$row');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Excel Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _createAndSaveExcel,
//               child: Text('Create and Save Excel'),
//             ),
//             ElevatedButton(
//               onPressed: _readExcel,
//               child: Text('Read Excel'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
