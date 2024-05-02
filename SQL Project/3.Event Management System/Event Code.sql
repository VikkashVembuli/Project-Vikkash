CREATE TABLE Events (
    Event_Id SERIAL PRIMARY KEY,
    Event_Name VARCHAR(100),
    Event_Date DATE,
    Event_Location VARCHAR(100),
    Event_Description TEXT
);

CREATE TABLE Attendees (
    Attendee_Id SERIAL PRIMARY KEY,
    Attendee_Name VARCHAR(100),
    Attendee_Phone VARCHAR(15),
    Attendee_Email VARCHAR(100),
    Attendee_City VARCHAR(50)
);

CREATE TABLE Registrations (
    Registration_Id SERIAL PRIMARY KEY,
    Event_Id INT,
    Attendee_Id INT,
    Registration_Date DATE,
    Registration_Amount NUMERIC(10, 2),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
    ('Tech Conference', '2024-06-01', 'Chennai', 'A tech conference for developers.'),
    ('Music Festival', '2024-07-10', 'Kanchipuram', 'An annual music festival featuring various artists.'),
    ('Art Exhibition', '2024-08-15', 'Tamilnadu', 'An exhibition showcasing contemporary art.');

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES
    ('Surya', '123-456-7890', 'Surya@example.com', 'Chennai'),
    ('Nandha', '987-654-3210', 'Nandha@example.com', 'Kanchipuram'),
    ('Sandeep', '555-123-4567', 'Sandeep@example.com', 'Tamilnadu');

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES
    (1, 1, '2024-05-01', 100.00),
    (2, 2, '2024-05-15', 200.00),
    (3, 3, '2024-06-01', 150.00);

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES ('Coding Bootcamp', '2024-09-01', 'Delhi', 'A bootcamp for coding enthusiasts.');

UPDATE Events
SET Event_Location = 'Tamilnadu'
WHERE Event_Id = 1;

DELETE FROM Events
WHERE Event_Id = 4;

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES ('Madhan', '111-222-3333', 'Madhan@example.com', 'China');

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES (1, 4, '2024-07-01', 120.00);

SELECT *
FROM Events
WHERE Event_Id = 1;

SELECT a.Attendee_Name, a.Attendee_Email, r.Registration_Date, r.Registration_Amount
FROM Registrations r
JOIN Attendees a ON r.Attendee_Id = a.Attendee_Id
WHERE r.Event_Id = 2;

SELECT e.Event_Name, COUNT(r.Registration_Id) AS Total_Registrations
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Name;








