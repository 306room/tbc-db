-- ----------------------------------------
-- Elemental Invasion: Fire
-- ----------------------------------------

UPDATE game_event SET start_time="2006-01-01 00:00:00", end_time="2030-12-31 23:59:00", occurence=60*24*3, length=60*24*1.5, description="Elemental Invasion: Fire" WHERE entry=13;

-- ----------------------------------------
-- Elemental Rift from which the NPCs spawn
-- ----------------------------------------
SET @GUID := 54949;

DELETE FROM gameobject WHERE guid BETWEEN @GUID + 1 AND @GUID + 6;
INSERT INTO gameobject (guid, id, map, spawnMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecsmin, spawntimesecsmax, animprogress, state) VALUES
(@GUID + 1, 179666, 1, 1, -7105.06, -1550.73, -272.101, 0, 0, 0, 0, 1, 300, 300, 0, 1),                        -- Fire Elemental Rifts
(@GUID + 2, 179666, 1, 1, -7185.73, -1108.07, -271.805, 0.471239, 0, 0, 0.233445, 0.97237, 300, 300, 0, 1),
(@GUID + 3, 179666, 1, 1, -7331.47, -1196.34, -265.41, 2.58309, 0, 0, 0.961262, 0.275636, 300, 300, 0, 1),
(@GUID + 4, 179666, 1, 1, -7347.25, -1334.56, -263.032, -2.9147, 0, 0, -0.993572, 0.113203, 300, 300, 0, 1),
(@GUID + 5, 179666, 1, 1, -7340.23, -1488.26, -257.98, 0.663225, 0, 0, 0.325568, 0.945519, 300, 300, 0, 1),
(@GUID + 6, 179666, 1, 1, -7007.57, -1393.05, -262.891, 2.67035, 0, 0, 0.972369, 0.233447, 300, 300, 0, 1);

DELETE FROM game_event_gameobject WHERE guid BETWEEN @GUID + 1 AND @GUID + 6;
INSERT INTO game_event_gameobject (guid, event) VALUES
(@GUID + 1, 13),
(@GUID + 2, 13),
(@GUID + 3, 13),
(@GUID + 4, 13),
(@GUID + 5, 13),
(@GUID + 6, 13);

-- ----------------------------------------
-- Fire elemental NPCs
-- ----------------------------------------

-- Stat updates
UPDATE creature_template SET SpeedWalk=1, HealthMultiplier=5, DamageMultiplier=7.5, ArmorMultiplier=1, MinLevelHealth=14355, MaxLevelHealth=14355, MinMeleeDmg=100, MaxMeleeDmg=132, MinRangedDmg=69, MaxRangedDmg=101, MeleeAttackPower=242, RangedAttackPower=25, MeleeBaseAttackTime=2000, RangedBaseAttackTime=2000 WHERE entry=14461;
UPDATE creature_template SET MovementType=1, ArmorMultiplier=1, MinLevelHealth=2533, MaxLevelHealth=2699, MinMeleeDmg=92, MaxMeleeDmg=127, MinRangedDmg=66, MaxRangedDmg=97, MeleeAttackPower=234, RangedAttackPower=23, MeleeBaseAttackTime=2000, RangedBaseAttackTime=2000 WHERE entry=14460;

-- Actual spawns
SET @GUID := 103000;

DELETE FROM game_event_creature WHERE guid BETWEEN @GUID + 1 AND @GUID + 4;
INSERT INTO game_event_creature (guid, event) VALUES
(@GUID + 1, 13),
(@GUID + 2, 13),
(@GUID + 3, 13),
(@GUID + 4, 13);

DELETE FROM creature_linking WHERE master_guid=@GUID + 1;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(@GUID + 2, @GUID + 1, 519),
(@GUID + 3, @GUID + 1, 519),
(@GUID + 4, @GUID + 1, 519);

