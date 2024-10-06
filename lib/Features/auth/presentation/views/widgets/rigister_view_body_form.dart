import 'package:e_commerce_shop_smart/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/helper/my_app_method.dart';
import '../../../../../core/utils/my_validators.dart';
import '../../../../../core/widgets/auth/pick_image_widget.dart';

class RigisterViewBodyForm extends StatefulWidget {
  const RigisterViewBodyForm({super.key});

  @override
  State<RigisterViewBodyForm> createState() => _RigisterViewBodyFormState();
}

class _RigisterViewBodyFormState extends State<RigisterViewBodyForm> {
  late final TextEditingController _nameController,
      _emailController,
      _passwordController,
      _confirmPasswordController;
  late final FocusNode _nameFocusNode,
      _emailFocusNode,
      _passwordFocusNode,
      _confirmPasswordFocusNode;
  late final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  // final bool _isLoading = false;
  XFile? _pickedImage;
  // final auth = FirebaseAuth.instance;
  String? userImageUrl;
  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    // Focus Nodes
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    // Focus Nodes
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _registerFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_pickedImage == null) {
      MyAppMethods.showErrorORWarningDialog(
        context: context,
        subtitle: "Make sure to pick up an image",
        fct: () {},
      );
      return;
    }
    if (isValid) {
      _formKey.currentState!.save();
      // try {
      //   setState(() {
      //     _isLoading = true;
      //   });
      //   final ref = FirebaseStorage.instance
      //       .ref()
      //       .child("usersImages")
      //       .child('${_emailController.text.trim()}.jpg');
      //   await ref.putFile(File(_pickedImage!.path));
      //   userImageUrl = await ref.getDownloadURL();

      //   await auth.createUserWithEmailAndPassword(
      //     email: _emailController.text.trim(),
      //     password: _passwordController.text.trim(),
      //   );
      //   User? user = auth.currentUser;
      //   final uid = user!.uid;
      //   await FirebaseFirestore.instance.collection("users").doc(uid).set({
      //     'userId': uid,
      //     'userName': _nameController.text,
      //     'userImage': userImageUrl,
      //     'userEmail': _emailController.text.toLowerCase(),
      //     'createdAt': Timestamp.now(),
      //     'userWish': [],
      //     'userCart': [],
      //   });
      //   Fluttertoast.showToast(
      //     msg: "An account has been created",
      //     toastLength: Toast.LENGTH_SHORT,
      //     textColor: Colors.white,
      //   );
      //   if (!mounted) return;
      //   Navigator.pushReplacementNamed(context, RootScreen.routName);
      // } on FirebaseAuthException catch (error) {
      //   await MyAppMethods.showErrorORWarningDialog(
      //     context: context,
      //     subtitle: "An error has been occured ${error.message}",
      //     fct: () {},
      //   );
      // } catch (error) {
      //   await MyAppMethods.showErrorORWarningDialog(
      //     context: context,
      //     subtitle: "An error has been occured $error",
      //     fct: () {},
      //   );
      // } finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      // }
    }
  }

  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    await MyAppMethods.imagePickerDialog(
      context: context,
      cameraFCT: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.camera);
        setState(() {});
      },
      galleryFCT: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.gallery);
        setState(() {});
      },
      removeFCT: () {
        setState(() {
          _pickedImage = null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: size.width * 0.3,
            width: size.width * 0.3,
            child: PickImageWidget(
              pickedImage: _pickedImage,
              function: () async {
                await localImagePicker();
              },
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextFormField(
            controller: _nameController,
            focusNode: _nameFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            hintText: "Full name",
            prefixIcon: const Icon(
              IconlyLight.message,
            ),
            validator: (value) {
              return MyValidators.displayNamevalidator(value);
            },
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_emailFocusNode);
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextFormField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email address",
            prefixIcon: const Icon(
              IconlyLight.message,
            ),
            validator: (value) {
              return MyValidators.emailValidator(value);
            },
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextFormField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscureText,
            hintText: "*********",
            prefixIcon: const Icon(
              IconlyLight.lock,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            validator: (value) {
              return MyValidators.passwordValidator(value);
            },
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextFormField(
            controller: _confirmPasswordController,
            focusNode: _confirmPasswordFocusNode,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscureText,
            hintText: "*********",
            prefixIcon: const Icon(
              IconlyLight.lock,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            validator: (value) {
              return MyValidators.repeatPasswordValidator(
                  value: value, password: _passwordController.text);
            },
            onFieldSubmitted: (value) {
              _registerFct();
            },
          )
        ],
      ),
    );
  }
}
