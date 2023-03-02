CREATE DATABASE  IF NOT EXISTS `stores7new` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `stores7new`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: stores7new
-- ------------------------------------------------------
-- Server version	5.7.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `call_type`
--

DROP TABLE IF EXISTS `call_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call_type` (
  `call_code` char(1) NOT NULL,
  `code_descr` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`call_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_type`
--

LOCK TABLES `call_type` WRITE;
/*!40000 ALTER TABLE `call_type` DISABLE KEYS */;
INSERT INTO `call_type` VALUES ('B','billing error'),('D','damaged goods'),('I','incorrect merchandise sent'),('L','late shipment'),('O','other');
/*!40000 ALTER TABLE `call_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog` (
  `catalog_num` smallint(6) NOT NULL,
  `stock_num` smallint(6) NOT NULL,
  `manu_code` char(3) NOT NULL,
  `cat_descr` longtext,
  `cat_picture` varchar(255) DEFAULT NULL,
  `cat_advert` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`catalog_num`),
  KEY `stock_num` (`stock_num`,`manu_code`),
  CONSTRAINT `catalog_ibfk_1` FOREIGN KEY (`stock_num`, `manu_code`) REFERENCES `products` (`stock_num`, `manu_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (10001,1,'HRO','Brown leather. Specify first baseman s or infield/outfield style.  Specify right- or \nleft-handed.','','Your First Season s Baseball Glove'),(10002,1,'HSK','Babe Ruth signature glove. Black leather. Infield/outfield style. Specify right- or \nleft-handed.','','All Leather'),(10003,1,'SMT','Catcher s mitt. Brown leather. Specify right- or left-handed.','','A Sturdy Catcher s \nMitt With the Perfect Pocket'),(10004,2,'HRO','Jackie Robinson signature ball. Highest professional quality','',' used by National League.'),(10005,3,'HSK','Pro-style wood. Available in sizes: 31','',' 32 33'),(10006,3,'SHM','Aluminum. Blue \nwith black tape. 31\" 20 oz or 22 oz; 32\"','',' 21 oz or 23 oz; 33\"'),(10007,4,'HSK','Norm Van \nBrocklin signature style.','','Quality Pigskin with Norm Van Brocklin \nSignature'),(10008,4,'HRO','NFL Style \npigskin.','','Highest Quality Football for High School and Collegiate \nCompetitions'),(10009,5,'NRG','Graphite frame. \nSynthetic strings.','','Wide Body Amplifies Your Natural Abilities by \nProviding More Power Through Aerodynamic Design'),(10010,5,'SMT','Aluminum frame. Synthetic strings.','','Mid-Sized Racquet for the Improving Player'),(10011,5,'ANZ','Wood frame','',' cat-gut strings.'),(10012,6,'SMT','Soft yellow color for easy visibility in sunlight or artificial light.','','High-Visibility Tennis'),(10013,6,'ANZ','Pro-core. Available in neon yellow','',' green and pink.'),(10014,7,'HRO','Indoor. Classic NBA style. Brown leather.','','Long-Life Basketballs for Indoor \nGymnasiums'),(10015,8,'ANZ','Indoor. Finest leather. Professional quality.','','Professional Volleyballs for \nIndoor Competitions'),(10016,9,'ANZ','Steel eyelets. Nylon cording. Double-stitched. Sanctioned by the National Athletic \nCongress','','Sanctioned Volleyball Netting for Indoor Professional and \nCollegiate Competition'),(10017,101,'PRC','Reinforced','',' hand-finished tubular. Polyurethane belted.  Effective against \npunctures. Mixed tread for super wear and road grip.'),(10018,101,'SHM','Durable nylon \ncasing with butyl tube for superior air retention.  Center-ribbed tread \nwith herringbone side. Coated sidewalls resist abrasion.','','The \nPerfect Tire for Club Rides or Training'),(10019,102,'SHM','Thrust bearing \nand coated pivot washer/spring sleeve for smooth action. Slotted levers \nwith soft gum hoods. Two-tone paint treatment. Set includes calipers levers ','',' and cables.'),(10020,102,'PRC','Computer-aided \ndesign with low-profile pads. Cold-forged alloy calipers and beefy \ncaliper bushing. Aero levers. Set includes calipers levers ','',' and \ncables.'),(10021,103,'PRC','Compact \nleading-action design enhances shifting. Deep cage for super-small granny \ngears. Extra strong construction to resist off-road abuse.','','Climb \nAny Mountain: ProCycle s Front Derailleur Adds Finesse to Your ATB'),(10022,104,'PRC','Floating \ntrapezoid geometry with extra thick parallelogram arms. 100-tooth capacity. \nOptimum alignment with any Freewheel.','','Computer-Aided Design \nEngineers 100-Tooth Capacity into ProCycle s Rear Derailleur'),(10023,105,'PRC','Front wheels laced with 15 g spokes in a 3 cross pattern. Rear wheels laced with 14 g \nspikes in a 3-cross pattern.','','Durable Training Wheels That Hold \nTrue Under Toughest Conditions'),(10024,105,'SHM','Polished alloy. Sealed-bearing','',' quick-release hubs. Double-butted. Front wheels are laced 15 g/2-cross. Rear wheels are laced 15 g/3-cross.'),(10025,106,'PRC','Hard anodized alloy with pearl finish. 6 mm hex bolt hardware. Available in lengths of 90-140 mm in 10 mm increments.','','ProCycle Stem with Pearl Finish'),(10026,107,'PRC','Available in three styles: Men s racing; Men s touring; and Women s. Anatomical gel construction with lycra cover. Black or black/hot pink.','','The Ultimate in Riding Comfort'),(10027,108,'SHM','Double or triple crankset with choice of chainrings. For double crankset','',' chainrings from 38-54 teeth. For triple crankset chainrings from 24-48 teeth.'),(10028,109,'PRC','Steel toe clips with nylon strap. Extra wide at buckle to reduce pressure.','','Classic Toeclip Improved to Prevent Soreness at Clip Buckle'),(10029,109,'SHM','Ingenious new design combines button on sole of shoe with slot on a pedal plate to give riders new options in riding efficiency. Choose full or partial locking. Four plates mean both top and bottom of pedals are slotted -- no fishing around when you want to engage full power. Fast unlocking ensures safety when maneuverability is paramount.','','Ingenious Pedal/Clip Design Delivers Maximum Power and Fast Unlocking'),(10030,110,'PRC','Super-lightweight. Meets both ANSI and Snell standards for impact protection. 7.5 oz. Quick-release shadow buckle.','','Feather-Light'),(10031,110,'ANZ','No buckle so \nno plastic touches your chin. Meets both ANSI and Snell standards for \nimpact protection. 7.5 oz. Lycra cover.','','Minimum Chin Contact'),(10032,110,'SHM','Dense outer layer combines with softer inner layer to eliminate the mesh cover','',' no snagging on brush. Meets both ANSI and Snell standards for impact \nprotection. 8.0 oz.'),(10033,110,'HRO','Newest ultralight helmet uses plastic shell. Largest ventilation channels of any helmet on the market. 8.5 oz.','','Lightweight Plastic with Vents Assures Cool Comfort Without Sacrificing Protection'),(10034,110,'HSK','Aerodynamic \n(teardrop) helmet covered with anti-drag fabric. Credited with shaving 2 \nseconds/mile from winner s time in Tour de France time trial. 7.5 oz.','','Teardrop Design Used by Yellow Jerseys; You Can Time the Difference'),(10035,111,'SHM','Light-action \nshifting 10 speed. Designed for the city commuter with shock-absorbing \nfront fork and drilled eyelets for carry-all racks or bicycle trailers. \nInternal wiring for generator lights. 33 lbs.','','Fully Equipped \nBicycle Designed for the Serious Commuter Who Mixes Business with \nPleasure'),(10036,112,'SHM','Created for the beginner enthusiast. Ideal for club rides and light touring. \nSophisticated triple-butted frame construction. Precise index shifting. 28 \nlbs.','','We Selected the Ideal Combination of Touring Bike Equipment'),(10037,113,'SHM','Ultra-lightweight. Racing frame geometry built for aerodynamic handlebars. Cantilever brakes. Index shifting. High-performance gearing. Quick-release hubs. Disk wheels. Bladed spokes.','','Designed for the Serious Competitor'),(10038,114,'PRC','Padded leather palm and stretch mesh merged with terry back; available in tan black ','',' and cream. Sizes S'),(10039,201,'NKL','Designed for comfort and stability. Available in white & blue or white & brown. \nSpecify size.','','Full-Comfort'),(10040,201,'ANZ','Guaranteed waterproof. Full leather upper. Available in white','',' bone brown'),(10041,201,'KAR','Leather and leather mesh for maximum ventilation. Waterproof lining to keep feet dry. Available in white & gray or white & ivory.  Specify size.','','Karsten s Top Quality Shoe Combines Leather and Leather Mesh'),(10042,202,'NKL','Complete starter set utilizes gold shafts. Balanced for power.','','Starter Set of Woods'),(10043,202,'KAR','Full set of woods designed for precision control and power performance.','','High-Quality Woods Appropriate for High School Competitions or Serious \nAmateurs'),(10044,203,'NKL','Set of eight irons includes 3 through 9 irons and pitching wedge. Originally priced at $489.00.','','Set of Irons Available from Factory at Tremendous Savings: Discontinued Line.'),(10045,204,'KAR','Ideally balanced for optimum control. Nylon-covered shaft.','','High-Quality Beginning Set of Irons Appropriate for High School Competitions'),(10046,205,'NKL','Fluorescent yellow.','','Long Drive Golf Balls: Fluorescent Yellow'),(10047,205,'ANZ','White only.','','Long Drive Golf Balls: White'),(10048,205,'HRO','Combination fluorescent yellow and standard white.','','HiFlier Golf Balls: Case Includes Fluorescent Yellow and Standard White'),(10049,301,'NKL','Super shock-absorbing gel pads disperse vertical energy into a horizontal plane for extraordinary cushioned comfort. Great motion control. Mens only. Specify size.','','Maximum Protection For High-Mileage Runners'),(10050,301,'HRO','Engineered for serious training with exceptional stability. Fabulous shock absorption. Great durability. Specify men s/women s','',' size.'),(10051,301,'SHM','For runners who log heavy miles and need a durable','',' supportive stable \nplatform. Mesh/synthetic upper gives excellent moisture dissipation. Stability \nsystem uses rear antipronation platform and forefoot control plate for \nextended protection during high-intensity training. Specify \nmens/womens'),(10052,301,'PRC',' Supportive','',' stable racing flat. Plenty of forefoot cushioning with added motion \ncontrol. Women s only. D widths available.  Specify size.'),(10053,301,'KAR','Anatomical \nlast holds your foot firmly in place. Feather-weight cushioning delivers \nthe responsiveness of a racing flat. Specify men s/women s size.','',''),(10054,301,'ANZ','Cantilever sole provides shock absorption and energy rebound. Positive traction shoe with ample toe box. Ideal for runners who need a wide shoe. Available \nin men s and women s. Specify size.','','Motion Control'),(10055,302,'KAR','Re-usable ice pack with velcro strap. For general use. Velcro strap allows easy \napplication to arms or legs.','','Finally'),(10056,303,'PRC','Neon nylon. Perfect for running or aerobics. Indicate color: Fluorescent pink','',' yellow green'),(10057,303,'KAR','100% nylon blend for optimal wicking and comfort. We ve taken out the cotton to \neliminate the risk of blisters and reduce the opportunity for infection. \nSpecify men s or women s.','','100% Nylon Blend Socks - No Cotton!'),(10058,304,'ANZ',' Provides time date ','',' dual display of lap/cumulative splits'),(10059,304,'HRO','Split timer','',' waterproof to 50 m. Indicate color: hot pink mint green'),(10060,305,'HRO','Contains ace bandage','',' anti-bacterial cream alcohol cleansing pads'),(10061,306,'PRC','Converts a \nstandard tandem bike into an adult/child bike. User-tested assembly \ninstructions','','Enjoy Bicycling with Your Child on a Tandem; Make Your \nFamily Outing Safer'),(10062,306,'SHM','Converts a standard tandem bike into an adult/child bike.  Lightweight model.','','Consider a Touring Vacation For the Entire Family: A Lightweight'),(10063,307,'PRC','Allows mom or \ndad to take the baby out','',' too. Fits children up to 21 pounds. Navy \nblue with black trim.'),(10064,308,'PRC','Allows mom or \ndad to take both children! Rated for children up to 18 pounds.','','As Your Family Grows'),(10065,309,'HRO','Prevents \nswimmer s ear.','','Swimmers Can Prevent Ear Infection All Season Long'),(10066,309,'SHM','Extra-gentle \nformula. Can be used every day for prevention or treatment of swimmer s \near.','','Swimmer s Ear Drops Specially Formulated for Children'),(10067,310,'SHM','Blue \nheavy-duty foam board with Shimara or team logo.','','Exceptionally Durable'),(10068,310,'ANZ','White. \nStandard size.','','High-Quality Kickboard'),(10069,311,'SHM','Swim gloves. \nWebbing between fingers promotes strengthening of arms. Cannot be used \nin competition.','','Hot Training Tool - Webbed Swim Gloves Build Arm \nStrength and Endurance'),(10070,312,'SHM','Hydrodynamic \negg-shaped lens. Ground-in anti-fog elements; available in blue or \nsmoke.','','Anti-Fog Swimmer s Goggles: Quantity Discount.'),(10071,312,'HRO','Durable \ncompetition-style goggles. Available in blue','',' grey or white.'),(10072,313,'SHM','Silicone swim \ncap. One size. Available in white','',' silver or navy. Team logo \nimprinting available'),(10073,313,'ANZ','Silicone swim cap. Squared-off top. One size. White.','','Durable Squared-off \nSilicone Swim Cap'),(10074,302,'HRO','Re-usable ice \npack. Store in the freezer for instant first-aid. Extra capacity to \naccommodate water and ice.','','Water Compartment Combines with Ice to \nProvide Optimal Orthopedic Treatment');
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_calls`
--

DROP TABLE IF EXISTS `cust_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust_calls` (
  `customer_num` smallint(6) NOT NULL,
  `call_dtime` datetime(3) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `call_code` char(1) DEFAULT NULL,
  `call_descr` varchar(240) DEFAULT NULL,
  `res_dtime` datetime(3) DEFAULT NULL,
  `res_descr` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`customer_num`,`call_dtime`),
  KEY `call_code` (`call_code`),
  CONSTRAINT `cust_calls_ibfk_1` FOREIGN KEY (`call_code`) REFERENCES `call_type` (`call_code`),
  CONSTRAINT `cust_calls_ibfk_2` FOREIGN KEY (`customer_num`) REFERENCES `customer` (`customer_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_calls`
--

LOCK TABLES `cust_calls` WRITE;
/*!40000 ALTER TABLE `cust_calls` DISABLE KEYS */;
INSERT INTO `cust_calls` VALUES (106,'2008-06-14 08:20:00.000','maryj','D','Order was received, but two of the cans of ANZ tennis balls within the case were empty','2015-06-13 08:25:00.000','Authorized credit for two cans to customer, issued apology. Called ANZ buyer to report the QA problem.'),(110,'2008-07-09 10:24:00.000','richc','L','Order placed one month ago (6/7) not received.','2015-07-08 10:30:00.000','Checked with shipping (Ed Smith). Order sent yesterday- we were waiting for goods from ANZ. Next time will call with delay if necessary.'),(116,'2007-11-30 13:34:00.000','mannyn','I','Received plain white swim caps (313 ANZ) instead of navy with team logo (313 SHM)','2015-11-28 16:47:00.000','Shipping found correct case in warehouse and express mailed it in time for swim meet.'),(116,'2007-12-23 11:24:00.000','mannyn','I','Second complaint from this customer! Received two cases right-handed outfielder gloves (1 HRO) instead of one case lefties.','2015-12-27 08:19:00.000','Memo to shipping (Ava Brown) to send case of left-handed gloves, pick up wrong case'),(119,'2008-07-03 15:00:00.000','richc','B','Bill does not reflect credit from previous order','2015-07-03 08:21:00.000','Spoke with Jane Akant in Finance. She found the error and is sending new bill to customer'),(121,'2008-07-12 14:05:00.000','maryj','O','Customer likes our merchandise. Requests that we stock more types of infant joggers. Will call back to place order.','2015-07-11 14:06:00.000','Sent note to marketing group of interest in infant joggers'),(127,'2008-08-02 14:30:00.000','maryj','I','Received Hero watches (item # 304) instead of ANZ watches','2014-12-04 00:00:00.000','Sent memo to shipping to send ANZ item 304 to customer and pickup HRO watches. Should be done tomorrow, 8/1');
/*!40000 ALTER TABLE `cust_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_num` smallint(6) NOT NULL,
  `fname` varchar(15) DEFAULT NULL,
  `lname` varchar(15) DEFAULT NULL,
  `company` varchar(20) DEFAULT NULL,
  `address1` varchar(20) DEFAULT NULL,
  `address2` varchar(20) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zipcode` char(5) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `customer_num_referedBy` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`customer_num`),
  KEY `customer_num_referedBy` (`customer_num_referedBy`),
  KEY `state` (`state`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customer_num_referedBy`) REFERENCES `customer` (`customer_num`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`state`) REFERENCES `state` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (101,'Ludwig','Pauli','All Sports Supplies','213 Erstwild Court','','Sunnyvale','CA','94086','408-789-8075',NULL),(102,'Carole','Sadler','Sports Spot','785 Geary St','','San Francisco','CA','94117','415-822-1289',101),(103,'Philip','Currie','Phil s Sports','654 Poplar','P. O. Box 3498','Palo Alto','CA','94303','415-328-4543',101),(104,'Anthony','Higgins','Play Ball!','East Shopping Cntr.','422 Bay Road','Redwood City','CA','94026','415-368-1100',103),(105,'Raymond','Vector','Los Altos Sports','1899 La Loma Drive','','Los Altos','CA','94022','415-776-3249',103),(106,'George','Watson','Watson & Son','1143 Carver Place','','Mountain View','CA','94063','415-389-8789',103),(107,'Charles','Ream','Athletic Supplies','41 Jordan Avenue','','Palo Alto','CA','94304','415-356-9876',NULL),(108,'Donald','Quinn','Quinn s Sports','587 Alvarado','','Redwood City','CA','94063','415-544-8729',107),(109,'Jane','Miller','Sport Stuff','Mayfair Mart','7345 Ross Blvd.','Sunnyvale','CA','94086','408-723-8789',107),(110,'Roy','Jaeger','AA Athletics','520 Topaz Way','','Redwood City','CA','94062','415-743-3611',NULL),(111,'Frances','Keyes','Sports Center','3199 Sterling Court','','Sunnyvale','CA','94085','408-277-7245',NULL),(112,'Margaret','Lawson','Runners & Others','234 Wyandotte Way','','Los Altos','CA','94022','415-887-7235',111),(113,'Lana','Beatty','Sportstown','654 Oak Grove','','Menlo Park','CA','94025','415-356-9982',111),(114,'Frank','Albertson','Sporting Place','947 Waverly Place','','Redwood City','CA','94062','415-886-6677',111),(115,'Alfred','Grant','Gold Medal Sports','776 Gary Avenue','','Menlo Park','CA','94025','415-356-1123',NULL),(116,'Jean','Parmelee','Olympic City','1104 Spinosa Drive','','Mountain View','CA','94040','415-534-8822',115),(117,'Arnold','Sipes','Kids Korner','850 Lytton Court','','Redwood City','CA','94063','415-245-4578',115),(118,'Dick','Baxter','Blue Ribbon Sports','5427 College','','Oakland','CA','94609','415-655-0011',115),(119,'Bob','Shorter','The Triathletes Club','2405 Kings Highway','','Cherry Hill','NJ','8002','609-663-6079',115),(120,'Fred','Jewell','Century Pro Shop','6627 N. 17th Way','','Phoenix','AZ','85016','602-265-8754',NULL),(121,'Jason','Wallack','City Sports','Lake Biltmore Mall','350 W. 23rd Street','Wilmington','DE','19898','302-366-7511',120),(122,'Cathy','O Brian','The Sporting Life','543 Nassau Street','','Princeton','NJ','8540','609-342-0054',121),(123,'Marvin','Hanlon','Bay Sports','10100 Bay Meadows Ro','Suite 1020','Jacksonville','FL','32256','904-823-4239',121),(124,'Chris','Putnum','Putnum s Putters','4715 S.E. Adams Blvd','Suite 909C','Bartlesville','OK','74006','918-355-2074',120),(125,'James','Henry','Total Fitness Sports','1450 Commonwealth Av','','Brighton','MA','2135','617-232-4159',NULL),(126,'Eileen','Neelie','Neelie s Discount Sp','2539 South Utica Str','','Denver','CO','80219','303-936-7731',125),(127,'Kim','Satifer','Big Blue Bike Shop','Blue Island Square','12222 Gregory Street','Blue Island','NY','60406','312-944-5691',125),(128,'Frank','Lessor','Phoenix University','Athletic Department','1817 N. Thomas Road','Phoenix','AZ','85008','602-533-1817',125);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_num` smallint(6) NOT NULL,
  `order_num` smallint(6) NOT NULL,
  `stock_num` smallint(6) NOT NULL,
  `manu_code` char(3) NOT NULL,
  `quantity` smallint(6) DEFAULT NULL,
  `total_price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`item_num`,`order_num`),
  KEY `stock_num` (`stock_num`,`manu_code`),
  KEY `order_num` (`order_num`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`stock_num`, `manu_code`) REFERENCES `products` (`stock_num`, `manu_code`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`stock_num`, `manu_code`) REFERENCES `products` (`stock_num`, `manu_code`),
  CONSTRAINT `items_ibfk_3` FOREIGN KEY (`order_num`) REFERENCES `orders` (`order_num`),
  CONSTRAINT `items_ibfk_4` FOREIGN KEY (`order_num`) REFERENCES `orders` (`order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1001,1,'HRO',1,250.00),(1,1002,4,'HSK',1,960.00),(1,1003,9,'ANZ',1,20.00),(1,1004,1,'HRO',1,250.00),(1,1005,5,'NRG',10,280.00),(1,1006,5,'SMT',5,125.00),(1,1007,1,'HRO',1,250.00),(1,1008,8,'ANZ',1,840.00),(1,1009,1,'SMT',1,450.00),(1,1010,6,'SMT',1,36.00),(1,1011,5,'ANZ',5,99.00),(1,1012,8,'ANZ',1,840.00),(1,1013,5,'ANZ',1,19.80),(1,1014,4,'HSK',1,960.00),(1,1015,1,'SMT',1,450.00),(1,1016,101,'SHM',2,136.00),(1,1017,201,'NKL',4,150.00),(1,1018,307,'PRC',2,500.00),(1,1019,111,'SHM',3,1499.97),(1,1020,204,'KAR',2,90.00),(1,1021,201,'NKL',2,75.00),(1,1022,309,'HRO',1,40.00),(1,1023,103,'PRC',2,40.00),(2,1002,3,'HSK',1,240.00),(2,1003,8,'ANZ',1,840.00),(2,1004,2,'HRO',1,126.00),(2,1005,5,'ANZ',10,198.00),(2,1006,5,'NRG',5,140.00),(2,1007,2,'HRO',1,126.00),(2,1008,9,'ANZ',5,100.00),(2,1010,6,'ANZ',1,48.00),(2,1012,9,'ANZ',10,200.00),(2,1013,6,'SMT',1,36.00),(2,1014,4,'HRO',1,480.00),(2,1016,109,'PRC',3,90.00),(2,1017,202,'KAR',1,230.00),(2,1018,302,'KAR',3,15.00),(2,1020,301,'KAR',4,348.00),(2,1021,201,'ANZ',3,225.00),(2,1022,303,'PRC',2,96.00),(2,1023,104,'PRC',2,116.00),(3,1003,5,'ANZ',5,99.00),(3,1004,3,'HSK',1,240.00),(3,1005,6,'SMT',1,36.00),(3,1006,5,'ANZ',5,99.00),(3,1007,3,'HSK',1,240.00),(3,1013,6,'ANZ',1,48.00),(3,1016,110,'HSK',1,308.00),(3,1017,301,'SHM',2,204.00),(3,1018,110,'PRC',1,236.00),(3,1021,202,'KAR',3,690.00),(3,1022,6,'ANZ',2,96.00),(3,1023,105,'SHM',1,80.00),(4,1004,1,'HSK',1,800.00),(4,1005,6,'ANZ',1,48.00),(4,1006,6,'SMT',1,36.00),(4,1007,4,'HRO',1,480.00),(4,1013,9,'ANZ',2,40.00),(4,1016,114,'PRC',1,120.00),(4,1018,5,'SMT',4,100.00),(4,1021,205,'ANZ',2,624.00),(4,1023,110,'SHM',1,228.00),(5,1006,6,'ANZ',1,48.00),(5,1007,7,'HRO',1,600.00),(5,1018,304,'HRO',1,280.00),(5,1023,304,'ANZ',1,170.00),(6,1023,306,'SHM',1,190.00);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufact`
--

DROP TABLE IF EXISTS `manufact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufact` (
  `manu_code` char(3) NOT NULL,
  `manu_name` varchar(15) DEFAULT NULL,
  `lead_time` smallint(6) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `f_alta_audit` datetime DEFAULT NULL,
  `d_usualta_audit` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`manu_code`),
  KEY `state` (`state`),
  CONSTRAINT `manufact_ibfk_1` FOREIGN KEY (`state`) REFERENCES `state` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufact`
--

LOCK TABLES `manufact` WRITE;
/*!40000 ALTER TABLE `manufact` DISABLE KEYS */;
INSERT INTO `manufact` VALUES ('ANZ','Anza',5,'CA',NULL,NULL),('HRO','Hero',4,'CA',NULL,NULL),('HSK','Husky',5,'CA',NULL,NULL),('KAR','Karsten',21,'CA',NULL,NULL),('NKL','Nikolus',8,'AZ',NULL,NULL),('NRG','Norge',7,'AZ',NULL,NULL),('PRC','ProCycle',9,'AZ',NULL,NULL),('SHM','Shimara',30,'CO',NULL,NULL),('SMT','Smith',3,'CO',NULL,NULL);
/*!40000 ALTER TABLE `manufact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msgs`
--

DROP TABLE IF EXISTS `msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs` (
  `lang` varchar(32) DEFAULT NULL,
  `number` smallint(6) DEFAULT NULL,
  `mesage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msgs`
--

LOCK TABLES `msgs` WRITE;
/*!40000 ALTER TABLE `msgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `msgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_num` smallint(6) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `customer_num` smallint(6) NOT NULL,
  `ship_instruct` varchar(40) DEFAULT NULL,
  `backlog` char(1) DEFAULT NULL,
  `po_num` varchar(10) DEFAULT NULL,
  `ship_date` datetime DEFAULT NULL,
  `ship_weight` decimal(8,2) DEFAULT NULL,
  `ship_charge` decimal(6,2) DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_num`),
  KEY `customer_num` (`customer_num`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_num`) REFERENCES `customer` (`customer_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1001,'2015-05-16 00:00:00',104,'express','n','B77836','2015-05-28 00:00:00',20.40,10.00,'2015-07-18 00:00:00'),(1002,'2015-05-17 00:00:00',101,'PO on box; deliver to back door only','n','9270','2015-05-22 00:00:00',50.60,15.30,'2015-05-30 00:00:00'),(1003,'2015-05-18 00:00:00',104,'express','n','B77890','2015-05-19 00:00:00',35.60,10.80,'2015-06-10 00:00:00'),(1004,'2015-05-18 00:00:00',106,'ring bell twice','y','8006','2015-05-26 00:00:00',95.80,19.20,NULL),(1005,'2015-05-20 00:00:00',116,'call before delivery','n','2865','2015-06-05 00:00:00',80.80,16.20,'2015-06-17 00:00:00'),(1006,'2015-05-26 00:00:00',112,'after 10 am','y','Q13557',NULL,70.80,14.20,NULL),(1007,'2015-05-27 00:00:00',117,'','n','278693','2015-06-01 00:00:00',125.90,25.20,NULL),(1008,'2015-06-03 00:00:00',110,'closed Monday','y','LZ230','2015-07-02 00:00:00',45.60,13.80,'2015-07-17 00:00:00'),(1009,'2015-06-10 00:00:00',111,'next door to grocery','n','4745','2015-06-17 00:00:00',20.40,10.00,'2015-08-17 00:00:00'),(1010,'2015-06-13 00:00:00',115,'deliver 776 King St. if no answer','n','429Q','2015-06-25 00:00:00',40.60,12.30,'2015-08-18 00:00:00'),(1011,'2015-06-14 00:00:00',104,'express','n','B77897','2015-06-29 00:00:00',10.40,5.00,'2015-08-25 00:00:00'),(1012,'2015-06-14 00:00:00',117,'','n','278701','2015-06-25 00:00:00',70.80,14.20,NULL),(1013,'2015-06-18 00:00:00',104,'express','n','B77930','2015-07-06 00:00:00',60.80,12.20,'2015-07-27 00:00:00'),(1014,'2015-06-21 00:00:00',106,'ring bell kick door loudly','n',' ',NULL,40.60,12.30,NULL),(1015,'2015-06-23 00:00:00',110,'closed Mondays','n','MA003','2015-07-12 00:00:00',20.60,6.30,'2015-08-27 00:00:00'),(1016,'2015-06-25 00:00:00',119,'delivery entrance off Camp St.','n','PC6782','2015-07-08 00:00:00',35.00,11.80,NULL),(1017,'2015-07-05 00:00:00',120,'North side of clubhouse','n','DM354331','2015-07-09 00:00:00',60.00,18.00,NULL),(1018,'2015-07-06 00:00:00',121,'SW corner of Biltmore Mall','n','S22942','2015-07-09 00:00:00',70.50,20.00,'2015-08-02 00:00:00'),(1019,'2015-07-07 00:00:00',122,'closed til noon Mondays','n','Z55709','2015-07-12 00:00:00',90.00,23.00,'2015-08-02 00:00:00'),(1020,'2015-07-07 00:00:00',123,'express','n','W2286','2015-07-12 00:00:00',14.00,8.50,'2015-09-16 00:00:00'),(1021,'2015-07-19 00:00:00',124,'ask for Elaine','n','C3288','2015-07-21 00:00:00',40.00,12.00,'2015-08-18 00:00:00'),(1022,'2015-07-20 00:00:00',126,'express','n','W9925','2015-07-26 00:00:00',15.00,13.00,'2015-08-29 00:00:00'),(1023,'2015-07-20 00:00:00',127,'no deliveries after 3 p.m.','n','KF2961','2015-07-26 00:00:00',60.00,18.00,'2015-08-18 00:00:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_types`
--

DROP TABLE IF EXISTS `product_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_types` (
  `stock_num` smallint(6) NOT NULL,
  `description` varchar(15) NOT NULL,
  PRIMARY KEY (`stock_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_types`
--

LOCK TABLES `product_types` WRITE;
/*!40000 ALTER TABLE `product_types` DISABLE KEYS */;
INSERT INTO `product_types` VALUES (1,'baseball gloves'),(2,'baseball'),(3,'baseball bat'),(4,'football'),(5,'tennis racquet'),(6,'tennis ball'),(7,'basketball'),(8,'volleyball'),(9,'volleyball net'),(101,'bicycle tires'),(102,'bicycle brakes'),(103,'frnt derailleur'),(104,'rear derailleur'),(105,'bicycle wheels'),(106,'bicycle stem'),(107,'bicycle saddle'),(108,'crankset'),(109,'pedal binding'),(110,'helmet'),(111,'10-spd assmbld'),(112,'12-spd assmbld'),(113,'18-spd assmbld'),(114,'bicycle gloves'),(201,'golf shoes'),(202,'metal woods'),(203,'irons/wedge'),(204,'putter'),(205,'3 golf balls'),(301,'running shoes'),(302,'ice pack'),(303,'socks'),(304,'watch'),(305,'first-aid kit'),(306,'tandem adapter'),(307,'infant jogger'),(308,'twin jogger'),(309,'ear drops'),(310,'kick board'),(311,'water gloves'),(312,'racer goggles'),(313,'swim cap');
/*!40000 ALTER TABLE `product_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `stock_num` smallint(6) NOT NULL,
  `manu_code` char(3) NOT NULL,
  `unit_price` decimal(6,2) DEFAULT NULL,
  `unit_code` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`stock_num`,`manu_code`),
  KEY `manu_code` (`manu_code`),
  KEY `unit_code` (`unit_code`),
  CONSTRAINT `FK_product_types` FOREIGN KEY (`stock_num`) REFERENCES `product_types` (`stock_num`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`manu_code`) REFERENCES `manufact` (`manu_code`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`unit_code`) REFERENCES `units` (`unit_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'HRO',250.00,6),(1,'HSK',800.00,6),(1,'SMT',450.00,6),(2,'HRO',126.00,13),(3,'HSK',240.00,9),(3,'SHM',280.00,9),(4,'HRO',480.00,13),(4,'HSK',960.00,13),(5,'ANZ',19.80,19),(5,'NRG',28.00,19),(5,'SMT',25.00,19),(6,'ANZ',48.00,12),(6,'SMT',36.00,12),(7,'HRO',600.00,13),(8,'ANZ',840.00,13),(9,'ANZ',20.00,19),(101,'PRC',88.00,5),(101,'SHM',68.00,5),(102,'PRC',480.00,15),(102,'SHM',220.00,15),(103,'PRC',20.00,19),(104,'PRC',58.00,19),(105,'PRC',53.00,20),(105,'SHM',80.00,20),(106,'PRC',23.00,19),(107,'PRC',70.00,20),(108,'SHM',45.00,19),(109,'PRC',30.00,17),(109,'SHM',200.00,14),(110,'ANZ',244.00,16),(110,'HRO',260.00,16),(110,'HSK',308.00,16),(110,'PRC',236.00,16),(110,'SHM',228.00,16),(111,'SHM',499.99,18),(112,'SHM',549.00,18),(113,'SHM',685.90,18),(114,'PRC',120.00,7),(201,'ANZ',75.00,19),(201,'KAR',90.00,19),(201,'NKL',37.50,19),(202,'KAR',230.00,10),(202,'NKL',174.00,10),(203,'NKL',670.00,10),(204,'KAR',45.00,19),(205,'ANZ',312.00,13),(205,'HRO',312.00,13),(205,'NKL',312.00,13),(301,'ANZ',95.00,19),(301,'HRO',42.50,19),(301,'KAR',87.00,19),(301,'NKL',97.00,19),(301,'PRC',75.00,19),(301,'SHM',102.00,19),(302,'HRO',4.50,19),(302,'KAR',5.00,19),(303,'KAR',36.00,3),(303,'PRC',48.00,3),(304,'ANZ',170.00,1),(304,'HRO',280.00,1),(305,'HRO',48.00,16),(306,'PRC',160.00,19),(306,'SHM',190.00,19),(307,'PRC',250.00,19),(308,'PRC',280.00,19),(309,'HRO',40.00,11),(309,'SHM',40.00,11),(310,'ANZ',84.00,9),(310,'SHM',80.00,8),(311,'SHM',48.00,4),(312,'HRO',72.00,2),(312,'SHM',96.00,2),(313,'ANZ',60.00,2),(313,'SHM',72.00,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `code` char(2) NOT NULL,
  `sname` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES ('AK','Alaska'),('AL','Alabama'),('AR','Arkansas'),('AZ','Arizona'),('CA','California'),('CO','Colorado'),('CT','Connecticut'),('DC','D.C.'),('DE','Delaware'),('FL','Florida'),('GA','Georgia'),('HI','Hawaii'),('IA','Iowa'),('ID','Idaho'),('IL','Illinois'),('IN','Indiana'),('KS','Kansas'),('KY','Kentucky'),('LA','Louisiana'),('MA','Massachusetts'),('MD','Maryland'),('ME','Maine'),('MI','Michigan'),('MN','Minnesota'),('MO','Missouri'),('MS','Mississippi'),('MT','Montana'),('NC','North Carolina'),('ND','North Dakota'),('NE','Nebraska'),('NH','New Hampshire'),('NJ','New Jersey'),('NM','New Mexico'),('NV','Nevada'),('NY','New York'),('OH','Ohio'),('OK','Oklahoma'),('OR','Oregon'),('PA','Pennsylvania'),('PR','Puerto Rico'),('RI','Rhode Island'),('SC','South Carolina'),('SD','South Dakota'),('TN','Tennessee'),('TX','Texas'),('UT','Utah'),('VA','Virginia'),('VT','Vermont'),('WA','Washington'),('WI','Wisconsin'),('WV','West Virginia'),('WY','Wyoming');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `unit_code` smallint(6) NOT NULL AUTO_INCREMENT,
  `unit` char(4) DEFAULT NULL,
  `unit_descr` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`unit_code`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'box','10/box'),(2,'box','12/box'),(3,'box','24 pairs/box'),(4,'box','4 pairs/box'),(5,'box','4/box'),(6,'case','10 gloves/case'),(7,'case','10 pairs/case'),(8,'case','10/case'),(9,'case','12/case'),(10,'case','2 sets/case'),(11,'case','20/case'),(12,'case','24 cans/case'),(13,'case','24/case'),(14,'case','4 pairs/case'),(15,'case','4 sets/case'),(16,'case','4/case'),(17,'case','6 pairs/case'),(18,'each',''),(19,'each','each'),(20,'pair','pair');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'stores7new'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-02 23:38:57
