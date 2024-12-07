-- Group 2
-- Adam Hanson, Alexis Brewers, Colton Bondhus, Ismail Abdullahi, Lily Rossman

USE [Doomsday]
GO

-- Location Type AH

INSERT INTO LocationType
VALUES
    ('LT0001',	'Town'),
    ('LT0002',	'Water'),
    ('LT0003',	'Wasteland'),
    ('LT0004',	'Power'),
    ('LT0005',	'Residential'),
    ('LT0006',	'Forest'),
    ('LT0007',	'Greenhouse'),
    ('LT0008',	'Government Building');

-- Locations AH

INSERT INTO Locations
VALUES
    ('LO0001',	'Zomcaster',	'LT0001',	39.719769,	-82.598259,	'Used to be Lancaster, Ohio',	0,	'2046-02-05'),
    ('LO0002',	'London',	'LT0001',	51.51784548,	-0.120833083,	NULL,		0,	'2046-01-10'),
    ('LO0003',	'New York',	'LT0001',	40.72391574,	-73.98861745,	NULL,		0,	'2046-04-11'),
    ('LO0004',	'Chicago',	'LT0001',	41.87299696,	-87.63996336,	NULL,		0,	'2045-12-06'),
    ('LO0005',	'Novac',	'LT0001',	35.82749019,	-114.9364581,	NULL,		1,	'2046-04-11'),
    ('LO0006',	'Ciudad de la Muerte',	'LT0001',	43.26197918,	-5.307890758,	NULL,		0,	'2045-12-20');

-- Water CB 
-- water key formatted as 'WA0000'
INSERT INTO Water
VALUES
	('WA0001', 'Hocking River', 1, 4, 'LO0001'),
	('WA0002', 'Rising Park', 1, 1, 'LO0001'),
	('WA0003', 'Cenci Lake', 3, 2, 'LO0001'),
	('WA0004', 'Lakeview RV Park', 3, 5, 'LO0001'),
	('WA0005', 'Lake Lukinston', 2, 4, 'LO0001'),
	('WA0006', 'Baldwin Run', 1, 2, 'LO0001'),
	('WA0007', 'Pleasant Run', 1, 2, 'LO0001'),
	('WA0008', 'River Thames', 2, 10, 'LO0002'),
	('WA0009', 'Round Pond', 1, 1, 'LO0002'),
	('WA0010', 'The Long Water', 2, 3, 'LO0002'),
	('WA0011', 'St. James''s Park Lake', 2, 3, 'LO0002'),
	('WA0012', 'Regent''s Canal', 3, 8, 'LO0002'),
	('WA0013', 'Ladies Pond', 1, 4, 'LO0002'),
	('WA0014', 'Hudson River', 7, 10, 'LO0003'),
	('WA0015', 'Ohrbach Lake', 4, 4, 'LO0003'),
	('WA0016', 'Grasmere Lake', 3, 5, 'LO0003'),
	('WA0017', 'Cameron Lake', 2, 3, 'LO0003'),
	('WA0018', 'Silver Lake', 4, 5, 'LO0003'),
	('WA0019', 'Goethals Pond Complex', 1, 2, 'LO0003'),
	('WA0020', 'Old Place Creek Tidal Wetlands Area', 1, 5, 'LO0003'),
	('WA0021', 'Lake Michigan', 9, 10, 'LO0004'),
	('WA0022', 'Calumet River', 6, 10, 'LO0004'),
	('WA0023', 'Chicago River', 7, 10, 'LO0004'),
	('WA0024', 'South Lagooon', 4, 10, 'LO0004'),
	('WA0025', 'North Pond', 1, 5, 'LO0004'),
	('WA0026', 'Lake Victory', 3, 5, 'LO0004'),
	('WA0027', 'Peaceful Lake', 1, 2, 'LO0004'),
	('WA0028', 'Marquette Lagoon', 2, 4, 'LO0004'),
	('WA0029', 'Des Plaines River', 7, 10, 'LO0004'),
	('WA0030', 'Salt Creek', 4, 10, 'LO0004'),
	('WA0031', 'Bubbly Creek', 6, 10, 'LO0004')
;

-- Factions IA

INSERT INTO Factions
VALUES
    ('FA0001',	'United Zombies',	8,	'LO0001'),
    ('FA0002',	'ZomAid',	3,	'LO0002'),
    ('FA0003',	'Bioterrorism Security Assessment Alliance',	8,	'LO0003'),
    ('FA0004',	'Farmers Against Zombies!',	5,	'LO0005'),
    ('FA0005',	'Lawyers Against Zombies!',	1,	'LO0004'),
    ('FA0006',	'Las Plagas',	6,	'LO0006'),
    ('FA0007',	'Community of Novac',	4,	'LO0005'),
    ('FA0008',	'The Guild',	7,	'LO0005');

-- Alliances IA

INSERT INTO Alliances
VALUES
    ('FA0001',	'FA0002',	'Enemies'),
    ('FA0001',	'FA0003',	'Enemies'),
    ('FA0001',	'FA0004',	'Enemies'),
    ('FA0001',	'FA0005',	'Enemies'),
    ('FA0001',	'FA0006',	'Enemies'),
    ('FA0001',	'FA0007',	'Enemies'),
    ('FA0001',	'FA0008',	'Enemies'),
    ('FA0008',	'FA0007',	'Allied'),
    ('FA0008',	'FA0004',	'Allied'),
    ('FA0007',	'FA0004',	'Allied'),
    ('FA0002',	'FA0003',	'Allied'),
    ('FA0004',	'FA0003',	'Neutral'),
    ('FA0005',	'FA0003',	'Neutral'),
    ('FA0007',	'FA0003',	'Neutral'),
    ('FA0008',	'FA0003',	'Neutral'),
    ('FA0004',	'FA0002',	'Neutral'),
    ('FA0005',	'FA0002',	'Neutral'),
    ('FA0007',	'FA0002',	'Neutral'),
    ('FA0008',	'FA0002',	'Neutral'),
    ('FA0006',	'FA0003',	'Enemies');

