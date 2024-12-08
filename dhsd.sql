CREATE DATABASE  IF NOT EXISTS `surf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `surf`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: surf
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad` (
  `id_actividad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `capacidad` int NOT NULL,
  `costo` int NOT NULL,
  PRIMARY KEY (`id_actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,'Surf','Aprende las técnicas básicas y avanzadas del surf con instructores experimentados.',20,30),(2,'Paddle Surf ','Explora la costa mientras remas sobre una tabla de paddle surf.',15,25),(3,'Yoga','Comienza tu día con una sesión relajante de yoga frente al mar.',30,15),(4,'Kayak','Descubre lugares pintorescos y cuevas marinas en un tour en kayak.',12,40);
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alojamiento`
--

DROP TABLE IF EXISTS `alojamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alojamiento` (
  `id_alojamiento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` text,
  `direccion` varchar(150) NOT NULL,
  `maps` text,
  `capacidad` int NOT NULL,
  `costo` int NOT NULL,
  `lugar` varchar(200) DEFAULT NULL,
  `cant_comprada` int DEFAULT NULL,
  `foto1` varchar(200) DEFAULT NULL,
  `foto2` varchar(200) DEFAULT NULL,
  `foto3` varchar(200) DEFAULT NULL,
  `foto4` varchar(200) DEFAULT NULL,
  `id_pack` int DEFAULT NULL,
  PRIMARY KEY (`id_alojamiento`),
  KEY `id_pack` (`id_pack`),
  CONSTRAINT `alojamiento_ibfk_1` FOREIGN KEY (`id_pack`) REFERENCES `pack` (`id_pack`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alojamiento`
--

