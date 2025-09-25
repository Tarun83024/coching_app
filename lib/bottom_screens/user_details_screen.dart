import 'package:coching_app/bottom_screens/ImagePickerBottomSheet.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(text: "");
  final phoneController = TextEditingController(text: "+91 ");
  final emailController = TextEditingController(text: "");
  final customOccupationController = TextEditingController();
  final pincodeController = TextEditingController();
  final cityController = TextEditingController();

  String? gender;
  String? occupation;
  String? state;

  final genderList = ['Male', 'Female', 'Other'];

  final indianStates = [
    'Rajasthan',
    'Maharashtra',
    'Uttar Pradesh',
    'Gujarat',
    'Madhya Pradesh',
    'Bihar',
    'Tamil Nadu',
    'Karnataka',
    'Punjab',
    'Delhi',
    'Andhra Pradesh',
    'West Bengal',
    'Haryana',
    'Chhattisgarh',
    'Kerala',
    'Telangana',
    'Jharkhand',
    'Odisha',
    'Assam',
    'Himachal Pradesh',
    'Uttarakhand',
    'Jammu & Kashmir',
    'Goa',
    'Tripura',
    'Manipur',
    'Mizoram',
    'Nagaland',
    'Sikkim',
    'Arunachal Pradesh',
    'Meghalaya',
    'Chandigarh',
    'Ladakh',
    'Puducherry',
    'Andaman & Nicobar',
    'Dadra & Nagar Haveli',
    'Lakshadweep',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile Avatar
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blueAccent, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (_) => ImagePickerBottomSheet(
                        onCameraTap: () {
                          print("Camera selected");
                        },
                        onGalleryTap: () {
                          print("Gallery selected");
                        },
                        onRemoveTap: () {
                          print("Image removed");
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/icons/person.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              _buildTextField("Full Name", Icons.person, nameController),
              const SizedBox(height: 18),

              _buildTextField("Phone Number", Icons.phone, phoneController,
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 18),

              _buildTextField("Email", Icons.email, emailController,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 18),

              _buildDropdown("Gender", Icons.wc, genderList, gender,
                  (val) => setState(() => gender = val)),
              const SizedBox(height: 18),

              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      "Pincode",
                      Icons.pin,
                      pincodeController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(
                        "City", Icons.location_city, cityController),
                  ),
                ],
              ),

              const SizedBox(height: 18),
              _buildDropdown("State", Icons.map, indianStates, state,
                  (val) => setState(() => state = val)),

              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  label: const Text(
                    "Save",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Profile updated successfully")),
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    IconData icon,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: (val) =>
          val == null || val.trim().isEmpty ? '$label is required' : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.lightBlue),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.lightBlue),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    IconData icon,
    List<String> items,
    String? value,
    void Function(String?)? onChanged,
  ) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: onChanged,
      validator: (val) =>
          val == null || val.isEmpty ? '$label is required' : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.lightBlue),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.lightBlue),
        ),
      ),
    );
  }
}
