import 'package:first_page/models/details.dart';
import 'package:first_page/utils/database_helper.dart';
import 'package:flutter/material.dart';


const deepPurpleColor = Colors.deepPurple;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense CRUD',
      theme: ThemeData(
        primaryColor : deepPurpleColor,
      ),
      home: const MyHomePage(title: 'Expense CRUD'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController dateCtl = TextEditingController();

  Details _details = Details(amount: '', date: '', itemslist: '', items: '', id: 1);
  List<Details> _detail =[];
  late DatabaseHelper _dbHelper;

  final _formKey = GlobalKey<FormState>();
  final _ctrlAmount = TextEditingController();
  //final _ctrlDate = TextEditingController();


  @override
  void initState(){
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
    _refreshDetailsList();
  }

  String dropdownvalue = 'CASH';

  // List of items in our dropdown menu
  var items = [
    'CASH',
    'UPI',
    'NET BANKING',
    'DEBIT CARD',
    'CREDIT CARD',
  ];

  String dropdownvaluelist = 'SHOPPING';

  var itemslist = [
    'SHOPPING',
    'GIFT',
    'BUSINESS',
    'GAMING',
    'FOOD',
    'CHARITY',
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: deepPurpleColor,
        title: Center(

            child: Text(widget.title , style: TextStyle(
              color: Colors.white,
            ),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _form(),_list()
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _form() => Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
    child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add Expense Mode',),
          Container(
            padding: EdgeInsets.only(top: 5, left: 3),
            child: DropdownButtonFormField(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onSaved: (String? newValue) => setState(() => _details.items = newValue!),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
          Text('Add Expense Category'),
          Container(
            padding: EdgeInsets.only(top: 5, left: 3),
            child: DropdownButtonFormField(
              value: dropdownvaluelist,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: itemslist.map((String itemslist) {
                return DropdownMenuItem(
                  value: itemslist,
                  child: Text(itemslist),
                );
              }).toList(),
              onSaved: (String? newValue) => setState(() => _details.itemslist = newValue!),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvaluelist = newValue!;
                },
                );


              },
            ),
          ),
          TextFormField(
            controller: _ctrlAmount,
            keyboardType: TextInputType.text,
            cursorColor: Colors.deepPurple,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter amount';
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: 'Enter amount ',
                labelStyle: TextStyle(color: Colors.deepPurple),
            ),
            onSaved: (String? vall) => setState(() => _details.amount = vall!),
          ),
          TextFormField(
            controller: dateCtl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter date';
                }
                return null;
              },
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.deepPurple),
              labelText: "Date of Transaction",
              hintText: "Enter date",),
            onTap: () async{
              DateTime date = DateTime(1900);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = (await showDatePicker(
                  context: context,
                  initialDate:DateTime.now(),
                  firstDate:DateTime(1900),
                  lastDate: DateTime(2100)))!;

              dateCtl.text = date.toString().substring(0,11);
              },
            onSaved: (dateCtl) => setState(() => _details.date = dateCtl!),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                RaisedButton.icon(onPressed: () {_onAdd();},
                  //Navigator.of(context).push(MaterialPageRoute(builder: (_) => ListPage()));
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Colors.deepPurple,
                  icon: Icon(Icons.add , color: Colors.white,),
                  label: Text('ADD', style: TextStyle(color: Colors.white),),

                ),
              ]
          ),
        ],
      ),
    ),);

  _refreshDetailsList() async {
    List<Details> x = await _dbHelper.fetchDetail();
    setState(() {
      _detail = x;
    });
  }

  _onAdd() async {
    var form = _formKey.currentState;
    if (form!.validate()){
      form.save();
      if(_details.id==null)
       await _dbHelper.insertDetails(_details);
      else
       await _dbHelper.updateDetails(_details);
      _refreshDetailsList();
      _resetForm();
    }}

    _resetForm(){
    setState(() {
      //form.reset();
      _formKey.currentState!.reset();
      _ctrlAmount.clear();
      _details.id = null;
    });
    }

  _list() => Expanded(
      child: Card(
        margin: EdgeInsets.all(15),
        child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemBuilder: (context,index){
              return Column(
                children: [
                 ListTile(
                   leading: CircleAvatar(
                     backgroundColor: Colors.deepPurple,
                     child: Icon(Icons.money),
                     ),
                   title: Text(this._detail[index].itemslist.toString(),),

                   subtitle:
                   //Text(this._detail[index].date),
                   SingleChildScrollView(
                     child: Row(
                         mainAxisSize: MainAxisSize.min,
                         children :[
                           Text(this._detail[index].amount.toString()),
                           Container(height: 4,width: 4,),
                           Text(this._detail[index].items.toString()),
                           Container(height: 4,width: 4,),
                           Text(this._detail[index].date.toString()),
                         ]),
                   ),
                   onTap: (){
                     setState(() {
                       _details = _detail[index];
                       _ctrlAmount.text = _detail[index].amount!;
                     });
                   },

                   trailing: IconButton(
                       icon: Icon(Icons.delete , color: Colors.deepPurple,),
                       onPressed: () async {
                         await _dbHelper.deleteDetails(_detail[index].id);
                         _resetForm();
                         _refreshDetailsList();
                       },),
                 ),
                 Divider(height: 5,),
                ],
              );
            },
          itemCount: _detail.length,
        ),
      ) );

}
