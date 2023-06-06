-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: web2
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `recipe_id` int NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(255) DEFAULT NULL,
  `description` text,
  `ingredients` text,
  `instructions` text,
  `image` blob,
  `servings` int DEFAULT NULL,
  `prep_time` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`recipe_id`),
  KEY `category_id` (`category_id`),
  KEY `recipes_ibk_2_idx` (`user_id`),
  CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recipes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (63,'Pork Adobo','Classic Filipino dish. Tender pork marinated in soy sauce and vinegar, braised until flavorful. Served with rice. Savory, tangy, and delicious.','20 grams vegetable oil\r\n1 tbsp garlic, crushed\r\n35 grams onions, minced\r\n1/2 kg pork belly, sliced\r\n10 g (1 pc) Knorr Pork Cubes\r\n45 ml Knorr Liquid Seasoning\r\n100 ml water\r\n25 ml vinegar\r\n3 pcs laurel leaves\r\n1 tsp brown sugar\r\n2 grams whole black pepper','Heat a pot over medium heat and add some oil. Once the pot is hot, sauté garlic and onions until they become fragrant.\r\nAdd the pork to the pot and continue sautéing until it is cooked through.\r\nPour Knorr Liquid Seasoning, water, vinegar, laurel leaves, sugar, and pepper into the pot. Also, add 1 piece of Knorr Pork Cube for added flavor.\r\nIncrease the heat and bring the mixture to a boil. Once it boils, reduce the heat to a simmer. It\'s important to leave the pan uncovered to allow the vinegar to evaporate. Simmer the mixture for about 10 more minutes.\r\nRemove the meat from the sauce and set it aside.\r\nIn a separate pan, fry the meat until it becomes crispy and gains color.\r\nReturn the fried meat to the sauce in the pot.\r\nReheat the pot and continue to simmer the meat in the sauce until the sauce thickens to your desired consistency.',_binary 'adobo.png',3,44,2,'2023-06-05 08:12:09','2023-06-05 08:15:12',26),(64,'Sopas','\"Sopas is a comforting Filipino dish made with elbow macaroni, chicken, and vegetables in a creamy broth. It\'s a delicious and hearty soup that is perfect for a cozy meal.\"','1 pc onion chopped\r\n1 clove garlic chopped\r\n2 cup water\r\n1 Knorr Chicken Cube\r\n1 bag 50g elbow macaroni\r\n1 small egg piece carrot sliced diagonally\r\n1/4 cup evaporada','Igisa ang sibuyas at bawang sa kawali sa moderate na init ng apoy.\r\nIdagdag ang tubig at chicken cube sa kawali. Pakuluin ang sabaw.\r\nKapag kumukulo na ang sabaw, idagdag ang elbow macaroni. Hayaang maluto hanggang sa lumambot ang macaroni.\r\nPagkatapos, idagdag ang carrots sa kawali. Ilagay ang gatas.\r\nHayaan itong maluto ng ilang minuto hanggang sa malambot ang carrots at lumapot ang sabaw.\r\nMatapos maluto, ihain ang sopas nang mainit. Enjoy!',_binary 'sopas.png',5,30,1,'2023-06-05 08:25:12','2023-06-05 08:25:12',26),(65,'Kinilaw','Kinilaw is a traditional Filipino dish that consists of raw seafood or meat marinated in vinegar, citrus juice, and spices, resulting in a refreshing and tangy flavor.','1 pounds Tanigue or Tuna skinned and deboned\r\n1 cup vinegar\r\n4 pieces calamansi or half of a lemon\r\n2 thumbs ginger minced\r\n1 medium red onion minced\r\n2 pieces green chili or Thai chili, cut into thin slices \r\nsalt\r\nfresh ground pepper','Wash the fish meat and tap dry with paper towels. Cut into 1-inch cubes.\r\nPlace the fish cubes in a bowl. Pour in the vinegar and the juice from calamansi. Season with salt and pepper. Add the ginger, onion, and chili. Toss gently until well blended.\r\nCover and marinate for an hour or up to 3 hours in the fridge. The fish should lose its translucent and pinkish color and should turn whiter and opaque.\r\nTransfer to a serving dish and serve immediately.',_binary 'kinilaw.png',4,65,4,'2023-06-05 09:18:20','2023-06-05 09:18:49',25),(66,'Tinolang Manok','Chicken tinola is a Filipino soup made with chicken, ginger, garlic, and vegetables, simmered in a flavorful broth. Comforting and nourishing.','1 tbsp cooking oil\r\n1 pc onion, small -sized, chopped\r\n2 cloves garlic, chopped\r\n1 pc ginger, cut into strips\r\n½ kilo chicken, cut into 8 pcs\r\n4 cups water\r\n2 pcs Knorr chicken cubes\r\n1 pc chayote or 1 pc small-sized green papaya, sliced\r\n2 stalks of moringa leaves\r\nKnorr Chicken Cube','Heat oil in a pot over medium heat and sauté onions, garlic, and ginger for 2 minutes until fragrant.\r\nAdd chicken pieces and stir until they turn white or light brown in color.\r\nPour in water and add Knorr Chicken Broth cubes. Simmer until the chicken is tender and cooked through.\r\nAdd sayote or green papaya and cook until tender.\r\nAdd dahon ng sili (chili leaves) or malunggay (moringa leaves) for added nutrients and cook for a minute.\r\nServe with patis (fish sauce) and calamansi on the side. Enjoy with your family.',_binary 'tinola.png',4,50,3,'2023-06-05 09:41:22','2023-06-05 09:41:22',25),(67,'Pansit Guisado','Pansit guisado is a popular Filipino noodle dish stir-fried with vegetables, meat, or seafood, and a savory sauce. Delicious and satisfying.','½ cup thinly sliced pork\r\n3½ cups water, divided\r\n2-3 tbsp cooking oil\r\n1 small pc red onion, chopped\r\n6 cloves garlic, chopped\r\n½ cup sliced chicken liver (bite-sized pieces)\r\n1 small pc carrot, cut into strips\r\n¼ cup chicharo, ends trimmed\r\n2 cups cabbage strips\r\n2 tbsp chopped kinchay\r\n3 tbsp soy sauce\r\n2 pcs Knorr Pork Cubes\r\npinch of ground black pepper and salt\r\n1 (240-g) pack pancit bihon (vermicelli)','Boil pork in ½ cup water for 10-15 minutes. Drain and set aside.\r\nHeat oil in a pan. Stir-fry pork until brown. Sauté onion and garlic until tender.\r\nAdd chicken liver and stir-fry until cooked. Add vegetables and cook for 1 minute.\r\nAdd 3 cups water, soy sauce, and Knorr Pork Cubes; mix well. Bring to a simmer. Season to taste. Transfer meat and vegetables to a bowl; set aside.\r\nAdd noodles to the pan and cook, stirring occasionally, until the stock is fully absorbed. Transfer to a serving platter. Top with cooked meat and vegetables. Serve immediately.',_binary 'pansit.png',3,20,4,'2023-06-05 09:57:18','2023-06-05 09:57:18',27),(68,'Omelette','An omelette is a fluffy, savory dish made by whisking eggs, cooking them in a pan, and often filled with ingredients like cheese, vegetables, or meat. Delicious and versatile.','2 large eggs\r\nPinch salt\r\n1 tablespoon unsalted butter\r\n2 tablespoons grated cheese, any kind\r\n3 to 4 cherry tomatoes, cut in half and sprinkled lightly with salt\r\n2 tablespoons chopped basil, parsley, or herb of your choice','Crack the desired number of eggs into a bowl and whisk them together until well combined.\r\nHeat a non-stick frying pan over medium heat and add a small amount of oil or butter to coat the pan.\r\nPour the beaten eggs into the pan and let them cook undisturbed for about a minute or until the edges start to set.\r\nGently lift the edges of the omelet with a spatula and tilt the pan to allow the uncooked eggs to flow to the edges.\r\nCook for another minute or until the top of the omelet is mostly set but still slightly runny. Then, fold the omelet in half and slide it onto a plate to serve.',_binary 'foods.png',1,5,1,'2023-06-05 10:05:29','2023-06-05 10:05:29',27);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-06 15:53:22
