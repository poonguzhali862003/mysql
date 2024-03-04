create database careerhub;
use careerhub;
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    Location VARCHAR(255)
);

CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(255),
    JobDescription TEXT,
    JobLocation VARCHAR(255),
    Salary DECIMAL(10, 2),
    JobType VARCHAR(50),
    PostedDate DATETIME,
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);

CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Resume TEXT
);

CREATE TABLE Applications (
    ApplicationID INT AUTO_INCREMENT PRIMARY KEY,
    JobID INT,
    ApplicantID INT,
    ApplicationDate DATETIME,
    CoverLetter TEXT,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID)
);
INSERT INTO Companies (CompanyID, CompanyName, Location)
VALUES (1, 'Company A', 'City X'),
       (2, 'Company B', 'City Y'),
       (3, 'Company C', 'City Z');
       INSERT INTO Jobs (JobID, CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate)
VALUES (1, 1, 'Software Engineer', 'Job description for Software Engineer position', 'City X', 75000.00, 'Full-time', '2024-03-01 08:00:00'),
       (2, 2, 'Data Analyst', 'Job description for Data Analyst position', 'City Y', 65000.00, 'Full-time', '2024-03-01 09:00:00'),
       (3, 3, 'Marketing Manager', 'Job description for Marketing Manager position', 'City Z', 80000.00, 'Full-time', '2024-03-01 10:00:00');


INSERT INTO Applicants (ApplicantID, FirstName, LastName, Email, Phone, Resume)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
       (2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem.');



SELECT JobTitle, CompanyID, JobLocation, Salary
FROM Jobs
WHERE Salary >= 65000 AND Salary <= 75000;
INSERT INTO Applications (ApplicationID, JobID, ApplicantID, ApplicationDate, CoverLetter)
VALUES (1, 1, '2024-03-02 08:00:00', 'Cover letter for Software Engineer position'),
       (2, 2,  '2024-03-02 09:00:00', 'Cover letter for Data Analyst position');
       
       INSERT INTO Applications ( ApplicationID, JobID,ApplicationDate, CoverLetter)
VALUES (1, 1, '2024-03-02 08:00:00', 'Cover letter for Software Engineer position'),
       (2, 2, '2024-03-02 09:00:00', 'Cover letter for Data Analyst position');
       
       INSERT INTO Applications (JobID, ApplicantID, ApplicationDate, CoverLetter)
VALUES (1, 1, '2024-03-02 08:00:00', 'Cover letter for Software Engineer position'),
       (2, 2, '2024-03-02 09:00:00', 'Cover letter for Data Analyst position');
       INSERT INTO Applications (JobID, ApplicantID, ApplicationDate, CoverLetter)
VALUES 
    (1, 1, '2024-03-02 08:00:00', 'Cover letter for Software Engineer position'),
    (2, 2, '2024-03-02 09:00:00', 'Cover letter for Data Analyst position');
    
    
    
    create database assign;
    use assign;
    CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    Location VARCHAR(255)
);

CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(255),
    JobDescription TEXT,
    JobLocation VARCHAR(255),
    Salary DECIMAL(10, 2),
    JobType VARCHAR(50),
    PostedDate DATETIME,
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);

CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Resume TEXT
);

CREATE TABLE Applications (
    ApplicationID INT AUTO_INCREMENT PRIMARY KEY,
    JobID INT,
    ApplicantID INT,
    ApplicationDate DATETIME,
    CoverLetter TEXT,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID)
);
INSERT INTO Companies (CompanyID, CompanyName, Location)
VALUES (1, 'Company A', 'City X'),
       (2, 'Company B', 'City Y'),
       (3, 'Company C', 'City Z');
       INSERT INTO Jobs (JobID, CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate)
VALUES (1, 1, 'Software Engineer', 'Job description for Software Engineer position', 'City X', 75000.00, 'Full-time', '2024-03-01 08:00:00'),
       (2, 2, 'Data Analyst', 'Job description for Data Analyst position', 'City Y', 65000.00, 'Full-time', '2024-03-01 09:00:00'),
       (3, 3, 'Marketing Manager', 'Job description for Marketing Manager position', 'City Z', 80000.00, 'Full-time', '2024-03-01 10:00:00');


