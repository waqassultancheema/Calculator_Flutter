import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SIForm(),
    theme: ThemeData(
      primaryColor: Colors.indigo,
      accentColor: Colors.indigoAccent,
      brightness: Brightness.dark
    ),
)
);

class SIForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SIFormState();

  }
}
class SIFormState extends State<SIForm> {
  var _currenies = ['Rupee','Dollars','Pounds'];
  var currencyValue = 'Rupee';

  var _formKey = GlobalKey<FormState>();

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
 var displayREsult = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Calculator",style: textStyle),
      ),
      body: Form(
       // margin: EdgeInsets.all(20),
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
        child:  ListView(
          children: <Widget>[
            ImageIcon(),
            Container(
              height: 30,
            ),
         Padding(
           child: TextFormField(
             keyboardType: TextInputType.number,
             style: textStyle,
             controller: principalController,
             validator: (String value){
               if (value.isEmpty) {
                 return "Please enter princal ";
               }
             },
             decoration: InputDecoration(
                 labelText: "Princpal",
                 labelStyle: textStyle,
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5.0),
                 )

             ),
           ),
           padding: EdgeInsets.only(
             top: 5.0,
             bottom: 5.0
           ),
         ),
            Padding(
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: textStyle,
                controller: roiController,
                decoration: InputDecoration(
                    labelText: "Rate Of Interest",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )

                ),
              ),
              padding: EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0
              ),
            ),
            Padding(
              child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: textStyle,
                              controller: termController,
                              decoration: InputDecoration(
                                  labelText: "Terms",
                                  labelStyle: textStyle,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )
                              ),
                            ),
                            margin: EdgeInsets.only(
                                right: 5
                            )
                        ),
                      ),
                      Container(
                        width: 10,
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          items:_currenies.map((String dropDownStringItem){

                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList() ,
                          value: currencyValue,
                          onChanged: (newValue){
                            _onDropDownItemSelected(newValue);
                          },
                        ),
                      ),
                    ],
                  )
              ),
              padding: EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0
              ),
            ),

            Container(

              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        child: Container(
                          child: RaisedButton(
                            child: Text("Calculate",textScaleFactor: 1.5),
                            onPressed: (){
                              setState(() {
                                if(_formKey.currentState.validate()){
                                  displayREsult = _calculateTotalReturn();
                                }
                              });
                            },
                            elevation: 1.0,
                            textColor:Theme.of(context).primaryColorDark,
                            color:Theme.of(context).primaryColorLight,
                          ),

                        ),
                        margin: EdgeInsets.only(
                            right: 5
                        )
                    ),
                    flex: 5,
                  ),
                  Expanded(
                    child: Container(
                        child: Container(
                          child: RaisedButton(

                            child: Text("Resets",textScaleFactor: 1.5),
                            onPressed: (){
                              setState(() {
                                displayREsult = "";
                              });
                            },
                            elevation: 1.0,
                            textColor:Theme.of(context).primaryColorLight,
                            color:Theme.of(context).primaryColorDark,
                          ),

                        ),
                        margin: EdgeInsets.only(
                            left: 5
                        )
                    ),

                    flex: 5,
                  ),
                ],
              ),
              margin: EdgeInsets.only(
                  top: 10
              ),

            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(displayREsult,style: textStyle),
            )
          ],
        ),
        )
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected){
    setState(() {
      this.currencyValue = newValueSelected;
    });
  }
  String _calculateTotalReturn(){

    double princiapl  = double.parse(principalController.text);
    double roi  = double.parse(roiController.text);
    double term  = double.parse(termController.text);
    double totalAmountPayable = princiapl + (princiapl * roi * term);
    return "After $term years, your investment will be will be worth $totalAmountPayable ";

  }
}

Widget getTextField(String placeHolder,String textResult){

    return TextField(

        decoration: InputDecoration(
          labelText: placeHolder
        ),
    );
}
class ImageIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      var assetImage = AssetImage("images/BankIcons.jpeg");
      var image = Image(
        image: assetImage,
      );
      return Center(
          child: Container(
            child: image,
          )
      );
  }
}

class CalculateButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Container(
       child: RaisedButton(
          child: Text("Calculate",textScaleFactor: 1.5),
         onPressed: (){

         },
         elevation: 1.0,
         textColor:Theme.of(context).primaryColorDark,
         color:Theme.of(context).primaryColorLight,
       ),

     );
  }
}

class ResetButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: RaisedButton(

        child: Text("Resets",textScaleFactor: 1.5),
        onPressed: (){

        },
        elevation: 1.0,
        textColor:Theme.of(context).primaryColorLight,
        color:Theme.of(context).primaryColorDark,
      ),

    );
  }
}

//class CurrenciesDropDown extends StatelessWidget {
//
//}

