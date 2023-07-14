CREATE TABLE `hotel` (
  `id` integer PRIMARY KEY,
  `habitacion_id` integer,
  `admin_id` integer
);

CREATE TABLE `reservas` (
  `id` integer,
  `hotel_id` integer,
  `habitacion_id` integer,
  `start_date` date,
  `end_date` date,
  `price_per_night` integer,
  `num_nights` varchar(31)
);

CREATE TABLE `pasajeros` (
  `id` integer PRIMARY KEY,
  `dni_id` varchar(08) UNIQUE NOT NULL,
  `apellido_id` varchar(40),
  `nombre_id` varchar(30),
  `direccion` varchar(30),
  `ciudad_id` varchar(10)
);

CREATE TABLE `comprobantes` (
  `id` integer PRIMARY KEY,
  `reservas_id` integer,
  `pasajero_id` integer
);

CREATE TABLE `administrador` (
  `id` integer PRIMARY KEY,
  `hotel_id` integer
);

CREATE TABLE `ciudades` (
  `id` integer PRIMARY KEY,
  `nombre` varchar(10)
);

ALTER TABLE `reservas` ADD FOREIGN KEY (`habitacion_id`) REFERENCES `hotel` (`habitacion_id`);

ALTER TABLE `reservas` ADD FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`);

ALTER TABLE `administrador` ADD FOREIGN KEY (`id`) REFERENCES `hotel` (`admin_id`);

ALTER TABLE `comprobantes` ADD FOREIGN KEY (`reservas_id`) REFERENCES `reservas` (`id`);

ALTER TABLE `pasajeros` ADD FOREIGN KEY (`id`) REFERENCES `comprobantes` (`pasajero_id`);

ALTER TABLE `ciudades` ADD FOREIGN KEY (`id`) REFERENCES `pasajeros` (`ciudad_id`);