-- Power Type IA
-- power type key formatted as 'PT0000'

INSERT INTO PowerType
VALUES
    ('PT0001', 'Solar'),
    ('PT0002', 'Wind'),
    ('PT0003', 'Hydro'),
    ('PT0004', 'Nuclear'),
    ('PT0005', 'Coal'),
    ('PT0006', 'Geothermal'),
    ('PT0007', 'Battery'),
    ('PT0008', 'Biomass');

-- Power IA
-- power key formatted as 'PO0000'

INSERT INTO Power
VALUES
    ('PO0001', 'PT0001', 'LO0001', 'Operational', '2046-01-15'),
    ('PO0002', 'PT0002', 'LO0002', 'Needs Repair', '2045-12-01'),
    ('PO0003', 'PT0003', 'LO0003', 'Inactive', NULL),
    ('PO0004', 'PT0004', 'LO0004', 'Unknown', NULL),
    ('PO0005', 'PT0005', 'LO0005', 'Operational', '2046-03-10'),
    ('PO0006', 'PT0006', 'LO0006', 'Needs Repair', '2046-02-25'),
    ('PO0007', 'PT0007', 'LO0005', 'Operational', '2046-04-01'),
    ('PO0008', 'PT0008', 'LO0001', 'Inactive', '2046-01-20');


-- Lodging CB
-- lodging key formatted as 'LD0000'
INSERT INTO Lodging
VALUES
	('LD0001', 'Stanbery High School', 'LO0001', 7),
	('LD0002', 'St. Peter''s Lutheran Church', 'LO0001', 6),
	('LD0003', 'Fairfield Metropolitan Housing', 'LO0001', 8),
	('LD0004', 'East Main Shopping Center', 'LO0001', 8),
	('LD0005', 'The Fairmore Center', 'LO0001', 9),
	('LD0006', 'Lancaster High School', 'LO0001', 7),
	('LD0007', 'Ohio University Lancaster', 'LO0001', 9),
	('LD0008', 'Fairfield County Infirmary', 'LO0001', 5),
	('LD0009', 'Fairfield Christian Church', 'LO0001', 6),
	('LD0010', 'River Valley Mall', 'LO0001', 8),
	('LD0011', 'River Valley Apartments', 'LO0001', 10),
	('LD0012', 'Buckingham Palace', 'LO0002', 10),
	('LD0013', 'Kensington Palace', 'LO0002', 10),
	('LD0014', 'The British Museum', 'LO0002', 5),
	('LD0015', 'University of London', 'LO0002', 9),
	('LD0016', 'St Saviours Estate', 'LO0002', 10),
	('LD0017', 'St. Paul''s Cathedral', 'LO0002', 7),
	('LD0018', 'Somerset House', 'LO0002', 4),
	('LD0019', 'St Thomas'' Hospital', 'LO0002', 9),
	('LD0020', 'Silverlock Medical Centre', 'LO0002', 7),
	('LD0021', 'Tower of London', 'LO0002', 9),
	('LD0022', 'Empire State Building', 'LO0003', 8),
	('LD0023', 'VU New York Condominiums', 'LO0003', 10),
	('LD0024', 'The Fifth Avenue Hotel', 'LO0003', 10),
	('LD0025', 'The Ned NoMade', 'LO0003', 10),
	('LD0026', 'Made Hotel', 'LO0003', 10),
	('LD0027', 'Walker Hotel Greenwich Village', 'LO0003', 10),
	('LD0028', 'Flatiron Building', 'LO0003', 9),
	('LD0029', 'Lexington Parc Condominium', 'LO0003', 10),
	('LD0030', 'Merrion Row Hotel and Public House', 'LO0003', 10),
	('LD0031', 'Hotel Scherman', 'LO0003', 10),
	('LD0032', 'The Art Institute of Chicago', 'LO0004', 4),
	('LD0033', 'Thalia Hall', 'LO0004', 3),
	('LD0034', 'Museum Park Place', 'LO0004', 8),
	('LD0035', 'Adler Place Luxury Condos', 'LO0004', 10),
	('LD0036', 'Prairie Pointe Apartments', 'LO0004', 10),
	('LD0037', 'The Grant Luxury Condos', 'LO0004', 10),
	('LD0038', 'Soldier Field', 'LO0004', 2),
	('LD0039', 'Martha Washington Apartments', 'LO0004', 10),
	('LD0040', 'Newton Bateman Elementary School', 'LO0004', 4),
	('LD0041', 'North Park Village Apartments', 'LO0004', 10)
;

