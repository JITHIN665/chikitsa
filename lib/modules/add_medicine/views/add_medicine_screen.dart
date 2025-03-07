import 'package:chikitsa/infrastructure/providers/add_medicine_provider.dart';
import 'package:chikitsa/modules/add_medicine/widgets/color_selection_widget.dart';
import 'package:chikitsa/modules/add_medicine/widgets/compartment_selection_widget.dart';
import 'package:chikitsa/modules/add_medicine/widgets/date_selection_widget.dart';
import 'package:chikitsa/modules/add_medicine/widgets/meal_time_selection_widget.dart';
import 'package:chikitsa/modules/add_medicine/widgets/quantity_selection_widget.dart';
import 'package:chikitsa/modules/add_medicine/widgets/search_field_widget.dart';
import 'package:chikitsa/modules/add_medicine/widgets/total_count_widget.dart';
import 'package:chikitsa/modules/add_medicine/widgets/type_selection_widget.dart';
import 'package:chikitsa/theme/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMedicineScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  AddMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_sharp)),
        title: const Text("Add Medicines", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: Consumer<AddMedicineProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchFieldWidget(),
                const SizedBox(height: 10),
                CompartmentSelectionWidget(provider: provider),
                const SizedBox(height: 10),
                ColourSelectionWidget(provider: provider),
                const SizedBox(height: 10),
                TypeSelectionWidget(provider: provider),
                const SizedBox(height: 10),
                QuantitySelectionWidget(provider: provider),
                const SizedBox(height: 10),
                TotalCountWidget(provider: provider),
                const SizedBox(height: 10),
                DateSelectionWidget(provider: provider, context: context),
                const SizedBox(height: 10),
                buildDayFreqSelection(provider),
                const SizedBox(height: 10),
                buildFreqSelection(provider),
                const SizedBox(height: 20),
                MealTimeSelectionWidget(
                  selectedMealTime: provider.selectedMealTime,
                  mealTimes: const ["Before Food", "After Food", "Before Sleep"],
                  onMealTimeSelected: provider.selectMealTime,
                ),
                const SizedBox(height: 20),
                const ListTile(
                  leading: Icon(
                    Icons.alarm_sharp,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Dose 1",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.alarm_sharp,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Dose 2",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.alarm_sharp,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Dose 3",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Add",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  isOutlined: false,
                ),
                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDropdown(String label, String value, List<String> options, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: value,
          items: options.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (newValue) => onChanged(newValue!),
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        ),
      ],
    );
  }

  Widget buildDayFreqSelection(AddMedicineProvider provider) {
    return _buildDropdown("Frequncy of Days", provider.selectedMealTime, ["Before Food", "After Food", "Before Sleep"], provider.selectFrequency);
  }

  Widget buildFreqSelection(AddMedicineProvider provider) {
    return _buildDropdown("Frequncy of Days", provider.selectedMealTime, ["Before Food", "After Food", "Before Sleep"], provider.selectDoseTimes);
  }
}
