import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liftdedo/screens/main/dashboard_screen.dart';
import 'package:liftdedo/widgets/common/picker_item.dart';
import 'package:liftdedo/widgets/common/simple_button.dart';

class UploadDocumentsScreen extends StatefulWidget {
  const UploadDocumentsScreen({Key? key}) : super(key: key);

  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  final ImagePicker picker = ImagePicker();
  bool loading = false;
  Map photo = {"path": "", "name": ""};
  Map aadharCard = {"path": "", "name": ""};
  Map drivingLicense = {"path": "", "name": ""};
  Map rc = {"path": "", "name": ""};

  void openImagePicker() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Map photoFile = {"path": image.path, "name": image.name};

      setState(() {
        photo = photoFile;
      });
    }
  }

  void openAadharCardPicker() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ["jpg", "png", "pdf"]);
    if (filePickerResult != null) {
      Map aadharFile = {
        "path": filePickerResult.files.first.path,
        "name": filePickerResult.files.first.name
      };

      setState(() {
        aadharCard = aadharFile;
      });
    }
  }

  void openDrivingLicense() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ["jpg", "png", "pdf"]);
    if (filePickerResult != null) {
      Map licenseFile = {
        "path": filePickerResult.files.first.path,
        "name": filePickerResult.files.first.name
      };
      setState(() {
        drivingLicense = licenseFile;
      });
    }
  }

  void openRC() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ["jpg", "png", "pdf"]);
    if (filePickerResult != null) {
      Map rcFile = {
        "path": filePickerResult.files.first.path,
        "name": filePickerResult.files.first.name
      };
      setState(() {
        rc = rcFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("Upload Documents"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextButton(
              onPressed: openImagePicker,
              child: PickerItem(
                name: photo["name"] == "" ? "Upload your photo" : photo["name"],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: openAadharCardPicker,
              child: PickerItem(
                name: aadharCard["name"] == ""
                    ? "Upload your aadhar card"
                    : aadharCard["name"],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: openDrivingLicense,
              child: PickerItem(
                name: drivingLicense["name"] == ""
                    ? "Upload Driving license copy"
                    : drivingLicense["name"],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: openRC,
              child: PickerItem(
                name: rc["name"] == "" ? "Upload RC Copy" : rc["name"],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SimpleButton(
              title: "Upload Documents",
              onPressed: onPressed,
              isLoading: loading,
            )
          ],
        ),
      ),
    ));
  }

  void onPressed() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
        (Route<dynamic> route) => false);
  }
}
