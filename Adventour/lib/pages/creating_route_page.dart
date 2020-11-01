import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:Adventour/pages/search_page.dart';

class CreatingRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating your route'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SafeArea(
          child: ScrollColumnExpandable(
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: SizedBox(
                  height: 180,
                  child: Image.asset(
                    'assets/logo_adventour.png',
                  ),
                ),
              ),
              Expanded(
                child: CreatingRouteForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreatingRouteForm extends StatefulWidget {
  @override
  _CreatingRouteFormState createState() => _CreatingRouteFormState();
}

class _CreatingRouteFormState extends State<CreatingRouteForm> {
  TextEditingController _locationController = TextEditingController(text:'Your location');
  TextEditingController _dateController =
      TextEditingController(text: DateFormat.yMMMd().format(DateTime.now()));
  DateTime _selectedDate;
  String _location;
  String _locationId = 'your_location';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: InputText(
                  controller: _locationController,
                  labelText: 'Route zone',
                  icon: Icons.location_on,
                  onTap: () => PlacesAutocomplete.show(
                    context: context,
                    onTapPrediction: (prediction){
                      Navigator.pop(context);
                      
                        _location = prediction.description;
                        _locationId = prediction.placeId;
                        setState(() {
                        _locationController.text = _location;
                      });
                    },
                    onSubmitted: (value){},
                  ),
                  readOnly: true,
                ),
              ),
              Expanded(
                child: InputText(
                  controller: _dateController,
                  labelText: 'Date',
                  icon: Icons.calendar_today,
                  onTap: () => _selectDate(context),
                  readOnly: true,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // PrimaryButton(
                    //   text: 'HIGHLIGHTS',
                    //   onPressed: () {
                    //     //Navigator.of(context).pushNamed('/xxx');
                    //   },
                    //   icon: Icons.star,
                    //   style: ButtonType.Void,
                    // ),
                    PrimaryButton(
                      text: 'NEXT',
                      onPressed: () {
                        Navigator.of(context).pushNamed('/customRoutePage',arguments: _locationId);
                      },
                      icon: Icons.edit,
                      style: ButtonType.Normal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365 * 2)),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(),
          ),
          child: child,
        );
      },
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _dateController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}