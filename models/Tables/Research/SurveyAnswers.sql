IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Research' and t.name='SurveyAnswers'
) 
CREATE TABLE [Research].[SurveyAnswers]
(
	[SurveyAnswerID] [int] NOT NULL PRIMARY KEY,
	[SurveyID] [int] NOT NULL FOREIGN KEY (SurveyID) REFERENCES Research.Surveys(SurveyID),
	[EnrollmentID] [int] NOT NULL FOREIGN KEY (EnrollmentID) REFERENCES Courses.Enrollments(EnrollmentID),
	[EnrollableID] [int] NOT NULL FOREIGN KEY (EnrollableID) REFERENCES Courses.Enrollables(EnrollableID),
	[CourseID] [int] NOT NULL FOREIGN KEY (CourseID) REFERENCES Courses.Courses(CourseID),
	[CampaignID] [int] NULL FOREIGN KEY (CampaignID) REFERENCES Campaigns.Campaigns(CampaignID),
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[SubmissionDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsAnonymousAnswer] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 