import 'package:flutter/material.dart';

class Billentry extends StatefulWidget {
  const Billentry({super.key});

  @override
  State<Billentry> createState() => _BillentryState();
}

class _BillentryState extends State<Billentry> {
  DateTime? selectedDate = DateTime.now();
  TextEditingController BillNoctrl = TextEditingController();
  TextEditingController Namectrl = TextEditingController();
  TextEditingController Mbnoctrl = TextEditingController();
  TextEditingController Tablenoctrl = TextEditingController();
  TextEditingController Vehnoctrl = TextEditingController();
  TextEditingController Itemnamectrl = TextEditingController();
  TextEditingController Qtyctrl = TextEditingController();
  TextEditingController Ratectrl = TextEditingController();
  TextEditingController Amountctrl = TextEditingController();
  TextEditingController Grossamtctrl = TextEditingController();
  TextEditingController Taxctrl = TextEditingController();
  TextEditingController Totamtctrl = TextEditingController();

  FocusNode BillNo = FocusNode();
  FocusNode Name = FocusNode();
  FocusNode Mobileno = FocusNode();
  FocusNode Tableno = FocusNode();
  FocusNode Vehno = FocusNode();
  FocusNode Itemname = FocusNode();
  FocusNode Qty = FocusNode();
  FocusNode Rate = FocusNode();
  FocusNode Amount = FocusNode();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: 'Select Date',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.deepOrange, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.deepOrange),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bill Entry",
          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text("Bill No:", style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: BillNoctrl,
                      focusNode: BillNo,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