-- Virus CB 
-- virus key formatted as 'VT0000'
INSERT INTO Virus
VALUES
	('VT0001', 'Kharaa', 'Small green glowing blisters appear.', 'Fishes of the Great Barrier Reef', 6),
	('VT0002', 'Gandaris', 'Increased leg endurance.', 'Horses of North America', 2),
	('VT0003', 'Otaundi', 'Yellow sclera.', 'Bats of Malaysia.', 1),
	('VT0004', 'Eel''s Touch', 'Prone to static electricity.', 'Eels of the Amazon River.', 6),
	('VT0005', 'Calrhagia', 'Clots form faster leading to faster healing time and higher risk of blood clots.', 'Alien Parasite of Canada.', 7),
	('VT0006', 'Halluci', 'Increased frequency of hallucinations over time.', 'Cuttlefish of the Pacific', 5),
	('VT0007', 'Astiones', 'Acidic saliva.', 'Centipedes of Eurasia.', 7),
	('VT0008', 'Bleeding Sheep', 'Thinner skin, more prone to cuts.', 'Frogs of South America.', 6),
	('VT0009', 'Crazy Marco', 'Increased activity of the thyroid gland, leading to restlessness.', 'Alien Parasite of El Salvador.', 7),
	('VT0010', 'Faminia', 'Stomach empties quicker than normal, leading to increased hunger.', 'Deers of North America.', 5),
	('VT0011', 'Lich''s Hand', 'Prone to cold temperatures.', 'Alien Parasite of Siberia.', 7),
	('VT0012', 'Fire Virus', 'Skin becomes more resistant to fire.', 'Long-Toed Salamanders of California.', 2),
	('VT0013', 'Stomidia', 'Stomach acid is constantly produced.', 'Vultures of Africa and Eurasia.', 9),
	('VT0014', 'Jumper Boon', 'Leg muscles easily grow stronger.', 'Rabbits of Europe.', 1),
	('VT0015', 'Thirst Virus', 'Body dehydrates at a slower rate.', 'Camels of Sahara.', 1),
	('VT0016', 'Tormenting Breath', 'Lung air sacs collapses over time.', 'Alien parasite of Indonesia.', 9),
	('VT0017', 'Panda Curse', 'Increased fatigue frequency.', 'Pandas of China.', 6),
	('VT0018', 'Mycellid', 'Spore bulbs with stem starts to grow on skin.', 'Alien parasite of Oregon.', 8),
	('VT0019', 'Armori', 'Thicker skin, less prone to cuts.', 'Rhinoceros', 1),
	('VT0020', 'Viralysis', 'Skin breaks down, eventually leading the victim skinless.', 'Alien Parasite of Germany.', 9),
	('VT0021', 'Digero', 'Decreased ability of digestive system to absorb nutrients.', 'Variant of VT0010', 8),
	('VT0022', 'Coaguliro', 'Blood becomes thicker.', 'Variant of VT0005', 9),
	('VT0023', 'Crystemia', 'Blood crystallizes.', 'Variant of VT0005', 10),
	('VT0024', 'Sleeping Beauty Virus', 'Increased frequency and duration of sleepwalking episodes.', 'Alien Parasite of Michigan.', 4),
    ('VT0025', 'Las Plagas Parasite', 'Complete takeover by the hive', 'Las Plagas Cult', 7)
;

-- Virus Transmissions CB
-- transmission method key formatted as 'TM0000'
INSERT INTO TransmissionMethod
VALUES
	('TM0001', 'Contact with infected blood.'),
	('TM0002', 'Contact with infected skin.'),
	('TM0003', 'Contact with object recently in contact of an infected.'),
	('TM0004', 'Consuming infected meat.'),
	('TM0005', 'Drinking infected water.'),
	('TM0006', 'Respiratory/Droplet Transmission.'),
	('TM0007', 'Airborne Transmission.'),
	('TM0008', 'Bite Transmission.'),
	('TM0009', 'Blood Transfusion.')
;

-- Virus Transmission Details CB
INSERT INTO VirusTransmissionMethod
VALUES
	('VT0001', 'TM0002'),
	('VT0001', 'TM0003'),
	('VT0001', 'TM0004'),
	('VT0001', 'TM0005'),
	('VT0002', 'TM0004'),
	('VT0003', 'TM0004'),
	('VT0003', 'TM0008'),
	('VT0003', 'TM0009'),
	('VT0004', 'TM0002'),
	('VT0005', 'TM0004'),
	('VT0005', 'TM0009'),
	('VT0006', 'TM0004'),
	('VT0007', 'TM0004'),
	('VT0007', 'TM0008'),
	('VT0008', 'TM0002'),
	('VT0008', 'TM0009'),
	('VT0009', 'TM0004'),
	('VT0009', 'TM0008'),
	('VT0010', 'TM0004'),
	('VT0010', 'TM0006'),
	('VT0011', 'TM0007'),
	('VT0012', 'TM0001'),
	('VT0012', 'TM0004'),
	('VT0012', 'TM0009'),
	('VT0013', 'TM0009'),
	('VT0014', 'TM0004'),
	('VT0014', 'TM0009'),
	('VT0015', 'TM0006'),
	('VT0015', 'TM0007'),
	('VT0015', 'TM0009'),
	('VT0016', 'TM0001'),
	('VT0016', 'TM0009'),
	('VT0017', 'TM0004'),
	('VT0018', 'TM0002'),
	('VT0018', 'TM0003'),
	('VT0018', 'TM0006'),
	('VT0018', 'TM0007'),
	('VT0019', 'TM0004'),
	('VT0019', 'TM0009'),
	('VT0020', 'TM0001'),
	('VT0020', 'TM0002'),
	('VT0020', 'TM0003'),
	('VT0020', 'TM0009'),
	('VT0021', 'TM0004'),
	('VT0021', 'TM0008'),
	('VT0022', 'TM0008'),
	('VT0022', 'TM0009'),
	('VT0023', 'TM0001'),
	('VT0023', 'TM0005'),
	('VT0023', 'TM0008'),
	('VT0023', 'TM0009'),
	('VT0024', 'TM0006'),
	('VT0024', 'TM0007'),
    ('VT0025', 'TM0009')
