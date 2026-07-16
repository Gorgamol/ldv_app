import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/api/ldv_http_client.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/maintenance/domain/interfaces/create_maintenance_item_port.dart';
import 'package:ldv_app/features/maintenance/domain/interfaces/delete_maintentance_item_port.dart';
import 'package:ldv_app/features/maintenance/domain/interfaces/fetch_maintenance_details_port.dart';
import 'package:ldv_app/features/maintenance/domain/interfaces/fetch_maintenance_items_port.dart';
import 'package:ldv_app/features/maintenance/domain/interfaces/update_maintenance_item_port.dart';
import 'package:ldv_app/features/maintenance/domain/models/maintenance_image.dart';
import 'package:ldv_app/features/maintenance/domain/models/maintenance_item.dart';
import 'package:ldv_app/features/maintenance/domain/models/maintenance_update.dart';

@injectable
class MaintenanceHttpAdapter
    implements
        FetchMaintenanceItemsPort,
        FetchMaintenanceDetailsPort,
        CreateMaintenanceItemPort,
        UpdateMaintenanceItemPort,
        DeleteMaintentanceItemPort {
  const MaintenanceHttpAdapter(this._client);

  final LdvHttpClient _client;

  @override
  Future<List<MaintenanceItem>> fetchData({required Branch branch}) async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      MaintenanceItem(
        title: 'Flügel Zustand',
        description:
            'Der Zustand der Flügel soll erfasst werden. Bitte zu jedem Flügel folgendes dokumentieren und eventuell entstehende Aufgaben daraus erstellen:\n\n• Flügel Nummer\n• Auffälligkeiten/Zustand des Flügels\n\nDie Flügel Nummer ist in Kerben (1-4 je nach Flügel) am jeweiligen Flügel eingeritzt.',
        author: 'Bernd-Thomas Martens',
        updatedAt: DateTime.now(),
        thumbnail: const MaintenanceImage(
          url:
              'https://media.istockphoto.com/id/695733614/photo/white-male-call-duck.jpg?s=612x612&w=0&k=20&c=JB1qeE_J-yQ35CkgLLl6qHAuDWE0DLZmtqUYJyZU2Ts=',
        ),
        updates: [
          const MaintenanceUpdate(
            author: 'Bernd-Thomas Martens',
            description:
                'Flügel 1:\n• Keine sichtbaren Beschädigungen.\n\n'
                'Flügel 2:\n• Innensaumleiste Achterheck in Ordnung\n\n• Dünne Leiste neben Innensaumleiste beschädigt. 3,3cm x 2,5cm x 450cm.\n\n'
                'Flügel 3:\n• Innensaumleiste Achterheck leicht beschädigt. 4cm x 5cm x 450cm\n\n• Zweite Querleiste unten Achterheck beschädigt. 4cm x 5cm x 140cm.\n\n'
                'Flügel 4:\n• Innensaumleiste Achterheck stark beschädigt. 4cm x 5cm x 450cm\n\n',
          ),
        ],
      ),
      MaintenanceItem(
        title: 'Wartung mit Bildern und einem langen Titel',
        description: 'Hier wird ein Beispielbereich mit Bildern dargestellt.',
        author: 'Bernd-Thomas Martens',
        updatedAt: DateTime.now(),
        thumbnail: MaintenanceImage(url: _getRandomPokemonArtworkUrl),
        images: [
          MaintenanceImage(title: 'Von oben', url: _getRandomPokemonArtworkUrl),
          MaintenanceImage(
            title: 'Von der Seite',
            url: _getRandomPokemonArtworkUrl,
          ),
          MaintenanceImage(url: _getRandomPokemonArtworkUrl),
          MaintenanceImage(
            title: 'Auf den Hebel aufpassen',
            url: _getRandomPokemonArtworkUrl,
          ),
        ],
        updates: [
          MaintenanceUpdate(
            createdAt: DateTime.now(),
            author: 'Bernd-Thomas Martens',
            description: 'Mehrere Bilder werden angezeigt.',
            images: [
              MaintenanceImage(
                title: 'Kleine Beschreibung.',
                url: _getRandomPokemonArtworkUrl,
              ),
              MaintenanceImage(url: _getRandomPokemonArtworkUrl),
              MaintenanceImage(
                title: 'Hier ist eine etwas größere Beschreibung für ein Bild.',
                url: _getRandomPokemonArtworkUrl,
              ),
            ],
          ),
          MaintenanceUpdate(
            createdAt: DateTime.now(),
            author: 'Bernd-Thomas Martens',
            description: 'Hier werden keine Bilder angezeigt.',
          ),
          MaintenanceUpdate(
            createdAt: DateTime.now(),
            author: 'Bernd-Thomas Martens',
            description: 'Hier wird ein Bild angezeigt.',
            images: [
              MaintenanceImage(
                title: 'Das hier wurde repariert.',
                url: _getRandomPokemonArtworkUrl,
              ),
            ],
          ),
        ],
      ),
    ];
  }
}

String get _getRandomPokemonArtworkUrl {
  final random = Random();
  final pokemonId = random.nextInt(386) + 1;

  return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokemonId.png';
}
