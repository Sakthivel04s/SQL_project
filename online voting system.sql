-- create database
create database online_voting_system;
use online_voting_system;

-- create voter table
create table Voter(
VoterID INT primary key auto_increment,
Name varchar(100) not null,
Age int check (Age>=18),
Gender enum('Male','Female','others'),
Address varchar(100),
Email varchar(100) unique not null,
Password varchar(100) not null,
HasVoted boolean default false 
);
-- data insert to the table
INSERT INTO Voter (Name, Age, Gender, Address, Email, Password, HasVoted) VALUES
('Alice Johnson', 25, 'Female', '123 Elm St, Springfield', 'alice.johnson@example.com', 'password123', false),
('Bob Smith', 32, 'Male', '456 Oak Ave, Lincoln', 'bob.smith@example.com', 'mypassword321', true),
('Charlie Brown', 19, 'Male', '789 Pine Rd, Greenfield', 'charlie.brown@example.com', 'password@2025', false),
('David Lee', 40, 'Male', '101 Maple Blvd, Rivertown', 'david.lee@example.com', 'davidPass123', true),
('Emma Williams', 28, 'Female', '202 Birch Ln, Lakeside', 'emma.williams@example.com', 'emmapass@321', false),
('Fay Patel', 22, 'Female', '303 Cedar Dr, Hillview', 'fay.patel@example.com', 'fay1234', true),
('George Clark', 35, 'Male', '404 Walnut St, Westwood', 'george.clark@example.com', 'georgepass123', true),
('Hannah Kim', 31, 'Female', '505 Ash Rd, Oak City', 'hannah.kim@example.com', 'han1234', false),
('Isaac Stone', 26, 'Male', '606 Pine Ct, Rockdale', 'isaac.stone@example.com', 'isaac2025pass', true),
('Jessica Martin', 30, 'Female', '707 Maple St, Clearview', 'jessica.martin@example.com', 'jessica@456', true),
('Kylie Davis', 21, 'Female', '808 Cedar Blvd, Sunnyside', 'kylie.davis@example.com', 'kylie21@pass', false),
('Liam Taylor', 34, 'Male', '909 Oak Dr, Forest Glen', 'liam.taylor@example.com', 'liam2025@123', true),
('Mia Thompson', 24, 'Female', '1010 Birch Ave, Riverside', 'mia.thompson@example.com', 'mia@1234', false),
('Nathan Walker', 38, 'Male', '1111 Maple Rd, Silverlake', 'nathan.walker@example.com', 'nathanpass22', true),
('Olivia Scott', 27, 'Female', '1212 Pine Ave, Northwood', 'olivia.scott@example.com', 'olivia@321', false),
('Paul Adams', 29, 'Male', '1313 Oak Ln, Briarwood', 'paul.adams@example.com', 'paulpass2025', false),
('Quinn Murphy', 33, 'Others', '1414 Cedar St, Fairview', 'quinn.murphy@example.com', 'quinn1234', true),
('Rachel Moore', 42, 'Female', '1515 Ash Blvd, Highland', 'rachel.moore@example.com', 'rachel@pass', true),
('Samuel Green', 23, 'Male', '1616 Birch Rd, Mountainview', 'samuel.green@example.com', 'samuelpass@23', false),
('Tina Clark', 27, 'Female', '1717 Pine Blvd, Meadowbrook', 'tina.clark@example.com', 'tina@321pass', true);