LOCK TABLES `alojamiento` WRITE;
/*!40000 ALTER TABLE `alojamiento` DISABLE KEYS */;
INSERT INTO `alojamiento` VALUES (1,'ART SURF CAMP','Descubre nuestras instalaciones únicas del campamento-escuela de surf para menores y adultos ArtSurfcamp. Ponemos a disposición de los alumnos nuestro albergue a pie de la paradisíaca playa de Razo, a escasos 100 metros de las olas, en el municipio coruñés de Carballo, en plena Costa da Morte de Galicia.','Rúa Paseo Arenal, 13, 15107 Carballo, A Coruña','https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d511210.60058725765!2d-8.82707696397036!3d43.23428153555438!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd2e908b9ce83f23%3A0xfc3c16a4a433f4c5!2sArtsurfcamp!5e0!3m2!1ses!2ses!4v1706008409310!5m2!1ses!2ses',35,35,'GALICIA',1,'img/alojamiento1.1.png','img/alojamiento1.2.png','img/alojamiento1.3.png','img/alojamiento1.4.png',1),(2,'SURF HOUSE SURF CAMP','Nuestro Surf House está situado en el hermoso paisaje natural de Galicia, en el pequeño pueblo de Xuño, a pocos minutos de las dos playas de As Furnas y Rio Sieira. La zona es conocida por su impresionante paisaje costero, playas de arena dorada y aguas cristalinas. Alejado del bullicio del turismo masivo, el Surf House As Furnas es un refugio ideal tanto para entusiastas del surf como para amantes de la naturaleza.','Agra, 66, 15995 Porto do Son, A Coruña','https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d157991.03285881918!2d-9.060595929141614!3d42.62556314618617!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd2f30701f37fd09%3A0xea801c5a619fd01d!2sSurf%20House%20As%20Furnas!5e0!3m2!1ses!2ses!4v1706008447842!5m2!1ses!2ses',20,30,'GALICIA',1,'img/alojamiento4.png','img/alojamiento4.1.png','img/alojamiento4.4.png','img/alojamiento4.6.png',1),(3,'AREA SURF CAMP','Descubre la serenidad costera en nuestro alojamiento en Louro, A Coruña, donde la comodidad se encuentra con el encanto del océano. Con vistas panorámicas al mar y una ubicación idílica, disfruta de una estancia relajante cerca de las impresionantes playas y los encantadores paisajes de la región. Sumérgete en la auténtica experiencia gallega mientras exploras los tesoros naturales que Louro tiene para ofrecer.','Porto carral, 11, 15291 Muros, A Coruña','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d93737.96782027281!2d-9.161187290116128!3d42.760617120816505!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd2f29bbb7f07775%3A0x92a2f9f54fc6d749!2sArea%20Surf%20House!5e0!3m2!1ses!2ses!4v1706441787481!5m2!1ses!2ses',25,20,'GALICIA',1,'img/alojamiento11.png','img/alojamiento11.1.png','img/alojamiento11.2.png','img/alojamiento11.3.png',1),(4,'SURF FAST SURF CAMP','Surf & Breakfast ofrece una gran oportunidad para descubrir Galicia, uno de los mejores destinos de Surf en Europa. Surf & Breakfast se encuentra en el municipio de Valdoviño, a sólo 300 metros de una de las playas más impresionantes del Atlántico. Aquí podrás disfrutar de una atmósfera relajada e informal tras surfear nuestras magníficas olas.','Av. Ferrol s/n, 15552 Valdoviño, A Coruña','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d521612.0531606161!2d-8.823596690127472!3d43.76192405783414!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd2ddd9d164417c7%3A0x4c487622f9f176d6!2sSurf%26Breakfast!5e0!3m2!1ses!2ses!4v1706218316161!5m2!1ses!2ses',40,25,'GALICIA',0,'img/alojamiento12.png','img/alojamiento12.1.png','img/alojamiento12.2.png','img/alojamiento12.3.png',4),(5,'LLANES SURF CAMP','En el albergue, cada habitación está equipada con armario. En LLANES SURF & HOSTEL pensión completa INCLUYE CLASES DE SURF, las habitaciones tienen baño privado con ducha. Se puede jugar al ping-pong en el alojamiento, y la zona es ideal para practicar senderismo y snorkel.','C. Mayor, 33500 Llanes, Asturias','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d19494.719464852136!2d-4.789107024467635!3d43.420761684211534!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd49ebbe3de50ac7%3A0x24b98249a3cdb61e!2sLlanes%20Escuela%20de%20Surf%20%26%20Surfskate!5e0!3m2!1ses!2ses!4v1706008366804!5m2!1ses!2ses',30,25,'ASTURIAS',0,'img/alojamiento3.png','img/alojamiento3.1.png','img/alojamiento3.2.png','img/alojamiento3.3.png',6),(6,'SURF PALACE SURF CAMP','Nuestro Surf Palace frente al mar es un surfhouse situada en la entrada principal de la playa de Santa Marina. Un palacete centenario recién reformado y con una espectacular terraza desde la que mirar las olas.Con una cuidada decoración muchas de sus habitaciones tienen vistas al mar. Dispone de un gran salón común, un comedor y su propio restaurante en la terraza, donde disfrutar del mar, las olas, e increíbles atardeceres.','Albergue Roberto Frassinelli, C. Ricardo Cangas, 1, 33560 Ribadesella, Asturias','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d440056.9574812003!2d-5.63270929342539!3d43.56580806163731!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd361df3a6d276d1%3A0xeb009ca574f6b903!2sSurfcamp%20Ribadesella.!5e0!3m2!1ses!2ses!4v1706216578049!5m2!1ses!2ses',60,35,'ASTURIAS',0,'img/alojamiento7.png','img/alojamiento7.1.png','img/alojamiento7.4.png','img/alojamiento7.6.png',8),(7,'CARVING SURF CAMP','Nuestro Hostel es un albergue turístico se encuentra en el muelle del puerto de San Esteban (Muros de Nalón – Asturias), en la desembocadura del Río Nalón. Ha sido renovado completamente en 2019, con el objetivo de dotar las instalaciones de una nueva presencia y comodidad, tanto para el público general como peregrinos o apoyo de alojamiento a nuestros cursos y actividades.','Campo frio, s/n, 33138','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d370024.433696748!2d-6.254592426704348!3d43.56871934194172!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd36a1ddad1e3f29%3A0xee44a4218b8a101d!2sCarving%20Surf%20School!5e0!3m2!1ses!2ses!4v1706217467504!5m2!1ses!2ses',25,20,'ASTURIAS',0,'img/alojamiento8.png','img/alojamiento8.1.png','img/alojamiento8.2.png','img/alojamiento8.3.png',6),(8,'LAS DUNAS SURF CAMP','En nuestras instalaciones contamos un chalet de 500 m2 con más de 500m2 de finca donde encontrarás todo lo necesario para una cómoda estancia. Servicios como gimnasio, wifi gratuito… y todo a un paso de la playa y la zona de olas. Además, podréis disfrutar del entorno que rodea nuestro Surfcamp y el ambiente surfer del pueblo de Salinas.','C/ Bernardo Álvarez Galán, 1, 33405 Salinas, Asturias','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d739251.2285784251!2d-6.772498969299767!3d43.633600270607545!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd369c6b5b58adc3%3A0x902a374ad8b7ae33!2sFamily%20Surfers%20-%20Surfcamp%20Las%20Dunas%20-%20Salinas!5e0!3m2!1ses!2ses!4v1706221813122!5m2!1ses!2ses',50,35,'ASTURIAS',0,'img/alojamiento10.png','img/alojamiento10.1.png','img/alojamiento10.2.png','img/alojamiento10.3.png',8),(9,'OYAMBRE SURF CAMP','El Oyambre Surf Camp se encuentra en Los Llaós, a 300 metros de Oyambre y a 2,4 km de Gerra, y ofrece jardín y terraza. Esta tienda de lujo sirve un desayuno continental. El Golf Abra del Pas se encuentra a 47 km del Oyambre Surf Camp. El aeropuerto más cercano es el de Santander, ubicado a 56 km.','CA-131, 107, 39528 Los Llaos, Cantabria','https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d156133.44770964616!2d-4.381081617810734!3d43.35251302787307!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd490b42c3e065ab%3A0x41fb32a32b81806f!2sStar%20Surf%20Camps%20-%20Oyambre!5e0!3m2!1ses!2ses!4v1706008245196!5m2!1ses!2ses',45,30,'CANTABRIA',0,'img/alojamiento2.png','img/alojamiento2.1.png','img/alojamiento2.2.png','img/alojamiento2.3.png',4),(10,'LAS WAVES SURF CAMP','La Wave Surf House es una casa rural con la arquitectura típica de Cantabria, ubicada entre el pueblo de Somo y Loredo (Cantabria) a 5 minutos caminando de la playa, la espectacular primera reserva de surf de España con mas de 4 km de playa de arena blanca y rompientes para practicar el Surf sin peligro muy cerca de la misma bahía de Santander.','CA-131, 107, 39528 Los Llaos, Cantabria','https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d156133.44770964616!2d-4.381081617810734!3d43.35251302787307!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd490b42c3e065ab%3A0x41fb32a32b81806f!2sStar%20Surf%20Camps%20-%20Oyambre!5e0!3m2!1ses!2ses!4v1706008245196!5m2!1ses!2ses',55,45,'CANTABRIA',0,'img/alojamiento6.png','img/alojamiento6.1.png','img/alojamiento6.2.png','img/alojamiento6.4.png',6),(11,'ZARAUTZ SURF CAMP','Moderno y confortable alojamiento turístico de tipo villa completamente equipado con todo lo necesario para una estancia agradable. Cuenta con varias terrazas, jardín, salón y baños. Nuestra SURF HOUSE se encuentra en el centro de Zarautz a escasos minutos andando del casco antiguo y la playa. Dispone de tres plantas. En la planta baja encontraréis un amplio salón con pufs y sofá, TV interactiva, Netflix y WIFI. Además de un jardín con mesas, sillas y tumbonas.','Malecón de Zarautz, Nafarroa Kalea, 25, A, Bajo, 20800 Zarautz, Gipuzkoa','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d884491.8798582004!2d-2.86953689343887!3d43.2653333040251!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd51c85d2093e6db%3A0x9c8394a64e692ae2!2sNorth%20Shore%20Surf%20Camp!5e0!3m2!1ses!2ses!4v1706213124632!5m2!1ses!2ses',40,30,'PAIS VASCO',0,'img/alojamiento5.png','img/alojamiento5.2.png','img/alojamiento5.3.png','img/alojamiento5.4.png',4),(12,'SURFSOUL SURF CAMP','SurfSoul se encuentra en Zarautz y ofrece alojamiento con jardín, salón de uso común y terraza frente a la playa, a pocos pasos de Playa de Zarautz. El alojamiento está a 19 km de Funicular Monte Igueldo, a 19 km de Paseo de La Concha y a 20 km de Peine del Viento. El albergue libre de humo ofrece wifi gratis en todo el alojamiento.','Nafarroa Kalea, 10, 20800 Zarautz, Gipuzkoa','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d933154.5131362212!2d-2.9221729138232675!3d43.520159308701594!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd51c9bb8b95a2bf%3A0xe1f436ff931c496e!2sZarautz%20Surf%20House!5e0!3m2!1ses!2ses!4v1706219268711!5m2!1ses!2ses',50,25,'PAIS VASCO',0,'img/alojamiento9.png','img/alojamiento9.1.png','img/alojamiento9.2.png','img/alojamiento9.1.png',8);
/*!40000 ALTER TABLE `alojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id_carrito` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `id_usuario` int NOT NULL,
  `id_producto` int NOT NULL,
  PRIMARY KEY (`id_carrito`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `id_instructor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `email` varchar(90) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `id_actividad` int DEFAULT NULL,
  PRIMARY KEY (`id_instructor`),
  KEY `id_actividad` (`id_actividad`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Alejandro','García','alejandro.garcia@email.com','555666777',1),(2,'Sofía','Hernández','sofia.hernandez@email.com','999888777',2),(3,'Javier','Díaz','javier.diaz@email.com','333444555',3),(4,'Elena','Fernández','elena.fernandez@email.com','777111222',4),(5,'Paula','Gómez','paula.gomez@email.com','111000888',3),(6,'Adrián','Martínez','adrian.martinez@email.com','999555111',1),(7,'Carmen','Sánchez','carmen.sanchez@email.com','444111777',2);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pack`
--

DROP TABLE IF EXISTS `pack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pack` (
  `id_pack` int NOT NULL AUTO_INCREMENT,
  `cant_actv` int NOT NULL,
  `costo` int NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `descripcion` text,
  `foto` varchar(200) DEFAULT NULL,
  `cant_comprada` int DEFAULT NULL,
  `id_actividad` int DEFAULT NULL,
  PRIMARY KEY (`id_pack`),
  KEY `id_actividad` (`id_actividad`),
  CONSTRAINT `pack_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pack`
--

LOCK TABLES `pack` WRITE;
/*!40000 ALTER TABLE `pack` DISABLE KEYS */;
INSERT INTO `pack` VALUES (1,5,70,'¡EXPLORA LAS OLAS!','Sumérgete en el emocionante mundo del surf con nuestro pack de 5 clases diseñado para todos los niveles. Aprende las técnicas esenciales, desafía las olas y descubre la pasión del surf con instructores expertos. ¡Prepárate para una experiencia acuática inolvidable y haz del océano tu patio de juegos!','img/packsurf5.png',2,1),(2,8,110,'¡DOMINA LAS MAREAS!','Con nuestro pack de 8 clases, llevamos tu habilidad en el surf al siguiente nivel. Desde las bases hasta las maniobras avanzadas, nuestros instructores te guiarán en cada paso. Sumérgete en las mareas, perfecciona tu equilibrio y vive la emoción del surf como nunca antes. ¡Conviértete en el amo de las olas!','img/packsurf8.png',0,1),(3,10,200,'¡AVENTURA INFINITA EN EL MAR!','Embárcate en una aventura de surf con nuestro pack de 10 clases. Descubre la magia del océano, perfecciona tus habilidades y experimenta la libertad que solo el surf puede ofrecer. Con sesiones personalizadas y un enfoque progresivo, este pack te llevará a explorar nuevas alturas. ¡Haz del surf tu estilo de vida!','img/packsurf10.png',0,1),(4,3,50,'EXPLORADOR DEL MAR','Descubre la esencia del Paddle Surf con nuestro pack de iniciación. Aprende las técnicas fundamentales, equilibrio y disfruta de tres clases diseñadas para aquellos que dan sus primeros pasos en este apasionante deporte acuático. ¡Sumérgete en la diversión desde el principio!','img/packpaddle3.png',1,2),(5,5,80,'MAESTRIA ACUATICA','Conviértete en un verdadero explorador del mar con nuestro pack de 5 clases de Paddle Surf. Navega por las aguas, perfecciona tu técnica y adéntrate en rutas más desafiantes. Este pack es perfecto para aquellos que desean explorar nuevas fronteras y experimentar la libertad que solo el Paddle Surf puede ofrecer.','img/packpaddle5.png',0,2),(6,2,30,'CAMINO HACIA EL ZEN INTERIOR','Experimenta la armonía y el equilibrio con nuestro Pack Bienestar de 2 clases de Yoga. Sumérgete en la relajación profunda y aprende posturas esenciales que revitalizarán tu cuerpo y mente. Perfecto para aquellos que buscan un respiro y un impulso de energía positiva.','img/packyoga2.png',0,3),(7,5,60,'EQUILIBRIO Y BIENESTAR','Encuentra la paz interior y la renovación total con nuestro Pack de 5 clases de Yoga. Explora diferentes estilos, desde el Hatha al Vinyasa, y descubre la conexión entre tu cuerpo y mente. Este pack te guiará hacia la transformación personal y el bienestar integral. ¡Empieza tu viaje hacia una vida más saludable y equilibrada!','img/packyoga5.png',0,3),(8,3,60,'INICIACION AL KAYAK','Embárcate en una emocionante travesía acuática con tres clases diseñadas para iniciarte en este deporte acuático. Nuestros instructores expertos te guiarán a través de las aguas, enseñándote las técnicas fundamentales y brindándote una experiencia única que despertará tu amor por el kayak.','img/packkayak3.png',0,4),(9,5,90,'MAESTRO DEL KAYAK','Este pack intermedio te lleva más allá de las nociones básicas, perfeccionando tus habilidades y proporcionándote la confianza necesaria para explorar aguas más desafiantes. Descubre nuevas rutas, domina las técnicas avanzadas y sumérgete en la aventura con cinco emocionantes sesiones de kayak.','img/packkayak5.png',0,4);
/*!40000 ALTER TABLE `pack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `cantidad` int NOT NULL,
  `costo` int NOT NULL,
  `cant_comprada` int DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'MISFIT DOPE MACHINE 5\"6\"\"',7,539,3,'img/tabla1.png'),(2,'SPEED EGG TWIN 6',10,653,3,'img/tabla2.png'),(3,'BING PINTAIL LIGHTWEIGHT 9\"2\"\"',6,956,2,'img/tabla3.png'),(4,'BING CONTINENTAL 9\"6\"\"',12,983,4,'img/tabla4.png'),(5,'QUILLAS FUTURES AIPA & MAYHEM',15,225,0,'img/quilla1.png'),(6,'QUILLAS FCS II MARK RICHARDS ',12,119,0,'img/quilla2.png'),(7,'QUILLAS FCS CONNECT NEO 9\"\"',7,75,0,'img/quilla3.png'),(8,'QUILLA TRUE AMES GG 9.0\"\"',7,89,0,'img/quilla4.png'),(9,'INVENTO TBLS PRO 6\"',10,23,0,'img/invento1.png'),(10,'INVENTO TBLS PRO 8\"',10,27,0,'img/invento2.png'),(11,'INVENTO TBLS PRO 9\"',10,30,0,'img/invento3.png'),(12,'INVENTO TBLS PRO 10\"',10,31,0,'img/invento4.png'),(13,'NEOPRENO BILLABONG INTRUDER 5/4',5,139,0,'img/neopreno1.png'),(14,'NEOPRENO BILLABONG INTRUDER 4/3',5,132,0,'img/neopreno2.png'),(15,'NEOPRENO BILLABONG LAUNCH 5/4',5,188,0,'img/neopreno3.png'),(16,'NEOPRENO BILLABONG LAUNCH 4/3',5,179,0,'img/neopreno4.png');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nom_usuario` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'juan_perez','Juan','Pérez','clave123','juan.perez@example.com','123456789'),(2,'ana_gomez','Ana','Gómez','clave456','ana.gomez@example.com','987654321'),(3,'carlos_rivera','Carlos','Rivera','clave789','carlos.rivera@example.com','111222333'),(4,'laura_martin','Laura','Martín','claveabc','laura.martin@example.com','444555666'),(5,'pedro_sanchez','Pedro','Sánchez','clavexyz','pedro.sanchez@example.com','777888999'),(6,'maria_lopez','Maria','López','clave123','maria.lopez@example.com','111000222'),(7,'raul_fernandez','Raúl','Fernández','clave456','raul.fernandez@example.com','333444555'),(8,'clara_rodriguez','Clara','Rodríguez','clave789','clara.rodriguez@example.com','999888777'),(9,'jorge_gonzalez','Jorge','González','claveabc','jorge.gonzalez@example.com','123321123'),(10,'silvia_diaz','Silvia','Díaz','clavexyz','silvia.diaz@example.com','456654456'),(11,'root','root','root','1234','root@example.com','456654456'),(12,'prueba','prueba','prueba','1234','prueba@example.com','456654456');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_alojamiento`
--

DROP TABLE IF EXISTS `usuario_alojamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_alojamiento` (
  `id_usuario_alojamiento` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `fecha_entrada` date DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `id_alojamiento` int NOT NULL,
  PRIMARY KEY (`id_usuario_alojamiento`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_alojamiento` (`id_alojamiento`),
  CONSTRAINT `usuario_alojamiento_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `usuario_alojamiento_ibfk_2` FOREIGN KEY (`id_alojamiento`) REFERENCES `alojamiento` (`id_alojamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_alojamiento`
--

LOCK TABLES `usuario_alojamiento` WRITE;
/*!40000 ALTER TABLE `usuario_alojamiento` DISABLE KEYS */;
INSERT INTO `usuario_alojamiento` VALUES (1,12,'2024-06-07','2024-06-08',2),(2,12,'2024-06-17','2024-06-28',1);
/*!40000 ALTER TABLE `usuario_alojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_pack`
--

DROP TABLE IF EXISTS `usuario_pack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_pack` (
  `id_usuario_pack` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `id_pack` int NOT NULL,
  PRIMARY KEY (`id_usuario_pack`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_pack` (`id_pack`),
  CONSTRAINT `usuario_pack_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `usuario_pack_ibfk_2` FOREIGN KEY (`id_pack`) REFERENCES `pack` (`id_pack`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_pack`
--

LOCK TABLES `usuario_pack` WRITE;
/*!40000 ALTER TABLE `usuario_pack` DISABLE KEYS */;
INSERT INTO `usuario_pack` VALUES (1,12,'2024-06-07',1),(2,12,'2024-06-08',1);
/*!40000 ALTER TABLE `usuario_pack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_producto`
--

DROP TABLE IF EXISTS `usuario_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_producto` (
  `id_usuario_producto` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_usuario_producto`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `usuario_producto_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `usuario_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_producto`
--

LOCK TABLES `usuario_producto` WRITE;
/*!40000 ALTER TABLE `usuario_producto` DISABLE KEYS */;
INSERT INTO `usuario_producto` VALUES (1,12,'2024-06-05',2,1),(2,12,'2024-06-05',3,2),(3,NULL,'2024-06-05',1,10),(14,1,'2024-06-06',2,2),(15,1,'2024-06-06',1,1);
/*!40000 ALTER TABLE `usuario_producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-11 18:07:48
