// TODO(alestiago): remove this file.

import 'package:puzzle_models/puzzle_models.dart';

class GamePuzzles {
  static final games = [
    SimpleRushPuzzle(
      difficulty: PuzzleDifficulty.beginner,
      vehicles: [
        Vehicle(
          id: 'A',
          type: VehicleType.taxi,
          steering: Steering.horizontal,
          firstPosition: const Position(0, 0),
        ),
        Vehicle(
          id: 'P',
          type: VehicleType.bus,
          steering: Steering.vertical,
          firstPosition: const Position(0, 1),
        ),
        Vehicle(
          id: 'B',
          type: VehicleType.car,
          steering: Steering.vertical,
          firstPosition: const Position(0, 4),
        ),
        Vehicle(
          id: 'X',
          type: VehicleType.ambulance,
          steering: Steering.horizontal,
          firstPosition: const Position(1, 2),
        ),
        Vehicle(
          id: 'Q',
          type: VehicleType.truck,
          steering: Steering.vertical,
          firstPosition: const Position(3, 1),
        ),
        Vehicle(
          id: 'R',
          type: VehicleType.bus,
          steering: Steering.horizontal,
          firstPosition: const Position(2, 5),
        ),
        Vehicle(
          id: 'C',
          type: VehicleType.car,
          steering: Steering.horizontal,
          firstPosition: const Position(4, 4),
        ),
        Vehicle(
          id: 'O',
          type: VehicleType.truck,
          steering: Steering.vertical,
          firstPosition: const Position(5, 0),
        ),
      ],
    ),
  ];
}

class SimpleRushPuzzle extends RushPuzzle {
  SimpleRushPuzzle({
    required PuzzleDifficulty difficulty,
    required List<Vehicle> vehicles,
  }) : super(
          difficulty: difficulty,
          jammedVehicleId: 'X',
          vehicles: {
            for (final vehicle in vehicles) vehicle.id: vehicle,
          },
        );
}