-- create Election table
create table Election(
ElectionID int primary key auto_increment,
Election_Name varchar(100) not null,
Start_Date date not null,
End_Date date not null,
Status enum('Upcoming','ongoing','completed') default('Upcoming')
);
-- data insert to the table
INSERT INTO Election (Election_Name, Start_Date, End_Date, Status) VALUES
('2024 Presidential Election', '2024-11-01', '2024-11-03', 'Upcoming'),
('2024 Senate Election', '2024-09-10', '2024-09-12', 'Upcoming'),
('2024 Gubernatorial Election', '2024-10-01', '2024-10-05', 'Upcoming'),
('2023 Local Elections', '2023-05-15', '2023-05-16', 'Completed'),
('2023 Mayoral Election', '2023-11-01', '2023-11-02', 'Completed'),
('2024 Congressional Elections', '2024-06-01', '2024-06-03', 'Upcoming'),
('2025 Presidential Election', '2025-11-01', '2025-11-03', 'Upcoming'),
('2023 State Election', '2023-07-01', '2023-07-02', 'Completed'),
('2024 City Council Elections', '2024-02-01', '2024-02-02', 'Upcoming'),
('2025 Senate Election', '2025-09-10', '2025-09-12', 'Upcoming'),
('2024 National Election', '2024-12-01', '2024-12-03', 'Upcoming'),
('2023 County Election', '2023-10-15', '2023-10-16', 'Completed'),
('2023 Parliamentary Election', '2023-04-20', '2023-04-22', 'Completed'),
('2024 General Election', '2024-08-01', '2024-08-03', 'Upcoming'),
('2025 Local Elections', '2025-05-15', '2025-05-16', 'Upcoming'),
('2024 District Election', '2024-09-01', '2024-09-03', 'Upcoming'),
('2025 Gubernatorial Election', '2025-10-01', '2025-10-05', 'Upcoming'),
('2023 National Election', '2023-11-01', '2023-11-03', 'Completed'),
('2024 National Assembly Election', '2024-04-10', '2024-04-12', 'Upcoming'),
('2025 Mayor Election', '2025-06-01', '2025-06-02', 'Upcoming');
-- create candidate table
create table Candidate(
CandidateID int primary key auto_increment,
Name varchar(100) not null,
Party_Name varchar(100),
Position varchar(100),
ElectionID int,
Votes_Received int default 0,
foreign key (ElectionID) references Election(ElectionID) on delete cascade
);
-- data insert to the table
INSERT INTO Candidate (Name, Party_Name, Position, ElectionID, Votes_Received) VALUES
('John Doe', 'Democratic Party', 'President', 1, 3500000),
('Jane Smith', 'Republican Party', 'President', 1, 3300000),
('Emily Johnson', 'Green Party', 'Senator', 2, 1200000),
('Michael Davis', 'Independent', 'Senator', 2, 800000),
('Sarah Lee', 'Democratic Party', 'Governor', 3, 2500000),
('Kevin Turner', 'Republican Party', 'Governor', 3, 2300000),
('Thomas Brown', 'Libertarian Party', 'Governor', 3, 500000),
('Olivia Walker', 'Democratic Party', 'Congresswoman', 4, 1800000),
('David Martinez', 'Republican Party', 'Congressman', 4, 1500000),
('Sophie Wilson', 'Democratic Party', 'Senator', 5, 2700000),
('Ethan Miller', 'Republican Party', 'Senator', 5, 2200000),
('Mason Harris', 'Green Party', 'Mayor', 6, 900000),
('Charlotte Scott', 'Democratic Party', 'Mayor', 6, 1300000),
('Daniel Green', 'Republican Party', 'Mayor', 6, 1100000),
('Ava Thompson', 'Independent', 'City Councilor', 7, 800000),
('William Clark', 'Republican Party', 'City Councilor', 7, 950000),
('Lucas Young', 'Democratic Party', 'City Councilor', 7, 1200000),
('Chloe Adams', 'Libertarian Party', 'Governor', 8, 400000),
('Benjamin Harris', 'Democratic Party', 'President', 9, 3600000),
('Samantha White', 'Republican Party', 'President', 9, 3400000);

-- create vote table
create table Vote(
VoteID int primary key auto_increment,
VoterID int,
CandidateID int,
ElectionID int,
Vote_Time timestamp default current_timestamp,
foreign key(VoterID) references Voter(VoterID) on delete cascade,
foreign key(CandidateID) references Candidate(CandidateID) on delete cascade,
foreign key(ElectionID) references Election(ElectionID) on delete cascade
);
-- data insert to the table
INSERT INTO Vote (VoterID, CandidateID, ElectionID, Vote_Time) VALUES
(1, 1, 1, '2024-11-01 08:15:00'),
(2, 2, 1, '2024-11-01 09:00:00'),
(3, 3, 2, '2024-09-10 10:30:00'),
(4, 4, 2, '2024-09-10 11:00:00'),
(5, 5, 3, '2024-10-02 12:00:00'),
(6, 6, 3, '2024-10-02 12:30:00'),
(7, 7, 4, '2024-02-01 09:45:00'),
(8, 8, 4, '2024-02-01 10:00:00'),
(9, 9, 5, '2024-08-01 14:15:00'),
(10, 10, 5, '2024-08-01 14:45:00'),
(11, 11, 6, '2023-11-01 15:30:00'),
(12, 12, 6, '2023-11-01 16:00:00'),
(13, 13, 7, '2023-10-15 09:00:00'),
(14, 14, 7, '2023-10-15 09:30:00'),
(15, 15, 8, '2024-09-01 12:00:00'),
(16, 16, 8, '2024-09-01 12:45:00'),
(17, 17, 9, '2024-04-10 10:00:00'),
(18, 18, 9, '2024-04-10 10:30:00'),
(19, 19, 10, '2024-06-01 13:30:00'),
(20, 20, 10, '2024-06-01 14:00:00');
-- create admin table
create table Admin (
AdminID int primary key auto_increment,
Name varchar(100) not null,
Email varchar(100) unique not null,
Password varchar(100) not null
);
-- data insert to the table
INSERT INTO Admin (Name, Email, Password) VALUES
('Alice Cooper', 'alice.cooper@example.com', 'password123'),
('Bob Stevens', 'bob.stevens@example.com', 'bobPass2025'),
('Charlie Murphy', 'charlie.murphy@example.com', 'charlie@2024'),
('David King', 'david.king@example.com', 'kingPass!23'),
('Emily Smith', 'emily.smith@example.com', 'emily@admin456'),
('Fay Jenkins', 'fay.jenkins@example.com', 'fayAdmin2024'),
('George Clarke', 'george.clarke@example.com', 'george2025!'),
('Hannah Brown', 'hannah.brown@example.com', 'hannah@admin21'),
('Isaac Lee', 'isaac.lee@example.com', 'isaac2024pass'),
('Jessica White', 'jessica.white@example.com', 'jessica@admin123'),
('Kevin Taylor', 'kevin.taylor@example.com', 'kevinAdmin456'),
('Laura Adams', 'laura.adams@example.com', 'laura2025pass'),
('Michael Harris', 'michael.harris@example.com', 'michael@2024admin'),
('Nina Walker', 'nina.walker@example.com', 'ninaPass2025'),
('Olivia Davis', 'olivia.davis@example.com', 'olivia@admin2024'),
('Paul Scott', 'paul.scott@example.com', 'paul!admin456'),
('Quinn Jackson', 'quinn.jackson@example.com', 'quinnPass2025'),
('Rachel Williams', 'rachel.williams@example.com', 'rachelAdmin321'),
('Samuel Green', 'samuel.green@example.com', 'samuelAdmin2025'),
('Tina Moore', 'tina.moore@example.com', 'tinaPass!admin');