DELETE FROM creature WHERE guid BETWEEN @GUID + 1 AND @GUID + 4;
INSERT INTO creature (guid, id, map, spawnMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(@GUID + 1, 14461, 1, 0, 0, 0, -7153.77, -1085.68, -272.045, 2.80859, 60*60*24*1.5, 60*60*24*1.5, 0, 0, 14355, 0, 0, 2),
(@GUID + 2, 14460, 1, 0, 0, 0, -7143.03, -1088.31, -271.974, 2.89342, 60*60*24*1.5, 60*60*24*1.5, 0, 0, 2533, 0, 0, 0),
(@GUID + 3, 14460, 1, 0, 0, 0, -7145.11, -1080.19, -272.101, 2.89342, 60*60*24*1.5, 60*60*24*1.5, 0, 0, 2533, 0, 0, 0),
(@GUID + 4, 14460, 1, 0, 0, 0, -7148.78, -1094.69, -269.897, 2.89342, 60*60*24*1.5, 60*60*24*1.5, 0, 0, 2533, 0, 0, 0);

-- Baron Charr movement
DELETE FROM creature_movement_template WHERE entry=14461;
INSERT INTO creature_movement_template (entry, pathId, point, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(14461, 0, 43, -7135.11, -1085.06, -272.109, 0, 0, 0.110975),
(14461, 0, 42, -7117.62, -1101.19, -272.101, 0, 0, 5.53807),
(14461, 0, 41, -7105.38, -1116.83, -266.461, 0, 0, 5.37314),
(14461, 0, 40, -7096.74, -1126.93, -267.963, 0, 0, 5.42027),
(14461, 0, 39, -7065.23, -1166.62, -265.999, 0, 0, 5.39278),
(14461, 0, 38, -7029.37, -1212.32, -270.241, 0, 0, 5.37314),
(14461, 0, 37, -7024.72, -1256.15, -270.973, 0, 0, 4.81944),
(14461, 0, 36, -7015.88, -1290.35, -267.725, 0, 0, 4.94902),
(14461, 0, 35, -7007.79, -1318, -271.518, 0, 0, 1.67784),
(14461, 0, 34, -6986.48, -1365.56, -272.221, 0, 0, 5.13359),
(14461, 0, 33, -6985.28, -1398.54, -270.317, 0, 0, 4.74874),
(14461, 0, 32, -6976.92, -1412.7, -270.775, 0, 0, 5.23962),
(14461, 0, 31, -6993.5, -1475.92, -270.584, 0, 0, 4.47778),
(14461, 0, 30, -7006.99, -1485.66, -265.669, 0, 0, 3.30754),
(14461, 0, 29, -7031.77, -1519.77, -265.586, 0, 0, 3.94371),
(14461, 0, 28, -7062.55, -1536.84, -269.063, 0, 0, 3.67668),
(14461, 0, 27, -7071.44, -1533.38, -267.138, 0, 0, 2.67922),
(14461, 0, 26, -7077.19, -1531.89, -268.312, 0, 0, 2.88735),
(14461, 0, 25, -7082.32, -1529.72, -267.696, 0, 0, 2.74598),
(14461, 0, 24, -7095.81, -1524, -263.08, 0, 0, 2.691),
(14461, 0, 23, -7112.18, -1512.03, -261.656, 0, 0, 2.53392),
(14461, 0, 22, -7127.49, -1507.12, -258.775, 0, 0, 2.87557),
(14461, 0, 21, -7138.84, -1505.07, -267.372, 0, 0, 3.07192),
(14461, 0, 20, -7163.95, -1497.65, -265.527, 0, 0, 2.92662),
(14461, 0, 19, -7191.6, -1530.15, -267.737, 0, 0, 3.99869),
(14461, 0, 18, -7223.72, -1527.94, -270.572, 0, 0, 3.06799),
(14461, 0, 17, -7252.47, -1539.87, -273.447, 0, 0, 3.5353),
(14461, 0, 16, -7326.86, -1520.11, -271.987, 0, 0, 2.89128),
(14461, 0, 15, -7378.39, -1515.09, -271.612, 0, 0, 3.04443),
(14461, 0, 14, -7394.38, -1488.8, -272.073, 0, 0, 2.12551),
(14461, 0, 13, -7376.05, -1461.93, -271.677, 0, 0, 0.970977),
(14461, 0, 12, -7352.03, -1441.67, -267.434, 0, 0, 0.731431),
(14461, 0, 11, -7353.85, -1417.97, -267.298, 0, 0, 1.77208),
(14461, 0, 10, -7357.36, -1409.97, -271.055, 0, 0, 1.98414),
(14461, 0, 9, -7378.38, -1351.95, -271.932, 0, 0, 1.92916),
(14461, 0, 8, -7378.23, -1334.83, -268.018, 0, 0, 1.57573),
(14461, 0, 7, -7363.08, -1249.25, -270.737, 0, 0, 1.42651),
(14461, 0, 6, -7359.81, -1226.75, -267.334, 0, 0, 1.42651),
(14461, 0, 5, -7354.06, -1186.2, -271.498, 0, 0, 1.43043),
(14461, 0, 4, -7325.2, -1155.23, -268.697, 0, 0, 0.821751),
(14461, 0, 3, -7273.02, -1099.11, -270.22, 0, 0, 0.821751),
(14461, 0, 2, -7196.47, -1102.6, -271.634, 0, 0, 6.23707),
(14461, 0, 1, -7153.49, -1085.09, -272.055, 0, 0, 0.236628);


