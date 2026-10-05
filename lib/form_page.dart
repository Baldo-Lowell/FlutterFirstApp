import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FormPage extends StatefulWidget {
  const FormPage({super.key});


  @override
  State<FormPage> createState() => _FormPageState();
}


class _FormPageState extends State<FormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController sectionController = TextEditingController();


  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController civilStatusController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactNumberController =
      TextEditingController();
  final TextEditingController emailAddressController =
      TextEditingController();
  final TextEditingController occupationController =
      TextEditingController();


  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<void> saveData() async {
    if (nameController.text.trim().isEmpty ||
        courseController.text.trim().isEmpty ||
        sectionController.text.trim().isEmpty ||
        fullNameController.text.trim().isEmpty ||
        ageController.text.trim().isEmpty ||
        genderController.text.trim().isEmpty ||
        birthdayController.text.trim().isEmpty ||
        civilStatusController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        contactNumberController.text.trim().isEmpty ||
        emailAddressController.text.trim().isEmpty ||
        occupationController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }


    await firestore.collection('students').add({
      'name': nameController.text.trim(),
      'course': courseController.text.trim(),
      'section': sectionController.text.trim(),
      'fullName': fullNameController.text.trim(),
      'age': ageController.text.trim(),
      'gender': genderController.text.trim(),
      'birthday': birthdayController.text.trim(),
      'civilStatus': civilStatusController.text.trim(),
      'address': addressController.text.trim(),
      'contactNumber': contactNumberController.text.trim(),
      'emailAddress': emailAddressController.text.trim(),
      'occupation': occupationController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });


    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data saved successfully')),
    );


    nameController.clear();
    courseController.clear();
    sectionController.clear();
    fullNameController.clear();
    ageController.clear();
    genderController.clear();
    birthdayController.clear();
    civilStatusController.clear();
    addressController.clear();
    contactNumberController.clear();
    emailAddressController.clear();
    occupationController.clear();
  }


  @override
  void dispose() {
    nameController.dispose();
    courseController.dispose();
    sectionController.dispose();
    fullNameController.dispose();
    ageController.dispose();
    genderController.dispose();
    birthdayController.dispose();
    civilStatusController.dispose();
    addressController.dispose();
    contactNumberController.dispose();
    emailAddressController.dispose();
    occupationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),


              TextField(
                controller: courseController,
                decoration: const InputDecoration(
                  labelText: 'Course',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),


              TextField(
                controller: sectionController,
                decoration: const InputDecoration(
                  labelText: 'Section',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),


              TextField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),


              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),


              TextField(
                controller: genderController,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),


              TextField(
                controller: birthdayController,
                decoration: const InputDecoration(
                  labelText: 'Birthday',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),


              TextField(
                controller: civilStatusController,
                decoration: const InputDecoration(
                  labelText: 'Civil Status',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),


              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),


              TextField(
                controller: contactNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Contact Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),


              TextField(
                controller: emailAddressController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),


              TextField(
                controller: occupationController,
                decoration: const InputDecoration(
                  labelText: 'Occupation',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),


              ElevatedButton(
                onPressed: saveData,
                child: const Text('Save to Firebase'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}