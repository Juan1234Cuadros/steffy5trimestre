import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  PeliculasScreen (),
    );
  }
}

class ContadorScreen extends StatefulWidget {
  const ContadorScreen({super.key});

  @override
  State<ContadorScreen> createState() => _ContadorScreenState();
}

class _ContadorScreenState extends State<ContadorScreen> {
  int asistentes = 0;

  void ingresarPersona() {
    setState(() {
      asistentes++;
    });
  }

  void salirPersona() {
    setState(() {
      if (asistentes > 0) {
        asistentes--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro de Asistentes")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("cuantos han asistido", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text("$asistentes", style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: salirPersona,
                  child: const Text("Salió persona"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: ingresarPersona,
                  child: const Text("Ingresó persona"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//seguindo ejemplo


class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  // Variable que guarda el color actual
  Color colorFondo = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos la variable para definir el color de fondo
      backgroundColor: colorFondo,
      appBar: AppBar(title: const Text("Selector de Color")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Presiona un botón para cambiar el fondo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => colorFondo = Colors.blue),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text("Azul", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => setState(() => colorFondo = Colors.green),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Verde", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => setState(() => colorFondo = Colors.orange),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text("Naranja", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//3 ejemplop


class TareasScreen extends StatefulWidget {
  const TareasScreen({super.key});

  @override
  State<TareasScreen> createState() => _TareasScreenState();
}

class _TareasScreenState extends State<TareasScreen> {
  final TextEditingController controller = TextEditingController();
  final List<String> tareas = []; // Aquí guardaremos nuestras tareas

  void agregarTarea() {
    setState(() {
      if (controller.text.isNotEmpty) {
        tareas.add(controller.text); // Agregamos el texto a la lista
        controller.clear(); // Limpiamos el campo de texto
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro de Tareas")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(labelText: 'Nueva tarea'),
                  ),
                ),
                IconButton(
                  onPressed: agregarTarea,
                  icon: const Icon(Icons.add_box, color: Colors.teal, size: 40),
                )
              ],
            ),
          ),
          Expanded(
            // ListView.builder crea los elementos de la lista según sea necesario
            child: ListView.builder(
              itemCount: tareas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.task_alt),
                  title: Text(tareas[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//4 ejemplo



class TemperaturaScreen extends StatefulWidget {
  const TemperaturaScreen({super.key});

  @override
  State<TemperaturaScreen> createState() => _TemperaturaScreenState();
}

class _TemperaturaScreenState extends State<TemperaturaScreen> {
  int temperatura = 20;

  // Lógica para obtener el mensaje basado en la temperatura
  String obtenerMensaje() {
    if (temperatura < 18) return "Frío ❄️";
    if (temperatura <= 25) return "Agradable 😊";
    return "Caluroso 🔥";
  }

  void modificarTemperatura(int cambio) {
    setState(() {
      temperatura += cambio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simulador de Temperatura")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$temperatura°C",
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              obtenerMensaje(),
              style: const TextStyle(fontSize: 24, color: Colors.blueGrey),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => modificarTemperatura(-1),
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => modificarTemperatura(1),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//5 ejemplo




class Pelicula {
  String nombre;
  bool esFavorita;

  Pelicula({required this.nombre, this.esFavorita = false});
}

class PeliculasScreen extends StatefulWidget {
  const PeliculasScreen({super.key});

  @override
  State<PeliculasScreen> createState() => _PeliculasScreenState();
}

class _PeliculasScreenState extends State<PeliculasScreen> {
  // Lista inicial de películas
  final List<Pelicula> peliculas = [
    Pelicula(nombre: "Avatar"),
    Pelicula(nombre: "Interestelar"),
    Pelicula(nombre: "Titanic"),
    Pelicula(nombre: "Minecraft Movie"),
    Pelicula(nombre: "Deadpool"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catálogo de Películas")),
      body: ListView.builder(
        itemCount: peliculas.length,
        itemBuilder: (context, index) {
          final pelicula = peliculas[index];
          return ListTile(
            title: Text(pelicula.nombre),
            trailing: IconButton(
              icon: Icon(
                pelicula.esFavorita ? Icons.favorite : Icons.favorite_border,
                color: pelicula.esFavorita ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                // Al hacer clic, invertimos el valor de esFavorita
                setState(() {
                  pelicula.esFavorita = !pelicula.esFavorita;
                });
              },
            ),
          );
        },
      ),
    );
  }
}