-- Find the total number of eligible voters (age 18 or older)

DELIMITER //
    CREATE PROCEDURE EligibleVotersCount ()
    BEGIN
        SELECT COUNT(*) AS Eligible_Voters
        FROM Voter
        WHERE Age >= 18;
    END //
DELIMITER ;
call EligibleVotersCount();

--  Get the candidate with the highest number of votes in a specific election

DELIMITER //
    CREATE PROCEDURE Top_Candidate_In_Election (IN election_id INT)
    BEGIN
        SELECT c.Name, c.Party_Name,c.position, votes_received
        FROM Vote v
        JOIN Candidate c ON v.CandidateID = c.CandidateID
        WHERE v.ElectionID = election_id
        GROUP BY c.CandidateID
        ORDER BY votes_received DESC
        LIMIT 1;
    END //
DELIMITER ;
CALL Top_Candidate_In_Election(1);


-- find details of voters who voted already in particular election
DELIMITER //
    CREATE PROCEDURE GetVotersWhoVoted (IN election_id INT)
    BEGIN
        SELECT v.VoterID, v.Name, v.Email
        FROM Voter v
        JOIN Vote vo ON v.VoterID = vo.VoterID
        WHERE vo.ElectionID = election_id AND v.HasVoted = TRUE;
    END //
DELIMITER ;
call GetVotersWhoVoted(2);

-- get number of votes received per candidate
DELIMITER //
    CREATE PROCEDURE GetVotesPerCandidate (IN election_id INT)
    BEGIN
        SELECT c.Name AS Candidate_Name, c.votes_received AS Votes_Received
        from candidate c
        WHERE c.ElectionID = election_id;
	
    END //
DELIMITER ;
call GetVotesPerCandidate(1);

-- list of all elections that have already been completed?

DELIMITER //
    CREATE PROCEDURE GetCompletedElections ()
    BEGIN
        SELECT Election_Name, Start_Date, End_Date
        FROM Election
        WHERE Status = 'Completed';
    END //
DELIMITER ;

CALL GetCompletedElections();

-- Get a list of all elections that are currently ongoing
DELIMITER //
    CREATE PROCEDURE GetOngoingElections ()
    BEGIN
        SELECT Election_Name, Start_Date, End_Date
        FROM Election
        WHERE Status = 'Ongoing';
    END //
DELIMITER ;

CALL GetOngoingElections();

-- Get the names and email addresses of all admins
DELIMITER //
    CREATE PROCEDURE GetAdminDetails ()
    BEGIN
        SELECT Name, Email
        FROM Admin;
    END //
DELIMITER ;
CALL GetAdminDetails();

4. How can you retrieve the details of all voters who are below 18 years old?


-- To get voters below 18

DELIMITER //
    CREATE PROCEDURE GetUnderageVoters ()
    BEGIN
        SELECT VoterID, Name, Age, Email
        FROM Voter
        WHERE Age < 18;
    END //
DELIMITER ;
CALL GetUnderageVoters();

-- How can you find the total number of voters who have not yet voted in a specific election

DELIMITER //
    CREATE PROCEDURE GetVotersNotVoted (IN election_id INT)
    BEGIN
        SELECT v.VoterID, v.Name, v.Email
        FROM Voter v
        LEFT JOIN Vote vo ON v.VoterID = vo.VoterID AND vo.ElectionID = election_id
        WHERE v.HasVoted = FALSE OR vo.VoteID IS NULL;
    END //
DELIMITER ;
CALL GetVotersNotVoted(1);

-- Get the names of all candidates from a specific political party in a specific election

DELIMITER //
    CREATE PROCEDURE GetCandidatesByParty (IN election_id INT, IN party_name VARCHAR(100))
    BEGIN
        SELECT Name
        FROM Candidate
        WHERE Party_Name = party_name AND ElectionID = election_id;
    END //
DELIMITER ;
CALL GetCandidatesByParty(1, 'Democratic Party');