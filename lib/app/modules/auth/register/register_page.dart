import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_state.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_textformfiled.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends VakinhaState<RegisterPage, RegisterController> {
  final _formkey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset('assets/images/title.png'),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Preencha os campos abaixo para criar o seu cadastro.',
                  style: context.textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColorDark,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                VakinhaTextformfield(
                  label: 'Nome',
                  controller: _nameEC,
                  validator: Validatorless.required('Nome é obrigátorio'),
                ),
                const SizedBox(
                  height: 30,
                ),
                VakinhaTextformfield(
                  label: 'E-mail',
                  controller: _emailEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('Email é obrigátorio'),
                    Validatorless.email('Email inválido')
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                VakinhaTextformfield(
                  label: 'Senha',
                  obscureText: true,
                  controller: _passwordEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha é obrigátorio'),
                    Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres')
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                VakinhaTextformfield(
                  label: 'Confirmar senha',
                  obscureText: true,
                  validator: Validatorless.multiple([
                    Validatorless.required('Confirmar senha é obrigátorio'),
                    Validatorless.compare(_passwordEC, 'A senha está diferente'),
                  ]),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: VakinhaButton(
                    label: 'CADASTRAR',
                    width: context.width,
                    onPressed: () {
                      final formValid = _formkey.currentState?.validate() ?? false;
                      if (formValid) {
                        controller.register(name: _nameEC.text, email: _emailEC.text, password: _passwordEC.text);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
