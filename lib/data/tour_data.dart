import 'package:flutter/material.dart';

final List<Map<String, dynamic>> tourDays = const [
  {
    'title': 'Día 1: Tour Urbano ',
    'imageUrl': 'assets/exploracion_urbana.jpg',
    'itinerary': [
      {
        'title': 'Desayuno en Café Central',
        'content':
            'Comienza tu día con un delicioso desayuno en el Café Central, conocido por su café artesanal y pasteles frescos.',
        'icon': Icons.local_cafe,
      },
    ],
  },

  {
    'title': 'Día 2: Naturaleza y Senderismo',
    'imageUrl': 'assets/naturaleza_senderismo.jpg',
    'itinerary': [
      {
        'title': 'Desayuno en Bistró Verde',
        'content':
            'Comienza tu día con un desayuno saludable en Bistró Verde, famoso por sus opciones orgánicas y veganas.',
        'icon': Icons.local_cafe,
      },
      {
        'title': 'Excursión al Parque Nacional',
        'content':
            'Únete a una excursión guiada por el Parque Nacional para descubrir la flora y fauna local.',
        'icon': Icons.park,
      },
      {
        'title': 'Almuerzo tipo picnic',
        'content':
            'Disfruta de un almuerzo tipo picnic en una zona designada dentro del parque, rodeado de naturaleza.',
        'icon': Icons.lunch_dining,
      },
    ],
  },
  {
    'title': 'Día 3: Gastronomía Local',
    'imageUrl': 'assets/gastronomia_local.jpg',
    'itinerary': [
      {
        'title': 'Desayuno en Mercado Gourmet',
        'content':
            'Comienza tu día explorando los sabores locales en el Mercado Gourmet, donde encontrarás productos frescos y artesanales.',
        'icon': Icons.local_grocery_store,
      },
      {
        'title': 'Clase de Cocina',
        'content':
            'Participa en una clase de cocina para aprender a preparar platos típicos de la región con un chef local.',
        'icon': Icons.kitchen,
      },
      {
        'title': 'Almuerzo en Restaurante El Sabor',
        'content':
            'Disfruta de un almuerzo en El Sabor, conocido por su menú de temporada y su enfoque en ingredientes locales.',
        'icon': Icons.restaurant,
      },
    ],
  },

  {
    'title': 'Día 4: Museos y Arte ',
    'imageUrl': 'assets/museos_y_arte.jpg',
    'itinerary': [],
  },

  {
    'title': 'Día 5: Playas y Sol ',
    'imageUrl': 'assets/playa.jpg',
    'itinerary': [],
  },

  {
    'title': 'Día 6: Mercados y Compras ',
    'imageUrl': 'assets/mercado.jpg',
    'itinerary': [],
  },
];
