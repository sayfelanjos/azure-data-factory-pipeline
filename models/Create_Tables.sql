use [febraban-bi-stg-sqldb];

if not exists (select 1 from sys.schemas where name = 'Assessments')
begin
    exec('create schema Assessments')
end

if not exists (select 1 from sys.schemas where name = 'Audios')
begin
    exec('create schema Audios')
end

if not exists (select 1 from sys.schemas where name = 'Campaigns')
begin
    exec('create schema Campaigns')
end

if not exists (select 1 from sys.schemas where name = 'Categories')
begin
    exec('create schema Categories')
end

if not exists (select 1 from sys.schemas where name = 'Certifications')
begin
    exec('create schema Certifications')
end

if not exists (select 1 from sys.schemas where name = 'Contents')
begin
    exec('create schema Contents')
end

if not exists (select 1 from sys.schemas where name = 'Courses')
begin
    exec('create schema Courses')
end

if not exists (select 1 from sys.schemas where name = 'Files')
begin
    exec('create schema Files')
end

if not exists (select 1 from sys.schemas where name = 'FilesSend')
begin
    exec('create schema FilesSend')
end

if not exists (select 1 from sys.schemas where name = 'HtmlPages')
begin
    exec('create schema HtmlPages')
end

if not exists (select 1 from sys.schemas where name = 'PowerPointPresentation')
begin
    exec('create schema PowerPointPresentation')
end

if not exists (select 1 from sys.schemas where name = 'PresentialMeetings')
begin
    exec('create schema PresentialMeetings')
end

if not exists (select 1 from sys.schemas where name = 'Research')
begin
    exec('create schema Research')
end

if not exists (select 1 from sys.schemas where name = 'Scorms')
begin
    exec('create schema Scorms')
end

if not exists (select 1 from sys.schemas where name = 'Tags')
begin
    exec('create schema Tags')
end

if not exists (select 1 from sys.schemas where name = 'Users')
begin
    exec('create schema Users')
end

if not exists (select 1 from sys.schemas where name = 'VideoConference')
begin
    exec('create schema VideoConference')
end

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Audios' and t.name='Audios'
) 
create table Audios.Audios
(
    AudioID              int not null
        primary key,
    AudioActivityID      int,
    ModuleActivityTypeID int,
    IsDeleted            bit,
    Title                nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);


if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Users' and t.name='BusinessUnits'
) 
create table Users.BusinessUnits
(
    BusinessUnitID                int           not null
        primary key,
    ClientUniqueIdentifier        nvarchar(80) collate SQL_Latin1_General_CP1_CI_AS,
    BusinessUnitName              nvarchar(200) not null collate SQL_Latin1_General_CP1_CI_AS,
    BusinessUnitTypeID            int           not null,
    BusinessUnitType_Identifier   nvarchar(20)  not null collate SQL_Latin1_General_CP1_CI_AS,
    BusinessUnitStatusID          int           not null,
    BusinessUnitStatus_Identifier nvarchar(20)  not null collate SQL_Latin1_General_CP1_CI_AS,
    ParentBusinessUnitID          int,
    IsDeleted                     bit           not null,
    AuditCreatedDate              datetime      not null,
    AuditLastUpdatedDate          datetime,
    Page                          smallint      not null,
    PageSize                      smallint      not null,
    MaximumPageSize               smallint      not null
);