;

-- Role Types AH
-- role types key formatted as 'RT0000'

INSERT INTO RoleTypes
VALUES
    ('RT0001', 'Runner'),
    ('RT0002', 'Farmer'),
    ('RT0003', 'Crafter'),
    ('RT0004', 'Caretaker'),
    ('RT0005', 'Teacher'),
    ('RT0006', 'Healthcare'),
    ('RT0007', 'Military'),
    ('RT0008', 'Government');

-- Work Roles AH
-- work roles key formatted as 'WR0000'

INSERT INTO WorkRoles
VALUES
    ('WR0001', 'RT0001', 'Messenger', 'Delivers messages between alliances.'),
    ('WR0002', 'RT0001', 'Collector', 'Goes out to find and collect items/resources.'),
    ('WR0003', 'RT0001', 'Scout', 'Scouts for new locations and helps to keep an eye on known locations.'),
    ('WR0004', 'RT0002', 'Gardener', 'Takes care of the gardens.'),
    ('WR0005', 'RT0002', 'Livestock', 'Takes care of the livestock.'),
    ('WR0006', 'RT0003', 'Leather Artisan', 'Makes items out of leather.'),
    ('WR0007', 'RT0003', 'Tailor', 'Makes items out of cloths.'),
    ('WR0008', 'RT0003', 'Black Smith', 'Makes items out of metals.'),
    ('WR0009', 'RT0004', 'Child Caretaker', 'Takes care of small children.'),
    ('WR0010', 'RT0004', 'Elder Caretaker', 'Takes care of the elderly.'),
    ('WR0011', 'RT0005', 'Academics', 'Teaches the children subjects such as math, reading, writing.'),
    ('WR0012', 'RT0005', 'Survival', 'Teaches the children survival skills such as safe plants and shelter making.'),
    ('WR0013', 'RT0005', 'Weapons', 'Teaches the children offensive and defensive weapon skills.'),
    ('WR0014', 'RT0006', 'Nurse', 'Assists and learns from the doctor to one day be one if needed.'),
    ('WR0015', 'RT0006', 'Doctor', 'Treats sickness, injuries, and performs surgeries.'),
    ('WR0016', 'RT0006', 'Nurse', 'Teaches the children offensive and defensive weapon skills.'),
    ('WR0017', 'RT0007', 'Soldier', 'All 16+ year old able-bodied citizens. The first line of attack and defense.'),
    ('WR0018', 'RT0007', 'Major', 'The second-in-command. Trains and leads the soldiers.'),
    ('WR0019', 'RT0007', 'General', 'The highest rank in the military.'),
    ('WR0020', 'RT0008', 'Council', 'An elected member of a group that makes laws and major decisions.'),
    ('WR0021', 'RT0008', 'Judge', 'An elected member who presides over court proceedings.'),
    ('WR0022', 'RT0008', 'Scientist', 'Studies the Zombie virus looking for a cure.');

-- People LR

INSERT INTO People
VALUES
    ('PE0001',	'Carter',	'Jo',	21,	'FA0002',	'WR0014'),
    ('PE0002',	'Debby',	NULL,	35,	'FA0008',	'WR0008'),
    ('PE0003',	'Cassy',	'Porter',	64,	NULL,	NULL),
    ('PE0004',	'Patty',	'Tamsin',	NULL,	'FA0008',	'WR0011'),
    ('PE0005',	'Jaimie',	NULL,	23,	NULL	NULL),
    ('PE0006',	'Cali',	'Cher',	45,	'FA0002',	'WR0015'),
    ('PE0007',	'Ash',	'Williams',	NULL,	NULL,	NULL),
    ('PE0008',	'Al',	NULL,	41,	'FA0004',	'WR0004'),
    ('PE0009',	'Jill',	'Valentine',	49,	'FA0003',	'WR0018'),
    ('PE0010',	'Felix',	'Livy',	24,	'FA0008',	'WR0021'),
    ('PE0011',	'Merv',	'Wallace',	NULL,	'FA0002',	'WR0015'),
    ('PE0012',	'Chris',	'Redfield',	50,	'FA0003',	'WR0019'),
    ('PE0013',	'Gilbert',	'Hewie',	23,	'FA0004',	'WR0004'),
    ('PE0014',	'Winfred',	NULL,	57,	'FA0005',	NULL),
    ('PE0015',	'Lynnette',	'Hal',	NULL,	'FA0004',	'WR0005'),
    ('PE0016',	'Leon',	'Kennedy',	47,	'FA0003',	'WR0018'),
    ('PE0017',	'Bart',	'Aura',	34,	'FA0004',	'WR0004'),
    ('PE0018',	'Barry',	NULL,	24,	'FA0002',	'WR0015'),
    ('PE0019',	'Nolan',	'Velvet',	NULL,	'FA0004',	'WR0004'),
    ('PE0020',	'Craig',	'Boone',	NULL,	'FA0007',	'WR0018'),
    ('PE0021',	'Manny',	'Vargas',	NULL,	'FA0007',	'WR0017'),
    ('PE0022',	'Courtney',	'Sheryl',	24,	'FA0004',	'WR0005'),
    ('PE0023',	'Brooke',	'Benny',	34,	'FA0005',	NULL),
    ('PE0024',	'Fisher',	'Tripp',	NULL,	NULL,	NULL),
    ('PE0025',	'Clifton',	NULL,	35,	'FA0008',	'WR0007'),
    ('PE0026',	'Amy',	'Matt',	42,	'FA0002',	'WR0014'),
    ('PE0027',	'Billy',	NULL,	NULL,	NULL,	NULL),
    ('PE0028',	'Henry',	'Elton',	34,	'FA0008',	'WR0001'),
    ('PE0029',	'Craig',	'Mariah',	NULL,	'FA0008',	'WR0003'),
    ('PE0030',	'Wendell',	NULL,	24,	'FA0002',	'WR0014');

