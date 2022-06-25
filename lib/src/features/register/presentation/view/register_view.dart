import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/src/core/dependency/dependencies.dart';
import 'package:my_app/src/core/route/routes.dart';
import 'package:my_app/src/features/register/presentation/state/register_state.dart';

class RegisterView extends HookConsumerWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameTextController = useTextEditingController();
    final usernameTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    final isVisiblePassword = useState(true);

    ref.listen<RegisterState>(registerViewModel, (_, state) {
      if (state.isSuccess) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home,
          (Route<dynamic> route) => false,
        );
      } else if (state.isError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Oops!! Hubo un error al iniciar sesión'),
          ),
        );
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'Regístrate',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: nameTextController,
                decoration: InputDecoration(
                  hintText: 'Nombre',
                  suffix: IconButton(
                    onPressed: nameTextController.clear,
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: usernameTextController,
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  suffix: IconButton(
                    onPressed: usernameTextController.clear,
                    icon: const Icon(Icons.close),
                  ),
                ),
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
                        ref.read(registerViewModel.notifier).register(
                              nameTextController.text,
                              usernameTextController.text,
                              passwordTextController.text,
                            );
                      },
                      child: const Text('Registrarse'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