if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Campaigns' and t.name='CampaignContents'
) 
create table Campaigns.CampaignContents
(
    CampaignRepositoryContentID   int not null
        constraint CampaignContents_pk
            primary key,
    IsDeleted                     bit,
    CampaignContentID             int not null,
    RepositoryContentName         nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    Size                          tinyint,
    IsTrash                       bit,
    FullPath                      nvarchar(4000) collate SQL_Latin1_General_CP1_CI_AS,
    CampaignContentTypeID         int,
    CampaignContentTypeIdentifier nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate              datetime,
    AuditLastUpdatedDate          datetime,
    Page                          smallint,
    PageSize                      smallint,
    MaximumPageSize               smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Campaigns' and t.name='Campaigns'
) 
create table Campaigns.Campaigns
(
    CampaignID                    int not null
        primary key,
    IsDeleted                     bit,
    CampaignName                  nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    Beginning                     datetime,
    Ending                        datetime,
    IsActive                      bit,
    CampaignContentID             int,
    ContentName                   nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    ContentTypeID                 int,
    CampaignContentTypeIdentifier nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate              datetime,
    AuditLastUpdatedDate          datetime,
    Page                          smallint,
    PageSize                      smallint,
    MaximumPageSize               smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Categories' and t.name='Categories'
) 
create table Categories.Categories
(
    CategoryID             int      not null
        primary key,
    IsDeleted              bit      not null,
    CategoryName           nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    CategoryTypeID         int      not null,
    CategoryTypeIdentifier nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    ParentCategoryID       int,
    AuditCreatedDate       datetime not null,
    AuditLastUpdatedDate   datetime not null,
    Page                   smallint not null,
    PageSize               smallint not null,
    MaximumPageSize        smallint not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Certifications' and t.name='Certifications'
) 
create table Certifications.Certifications
(
    CertificationID               int      not null
        primary key,
    ClientUniqueIdentifier        nvarchar(40) collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted                     bit      not null,
    Name                          nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    Description                   nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    ExpirationType                nvarchar(10) collate SQL_Latin1_General_CP1_CI_AS,
    ExpirationValue               smallint,
    DaysBeforeRenewal             smallint,
    UseCoursePermission           bit,
    AllowCustomExpirationDate     bit,
    CertificationStatusID         int,
    CertificationStatusIdentifier nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate              datetime not null,
    AuditLastUpdatedDate          datetime not null,
    Page                          smallint not null,
    PageSize                      smallint not null,
    MaximumPageSize               smallint not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Courses' and t.name='Courses'
) 
create table Courses.Courses
(
    CourseID                         int           not null
        primary key,
    ClientUniqueIdentifier           nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted                        bit           not null,
    CourseName                       nvarchar(200) not null collate SQL_Latin1_General_CP1_CI_AS,
    CourseTypeID                     int           not null,
    CourseType_Identifier            nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    RegisterOriginTypeID             int,
    RegisterOriginType_Identifier    nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    CourseModeID                     int,
    CourseMode_Identifier            nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    EstimatedDuration                int,
    MinimumScoringGrade              decimal,
    Points                           int,
    Points_ScoreOnActivityConclusion bit,
    AuditCreatedDate                 datetime      not null,
    AuditLastUpdatedDate             datetime      not null,
    Page                             smallint      not null,
    PageSize                         smallint      not null,
    MaximumPageSize                  smallint      not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Courses' and t.name='CourseCategories'
) 
create table Courses.CourseCategories
(
    CourseCategoryID     int      not null
        primary key,
    CourseID             int      not null
        references Courses.Courses,
    CategoryID           int      not null
        references Categories.Categories,
    IsDeleted            bit      not null,
    AuditCreatedDate     datetime not null,
    AuditLastUpdatedDate datetime not null,
    Page                 smallint not null,
    PageSize             smallint not null,
    MaximumPageSize      smallint not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Courses' and t.name='CourseTags'
) 
create table Courses.CourseTags
(
    TagID           int      not null
        primary key,
    CourseID        int      not null
        references Courses.Courses,
    Page            smallint not null,
    PageSize        smallint not null,
    MaximumPageSize smallint not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Courses' and t.name='Enrollables'
) 
create table Courses.Enrollables
(
    EnrollableID                          int not null
        primary key,
    ClientUniqueIdentifier                nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted                             bit,
    EnrollableName                        nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    SourceEnrollableID                    int,
    CourseID                              int not null
        references Courses.Courses,
    Status_ID                             int,
    Status_Identifier                     nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    EnrollableCancellationReasonID        int,
    Beginning                             datetime,
    Ending                                datetime,
    EstimatedDuration                     int,
    EnrollableEnrollmentMethodID          int,
    EnrollableEnrollmentMethod_Identifier nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    MinimumScoringGrade                   decimal,
    KeepInProgress                        bit,
    PlaceID                               int,
    PlaceRoomID                           decimal,
    AuditCreatedDate                      datetime,
    AuditLastUpdatedDate                  datetime,
    Page                                  smallint,
    PageSize                              smallint,
    MaximumPageSize                       smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Courses' and t.name='ComponentActivities'
) 
create table Courses.ComponentActivities
(
    ComponentActivityID          int           not null
        primary key,
    IsDeleted                    bit           not null,
    ComponentActivityName        nvarchar(200) not null collate SQL_Latin1_General_CP1_CI_AS,
    ComponentActivityOrder       smallint      not null,
    ModuleActivityID             int           not null,
    ModuleActivityTypeID         int           not null,
    ModuleActivityTypeIdentifier nvarchar(80) collate SQL_Latin1_General_CP1_CI_AS,
    IsGradable                   bit           not null,
    GradeTypeID                  int,
    GradeTypeIdentifier          nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    GradeScale                   smallint,
    AccountProgress              bit           not null,
    EvidenceIsMandatory          bit           not null,
    VisibilityID                 int           not null,
    VisibilityIdentifier         nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    VisibilityBeginning          datetime,
    VisibilityEnding             datetime,
    VisibilityHoldDays           smallint,
    VisibilityAvailableDays      smallint,
    ComponentID                  int           not null,
    ComponentName                nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    ComponentOrder               smallint      not null,
    EnrollableID                 int           not null
        references Courses.Enrollables,
    CourseID                     int           not null
        references Courses.Courses,
    AuditCreatedDate             datetime      not null,
    AuditLastUpdatedDate         datetime      not null,
    Page                         smallint      not null,
    PageSize                     smallint      not null,
    MaximumPageSize              smallint      not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Courses' and t.name='Enrollments'
) 
create table Courses.Enrollments
(
    EnrollmentID                int not null
        constraint Enrollments_pk
            primary key,
    ClientUniqueIdentifier      nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted                   bit,
    IsBlocked                   bit,
    EnrollmentTypeID            int,
    EnrollmentType_Identifier   nvarchar(80) collate SQL_Latin1_General_CP1_CI_AS,
    EnrollableID                int not null,
    UserID                      int not null,
    Progress                    decimal,
    AverageGrade                decimal,
    EnrollmentDate              datetime,
    LastAccessDate              datetime,
    ConclusionDate              datetime,
    CourseUserStatusID          int,
    CourseUserStatus_Identifier nvarchar(80) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate            datetime,
    AuditLastUpdatedDate        datetime,
    Page                        smallint,
    PageSize                    smallint,
    MaximumPageSize             smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Courses' and t.name='EquivalencyRequests'
) 
create table Courses.EquivalencyRequests
(
    CourseEquivalencyRequestID int not null
        primary key,
    RequestedCourseID          int,
    EnrollmentID               int,
    RequesterUserID            int,
    RequestCreatedDate         datetime,
    Course                     nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    Institution                nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    Description                nvarchar(2000) collate SQL_Latin1_General_CP1_CI_AS,
    Duration                   smallint,
    Notes                      nvarchar(2000) collate SQL_Latin1_General_CP1_CI_AS,
    ExpirationDate             datetime,
    ConclusionDate             datetime,
    Status                     bit,
    LastActionUserID           nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    LastActionDate             datetime,
    Feedback                   nvarchar(2000) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate           datetime,
    AuditLastUpdatedDate       datetime,
    IsDeleted                  bit,
    Page                       smallint,
    PageSize                   smallint,
    MaximumPageSize            smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Assessments' and t.name='ExamTakenAnswers'
) 
create table Assessments.ExamTakenAnswers
(
    Identifier             nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted              bit,
    ExamTakenID            int not null,
    QuestionID             int not null,
    Grade                  decimal,
    Answer                 nvarchar(4000) collate SQL_Latin1_General_CP1_CI_AS,
    IsCorrect              bit,
    AuditCreatedDate       datetime,
    AuditLastUpdatedDate   datetime,
    Page                   smallint,
    PageSize               smallint,
    MaximumPageSize        smallint,
    EssayAnswerID          int,
    MatchingAnswerID       int,
    MultipleAnswerAnswerID int,
    MultipleChoiceAnswerID int,
    TrueOrFalseAnswerID    int
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Assessments' and t.name='Exams'
) 
create table Assessments.Exams
(
    ExamID                   int not null
        primary key,
    IsDeleted                bit,
    Title                    nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    FullPath                 nvarchar(4000) collate SQL_Latin1_General_CP1_CI_AS,
    AttemptsLimit            tinyint,
    DurationLimit            int,
    KeepScoreTypeID          int,
    KeepScoreType_Identifier nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    ExamTypeID               int,
    ExamType_Identifier      nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate         datetime,
    AuditLastUpdatedDate     datetime,
    Page                     smallint,
    PageSize                 smallint,
    MaximumPageSize          smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='HtmlPages' and t.name='Htmls'
) 
create table HtmlPages.Htmls
(
    HTMLPageID           int           not null
        primary key,
    ModuleActivityTypeID int           not null,
    Title                nvarchar(200) not null collate SQL_Latin1_General_CP1_CI_AS,
    FullPath             nvarchar(400) not null collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted            bit           not null,
    AuditCreatedDate     datetime      not null,
    AuditLastUpdatedDate datetime      not null,
    Page                 smallint      not null,
    PageSize             smallint      not null,
    MaximumPageSize      smallint      not null
);