-- Zombies LR

INSERT INTO Zombies
VALUES
    ('ZM0001',	'Test Subject #1',	NULL,	NULL,	NULL,	'VT0013'),
    ('ZM0002',	'Kai',	NULL,	NULL,	NULL,	NULL),
    ('ZM0003',	'Jon',	NULL,	NULL,	'FA0006',	'VT0025'),
    ('ZM0004',	'Kyrie',	NULL,	24,	NULL,	'VT0001'),
    ('ZM0005',	'Trace',	NULL,	NULL,	'FA0001',	NULL),
    ('ZM0006',	'John',	NULL,	57,	'FA0006',	'VT0025'),
    ('ZM0007',	'Delano',	'Joy',	53,	NULL,	NULL),
    ('ZM0008',	'Test Subject #2',	NULL,	NULL,	NULL,	'VT0003'),
    ('ZM0009',	'Clancy',	NULL,	NULL,	'FA0001',	'VT0023'),
    ('ZM0010',	'Heidi',	NULL,	12,	NULL,	'VT0001'),
    ('ZM0011',	'Billy',	'Jon',	NULL,	NULL,	'VT0018'),
    ('ZM0012',	'Ed',	NULL,	NULL,	'FA0006',	'VT0025'),
    ('ZM0013',	'Dortha',	NULL,	NULL,	NULL,	NULL),
    ('ZM0014',	'Ursula',	NULL,	24,	NULL,	'VT0018'),
    ('ZM0015',	'Don',	NULL,	35,	NULL,	'VT0001'),
    ('ZM0016',	'Paul',	NULL,	NULL,	'FA0001',	'VT0018'),
    ('ZM0017',	'Bill',	NULL,	NULL,	NULL,	NULL),
    ('ZM0018',	'Quin',	NULL,	NULL,	NULL,	'VT0003'),
    ('ZM0019',	'Misty',	NULL,	NULL,	NULL,	NULL),
    ('ZM0020',	'Test Subject #3',	NULL,	NULL,	'FA0006',	'VT0025'),
    ('ZM0021',	'Corn',	'Cate',	NULL,	NULL,	NULL),
    ('ZM0022',	'Davis',	NULL,	NULL,	NULL,	'VT0013'),
    ('ZM0023',	'Georgia',	NULL,	54,	'FA0001',	'VT0001'),
    ('ZM0024',	'Miss',	'Zip',	NULL,	NULL,	'VT0018'),
    ('ZM0025',	'Test Subject #4',	NULL,	NULL,	NULL,	NULL),
    ('ZM0026',	'Faron',	NULL,	NULL,	'FA0006',	'VT0025'),
    ('ZM0027',	'Gretty',	NULL,	NULL,	NULL,	'VT0013'),
    ('ZM0028',	'Ned',	'Mil',	NULL,	NULL,	NULL),
    ('ZM0029',	'Test Subject #5',	NULL,	NULL,	'FA0001',	'VT0001'),
    ('ZM0030',	'Jax',	NULL,	NULL,	NULL,	NULL);

-- Plants AB

INSERT INTO Plants
VALUES
    ('PL0001',	'Potato',	2, NULL),
    ('PL0002',	'Carrot',	1, NULL),
    ('PL0003',	'Green Beans',	3, NULL),
    ('PL0004',	'Peas',	3, NULL),
    ('PL0005',	'Lettuce',	3, NULL),
    ('PL0006',	'Tomato',	2, NULL),
    ('PL0007',	'Chives',	6, NULL),
    ('PL0008',	'Basil',	7, NULL),
    ('PL0009',	'Spinach',	3, NULL),
    ('PL0010',	'Strawberries',	3, NULL),
    ('PL0011',	'Cabbage',	2, NULL),
    ('PL0012',	'Wheat',	6, NULL),
    ('PL0013',	'Corn',	8, NULL),
    ('PL0014',	'Bell Pepper',	1, NULL);

-- Greenhouse AB

