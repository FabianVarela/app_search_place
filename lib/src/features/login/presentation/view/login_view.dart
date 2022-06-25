import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/src/core/dependency/dependencies.dart';
import 'package:my_app/src/core/route/routes.dart';
import 'package:my_app/src/features/login/presentation/state/login_state.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    final isVisiblePassword = useState(true);

    ref.listen<LoginState>(loginVieModel, (_, state) {
      if (state.isSuccess) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home,
          (Route<dynamic> route) => false,
        );
      } else if (state.isError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Oops!! Hubo un error al registrarse'),
          ),
        );
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'Bienvenido',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: usernameTextController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'Usuario',
                ),
                onSubmitted: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: passwordTextController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isVisiblePassword.value,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  suffix: IconButton(
                    onPressed: () {
                      isVisiblePassword.value = !isVisiblePassword.value;
                    },
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(loginVieModel.notifier).loginUser(
                              usernameTextController.text,
                              passwordTextController.text,
                            );
                      },
                      child: const Text('Iniciar sesión'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, Routes.register),
                child: const Text(
                  'Regístrate aquí',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
