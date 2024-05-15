// // Obtener los argumentos pasados a esta ruta
//     final arguments = ModalRoute.of(context)!.settings.arguments;

//     // Verificar si los argumentos son del tipo esperado (en este caso, el
//     // índice)
//     if (arguments is int) {
//       // Convertir el índice a un valor válido para el PageView
//       final index = arguments;

//       // Obtener la instancia de CarrerasModel del Provider
//       final carreras = context.watch<CarrerasModel>();
//       rd.initScreen(context);
//       return Scaffold(
//         drawer: context.watch<ViewMenu>().widgetDrawer,
//         appBar: AppBar(
//           toolbarHeight: 60,
//           backgroundColor: Colores.colorAppBar,
//           title: TitleBar(),
//           centerTitle: true,
//           elevation: 1,
//           actionsIconTheme: const IconThemeData(
//             color: Color.fromARGB(255, 0, 0, 0),
//           ),
//           actions: [
//             if (LoginController().authService.status ==
//                 AuthStatus.Authenticated)
//               IconButton(
//                 icon: const Icon(Icons.exit_to_app),
//                 onPressed: () {
//                   LoginController().signOut(context);
//                 },
//               ),
//           ],
//         ),
//         body: PageView.builder(
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//           itemCount: carreras.carreras.length,
//           controller: PageController(initialPage: index),
//           itemBuilder: (context, index) {
//             index = index % carreras.carreras.length;
//             return Image.network(carreras.carreras[index].toString());
//           },
//         ),
//       );
//     } else {
//       // Manejar el caso en el que los argumentos no sean del tipo esperado
//       return const Scaffold(
//         body: Center(
//           child: Text('Argumentos inválidos'),
//         ),
//       );
//     }