INSERT INTO Greenhouse
VALUES
    ('SP0001',	'FA0004',	'PL0001',	'2046-06-07', NULL),
    ('SP0002',	'FA0004',	'PL0001',	'2046-06-07', NULL),
    ('SP0003',	'FA0004',	'PL0001',	'2046-06-07', NULL),
    ('SP0004',	'FA0004',	'PL0001',	'2046-06-07', NULL),
    ('SP0005',	'FA0004',	'PL0001',	'2046-06-07', NULL),
    ('SP0006',	'FA0004',	'PL0001',	'2046-06-07', NULL),
    ('SP0007',	'FA0004',	'PL0002',	'2046-06-08', NULL),
    ('SP0008',	'FA0004',	'PL0002',	'2046-06-08', NULL),
    ('SP0009',	'FA0004',	'PL0005',	'2046-06-06', NULL),
    ('SP0010',	'FA0004',	'PL0005',	'2046-06-06', NULL),
    ('SP0011',	'FA0004',	'PL0012',	'2046-06-08', NULL),
    ('SP0012',	'FA0004',	'PL0012',	'2046-06-08', NULL),
    ('SP0013',	'FA0004',	'PL0005',	'2046-06-06', NULL),
    ('SP0014',	'FA0004',	'PL0005',	'2046-06-06', NULL),
    ('SP0015',	'FA0004',	'PL0013',	'2046-06-01', NULL),
    ('SP0016',	'FA0004',	'PL0013',	'2046-06-01', NULL),
    ('SP0017',	'FA0004',	'PL0013',	'2046-06-01', NULL),
    ('SP0018',	'FA0004',	'PL0012',	'2046-06-08', NULL),
    ('SP0019',	'FA0004',	'PL0012',	'2046-06-08', NULL),
    ('SP0020',	'FA0004',	'PL0012',	'2046-06-08', NULL),
    ('SP0021',	'FA0007',	'PL0001',	'2046-06-07', NULL),
    ('SP0022',	'FA0007',	'PL0001',	'2046-06-07', NULL),
    ('SP0023',	'FA0007',	'PL0001',	'2046-06-07', NULL),
    ('SP0024',	'FA0007',	'PL0001',	'2046-06-07', NULL),
    ('SP0025',	'FA0007',	'PL0001',	'2046-06-07', NULL),
    ('SP0026',	'FA0007',	'PL0001',	'2046-06-07', NULL),
    ('SP0027',	'FA0007',	'PL0001',	'2046-06-07', NULL),
    ('SP0028',	'FA0007',	'PL0001',	'2046-06-07', NULL),
    ('SP0029',	'FA0007',	'PL0001',	'2046-06-07', NULL),
    ('SP0030',	'FA0007',	'PL0006',	'2046-06-08', NULL),
    ('SP0031',	'FA0007',	'PL0006',	'2046-06-08', NULL),
    ('SP0032',	'FA0007',	'PL0006',	'2046-06-08', NULL),
    ('SP0033',	'FA0007',	'PL0006',	'2046-06-08', NULL),
    ('SP0034',	'FA0007',	'PL0006',	'2046-06-08', NULL),
    ('SP0035',	'FA0007',	'PL0006',	'2046-06-08', NULL),
    ('SP0036',	'FA0007',	'PL0012',	'2046-06-08', NULL),
    ('SP0037',	'FA0007',	'PL0012',	'2046-06-08', NULL),
    ('SP0038',	'FA0007',	'PL0012',	'2046-06-08', NULL),
    ('SP0039',	'FA0007',	'PL0012',	'2046-06-08', NULL),
    ('SP0040',	'FA0007',	'PL0012',	'2046-06-08', NULL),
    ('SP0041',	'FA0008',	'PL0001',	'2046-06-08', NULL),
    ('SP0042',	'FA0008',	'PL0002',	'2046-06-07', NULL),
    ('SP0043',	'FA0008',	'PL0003',	'2046-06-06', NULL),
    ('SP0044',	'FA0008',	'PL0004',	'2046-06-07', NULL),
    ('SP0045',	'FA0008',	'PL0005',	'2046-06-08', NULL),
    ('SP0046',	'FA0008',	'PL0006',	'2046-06-07', NULL),
    ('SP0047',	'FA0008',	'PL0007',	'2046-06-08', NULL),
    ('SP0048',	'FA0008',	'PL0008',	'2046-06-02', NULL),
    ('SP0049',	'FA0008',	'PL0009',	'2046-06-08', NULL),
    ('SP0050',	'FA0008',	'PL0010',	'2046-06-08', NULL),
    ('SP0051',	'FA0008',	'PL0011',	'2046-06-08', NULL),
    ('SP0052',	'FA0008',	'PL0012',	'2046-06-08', NULL),
    ('SP0053',	'FA0008',	'PL0013',	'2046-06-05', NULL),
    ('SP0054',	'FA0008',	'PL0014',	'2046-06-08', NULL),
    ('SP0055',	'FA0008',	'PL0001',	'2046-06-08', NULL),
    ('SP0056',	'FA0008',	'PL0001',	'2046-06-08', NULL),
    ('SP0057',	'FA0008',	'PL0001',	'2046-06-08', NULL),
    ('SP0058',	'FA0008',	'PL0013',	'2046-06-05', NULL),
    ('SP0059',	'FA0008',	'PL0013',	'2046-06-05', NULL),
    ('SP0060',	'FA0008',	'PL0013',	'2046-06-05', NULL);

-- Item Type LR

INSERT INTO ItemType
VALUES
    ('TK0001',	'Food'),
    ('TK0002',	'Weapon'),
    ('TK0003',	'Ammo'),
    ('TK0004',	'First Aid'),
    ('TK0005',	'Water'),
    ('TK0006',	'Seeds'),
    ('TK0007',	'Apparel'),
    ('TK0008',	'Currency'),
    ('TK0009',	'General Supplies'),
    ('TK0010',	'Misc');

-- Items LR