INSERT INTO Applicants (ApplicantID, FirstName, LastName, Email, Phone, Resume)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
       (2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem.');
INSERT INTO Applications (JobID, ApplicantID, ApplicationDate, CoverLetter)
VALUES (1, 1, '2024-03-02 08:00:00', 'Cover letter for Software Engineer position'),
       (2, 2, '2024-03-02 09:00:00', 'Cover letter for Data Analyst position');
       
/****Write an SQL query to count the number of applications received for each job listing in the 
"Jobs" table. Display the job title and the corresponding application count. Ensure that it lists all 
jobs, even if they have no applications. ***********/

SELECT J.JobID, J.JobTitle, COUNT(A.ApplicationID) AS ApplicationCount
FROM Jobs J
LEFT JOIN Applications A ON J.JobID = A.JobID
GROUP BY J.JobID, J.JobTitle;

/**************Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary 
range. Allow parameters for the minimum and maximum salary values. Display the job title, 
company name, location, and salary for each matching job. ***********/

SELECT JobTitle, CompanyID, JobLocation, Salary
FROM Jobs
WHERE Salary >= 65000 AND Salary <= 75000;
use assign;

/*****Write an SQL query that retrieves the job application history for a specific applicant. Allow a 
parameter for the ApplicantID, and return a result set with the job titles, company names, and 
application dates for all the jobs the applicant has applied to. *****/

SELECT Jobs.JobTitle, Companies.CompanyName, Applications.ApplicationDate
FROM Applications
INNER JOIN Jobs ON Applications.JobID = Jobs.JobID
INNER JOIN Companies ON Jobs.CompanyID = Companies.CompanyID
WHERE Applications.ApplicantID = 1;

/********Create an SQL query that calculates and displays the average salary offered by all companies for 
job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero. *******/

SELECT AVG(Salary) AS AverageSalary
FROM Jobs
WHERE Salary > 0;

/***Write an SQL query to identify the company that has posted the most job listings. Display the 
company name along with the count of job listings they have posted. Handle ties if multiple 
companies have the same maximum count. ****/

SELECT CompanyID,  COUNT(JobID) AS JobCount
FROM Jobs
GROUP BY CompanyID
ORDER BY JobCount DESC
LIMIT 1;


/**Retrieve a list of distinct job titles with salaries between $60,000 and $80,000**/
SELECT DISTINCT JobTitle
FROM Jobs
WHERE Salary BETWEEN 60000 AND 80000;

/***Find the jobs that have not received any applications. ***/

SELECT *
FROM Jobs
WHERE JobID NOT IN (SELECT DISTINCT JobID FROM Applications);

/***Retrieve a list of companies along with the count of jobs they have posted, even if they have not 
received any applications. ***/

SELECT Companies.CompanyName, COUNT(Jobs.JobID) AS JobCount
FROM Companies
LEFT JOIN Jobs ON Companies.CompanyID = Jobs.CompanyID
GROUP BY Companies.CompanyName;

/***List all applicants along with the companies and positions they have applied for, including those 
who have not applied.***/

SELECT Applicants.FirstName, Applicants.LastName, Companies.CompanyName, Jobs.JobTitle
FROM Applicants
CROSS JOIN Companies
CROSS JOIN Jobs;

/** Find companies that have posted jobs with a salary higher than the average salary of all jobs. **/

SELECT DISTINCT Companies.CompanyName
FROM Companies
INNER JOIN Jobs ON Companies.CompanyID = Jobs.CompanyID
WHERE Jobs.Salary > (SELECT AVG(Salary) FROM Jobs);

/**Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'. **/

SELECT *
FROM Jobs
WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%';

/*** List all combinations of applicants and companies where the company is in a specific city and the 
applicant has more than 2 years of experience. For example: city=Chennai ***/

SELECT Applicants.FirstName, Applicants.LastName, Companies.CompanyName
FROM Applicants
CROSS JOIN Companies
LEFT JOIN Applications ON Applicants.ApplicantID = Applications.ApplicantID
LEFT JOIN Jobs ON Applications.JobID = Jobs.JobID
WHERE Companies.Location = 'Chennai' AND Applicants.Experience > 2;

ALTER TABLE Applicants
ADD Experience INT;
INSERT INTO Applicants (ApplicantID, FirstName, LastName, Email, Phone, Resume, Experience)
VALUES
    (3, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 3),
    (4, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem.', 5);
    
SELECT Applicants.FirstName, Applicants.LastName, Companies.CompanyName
FROM Applicants
CROSS JOIN Companies
LEFT JOIN Applications ON Applicants.ApplicantID = Applications.ApplicantID
LEFT JOIN Jobs ON Applications.JobID = Jobs.JobID
WHERE Companies.Location = 'Chennai' AND Applicants.Experience > 2;

/**Retrieve a list of applicants and the jobs they have applied for, including those who have not 
applied and jobs without applicants. **/

SELECT Applicants.FirstName, Applicants.LastName, Jobs.JobTitle
FROM Applicants
LEFT OUTER JOIN Applications ON Applicants.ApplicantID = Applications.ApplicantID
LEFT OUTER JOIN Jobs ON Applications.JobID = Jobs.JobID;

/*** Display a list of applicants with their names and a concatenated string of their city and state.***/

SELECT CONCAT(FirstName, ' ', LastName) AS FullName,
CONCAT(City, ', ', State) AS CityState
FROM Applicants;
use assign;
/***Find the applicants who have applied for positions in companies located in 'CityX' and have at 
least 3 years of experience. ***/

SELECT DISTINCT Applicants.*
FROM Applicants
INNER JOIN Applications ON Applicants.ApplicantID = Applications.ApplicantID
INNER JOIN Jobs ON Applications.JobID = Jobs.JobID
INNER JOIN Companies ON Jobs.CompanyID = Companies.CompanyID
WHERE Companies.Location = 'chennai' AND Applicants.Experience >= 3;

/*** Retrieve a list of job applicants along with the companies they have applied to and the positions 
they have applied for. **/

SELECT Applicants.FirstName, Applicants.LastName, Companies.CompanyName, Jobs.JobTitle
FROM Applicants
LEFT JOIN Applications ON Applicants.ApplicantID = Applications.ApplicantID
LEFT JOIN Jobs ON Applications.JobID = Jobs.JobID
LEFT JOIN Companies ON Jobs.CompanyID = Companies.CompanyID;



