class Details{

  static const tblDetails ='detail';
  static const tblId ='id';
  static const tblItems ='items';
  static const tblItemslist ='itemslist';
  static const tblAmount ='amount';
  static const tblDate ='date';

  Details({
    required this.id,
    required this.items,
    required this.amount,
    required this.date,
    required this.itemslist});

  //Details({required this.id,required this.title,required this.description,required this.amount,required this.listitem,required this.date})

  Details.fromMap(Map<String,dynamic> map){
    id = map[tblId];
    items = map[tblItems];
    amount = map[tblAmount];
    date = map[tblDate];
    itemslist = map[tblItemslist];

  }

  int? id;
  String? items;
  String? amount;
  String? date;
  String? itemslist;


  Map<String,dynamic> toMap(){
    var map = <String,dynamic> {
      tblItems: items,
      tblItemslist: itemslist,
      tblAmount: amount,
      tblDate: date,
    };
    if (id != null) {
      map[tblId]=id;
    }
    return map;
  }
}

//var x = Details(id: 1, items: '', amount: '', date: '', itemslist: '');