INSERT INTO Items
VALUES
    ('IT0001',	'TK0005',	'Bottled Water',	            'Generic plastic 16oz water bottle. A surprising sight to see.'),
    ('IT0002',	'TK0003',	'Rocks',	                    'Sizable rocks, have some heft to them. Perfect for throwing or shooting'),
    ('IT0003',	'TK0002',	'Slingshot',	                'Perfect for launching projectiles. A bit worn out, though'),
    ('IT0004',	'TK0007',	'Hoodie',	                'Has some tears, but in otherwise good condition'),
    ('IT0005',	'TK0001',	'Canned Beans',	            'Good ol'' 15oz can of baked beans. Sure hope you don''t get sick of these.'),
    ('IT0006',	'TK0001',	'Canned Corn',	            '15oz can of corn. For those who can''t stomach beans.'),
    ('IT0007',	'TK0009',	'Canteen',	                '8oz worn canteen, capable of holding any liquid.'),
    ('IT0008',	'TK0010',	'Paper',	                    'Might be useful.'),
    ('IT0009',	'TK0010',	'Pen',	                    'Could be useful.'),
    ('IT0010',	'TK0002',	'Hand Chainsaw',	            'Perfect for stopping hordes of the undead. Groovy'),
    ('IT0011',	'TK0002',	'Shotgun',	                'Perfect for tackling groups.'),
    ('IT0012',	'TK0002',	'Pistol',	                'Perfect everyday weapon.'),
    ('IT0013',	'TK0002',	'Cleaver',	                'Perfect everyday weapon.'),
    ('IT0014',	'TK0002',	'Machete',	                'Multipurpose!'),
    ('IT0015',	'TK0002',	'Axe',	                    'Perfect everyday weapon.'),
    ('IT0016',	'TK0001',	'Dry Cereal',	            'Expired old 15oz box of cereal. I mean it''s something at least.'),
    ('IT0017',	'TK0008',	'Scotch',	                'qty in oz'),
    ('IT0018',	'TK0009',	'Gasoline',	                'qty in oz'),
    ('IT0019',	'TK0009',	'Lighter',	                'Used to set objects alight with ease.'),
    ('IT0020',	'TK0009',	'Matches',	                'Used to set objects alight with moderate ease.'),
    ('IT0021',	'TK0009',	'Wood',	                    'Used for building and fires.'),
    ('IT0022',	'TK0010',	'Casette',	                'Dusty old casette. Might still have it''s use.'),
    ('IT0023',	'TK0008',	'Hard Cider',	            'qty in oz'),
    ('IT0024',	'TK0008',	'Vodka',	                    'qty in oz'),
    ('IT0025',	'TK0008',	'Beer',	                    'qty in oz'),
    ('IT0026',	'TK0008',	'Whiskey',	                'qty in oz'),
    ('IT0027',	'TK0008',	'Bourbon',	                'qty in oz'),
    ('IT0028',	'TK0007',	'Jeans',	                    'Worn, but it does the job.'),
    ('IT0029',	'TK0007',	'Running Shoes',	            'qty in pairs'),
    ('IT0030',	'TK0007',	'T-Shirt',	                'Worn, but it does the job.'),
    ('IT0031',	'TK0007',	'Trenchcoat',	            'For that added flair.'),
    ('IT0032',	'TK0007',	'Button-up Shirt',	        'Some rips and tears, but perfect for completing business.'),
    ('IT0033',	'TK0007',	'Blazer',	                'Some rips and tears, but perfect for completing business.'),
    ('IT0034',	'TK0007',	'Dress Shoes',	            'Some rips and tears, but perfect for completing business.'),
    ('IT0035',	'TK0010',	'Mixed Seeds Packets',   	'No idea what these might contain.'),
    ('IT0036',	'TK0010',	'Bobby Pin',                 'Could be used for hair. Might be able to pick a lock with the right skills...'),
    ('IT0037',  'TK0008',       'Rum',                       'qty in oz'),
    ('IT0038',  'TK0008',       'Rubbing Alcohol',           'qty in oz'),
    ('IT0039', 	'TK0001',	'Fresh Potatoes',	NULL),
    ('IT0040', 	'TK0001',	'Fresh Carrots',	NULL),
    ('IT0041', 	'TK0001',	'Fresh Green Beans',	NULL),
    ('IT0042', 	'TK0001',	'Fresh Peas',	NULL),
    ('IT0043', 	'TK0001',	'Fresh Lettuce',	NULL),
    ('IT0044', 	'TK0001',	'Fresh Tomatoes',	NULL),
    ('IT0045', 	'TK0001',	'Fresh Chives',	NULL),
    ('IT0046', 	'TK0001',	'Fresh Basil',	NULL),
    ('IT0047', 	'TK0001',	'Fresh Spinach',	NULL),
    ('IT0048', 	'TK0001',	'Fresh Strawberries',	NULL),
    ('IT0049', 	'TK0001',	'Fresh Cabbage',	NULL),
    ('IT0050', 	'TK0001',	'Wheat',	NULL),
    ('IT0051', 	'TK0001',	'Fresh Corn',	NULL),
    ('IT0052', 	'TK0001',	'Fresh Bell Pepper',	NULL),
    ('IT0053',	'TK0002',	'Submachine Gun',	        'Useful against groups, though it burns through ammo.'),
    ('IT0054',	'TK0002',	'Sporting Rifle',	        'A quick and reliable semi-automatic rifle.'),
    ('IT0055',	'TK0002',	'Hunting Rifle',	        'A simple yet effective bolt-action rifle. Best used in a defensive position.'),
    ('IT0056',	'TK0002',	'Assault Rifle',	        'A fully-automatic military rifle.'),
    ('IT0057',	'TK0002',	'Revolver',	                'Pretty big for a handgun.'),
    ('IT0058',	'TK0002',	'Sniper Rifle',	            'Huge in both size and caliber, and impractical for most situations.'),
    ('IT0059'   'TK0004',   'First Aid Kit',            'Standard first aid kit.');
    