if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Users' and t.name='Labels'
) 
create table Users.Labels
(
    LabelID                int      not null
        primary key,
    ClientUniqueIdentifier nvarchar(80) collate SQL_Latin1_General_CP1_CI_AS,
    LabelName              nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted              bit      not null,
    AuditCreatedDate       datetime not null,
    AuditLastUpdatedDate   datetime not null,
    Page                   smallint not null,
    PageSize               smallint not null,
    MaximumPageSize        smallint not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Files' and t.name='MediaLibraryHtmls'
) 
create table Files.MediaLibraryHtmls
(
    MediaContentID       int not null
        primary key,
    IsDeleted            bit,
    CategoryID           int,
    Media_Name           nvarchar(4000) collate SQL_Latin1_General_CP1_CI_AS,
    HTMLPageID           int,
    IsEnabled            bit,
    DisplayDate          datetime,
    Points               smallint,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Contents' and t.name='MediaLibraryVideos'
) 
create table Contents.MediaLibraryVideos
(
    MediaContentID       int not null
        constraint MediaLibraryVideos_pk
            primary key,
    IsDeleted            bit,
    CategoryID           int
        constraint MediaLibraryVideos_Categories_CategoryID_fk
            references Categories.Categories,
    Media_Name           nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    VideoID              int,
    IsEnabled            bit,
    DisplayDate          datetime,
    Points               tinyint,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Users' and t.name='OccupationAreas'
) 
create table Users.OccupationAreas
(
    OccupationAreaID                int           not null
        primary key,
    ClientUniqueIdentifier          nvarchar(80) collate SQL_Latin1_General_CP1_CI_AS,
    OccupationAreaName              nvarchar(200) not null collate SQL_Latin1_General_CP1_CI_AS,
    IsManager                       bit           not null,
    OccupationAreaStatusID          int           not null,
    OccupationAreaStatus_Identifier nvarchar(20)  not null collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted                       bit           not null,
    AuditCreatedDate                datetime      not null,
    AuditLastUpdatedDate            datetime      not null,
    Page                            smallint      not null,
    PageSize                        smallint      not null,
    MaximumPageSize                 smallint      not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='PowerPointPresentation' and t.name='PPTS'
) 
create table PowerPointPresentation.PPTS
(
    PresentationID         int           not null
        primary key,
    PresentationActivityID int           not null,
    ModuleActivityTypeID   int           not null,
    IsDeleted              bit           not null,
    Title                  nvarchar(200) not null collate SQL_Latin1_General_CP1_CI_AS,
    SlideCount             smallint      not null,
    LastUploadedFileInfo   nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate       datetime      not null,
    AuditLastUpdatedDate   datetime      not null,
    Page                   smallint      not null,
    PageSize               smallint      not null,
    MaximumPageSize        smallint      not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Courses' and t.name='Places'
) 
create table Courses.Places
(
    PlaceID                int           not null
        primary key,
    PlaceName              nvarchar(200) not null collate SQL_Latin1_General_CP1_CI_AS,
    PlaceStatusID          int           not null,
    PlaceStatus_Identifier nvarchar(20)  not null collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted              bit           not null,
    AuditCreatedDate       datetime      not null,
    AuditLastUpdatedDate   datetime      not null,
    Page                   smallint      not null,
    PageSize               smallint      not null,
    MaximumPageSize        smallint      not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Courses' and t.name='PlaceRooms'
) 
create table Courses.PlaceRooms
(
    PlaceRoomID          int      not null
        primary key,
    PlaceID              int
        references Courses.Places,
    PlaceRoomName        nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    Capacity             smallint not null,
    HasAccessibility     bit      not null,
    Observations         nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted            bit      not null,
    AuditCreatedDate     datetime not null,
    AuditLastUpdatedDate datetime not null,
    Page                 smallint not null,
    PageSize             smallint not null,
    MaximumPageSize      smallint not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Users' and t.name='Positions'
)
create table Users.Positions
(
    PositionID           int           not null
        primary key,
    PositionName         nvarchar(200) not null collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted            bit           not null,
    AuditCreatedDate     datetime      not null,
    AuditLastUpdatedDate datetime,
    Page                 smallint      not null,
    PageSize             smallint      not null,
    MaximumPageSize      smallint      not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='PresentialMeetings' and t.name='PresentialMeetings'
)
create table PresentialMeetings.PresentialMeetings
(
    PresentialMeetingID         int           not null
        primary key,
    PresentialMeetingActivityID int           not null,
    ModuleActivityTypeID        int           not null,
    IsDeleted                   bit           not null,
    Name                        nvarchar(200) not null collate SQL_Latin1_General_CP1_CI_AS,
    Beginning                   datetime      not null,
    Ending                      datetime      not null,
    PlaceID                     int,
    PlaceName                   nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    PlaceCity                   nvarchar(40) collate SQL_Latin1_General_CP1_CI_AS,
    PlaceState                  nvarchar(40) collate SQL_Latin1_General_CP1_CI_AS,
    PlaceCountry                nvarchar(40) collate SQL_Latin1_General_CP1_CI_AS,
    PlaceRoomID                 int,
    PlaceRoom                   nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    PlaceRoomCapacity           smallint,
    PlaceRoomHasAccessibility   bit,
    AuditCreatedDate            datetime      not null,
    AuditLastUpdatedDate        datetime      not null,
    Page                        smallint      not null,
    PageSize                    smallint      not null,
    MaximumPageSize             smallint      not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Assessments' and t.name='Questions'
)
create table Assessments.Questions
(
    QuestionID              int not null
        primary key,
    IsDeleted               bit,
    Title                   nvarchar(max) collate SQL_Latin1_General_CP1_CI_AS,
    Question                nvarchar(max) collate SQL_Latin1_General_CP1_CI_AS,
    DifficultyLevel         tinyint,
    Feedback                nvarchar(4000) collate SQL_Latin1_General_CP1_CI_AS,
    HasAutoCorrection       bit,
    QuestionTypeID          smallint,
    QuestionType_Identifier nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate        datetime,
    AuditLastUpdatedDate    datetime,
    Page                    smallint,
    PageSize                smallint,
    MaximumPageSize         smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Assessments' and t.name='ExamQuestions'
)
create table Assessments.ExamQuestions
(
    ExamQuestionID       int not null
        primary key,
    ExamID               int not null,
    QuestionID           int
        constraint ExamQuestions_Questions_QuestionID_fk
            references Assessments.Questions,
    [Order]              smallint,
    Points               smallint,
    QuestionGroupID      int,
    QuestionGroup_Title  nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted            bit,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Assessments' and t.name='ExamTakenQuestions'
)
create table Assessments.ExamTakenQuestions
(
    ExamTakenQuestionID  int not null
        constraint ExamTakenQuestions_pk
            primary key,
    IsDeleted            bit,
    ExamTakenID          int not null,
    QuestionID           int not null
        constraint ExamTakenQuestions_Questions_QuestionID_fk
            references Assessments.Questions,
    [Order]              tinyint,
    Grade                decimal,
    Points               tinyint,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Scorms' and t.name='Scorms'
)
create table Scorms.Scorms
(
    ScormID               int          not null
        primary key,
    ScormActivityID       int          not null,
    ModuleActivityTypeID  int          not null,
    IsDeleted             bit          not null,
    Title                 nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    Version               nvarchar(10) not null collate SQL_Latin1_General_CP1_CI_AS,
    gradeType             nvarchar(20) not null collate SQL_Latin1_General_CP1_CI_AS,
    keepGradeType         nvarchar(20) not null collate SQL_Latin1_General_CP1_CI_AS,
    AllowMultipleAttempts bit          not null,
    AttemptsLimit         tinyint,
    LastUploadedFileInfo  nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate      datetime     not null,
    AuditLastUpdatedDate  datetime     not null,
    Page                  smallint     not null,
    PageSize              smallint     not null,
    MaximumPageSize       smallint     not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Research' and t.name='SurveyAnswers'
)
create table Research.SurveyAnswers
(
    SurveyAnswerID       int not null
        primary key,
    SurveyID             int,
    EnrollmentID         int,
    EnrollableID         int,
    CourseID             int,
    CampaignID           int,
    UserID               int,
    SubmissionDate       datetime,
    IsDeleted            bit,
    IsAnonymousAnswer    bit,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Research' and t.name='SurveyQuestionOptions'
)
create table Research.SurveyQuestionOptions
(
    SurveyQuestionOptionID int not null
        primary key,
    QuestionID             int,
    Label                  nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    Value                  nvarchar(10) collate SQL_Latin1_General_CP1_CI_AS,
    [Order]                tinyint,
    RequiresJustification  bit,
    IsDeleted              bit,
    AuditCreatedDate       datetime,
    AuditLastUpdatedDate   datetime,
    Page                   smallint,
    PageSize               smallint,
    MaximumPageSize        smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Research' and t.name='SurveyQuestions'
)
create table Research.SurveyQuestions
(
    SurveyQuestionID              int not null
        primary key,
    Question                      nvarchar(max) collate SQL_Latin1_General_CP1_CI_AS,
    SurveyID                      int,
    SurveyOrder                   tinyint,
    SurveyQuestionTypeID          int,
    SurveyQuestionType_Identifier nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    SurveyQuestionType_HasOptions bit,
    GroupingID                    int,
    SurveyQuestionGrouping_Title  nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    IsJustificationMandatory      bit,
    IsDeleted                     bit,
    AuditCreatedDate              datetime,
    AuditLastUpdatedDate          datetime,
    Page                          smallint,
    PageSize                      smallint,
    MaximumPageSize               smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Research' and t.name='SurveyAnswerQuestions'
)
create table Research.SurveyAnswerQuestions
(
    SurveyQuestionAnswerID int not null
        primary key,
    SurveyAnswerID         int not null,
    SurveyQuestionID       int not null
        constraint SurveyAnswerQuestions_SurveyQuestions_SurveyQuestionID_fk
            references Research.SurveyQuestions,
    SurveyQuestionOptionID int,
    Answer                 nvarchar(4000) collate SQL_Latin1_General_CP1_CI_AS,
    Justification          nvarchar(4000) collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted              bit,
    AuditCreatedDate       datetime,
    AuditLastUpdatedDate   datetime,
    Page                   smallint,
    PageSize               smallint,
    MaximumPageSize        smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Research' and t.name='Surveys'
)
create table Research.Surveys
(
    SurveyID                         int not null
        primary key,
    Title                            nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted                        bit,
    PrivacyLevel                     tinyint,
    SurveyTypeID                     int,
    SurveyType_Identifier            nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    CanResponseAfterEnrollablePeriod bit,
    AuditCreatedDate                 datetime,
    AuditLastUpdatedDate             datetime,
    Page                             smallint,
    PageSize                         smallint,
    MaximumPageSize                  smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Tags' and t.name='Tags'
)
create table Tags.Tags
(
    TagID                int not null
        primary key,
    TagName              nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted            bit,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Tags' and t.name='EnrollableTags'
)
create table Tags.EnrollableTags
(
    TagID           int not null
        constraint EnrollableTags_Tags_TagID_fk
            references Tags.Tags,
    EnrollableID    int
        references Courses.Enrollables,
    Page            smallint,
    PageSize        smallint,
    MaximumPageSize smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='FilesSend' and t.name='UploadActivities'
)
create table FilesSend.UploadActivities
(
    FileAssignmentID               int not null
        primary key,
    FileAssignmentUploadActivityID int,
    ModuleActivityTypeID           int,
    IsDeleted                      bit,
    Title                          nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate               datetime,
    AuditLastUpdatedDate           datetime,
    Page                           smallint,
    PageSize                       smallint,
    MaximumPageSize                smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Certifications' and t.name='UserCertifications'
)
create table Certifications.UserCertifications
(
    CertificationID      int not null
        constraint UserCertifications_Certifications_CertificationID_fk
            references Certifications.Certifications,
    UserID               int not null,
    CourseID             int not null
        constraint UserCertifications_Courses_CourseID_fk
            references Courses.Courses,
    GrantedDate          datetime,
    ExpirationDate       datetime,
    Status               nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Users' and t.name='Users'
)
create table Users.Users
(
    UserID                          int          not null
        primary key,
    ClientUniqueIdentifier          char(80) collate SQL_Latin1_General_CP1_CI_AS,
    FirstName                       nvarchar(80) not null collate SQL_Latin1_General_CP1_CI_AS,
    LastName                        nvarchar(80) collate SQL_Latin1_General_CP1_CI_AS,
    Login                           nvarchar(80) not null collate SQL_Latin1_General_CP1_CI_AS,
    CPF                             nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    RG                              nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    Email                           nvarchar(80) collate SQL_Latin1_General_CP1_CI_AS,
    BirthDate                       date,
    GenderIdentifier                nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    IsDeleted                       bit          not null,
    AuditCreatedDate                datetime     not null,
    AuditLastUpdatedDate            datetime     not null,
    LastLogin                       datetime,
    RegisterOriginTypeID            int          not null,
    RegisterOriginType_Identifier   nvarchar(80) collate SQL_Latin1_General_CP1_CI_AS,
    TermsOfUseAcceptance            smallint     not null,
    DefaultPictureURL               nvarchar(4000) collate SQL_Latin1_General_CP1_CI_AS,
    Suspension_IsActive             bit,
    Suspension_Motive               nvarchar(4000) collate SQL_Latin1_General_CP1_CI_AS,
    Suspension_Feedback             nvarchar(4000) collate SQL_Latin1_General_CP1_CI_AS,
    Suspension_StartDate            datetime,
    Suspension_ExpirationDate       datetime,
    Suspension_AuditLastUpdatedDate datetime,
    Page                            smallint     not null,
    PageSize                        smallint     not null,
    MaximumPageSize                 smallint     not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Campaigns' and t.name='CampaignPermissions'
)
create table Campaigns.CampaignPermissions
(
    CampaignPermissionID int not null
        constraint CampaignPermissions_pk
            primary key,
    IsDeleted            bit,
    CampaignID           int not null
        references Campaigns.Campaigns,
    OccupationAreaID     int,
    BusinessUnitID       int
        references Users.BusinessUnits,
    UserID               int
        references Users.Users,
    Inheritable          bit,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Certifications' and t.name='CertificationPermissions'
)
create table Certifications.CertificationPermissions
(
    CertificationID int not null
        references Certifications.Certifications,
    UserID          int not null
        references Users.Users,
    CourseID        int
        references Courses.Courses,
    GranteDate      datetime,
    ExpirationDate  datetime,
    Status          nvarchar(80) collate SQL_Latin1_General_CP1_CI_AS,
    Page            smallint,
    PageSize        smallint,
    MaximumPageSize smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Courses' and t.name='CourseActivityViews'
)
create table Courses.CourseActivityViews
(
    CompletedActivityID  int not null
        primary key,
    CourseID             int not null
        references Courses.Courses,
    EnrollableID         int not null
        references Courses.Enrollables,
    EnrollmentID         int,
    UserID               int not null
        references Users.Users,
    Identifier           nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    ModuleActivityTypeID int,
    ModuleActivityID     int,
    Activity             nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    Attempt              tinyint,
    timeSpent            smallint,
    ConclusionDate       datetime,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Courses' and t.name='CoursePermissions'
)
create table Courses.CoursePermissions
(
    UserID                  int not null
        constraint CoursePermissions_Users_UserID_fk
            references Users.Users,
    CourseID                int not null
        constraint CoursePermissions_Courses_CourseID_fk
            references Courses.Courses,
    CoursePermissionLevelID int,
    Page                    smallint,
    PageSize                smallint,
    MaximumPageSize         smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Assessments' and t.name='ExamTakens'
)
create table Assessments.ExamTakens
(
    ExamTakenID          int not null
        primary key,
    IsDeleted            bit,
    ExamID               int not null,
    EnrollmentID         int not null,
    UserID               int not null
        constraint ExamTakens_Users_UserID_fk
            references Users.Users,
    Attempt              int,
    TimeSpent            int,
    NeedsGrading         bit,
    Grade                decimal,
    Finished             bit,
    CompletionDate       datetime,
    Locked               bit,
    CreatedByLock        bit,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Files' and t.name='MediaLibraryFileDownloads'
)
create table Files.MediaLibraryFileDownloads
(
    DownloadHistoryID    int,
    IsDeleted            bit,
    FileAssignmentID     int,
    UserID               int not null
        references Users.Users,
    FileName             nvarchar(max) collate SQL_Latin1_General_CP1_CI_AS,
    Title                nvarchar(max) collate SQL_Latin1_General_CP1_CI_AS,
    Description          nvarchar(max) collate SQL_Latin1_General_CP1_CI_AS,
    DownloadDate         datetime,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='HtmlPages' and t.name='MediaLibraryHtmlViews'
)
create table HtmlPages.MediaLibraryHtmlViews
(
    AccessHistoryID      int      not null
        primary key,
    IsDeleted            bit      not null,
    UserID               int      not null
        references Users.Users,
    HTMLPageID           int      not null,
    AccessDate           datetime not null,
    AuditCreatedDate     datetime not null,
    AuditLastUpdatedDate datetime not null,
    Page                 smallint not null,
    PageSize             smallint not null,
    MaximumPageSize      smallint not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Contents' and t.name='MediaLibraryPermissions'
)
create table Contents.MediaLibraryPermissions
(
    MediaContentPermissionID     int not null
        primary key,
    UserID                       int not null
        references Users.Users,
    MediaContentID               int,
    ModuleContentTypeID          int,
    ModuleContentType_Identifier nvarchar(80) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate             datetime,
    AuditLastUpdatedDate         datetime,
    Page                         smallint,
    PageSize                     smallint,
    MaximumPageSize              smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Users' and t.name='UserAccessHistorys'
)
create table Users.UserAccessHistorys
(
    UserID            int not null
        references Users.Users,
    Device            nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate  datetime,
    BusinessUnitLinks nvarchar(4000) collate SQL_Latin1_General_CP1_CI_AS,
    Identifier        nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    Page              smallint,
    PageSize          smallint,
    MaximumPageSize   smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Users' and t.name='UserBusinessUnits'
)
create table Users.UserBusinessUnits
(
    UserBusinessUnitID          int not null
        primary key,
    IsDeleted                   bit,
    UserID                      int not null
        references Users.Users,
    BusinessUnitID              int not null
        references Users.BusinessUnits,
    OccupationAreaID            int,
    MonitorIndirectSubordinates bit,
    DirectSuperiorID            int,
    PositionID                  int,
    AdmissionDate               datetime,
    DismissalDate               datetime,
    RegistrationNumber          nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    IsActive                    bit,
    StateID                     int,
    State_Identifier            nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate            datetime,
    AuditLastUpdatedDate        datetime,
    Page                        smallint,
    PageSize                    smallint,
    MaximumPageSize             smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Users' and t.name='UserLabels'
)
create table Users.UserLabels
(
    UserLabelID            int      not null
        primary key,
    ClientUniqueIdentifier nvarchar(80) collate SQL_Latin1_General_CP1_CI_AS,
    UserID                 int      not null
        references Users.Users,
    LabelID                int      not null
        references Users.Labels,
    IsDeleted              bit      not null,
    AuditCreatedDate       datetime not null,
    AuditLastUpdatedDate   datetime not null,
    Page                   smallint not null,
    PageSize               smallint not null,
    MaximumPageSize        smallint not null
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Contents' and t.name='VideoViews'
)
create table Contents.VideoViews
(
    VideoAccessHistoryID int not null
        constraint VideoViews_pk
            primary key,
    IsDeleted            bit,
    UserID               int not null
        references Users.Users,
    VideoID              int,
    AccessDate           datetime,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='Contents' and t.name='Videos'
)
create table Contents.Videos
(
    VideoID                int not null
        primary key,
    IsDeleted              bit,
    Title                  nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS,
    FullPath               nvarchar(4000) collate SQL_Latin1_General_CP1_CI_AS,
    Duration               smallint,
    VideoStatusID          smallint,
    VideoStatus_Identifier nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS,
    IsLive                 bit,
    SeekEnabled            bit,
    IsExternal             bit,
    AuditCreatedDate       datetime,
    AuditLastUpdatedDate   datetime,
    Page                   smallint,
    PageSize               smallint,
    MaximumPageSize        smallint
);

if not exists (
select *
from sys.tables t join sys.schemas s on (t.schema_id = s.schema_id)
where s.name='VideoConference' and t.name='WebMeetings'
)
create table VideoConference.WebMeetings
(
    WebMeetingID         int not null
        constraint WebMeetings_pk
            primary key,
    WebMeetingActivityID int,
    ModuleActivityTypeID int,
    IsDeleted            bit,
    Title                nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    StartDate            datetime,
    EndDate              datetime,
    type                 nvarchar(200) collate SQL_Latin1_General_CP1_CI_AS,
    AuditCreatedDate     datetime,
    AuditLastUpdatedDate datetime,
    Page                 smallint,
    PageSize             smallint,
    MaximumPageSize      smallint
);