-- Inventory LR

INSERT INTO Inventory
VALUES
    ('FA0002',	'IT0038',	336),
    ('FA0002',	'IT0012',	6),
    ('FA0002',	'IT0059',	85),
    ('FA0002',	'IT0028',	20),
    ('FA0002',	'IT0030',	21),
    ('FA0003',	'IT0053',	15),
    ('FA0003',	'IT0054',	16),
    ('FA0003',	'IT0055',	24),
    ('FA0003',	'IT0056',	21),
    ('FA0003',	'IT0057',	26),
    ('FA0003',	'IT0058',	23),
    ('FA0003',	'IT0059',	46),
    ('FA0003',	'IT0011',	15),
    ('FA0003',	'IT0019',	12),
    ('FA0003',	'IT0020',	13),
    ('FA0004',	'IT0039',	40),
    ('FA0004',	'IT0040',	32),
    ('FA0004',	'IT0041',	201),
    ('FA0004',	'IT0042',	178),
    ('FA0004',	'IT0043',	14),
    ('FA0004',	'IT0044',	304),
    ('FA0004',	'IT0045',	3),
    ('FA0004',	'IT0046',	7),
    ('FA0004',	'IT0047',	7),
    ('FA0004',	'IT0048',	34),
    ('FA0004',	'IT0049',	9),
    ('FA0004',	'IT0050',	140),
    ('FA0004',	'IT0051',	36),
    ('FA0004',	'IT0052',	10),
    ('FA0004',	'IT0011',	7),
    ('FA0004',	'IT0054',	9),
    ('FA0005',	'IT0008',	2),
    ('FA0005',	'IT0009',	3),
    ('FA0006',	'IT0053',	27),
    ('FA0006',	'IT0054',	29),
    ('FA0006',	'IT0055',	36),
    ('FA0006',	'IT0056',	34),
    ('FA0006',	'IT0057',	39),
    ('FA0006',	'IT0058',	24),
    ('FA0007',	'IT0058',	7),
    ('FA0007',	'IT0059',	24),
    ('FA0007',	'IT0039',	47),
    ('FA0007',	'IT0044',	36),
    ('FA0007',	'IT0050',	34),
    ('FA0007',	'IT0003',	4),
    ('FA0008',	'IT0053',	15),
    ('FA0008',	'IT0054',	16),
    ('FA0008',	'IT0055',	24),
    ('FA0008',	'IT0056',	21),
    ('FA0008',	'IT0057',	26),
    ('FA0008',	'IT0058',	23),
    ('FA0008',	'IT0059',	46),
    ('FA0008',	'IT0011',	15),
    ('FA0008',	'IT0019',	12),
    ('FA0008',	'IT0020',	13),
    ('FA0008',	'IT0039',	10),
    ('FA0008',	'IT0040',	3),
    ('FA0008',	'IT0041',	34),
    ('FA0008',	'IT0042',	7),
    ('FA0008',	'IT0043',	8),
    ('FA0008',	'IT0044',	15),
    ('FA0008',	'IT0045',	14),
    ('FA0008',	'IT0046',	16),
    ('FA0008',	'IT0047',	3),
    ('FA0008',	'IT0048',	24),
    ('FA0008',	'IT0049',	21),
    ('FA0008',	'IT0050',	26),
    ('FA0008',	'IT0051',	19),
    ('FA0008',	'IT0052',	18);

-- Ammo AB
-- ammo key formatted as 'AM0000'
INSERT INTO Ammo
VALUES
	('AM0001', 'Rock'),
	('AM0002', 'Steel Ball'),
	('AM0003', '12-Gauge Buckshot'),
	('AM0004', '12-Gauge Slug'),
	('AM0005', '9mm NATO'),
	('AM0006', '.45 ACP'),
	('AM0007', '5.56x45mm NATO'),
	('AM0008', '7.62x39mm'),
	('AM0009', '.308 Winchester'),
	('AM0010', '.30-06 Springfield'),
	('AM0011', '.357 Magnum'),
	('AM0012', '.45 Magnum'),
	('AM0013', '.50 BMG');

-- Weapon Ammo AB
INSERT INTO WeaponAmmo
VALUES
	('IT0003', 'AM0001'),
	('IT0003', 'AM0002'),
	('IT0011', 'AM0003'),
	('IT0011', 'AM0004'),
	('IT0012', 'AM0005'),
	('IT0012', 'AM0006'),
	('IT0053', 'AM0005'),
	('IT0053', 'AM0006'),
	('IT0054', 'AM0007'),
	('IT0054', 'AM0008'),
	('IT0055', 'AM0009'),
	('IT0055', 'AM0010'),
	('IT0056', 'AM0007'),
	('IT0056', 'AM0008'),
	('IT0057', 'AM0011'),
	('IT0057', 'AM0012'),
	('IT0058', 'AM0013');


-- Currency AH

INSERT INTO Currency
VALUES
    ('IT0017', 5),
    ('IT0023', 1),
    ('IT0024', 10),
    ('IT0025', 1),
    ('IT0026', 5),
    ('IT0027', 5),
    ('IT0037', 10),
    ('IT0038', 20);
