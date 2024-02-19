create database [febraban-bi-stg-sqldb]
go

use [febraban-bi-stg-sqldb]
go

grant connect on database :: [febraban-bi-stg-sqldb] to dbo
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

create table Courses.CourseTags
(
    TagID           int      not null
        primary key,
    CourseID        int      not null
        references Courses.Courses,
    Page            smallint not null,
    PageSize        smallint not null,
    MaximumPageSize smallint not null
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

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
)
go

create table sys.filestream_tombstone_2073058421
(
    oplsn_fseqno             unknown not null,
    oplsn_bOffset            unknown not null,
    oplsn_slotid             unknown not null,
    file_id                  unknown not null,
    rowset_guid              unknown not null,
    column_guid              unknown,
    filestream_value_name    unknown collate Latin1_General_BIN,
    transaction_sequence_num unknown not null,
    status                   unknown not null,
    size                     unknown
)
go

create unique clustered index FSTSClusIdx
    on sys.filestream_tombstone_2073058421 (oplsn_fseqno, oplsn_bOffset, oplsn_slotid)
go

create index FSTSNCIdx
    on sys.filestream_tombstone_2073058421 (file_id, rowset_guid, column_guid, oplsn_fseqno, oplsn_bOffset,
                                            oplsn_slotid)
go

create table sys.filetable_updates_2105058535
(
    table_id      unknown not null,
    oplsn_fseqno  unknown not null,
    oplsn_bOffset unknown not null,
    oplsn_slotid  unknown not null,
    item_guid     unknown not null
)
go

create unique clustered index FFtUpdateIdx
    on sys.filetable_updates_2105058535 (table_id, oplsn_fseqno, oplsn_bOffset, oplsn_slotid, item_guid)
go

create table sys.queue_messages_1977058079
(
    status                  unknown not null,
    priority                unknown not null,
    queuing_order           unknown identity (0, 1),
    conversation_group_id   unknown not null,
    conversation_handle     unknown not null,
    message_sequence_number unknown not null,
    message_id              unknown not null,
    message_type_id         unknown not null,
    service_id              unknown not null,
    service_contract_id     unknown not null,
    validation              unknown not null collate Latin1_General_BIN,
    next_fragment           unknown not null,
    fragment_size           unknown not null,
    fragment_bitmap         unknown not null,
    binary_message_body     unknown,
    message_enqueue_time    unknown
)
go

create unique clustered index queue_clustered_index
    on sys.queue_messages_1977058079 (status, conversation_group_id, priority, conversation_handle, queuing_order)
go

create unique index queue_secondary_index
    on sys.queue_messages_1977058079 (status, priority, queuing_order, conversation_group_id, conversation_handle,
                                      service_id)
    with (allow_page_locks = OFF)
go

create table sys.queue_messages_2009058193
(
    status                  unknown not null,
    priority                unknown not null,
    queuing_order           unknown identity (0, 1),
    conversation_group_id   unknown not null,
    conversation_handle     unknown not null,
    message_sequence_number unknown not null,
    message_id              unknown not null,
    message_type_id         unknown not null,
    service_id              unknown not null,
    service_contract_id     unknown not null,
    validation              unknown not null collate Latin1_General_BIN,
    next_fragment           unknown not null,
    fragment_size           unknown not null,
    fragment_bitmap         unknown not null,
    binary_message_body     unknown,
    message_enqueue_time    unknown
)
go

create unique clustered index queue_clustered_index
    on sys.queue_messages_2009058193 (status, conversation_group_id, priority, conversation_handle, queuing_order)
go

create unique index queue_secondary_index
    on sys.queue_messages_2009058193 (status, priority, queuing_order, conversation_group_id, conversation_handle,
                                      service_id)
    with (allow_page_locks = OFF)
go

create table sys.queue_messages_2041058307
(
    status                  unknown not null,
    priority                unknown not null,
    queuing_order           unknown identity (0, 1),
    conversation_group_id   unknown not null,
    conversation_handle     unknown not null,
    message_sequence_number unknown not null,
    message_id              unknown not null,
    message_type_id         unknown not null,
    service_id              unknown not null,
    service_contract_id     unknown not null,
    validation              unknown not null collate Latin1_General_BIN,
    next_fragment           unknown not null,
    fragment_size           unknown not null,
    fragment_bitmap         unknown not null,
    binary_message_body     unknown,
    message_enqueue_time    unknown
)
go

create unique clustered index queue_clustered_index
    on sys.queue_messages_2041058307 (status, conversation_group_id, priority, conversation_handle, queuing_order)
go

create unique index queue_secondary_index
    on sys.queue_messages_2041058307 (status, priority, queuing_order, conversation_group_id, conversation_handle,
                                      service_id)
    with (allow_page_locks = OFF)
go

create table sys.sysallocunits
(
    auid       unknown not null,
    type       unknown not null,
    ownerid    unknown not null,
    status     unknown not null,
    fgid       unknown not null,
    pgfirst    unknown not null,
    pgroot     unknown not null,
    pgfirstiam unknown not null,
    pcused     unknown not null,
    pcdata     unknown not null,
    pcreserved unknown not null
)
go

create unique clustered index clust
    on sys.sysallocunits (auid)
go

create unique index nc
    on sys.sysallocunits (ownerid, type, auid)
go

create table sys.sysasymkeys
(
    id         unknown not null,
    name       unknown not null,
    thumbprint unknown not null,
    bitlength  unknown not null,
    algorithm  unknown not null collate Latin1_General_CI_AS_KS_WS,
    modified   unknown not null,
    pkey       unknown,
    encrtype   unknown not null collate Latin1_General_CI_AS_KS_WS,
    pukey      unknown not null
)
go

create unique clustered index cl
    on sys.sysasymkeys (id)
go

create unique index nc1
    on sys.sysasymkeys (name)
go

create unique index nc3
    on sys.sysasymkeys (thumbprint)
go

create table sys.sysaudacts
(
    class         unknown not null,
    id            unknown not null,
    subid         unknown not null,
    grantee       unknown not null,
    audit_spec_id unknown not null,
    type          unknown not null collate Latin1_General_CI_AS_KS_WS,
    state         unknown not null collate Latin1_General_CI_AS_KS_WS
)
go

create unique clustered index clust
    on sys.sysaudacts (class, id, subid, grantee, audit_spec_id, type)
go

create table sys.sysbinobjs
(
    class    unknown not null,
    id       unknown not null,
    nsid     unknown not null,
    name     unknown not null collate Latin1_General_BIN,
    status   unknown not null,
    type     unknown not null collate Latin1_General_BIN,
    intprop  unknown not null,
    created  unknown not null,
    modified unknown not null
)
go

create unique clustered index clst
    on sys.sysbinobjs (class, id)
go

create unique index nc1
    on sys.sysbinobjs (class, nsid, name)
go

create table sys.sysbinsubobjs
(
    class   unknown not null,
    idmajor unknown not null,
    subid   unknown not null,
    name    unknown not null collate Latin1_General_BIN,
    status  unknown not null,
    intprop unknown not null
)
go

create unique clustered index clst
    on sys.sysbinsubobjs (class, idmajor, subid)
go

create unique index nc1
    on sys.sysbinsubobjs (name, idmajor, class)
go

create table sys.sysbrickfiles
(
    brickid           unknown not null,
    dbid              unknown not null,
    pruid             unknown not null,
    fileid            unknown not null,
    grpid             unknown not null,
    status            unknown not null,
    filetype          unknown not null,
    filestate         unknown not null,
    size              unknown not null,
    maxsize           unknown not null,
    growth            unknown not null,
    lname             unknown not null,
    pname             unknown not null,
    createlsn         unknown,
    droplsn           unknown,
    fileguid          unknown,
    internalstatus    unknown not null,
    readonlylsn       unknown,
    readwritelsn      unknown,
    readonlybaselsn   unknown,
    firstupdatelsn    unknown,
    lastupdatelsn     unknown,
    backuplsn         unknown,
    diffbaselsn       unknown,
    diffbaseguid      unknown,
    diffbasetime      unknown not null,
    diffbaseseclsn    unknown,
    redostartlsn      unknown,
    redotargetlsn     unknown,
    forkguid          unknown,
    forklsn           unknown,
    forkvc            unknown not null,
    redostartforkguid unknown
)
go

create unique clustered index clst
    on sys.sysbrickfiles (dbid, pruid, fileid)
go

create table sys.syscerts
(
    id             unknown not null,
    name           unknown not null,
    issuer         unknown not null,
    snum           unknown not null,
    thumbprint     unknown not null,
    pkey           unknown,
    encrtype       unknown not null collate Latin1_General_CI_AS_KS_WS,
    cert           unknown not null,
    status         unknown not null,
    lastpkeybackup unknown
)
go

create unique clustered index cl
    on sys.syscerts (id)
go

create unique index nc1
    on sys.syscerts (name)
go

create unique index nc2
    on sys.syscerts (issuer, snum)
go

create unique index nc3
    on sys.syscerts (thumbprint)
go

create table sys.syschildinsts
(
    lsid      unknown not null,
    iname     unknown not null,
    ipipename unknown not null,
    pid       unknown not null,
    status    unknown not null,
    crdate    unknown not null,
    modate    unknown not null,
    sysdbpath unknown not null
)
go

create unique clustered index cl
    on sys.syschildinsts (lsid)
go

create table sys.sysclones
(
    id       unknown not null,
    subid    unknown not null,
    partid   unknown not null,
    version  unknown not null,
    segid    unknown not null,
    cloneid  unknown not null,
    rowsetid unknown not null,
    dbfragid unknown not null,
    status   unknown not null
)
go

create unique clustered index clst
    on sys.sysclones (id, subid, partid, version, segid, cloneid)
go

create table sys.sysclsobjs
(
    class    unknown not null,
    id       unknown not null,
    name     unknown not null,
    status   unknown not null,
    type     unknown not null collate Latin1_General_CI_AS_KS_WS,
    intprop  unknown not null,
    created  unknown not null,
    modified unknown not null
)
go

create unique clustered index clst
    on sys.sysclsobjs (class, id)
go

create unique index nc
    on sys.sysclsobjs (name, class)
go

create table sys.syscolpars
(
    id          unknown not null,
    number      unknown not null,
    colid       unknown not null,
    name        unknown,
    xtype       unknown not null,
    utype       unknown not null,
    length      unknown not null,
    prec        unknown not null,
    scale       unknown not null,
    collationid unknown not null,
    status      unknown not null,
    maxinrow    unknown not null,
    xmlns       unknown not null,
    dflt        unknown not null,
    chk         unknown not null,
    idtval      unknown
)
go

create unique clustered index clst
    on sys.syscolpars (id, number, colid)
go

create unique index nc
    on sys.syscolpars (id, name, number)
go

create table sys.syscommittab
(
    commit_ts   unknown not null,
    xdes_id     unknown not null,
    commit_lbn  unknown not null,
    commit_csn  unknown not null,
    commit_time unknown not null,
    dbfragid    unknown not null
)
go

create unique clustered index ci_commit_ts
    on sys.syscommittab (commit_ts, xdes_id)
go

create unique index si_xdes_id
    on sys.syscommittab (xdes_id) include (dbfragid)
go

create table sys.syscompfragments
(
    cprelid   unknown not null,
    fragid    unknown not null,
    fragobjid unknown not null,
    ts        unknown not null,
    status    unknown not null,
    datasize  unknown not null,
    itemcnt   unknown not null,
    rowcnt    unknown not null
)
go

create unique clustered index clst
    on sys.syscompfragments (cprelid, fragid)
go

create table sys.sysconvgroup
(
    id         unknown not null,
    service_id unknown not null,
    status     unknown not null,
    refcount   unknown not null
)
go

create unique clustered index clst
    on sys.sysconvgroup (id)
go

create table sys.syscscolsegments
(
    hobt_id                 unknown not null,
    column_id               unknown not null,
    segment_id              unknown not null,
    version                 unknown not null,
    encoding_type           unknown not null,
    row_count               unknown not null,
    status                  unknown not null,
    base_id                 unknown not null,
    magnitude               unknown not null,
    primary_dictionary_id   unknown not null,
    secondary_dictionary_id unknown not null,
    min_data_id             unknown not null,
    max_data_id             unknown not null,
    null_value              unknown not null,
    on_disk_size            unknown not null,
    data_ptr                unknown not null
)
go

create unique clustered index clust
    on sys.syscscolsegments (hobt_id, column_id, segment_id)
go

create table sys.syscsdictionaries
(
    hobt_id       unknown not null,
    column_id     unknown not null,
    dictionary_id unknown not null,
    version       unknown not null,
    type          unknown not null,
    flags         unknown not null,
    last_id       unknown not null,
    entry_count   unknown not null,
    on_disk_size  unknown not null,
    data_ptr      unknown not null
)
go

create unique clustered index clust
    on sys.syscsdictionaries (hobt_id, column_id, dictionary_id)
go

create table sys.sysdbfiles
(
    dbfragid unknown not null,
    fileid   unknown not null,
    fileguid unknown not null,
    pname    unknown
)
go

create unique clustered index clst
    on sys.sysdbfiles (dbfragid, fileid)
go

create table sys.sysdbfrag
(
    dbid    unknown not null,
    fragid  unknown not null,
    name    unknown not null,
    brickid unknown not null,
    pruid   unknown not null,
    status  unknown not null
)
go

create unique clustered index cl
    on sys.sysdbfrag (dbid, fragid)
go

create unique index nc1
    on sys.sysdbfrag (dbid, brickid, pruid)
go

create table sys.sysdbreg
(
    id          unknown not null,
    name        unknown not null,
    sid         unknown,
    status      unknown not null,
    status2     unknown not null,
    category    unknown not null,
    crdate      unknown not null,
    modified    unknown not null,
    svcbrkrguid unknown not null,
    scope       unknown not null,
    cmptlevel   unknown not null
)
go

create unique clustered index clst
    on sys.sysdbreg (id)
go

create unique index nc1
    on sys.sysdbreg (name)
go

create unique index nc2
    on sys.sysdbreg (svcbrkrguid, scope)
go

create table sys.sysdercv
(
    diagid       unknown not null,
    initiator    unknown not null,
    handle       unknown not null,
    rcvseq       unknown not null,
    rcvfrag      unknown not null,
    status       unknown not null,
    state        unknown not null collate Latin1_General_CI_AS_KS_WS,
    lifetime     unknown not null,
    contract     unknown not null,
    svcid        unknown not null,
    convgroup    unknown not null,
    sysseq       unknown not null,
    enddlgseq    unknown not null,
    firstoorder  unknown not null,
    lastoorder   unknown not null,
    lastoorderfr unknown not null,
    dlgtimer     unknown not null,
    dlgopened    unknown not null,
    princid      unknown not null,
    outseskey    unknown not null,
    outseskeyid  unknown not null,
    farprincid   unknown not null,
    inseskey     unknown not null,
    inseskeyid   unknown not null,
    farsvc       unknown not null collate Latin1_General_BIN,
    farbrkrinst  unknown collate Latin1_General_BIN,
    priority     unknown not null
)
go

create unique clustered index cl
    on sys.sysdercv (diagid, initiator)
go

create table sys.sysdesend
(
    handle    unknown not null,
    diagid    unknown not null,
    initiator unknown not null,
    sendseq   unknown not null,
    sendxact  unknown not null
)
go

create unique clustered index cl
    on sys.sysdesend (handle)
go

create table sys.sysendpts
(
    id        unknown not null,
    name      unknown not null,
    protocol  unknown not null,
    type      unknown not null,
    bstat     unknown not null,
    affinity  unknown not null,
    pstat     unknown not null,
    tstat     unknown not null,
    typeint   unknown not null,
    port1     unknown not null,
    port2     unknown not null,
    site      unknown collate Latin1_General_CI_AS_KS_WS,
    dfltns    unknown collate Latin1_General_BIN,
    wsdlproc  unknown,
    dfltdb    unknown,
    authrealm unknown,
    dfltdm    unknown,
    maxconn   unknown not null,
    encalg    unknown not null,
    authtype  unknown not null
)
go

create unique clustered index clst
    on sys.sysendpts (id)
go

create unique index nc1
    on sys.sysendpts (name)
go

create table sys.sysfgfrag
(
    fgid     unknown not null,
    fgfragid unknown not null,
    dbfragid unknown not null,
    phfgid   unknown not null,
    status   unknown not null
)
go

create unique clustered index cl
    on sys.sysfgfrag (fgid, fgfragid, dbfragid, phfgid)
go

create table sys.sysfiles1
(
    status   unknown not null,
    fileid   unknown not null,
    name     unknown not null,
    filename unknown not null
)
go

create table sys.sysfoqueues
(
    id      unknown not null,
    lsn     unknown not null,
    epoch   unknown,
    csn     unknown,
    created unknown not null
)
go

create unique clustered index clst
    on sys.sysfoqueues (id, lsn)
go

create table sys.sysfos
(
    id       unknown not null,
    tgid     unknown not null,
    low      unknown not null,
    high     unknown,
    rowcnt   unknown,
    size     unknown,
    csn      unknown,
    epoch    unknown,
    status   unknown not null,
    history  unknown,
    created  unknown not null,
    modified unknown not null
)
go

create unique clustered index clst
    on sys.sysfos (id)
go

create unique index nc1
    on sys.sysfos (tgid, low, high)
go

create table sys.sysftinds
(
    id                unknown not null,
    indid             unknown not null,
    status            unknown not null,
    crtype            unknown not null collate Latin1_General_CI_AS_KS_WS,
    crstart           unknown,
    crend             unknown,
    crrows            unknown not null,
    crerrors          unknown not null,
    crschver          unknown not null,
    crtsnext          unknown,
    sensitivity       unknown not null,
    bXVTDocidUseBaseT unknown not null,
    batchsize         unknown not null,
    nextdocid         unknown not null,
    fgid              unknown not null
)
go

create unique clustered index clst
    on sys.sysftinds (id)
go

create table sys.sysftproperties
(
    property_list_id   unknown not null,
    property_id        unknown not null,
    property_name      unknown not null collate SQL_Latin1_General_CP437_CS_AS,
    guid_identifier    unknown not null,
    int_identifier     unknown not null,
    string_description unknown
)
go

create unique clustered index clst
    on sys.sysftproperties (property_list_id, property_id)
go

create unique index nonclst
    on sys.sysftproperties (property_list_id, property_name)
go

create unique index nonclstgi
    on sys.sysftproperties (property_list_id, guid_identifier, int_identifier)
go

create table sys.sysftsemanticsdb
(
    database_id   unknown not null,
    register_date unknown not null,
    registered_by unknown not null,
    version       unknown not null,
    fileguid      unknown not null
)
go

create unique clustered index cl
    on sys.sysftsemanticsdb (database_id)
go

create table sys.sysftstops
(
    stoplistid unknown not null,
    stopword   unknown not null collate Latin1_General_BIN,
    lcid       unknown not null,
    status     unknown not null
)
go

create unique clustered index clst
    on sys.sysftstops (stoplistid, stopword, lcid)
go

create table sys.sysguidrefs
(
    class  unknown not null,
    id     unknown not null,
    subid  unknown not null,
    guid   unknown not null,
    status unknown not null
)
go

create unique clustered index cl
    on sys.sysguidrefs (id, class, subid)
go

create unique index nc
    on sys.sysguidrefs (guid, class)
go

create table sys.sysidxstats
(
    id        unknown not null,
    indid     unknown not null,
    name      unknown,
    status    unknown not null,
    intprop   unknown not null,
    fillfact  unknown not null,
    type      unknown not null,
    tinyprop  unknown not null,
    dataspace unknown not null,
    lobds     unknown not null,
    rowset    unknown not null
)
go

create unique clustered index clst
    on sys.sysidxstats (id, indid)
go

create unique index nc
    on sys.sysidxstats (name, id)
go

create table sys.sysiscols
(
    idmajor   unknown not null,
    idminor   unknown not null,
    subid     unknown not null,
    status    unknown not null,
    intprop   unknown not null,
    tinyprop1 unknown not null,
    tinyprop2 unknown not null,
    tinyprop3 unknown not null
)
go

create unique clustered index clst
    on sys.sysiscols (idmajor, idminor, subid)
go

create unique index nc1
    on sys.sysiscols (idmajor, intprop, subid, idminor)
go

create table sys.syslnklgns
(
    srvid   unknown not null,
    lgnid   unknown,
    name    unknown,
    status  unknown not null,
    modate  unknown not null,
    pwdhash unknown
)
go

create unique clustered index cl
    on sys.syslnklgns (srvid, lgnid)
go

create table sys.sysmultiobjrefs
(
    class      unknown not null,
    depid      unknown not null,
    depsubid   unknown not null,
    indepid    unknown not null,
    indepsubid unknown not null,
    status     unknown not null
)
go

create unique clustered index clst
    on sys.sysmultiobjrefs (depid, class, depsubid, indepid, indepsubid)
go

create unique index nc1
    on sys.sysmultiobjrefs (indepid, class, indepsubid, depid, depsubid)
go

create table sys.sysnsobjs
(
    class    unknown not null,
    id       unknown not null,
    name     unknown not null,
    nsid     unknown not null,
    status   unknown not null,
    intprop  unknown not null,
    created  unknown not null,
    modified unknown not null
)
go

create unique clustered index clst
    on sys.sysnsobjs (class, id)
go

create unique index nc
    on sys.sysnsobjs (name, nsid, class)
go

create table sys.sysobjkeycrypts
(
    class      unknown not null,
    id         unknown not null,
    thumbprint unknown not null,
    type       unknown not null collate Latin1_General_CI_AS_KS_WS,
    crypto     unknown not null,
    status     unknown not null
)
go

create unique clustered index cl
    on sys.sysobjkeycrypts (class, id, thumbprint)
go

create table sys.sysobjvalues
(
    valclass unknown not null,
    objid    unknown not null,
    subobjid unknown not null,
    valnum   unknown not null,
    value    unknown,
    imageval unknown
)
go

create unique clustered index clst
    on sys.sysobjvalues (valclass, objid, subobjid, valnum)
go

create table sys.sysowners
(
    id          unknown not null,
    name        unknown not null,
    type        unknown not null collate Latin1_General_CI_AS_KS_WS,
    sid         unknown,
    password    unknown,
    dfltsch     unknown,
    status      unknown not null,
    created     unknown not null,
    modified    unknown not null,
    deflanguage unknown
)
go

create unique clustered index clst
    on sys.sysowners (id)
go

create unique index nc1
    on sys.sysowners (name)
go

create unique index nc2
    on sys.sysowners (sid, id)
go

create table sys.sysphfg
(
    dbfragid unknown not null,
    phfgid   unknown not null,
    fgid     unknown not null,
    type     unknown not null collate Latin1_General_CI_AS_KS_WS,
    fgguid   unknown,
    lgfgid   unknown,
    status   unknown not null,
    name     unknown not null
)
go

create unique clustered index cl
    on sys.sysphfg (phfgid)
go

create table sys.syspriorities
(
    priority_id         unknown not null,
    name                unknown not null,
    service_contract_id unknown,
    local_service_id    unknown,
    remote_service_name unknown,
    priority            unknown not null
)
go

create unique clustered index cl
    on sys.syspriorities (priority_id)
go

create unique index nc
    on sys.syspriorities (service_contract_id, local_service_id, remote_service_name) include (priority)
go

create unique index nc2
    on sys.syspriorities (name)
go

create table sys.sysprivs
(
    class   unknown not null,
    id      unknown not null,
    subid   unknown not null,
    grantee unknown not null,
    grantor unknown not null,
    type    unknown not null collate Latin1_General_CI_AS_KS_WS,
    state   unknown not null collate Latin1_General_CI_AS_KS_WS
)
go

create unique clustered index clust
    on sys.sysprivs (class, id, subid, grantee, grantor, type)
go

create table sys.syspru
(
    brickid unknown not null,
    dbid    unknown not null,
    pruid   unknown not null,
    fragid  unknown not null,
    status  unknown not null
)
go

create unique clustered index cl
    on sys.syspru (dbid, pruid)
go

create table sys.sysprufiles
(
    dbfragid          unknown not null,
    fileid            unknown not null,
    grpid             unknown not null,
    status            unknown not null,
    filetype          unknown not null,
    filestate         unknown not null,
    size              unknown not null,
    maxsize           unknown not null,
    growth            unknown not null,
    lname             unknown not null,
    pname             unknown not null,
    createlsn         unknown,
    droplsn           unknown,
    fileguid          unknown,
    internalstatus    unknown not null,
    readonlylsn       unknown,
    readwritelsn      unknown,
    readonlybaselsn   unknown,
    firstupdatelsn    unknown,
    lastupdatelsn     unknown,
    backuplsn         unknown,
    diffbaselsn       unknown,
    diffbaseguid      unknown,
    diffbasetime      unknown not null,
    diffbaseseclsn    unknown,
    redostartlsn      unknown,
    redotargetlsn     unknown,
    forkguid          unknown,
    forklsn           unknown,
    forkvc            unknown not null,
    redostartforkguid unknown
)
go

create unique clustered index clst
    on sys.sysprufiles (fileid)
go

create table sys.sysqnames
(
    qid  unknown not null,
    hash unknown not null,
    nid  unknown not null,
    name unknown not null collate Latin1_General_BIN
)
go

create unique clustered index clst
    on sys.sysqnames (qid, hash, nid)
go

create unique index nc1
    on sys.sysqnames (nid)
go

create table sys.sysremsvcbinds
(
    id     unknown not null,
    name   unknown not null,
    scid   unknown not null,
    remsvc unknown collate Latin1_General_BIN,
    status unknown not null
)
go

create unique clustered index clst
    on sys.sysremsvcbinds (id)
go

create unique index nc1
    on sys.sysremsvcbinds (name)
go

create unique index nc2
    on sys.sysremsvcbinds (scid, remsvc)
go

create table sys.sysrmtlgns
(
    srvid  unknown not null,
    name   unknown,
    lgnid  unknown,
    status unknown not null,
    modate unknown not null
)
go

create unique clustered index cl
    on sys.sysrmtlgns (srvid, name)
go

create table sys.sysrowsetrefs
(
    class     unknown not null,
    objid     unknown not null,
    indexid   unknown not null,
    rowsetnum unknown not null,
    rowsetid  unknown not null,
    status    unknown not null
)
go

create unique clustered index clust
    on sys.sysrowsetrefs (class, objid, indexid, rowsetnum)
go

create table sys.sysrowsets
(
    rowsetid   unknown not null,
    ownertype  unknown not null,
    idmajor    unknown not null,
    idminor    unknown not null,
    numpart    unknown not null,
    status     unknown not null,
    fgidfs     unknown not null,
    rcrows     unknown not null,
    cmprlevel  unknown not null,
    fillfact   unknown not null,
    maxnullbit unknown not null,
    maxleaf    unknown not null,
    maxint     unknown not null,
    minleaf    unknown not null,
    minint     unknown not null,
    rsguid     unknown,
    lockres    unknown,
    scope_id   unknown
)
go

create unique clustered index clust
    on sys.sysrowsets (rowsetid)
go

create table sys.sysrscols
(
    rsid        unknown not null,
    rscolid     unknown not null,
    hbcolid     unknown not null,
    rcmodified  unknown not null,
    ti          unknown not null,
    cid         unknown not null,
    ordkey      unknown not null,
    maxinrowlen unknown not null,
    status      unknown not null,
    offset      unknown not null,
    nullbit     unknown not null,
    bitpos      unknown not null,
    colguid     unknown
)
go

create unique clustered index clst
    on sys.sysrscols (rsid, hbcolid)
go

create table sys.sysrts
(
    id       unknown not null,
    name     unknown not null,
    remsvc   unknown collate Latin1_General_BIN,
    brkrinst unknown collate Latin1_General_BIN,
    addr     unknown collate Latin1_General_BIN,
    miraddr  unknown collate Latin1_General_BIN,
    lifetime unknown
)
go

create unique clustered index clst
    on sys.sysrts (id)
go

create unique index nc1
    on sys.sysrts (remsvc, brkrinst, id)
go

create unique index nc2
    on sys.sysrts (name)
go

create table sys.sysscalartypes
(
    id          unknown not null,
    schid       unknown not null,
    name        unknown not null,
    xtype       unknown not null,
    length      unknown not null,
    prec        unknown not null,
    scale       unknown not null,
    collationid unknown not null,
    status      unknown not null,
    created     unknown not null,
    modified    unknown not null,
    dflt        unknown not null,
    chk         unknown not null
)
go

create unique clustered index clst
    on sys.sysscalartypes (id)
go

create unique index nc1
    on sys.sysscalartypes (schid, name)
go

create unique index nc2
    on sys.sysscalartypes (name, schid)
go

create table sys.sysschobjs
(
    id       unknown not null,
    name     unknown not null,
    nsid     unknown not null,
    nsclass  unknown not null,
    status   unknown not null,
    type     unknown not null collate Latin1_General_CI_AS_KS_WS,
    pid      unknown not null,
    pclass   unknown not null,
    intprop  unknown not null,
    created  unknown not null,
    modified unknown not null,
    status2  unknown not null
)
go

create unique clustered index clst
    on sys.sysschobjs (id)
go

create unique index nc1
    on sys.sysschobjs (nsclass, nsid, name)
go

create unique index nc2
    on sys.sysschobjs (name, nsid, nsclass)
go

create index nc3
    on sys.sysschobjs (pid, pclass)
go

create table sys.sysseobjvalues
(
    valclass unknown not null,
    id       unknown not null,
    subid    unknown not null,
    valnum   unknown not null,
    value    unknown,
    imageval unknown
)
go

create unique clustered index clst
    on sys.sysseobjvalues (valclass, id, subid, valnum)
go

create table sys.syssingleobjrefs
(
    class      unknown not null,
    depid      unknown not null,
    depsubid   unknown not null,
    indepid    unknown not null,
    indepsubid unknown not null,
    status     unknown not null
)
go

create unique clustered index clst
    on sys.syssingleobjrefs (depid, class, depsubid)
go

create unique index nc1
    on sys.syssingleobjrefs (indepid, class, indepsubid, depid, depsubid)
go

create table sys.syssoftobjrefs
(
    depclass    unknown not null,
    depid       unknown not null,
    indepclass  unknown not null,
    indepname   unknown not null,
    indepschema unknown,
    indepdb     unknown,
    indepserver unknown,
    number      unknown not null,
    status      unknown not null
)
go

create unique clustered index clst
    on sys.syssoftobjrefs (depid, depclass, indepname, indepschema, indepclass, number)
go

create unique index nc1
    on sys.syssoftobjrefs (indepname, indepschema, indepclass, depid, depclass, number)
go

create table sys.syssqlguides
(
    id              unknown not null,
    name            unknown not null,
    scopetype       unknown not null,
    scopeid         unknown not null,
    hash            unknown,
    status          unknown not null,
    created         unknown not null,
    modified        unknown not null,
    batchtext       unknown,
    paramorhinttext unknown
)
go

create unique clustered index clst
    on sys.syssqlguides (id)
go

create unique index nc1
    on sys.syssqlguides (name)
go

create unique index nc2
    on sys.syssqlguides (scopetype, scopeid, hash, id)
go

create table sys.systypedsubobjs
(
    class       unknown not null,
    idmajor     unknown not null,
    subid       unknown not null,
    name        unknown collate Latin1_General_BIN,
    xtype       unknown not null,
    utype       unknown not null,
    length      unknown not null,
    prec        unknown not null,
    scale       unknown not null,
    collationid unknown not null,
    status      unknown not null,
    intprop     unknown not null
)
go

create unique clustered index clst
    on sys.systypedsubobjs (class, idmajor, subid)
go

create unique index nc
    on sys.systypedsubobjs (name, idmajor, class)
go

create table sys.sysusermsgs
(
    id        unknown not null,
    msglangid unknown not null,
    severity  unknown not null,
    status    unknown not null,
    text      unknown not null
)
go

create unique clustered index clst
    on sys.sysusermsgs (id, msglangid)
go

create table sys.syswebmethods
(
    id      unknown not null,
    nmspace unknown collate Latin1_General_BIN,
    alias   unknown not null collate Latin1_General_BIN,
    objname unknown,
    status  unknown not null
)
go

create unique clustered index clst
    on sys.syswebmethods (id, nmspace, alias)
go

create table sys.sysxlgns
(
    id      unknown not null,
    name    unknown not null,
    sid     unknown,
    status  unknown not null,
    type    unknown not null collate Latin1_General_CI_AS_KS_WS,
    crdate  unknown not null,
    modate  unknown not null,
    dbname  unknown,
    lang    unknown,
    pwdhash unknown
)
go

create unique clustered index cl
    on sys.sysxlgns (id)
go

create unique index nc1
    on sys.sysxlgns (name)
go

create unique index nc2
    on sys.sysxlgns (sid)
go

create table sys.sysxmitbody
(
    msgref  unknown not null,
    count   unknown not null,
    msgbody unknown
)
go

create unique clustered index clst
    on sys.sysxmitbody (msgref)
go

create table sys.sysxmitqueue
(
    dlgid        unknown not null,
    finitiator   unknown not null,
    tosvc        unknown collate Latin1_General_BIN,
    tobrkrinst   unknown collate Latin1_General_BIN,
    fromsvc      unknown collate Latin1_General_BIN,
    frombrkrinst unknown collate Latin1_General_BIN,
    svccontr     unknown collate Latin1_General_BIN,
    msgseqnum    unknown not null,
    msgtype      unknown collate Latin1_General_BIN,
    unackmfn     unknown not null,
    status       unknown not null,
    enqtime      unknown not null,
    rsndtime     unknown,
    dlgerr       unknown not null,
    msgid        unknown not null,
    hdrpartlen   unknown not null,
    hdrseclen    unknown not null,
    msgenc       unknown not null,
    msgbodylen   unknown not null,
    msgbody      unknown,
    msgref       unknown
)
go

create unique clustered index clst
    on sys.sysxmitqueue (dlgid, finitiator, msgseqnum)
go

create table sys.sysxmlcomponent
(
    id       unknown not null,
    xsdid    unknown not null,
    uriord   unknown not null,
    qual     unknown not null,
    nameid   unknown not null,
    symspace unknown not null collate Latin1_General_BIN,
    nmscope  unknown not null,
    kind     unknown not null collate Latin1_General_BIN,
    deriv    unknown not null collate Latin1_General_BIN,
    status   unknown not null,
    enum     unknown not null collate Latin1_General_BIN,
    defval   unknown collate Latin1_General_BIN
)
go

create unique clustered index cl
    on sys.sysxmlcomponent (id)
go

create unique index nc1
    on sys.sysxmlcomponent (xsdid, uriord, qual, nameid, symspace, nmscope)
go

create table sys.sysxmlfacet
(
    compid unknown not null,
    ord    unknown not null,
    kind   unknown not null collate Latin1_General_BIN,
    status unknown not null,
    dflt   unknown collate Latin1_General_BIN
)
go

create unique clustered index cl
    on sys.sysxmlfacet (compid, ord)
go

create table sys.sysxmlplacement
(
    placingid unknown not null,
    ordinal   unknown not null,
    placedid  unknown not null,
    status    unknown not null,
    minoccur  unknown not null,
    maxoccur  unknown not null,
    defval    unknown collate Latin1_General_BIN
)
go

create unique clustered index cl
    on sys.sysxmlplacement (placingid, ordinal)
go

create unique index nc1
    on sys.sysxmlplacement (placedid, placingid, ordinal)
go

create table sys.sysxprops
(
    class unknown not null,
    id    unknown not null,
    subid unknown not null,
    name  unknown not null,
    value unknown
)
go

create unique clustered index clust
    on sys.sysxprops (class, id, subid, name)
go

create table sys.sysxsrvs
(
    id             unknown not null,
    name           unknown not null,
    product        unknown not null,
    provider       unknown not null,
    status         unknown not null,
    modate         unknown not null,
    catalog        unknown,
    cid            unknown,
    connecttimeout unknown,
    querytimeout   unknown
)
go

create unique clustered index cl
    on sys.sysxsrvs (id)
go

create unique index nc1
    on sys.sysxsrvs (name)
go

create table sys.trace_xe_action_map
(
    trace_column_id unknown not null,
    package_name    unknown not null collate SQL_Latin1_General_CP1_CI_AS,
    xe_action_name  unknown not null collate SQL_Latin1_General_CP1_CI_AS
)
go

create table sys.trace_xe_event_map
(
    trace_event_id unknown not null,
    package_name   unknown not null collate SQL_Latin1_General_CP1_CI_AS,
    xe_event_name  unknown not null collate SQL_Latin1_General_CP1_CI_AS
)
go

create view INFORMATION_SCHEMA.CHECK_CONSTRAINTS as
-- missing source code
go

create view INFORMATION_SCHEMA.COLUMNS as
-- missing source code
go

create view INFORMATION_SCHEMA.COLUMN_DOMAIN_USAGE as
-- missing source code
go

create view INFORMATION_SCHEMA.COLUMN_PRIVILEGES as
-- missing source code
go

create view INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE as
-- missing source code
go

create view INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE as
-- missing source code
go

create view INFORMATION_SCHEMA.DOMAINS as
-- missing source code
go

create view INFORMATION_SCHEMA.DOMAIN_CONSTRAINTS as
-- missing source code
go

create view INFORMATION_SCHEMA.KEY_COLUMN_USAGE as
-- missing source code
go

create view INFORMATION_SCHEMA.PARAMETERS as
-- missing source code
go

create view INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS as
-- missing source code
go

create view INFORMATION_SCHEMA.ROUTINES as
-- missing source code
go

create view INFORMATION_SCHEMA.ROUTINE_COLUMNS as
-- missing source code
go

create view INFORMATION_SCHEMA.SCHEMATA as
-- missing source code
go

create view INFORMATION_SCHEMA.SEQUENCES as
-- missing source code
go

create view INFORMATION_SCHEMA.TABLES as
-- missing source code
go

create view INFORMATION_SCHEMA.TABLE_CONSTRAINTS as
-- missing source code
go

create view INFORMATION_SCHEMA.TABLE_PRIVILEGES as
-- missing source code
go

create view INFORMATION_SCHEMA.VIEWS as
-- missing source code
go

create view INFORMATION_SCHEMA.VIEW_COLUMN_USAGE as
-- missing source code
go

create view INFORMATION_SCHEMA.VIEW_TABLE_USAGE as
-- missing source code
go

create view sys.all_columns as
-- missing source code
go

create view sys.all_objects as
-- missing source code
go

create view sys.all_parameters as
-- missing source code
go

create view sys.all_sql_modules as
-- missing source code
go

create view sys.all_views as
-- missing source code
go

create view sys.allocation_units as
-- missing source code
go

create view sys.assemblies as
-- missing source code
go

create view sys.assembly_files as
-- missing source code
go

create view sys.assembly_modules as
-- missing source code
go

create view sys.assembly_references as
-- missing source code
go

create view sys.assembly_types as
-- missing source code
go

create view sys.asymmetric_keys as
-- missing source code
go

create view sys.availability_databases_cluster as
-- missing source code
go

create view sys.availability_group_listener_ip_addresses as
-- missing source code
go

create view sys.availability_group_listeners as
-- missing source code
go

create view sys.availability_groups as
-- missing source code
go

create view sys.availability_groups_cluster as
-- missing source code
go

create view sys.availability_read_only_routing_lists as
-- missing source code
go

create view sys.availability_replicas as
-- missing source code
go

create view sys.backup_devices as
-- missing source code
go

create view sys.certificates as
-- missing source code
go

create view sys.change_tracking_databases as
-- missing source code
go

create view sys.change_tracking_tables as
-- missing source code
go

create view sys.check_constraints as
-- missing source code
go

create view sys.column_store_dictionaries as
-- missing source code
go

create view sys.column_store_segments as
-- missing source code
go

create view sys.column_type_usages as
-- missing source code
go

create view sys.column_xml_schema_collection_usages as
-- missing source code
go

create view sys.columns as
-- missing source code
go

create view sys.computed_columns as
-- missing source code
go

create view sys.configurations as
-- missing source code
go

create view sys.conversation_endpoints as
-- missing source code
go

create view sys.conversation_groups as
-- missing source code
go

create view sys.conversation_priorities as
-- missing source code
go

create view sys.credentials as
-- missing source code
go

create view sys.crypt_properties as
-- missing source code
go

create view sys.cryptographic_providers as
-- missing source code
go

create view sys.data_spaces as
-- missing source code
go

create view sys.database_audit_specification_details as
-- missing source code
go

create view sys.database_audit_specifications as
-- missing source code
go

create view sys.database_files as
-- missing source code
go

create view sys.database_filestream_options as
-- missing source code
go

create view sys.database_mirroring as
-- missing source code
go

create view sys.database_mirroring_endpoints as
-- missing source code
go

create view sys.database_mirroring_witnesses as
-- missing source code
go

create view sys.database_permissions as
-- missing source code
go

create view sys.database_principals as
-- missing source code
go

create view sys.database_recovery_status as
-- missing source code
go

create view sys.database_role_members as
-- missing source code
go

create view sys.databases as
-- missing source code
go

create view sys.default_constraints as
-- missing source code
go

create view sys.destination_data_spaces as
-- missing source code
go

create view sys.dm_audit_actions as
-- missing source code
go

create view sys.dm_audit_class_type_map as
-- missing source code
go

create view sys.dm_broker_activated_tasks as
-- missing source code
go

create view sys.dm_broker_connections as
-- missing source code
go

create view sys.dm_broker_forwarded_messages as
-- missing source code
go

create view sys.dm_broker_queue_monitors as
-- missing source code
go

create view sys.dm_cdc_errors as
-- missing source code
go

create view sys.dm_cdc_log_scan_sessions as
-- missing source code
go

create view sys.dm_clr_appdomains as
-- missing source code
go

create view sys.dm_clr_loaded_assemblies as
-- missing source code
go

create view sys.dm_clr_properties as
-- missing source code
go

create view sys.dm_clr_tasks as
-- missing source code
go

create view sys.dm_cryptographic_provider_properties as
-- missing source code
go

create view sys.dm_database_encryption_keys as
-- missing source code
go

create view sys.dm_db_file_space_usage as
-- missing source code
go

create view sys.dm_db_fts_index_physical_stats as
-- missing source code
go

create view sys.dm_db_index_usage_stats as
-- missing source code
go

create view sys.dm_db_log_space_usage as
-- missing source code
go

create view sys.dm_db_mirroring_auto_page_repair as
-- missing source code
go

create view sys.dm_db_mirroring_connections as
-- missing source code
go

create view sys.dm_db_mirroring_past_actions as
-- missing source code
go

create view sys.dm_db_missing_index_details as
-- missing source code
go

create view sys.dm_db_missing_index_group_stats as
-- missing source code
go

create view sys.dm_db_missing_index_groups as
-- missing source code
go

create view sys.dm_db_partition_stats as
-- missing source code
go

create view sys.dm_db_persisted_sku_features as
-- missing source code
go

create view sys.dm_db_script_level as
-- missing source code
go

create view sys.dm_db_session_space_usage as
-- missing source code
go

create view sys.dm_db_task_space_usage as
-- missing source code
go

create view sys.dm_db_uncontained_entities as
-- missing source code
go

create view sys.dm_exec_background_job_queue as
-- missing source code
go

create view sys.dm_exec_background_job_queue_stats as
-- missing source code
go

create view sys.dm_exec_cached_plans as
-- missing source code
go

create view sys.dm_exec_connections as
-- missing source code
go

create view sys.dm_exec_procedure_stats as
-- missing source code
go

create view sys.dm_exec_query_memory_grants as
-- missing source code
go

create view sys.dm_exec_query_optimizer_info as
-- missing source code
go

create view sys.dm_exec_query_resource_semaphores as
-- missing source code
go

create view sys.dm_exec_query_stats as
-- missing source code
go

create view sys.dm_exec_query_transformation_stats as
-- missing source code
go

create view sys.dm_exec_requests as
-- missing source code
go

create view sys.dm_exec_sessions as
-- missing source code
go

create view sys.dm_exec_trigger_stats as
-- missing source code
go

create view sys.dm_filestream_file_io_handles as
-- missing source code
go

create view sys.dm_filestream_file_io_requests as
-- missing source code
go

create view sys.dm_filestream_non_transacted_handles as
-- missing source code
go

create view sys.dm_fts_active_catalogs as
-- missing source code
go

create view sys.dm_fts_fdhosts as
-- missing source code
go

create view sys.dm_fts_index_population as
-- missing source code
go

create view sys.dm_fts_memory_buffers as
-- missing source code
go

create view sys.dm_fts_memory_pools as
-- missing source code
go

create view sys.dm_fts_outstanding_batches as
-- missing source code
go

create view sys.dm_fts_population_ranges as
-- missing source code
go

create view sys.dm_fts_semantic_similarity_population as
-- missing source code
go

create view sys.dm_hadr_auto_page_repair as
-- missing source code
go

create view sys.dm_hadr_availability_group_states as
-- missing source code
go

create view sys.dm_hadr_availability_replica_cluster_nodes as
-- missing source code
go

create view sys.dm_hadr_availability_replica_cluster_states as
-- missing source code
go

create view sys.dm_hadr_availability_replica_states as
-- missing source code
go

create view sys.dm_hadr_cluster as
-- missing source code
go

create view sys.dm_hadr_cluster_members as
-- missing source code
go

create view sys.dm_hadr_cluster_networks as
-- missing source code
go

create view sys.dm_hadr_database_replica_cluster_states as
-- missing source code
go

create view sys.dm_hadr_database_replica_states as
-- missing source code
go

create view sys.dm_hadr_instance_node_map as
-- missing source code
go

create view sys.dm_hadr_name_id_map as
-- missing source code
go

create view sys.dm_io_backup_tapes as
-- missing source code
go

create view sys.dm_io_cluster_shared_drives as
-- missing source code
go

create view sys.dm_io_pending_io_requests as
-- missing source code
go

create view sys.dm_logpool_hashentries as
-- missing source code
go

create view sys.dm_logpool_stats as
-- missing source code
go

create view sys.dm_os_buffer_descriptors as
-- missing source code
go

create view sys.dm_os_child_instances as
-- missing source code
go

create view sys.dm_os_cluster_nodes as
-- missing source code
go

create view sys.dm_os_cluster_properties as
-- missing source code
go

create view sys.dm_os_dispatcher_pools as
-- missing source code
go

create view sys.dm_os_dispatchers as
-- missing source code
go

create view sys.dm_os_hosts as
-- missing source code
go

create view sys.dm_os_latch_stats as
-- missing source code
go

create view sys.dm_os_loaded_modules as
-- missing source code
go

create view sys.dm_os_memory_allocations as
-- missing source code
go

create view sys.dm_os_memory_broker_clerks as
-- missing source code
go

create view sys.dm_os_memory_brokers as
-- missing source code
go

create view sys.dm_os_memory_cache_clock_hands as
-- missing source code
go

create view sys.dm_os_memory_cache_counters as
-- missing source code
go

create view sys.dm_os_memory_cache_entries as
-- missing source code
go

create view sys.dm_os_memory_cache_hash_tables as
-- missing source code
go

create view sys.dm_os_memory_clerks as
-- missing source code
go

create view sys.dm_os_memory_node_access_stats as
-- missing source code
go

create view sys.dm_os_memory_nodes as
-- missing source code
go

create view sys.dm_os_memory_objects as
-- missing source code
go

create view sys.dm_os_memory_pools as
-- missing source code
go

create view sys.dm_os_nodes as
-- missing source code
go

create view sys.dm_os_performance_counters as
-- missing source code
go

create view sys.dm_os_process_memory as
-- missing source code
go

create view sys.dm_os_ring_buffers as
-- missing source code
go

create view sys.dm_os_schedulers as
-- missing source code
go

create view sys.dm_os_server_diagnostics_log_configurations as
-- missing source code
go

create view sys.dm_os_spinlock_stats as
-- missing source code
go

create view sys.dm_os_stacks as
-- missing source code
go

create view sys.dm_os_sublatches as
-- missing source code
go

create view sys.dm_os_sys_info as
-- missing source code
go

create view sys.dm_os_sys_memory as
-- missing source code
go

create view sys.dm_os_tasks as
-- missing source code
go

create view sys.dm_os_threads as
-- missing source code
go

create view sys.dm_os_virtual_address_dump as
-- missing source code
go

create view sys.dm_os_wait_stats as
-- missing source code
go

create view sys.dm_os_waiting_tasks as
-- missing source code
go

create view sys.dm_os_windows_info as
-- missing source code
go

create view sys.dm_os_worker_local_storage as
-- missing source code
go

create view sys.dm_os_workers as
-- missing source code
go

create view sys.dm_qn_subscriptions as
-- missing source code
go

create view sys.dm_repl_articles as
-- missing source code
go

create view sys.dm_repl_schemas as
-- missing source code
go

create view sys.dm_repl_tranhash as
-- missing source code
go

create view sys.dm_repl_traninfo as
-- missing source code
go

create view sys.dm_resource_governor_configuration as
-- missing source code
go

create view sys.dm_resource_governor_resource_pool_affinity as
-- missing source code
go

create view sys.dm_resource_governor_resource_pools as
-- missing source code
go

create view sys.dm_resource_governor_workload_groups as
-- missing source code
go

create view sys.dm_server_audit_status as
-- missing source code
go

create view sys.dm_server_memory_dumps as
-- missing source code
go

create view sys.dm_server_registry as
-- missing source code
go

create view sys.dm_server_services as
-- missing source code
go

create view sys.dm_tcp_listener_states as
-- missing source code
go

create view sys.dm_tran_active_snapshot_database_transactions as
-- missing source code
go

create view sys.dm_tran_active_transactions as
-- missing source code
go

create view sys.dm_tran_commit_table as
-- missing source code
go

create view sys.dm_tran_current_snapshot as
-- missing source code
go

create view sys.dm_tran_current_transaction as
-- missing source code
go

create view sys.dm_tran_database_transactions as
-- missing source code
go

create view sys.dm_tran_locks as
-- missing source code
go

create view sys.dm_tran_session_transactions as
-- missing source code
go

create view sys.dm_tran_top_version_generators as
-- missing source code
go

create view sys.dm_tran_transactions_snapshot as
-- missing source code
go

create view sys.dm_tran_version_store as
-- missing source code
go

create view sys.dm_xe_map_values as
-- missing source code
go

create view sys.dm_xe_object_columns as
-- missing source code
go

create view sys.dm_xe_objects as
-- missing source code
go

create view sys.dm_xe_packages as
-- missing source code
go

create view sys.dm_xe_session_event_actions as
-- missing source code
go

create view sys.dm_xe_session_events as
-- missing source code
go

create view sys.dm_xe_session_object_columns as
-- missing source code
go

create view sys.dm_xe_session_targets as
-- missing source code
go

create view sys.dm_xe_sessions as
-- missing source code
go

create view sys.endpoint_webmethods as
-- missing source code
go

create view sys.endpoints as
-- missing source code
go

create view sys.event_notification_event_types as
-- missing source code
go

create view sys.event_notifications as
-- missing source code
go

create view sys.events as
-- missing source code
go

create view sys.extended_procedures as
-- missing source code
go

create view sys.extended_properties as
-- missing source code
go

create view sys.filegroups as
-- missing source code
go

create view sys.filetable_system_defined_objects as
-- missing source code
go

create view sys.filetables as
-- missing source code
go

create view sys.foreign_key_columns as
-- missing source code
go

create view sys.foreign_keys as
-- missing source code
go

create view sys.fulltext_catalogs as
-- missing source code
go

create view sys.fulltext_document_types as
-- missing source code
go

create view sys.fulltext_index_catalog_usages as
-- missing source code
go

create view sys.fulltext_index_columns as
-- missing source code
go

create view sys.fulltext_index_fragments as
-- missing source code
go

create view sys.fulltext_indexes as
-- missing source code
go

create view sys.fulltext_languages as
-- missing source code
go

create view sys.fulltext_semantic_language_statistics_database as
-- missing source code
go

create view sys.fulltext_semantic_languages as
-- missing source code
go

create view sys.fulltext_stoplists as
-- missing source code
go

create view sys.fulltext_stopwords as
-- missing source code
go

create view sys.fulltext_system_stopwords as
-- missing source code
go

create view sys.function_order_columns as
-- missing source code
go

create view sys.http_endpoints as
-- missing source code
go

create view sys.identity_columns as
-- missing source code
go

create view sys.index_columns as
-- missing source code
go

create view sys.indexes as
-- missing source code
go

create view sys.internal_tables as
-- missing source code
go

create view sys.key_constraints as
-- missing source code
go

create view sys.key_encryptions as
-- missing source code
go

create view sys.linked_logins as
-- missing source code
go

create view sys.login_token as
-- missing source code
go

create view sys.master_files as
-- missing source code
go

create view sys.master_key_passwords as
-- missing source code
go

create view sys.message_type_xml_schema_collection_usages as
-- missing source code
go

create view sys.messages as
-- missing source code
go

create view sys.module_assembly_usages as
-- missing source code
go

create view sys.numbered_procedure_parameters as
-- missing source code
go

create view sys.numbered_procedures as
-- missing source code
go

create view sys.objects as
-- missing source code
go

create view sys.openkeys as
-- missing source code
go

create view sys.parameter_type_usages as
-- missing source code
go

create view sys.parameter_xml_schema_collection_usages as
-- missing source code
go

create view sys.parameters as
-- missing source code
go

create view sys.partition_functions as
-- missing source code
go

create view sys.partition_parameters as
-- missing source code
go

create view sys.partition_range_values as
-- missing source code
go

create view sys.partition_schemes as
-- missing source code
go

create view sys.partitions as
-- missing source code
go

create view sys.plan_guides as
-- missing source code
go

create view sys.procedures as
-- missing source code
go

create view sys.registered_search_properties as
-- missing source code
go

create view sys.registered_search_property_lists as
-- missing source code
go

create view sys.remote_logins as
-- missing source code
go

create view sys.remote_service_bindings as
-- missing source code
go

create view sys.resource_governor_configuration as
-- missing source code
go

create view sys.resource_governor_resource_pool_affinity as
-- missing source code
go

create view sys.resource_governor_resource_pools as
-- missing source code
go

create view sys.resource_governor_workload_groups as
-- missing source code
go

create view sys.routes as
-- missing source code
go

create view sys.schemas as
-- missing source code
go

create view sys.securable_classes as
-- missing source code
go

create view sys.selective_xml_index_namespaces as
-- missing source code
go

create view sys.selective_xml_index_paths as
-- missing source code
go

create view sys.sequences as
-- missing source code
go

create view sys.server_assembly_modules as
-- missing source code
go

create view sys.server_audit_specification_details as
-- missing source code
go

create view sys.server_audit_specifications as
-- missing source code
go

create view sys.server_audits as
-- missing source code
go

create view sys.server_event_notifications as
-- missing source code
go

create view sys.server_event_session_actions as
-- missing source code
go

create view sys.server_event_session_events as
-- missing source code
go

create view sys.server_event_session_fields as
-- missing source code
go

create view sys.server_event_session_targets as
-- missing source code
go

create view sys.server_event_sessions as
-- missing source code
go

create view sys.server_events as
-- missing source code
go

create view sys.server_file_audits as
-- missing source code
go

create view sys.server_permissions as
-- missing source code
go

create view sys.server_principal_credentials as
-- missing source code
go

create view sys.server_principals as
-- missing source code
go

create view sys.server_role_members as
-- missing source code
go

create view sys.server_sql_modules as
-- missing source code
go

create view sys.server_trigger_events as
-- missing source code
go

create view sys.server_triggers as
-- missing source code
go

create view sys.servers as
-- missing source code
go

create view sys.service_broker_endpoints as
-- missing source code
go

create view sys.service_contract_message_usages as
-- missing source code
go

create view sys.service_contract_usages as
-- missing source code
go

create view sys.service_contracts as
-- missing source code
go

create view sys.service_message_types as
-- missing source code
go

create view sys.service_queue_usages as
-- missing source code
go

create view sys.service_queues as
-- missing source code
go

create view sys.services as
-- missing source code
go

create view sys.soap_endpoints as
-- missing source code
go

create view sys.spatial_index_tessellations as
-- missing source code
go

create view sys.spatial_indexes as
-- missing source code
go

create view sys.spatial_reference_systems as
-- missing source code
go

create view sys.sql_dependencies as
-- missing source code
go

create view sys.sql_expression_dependencies as
-- missing source code
go

create view sys.sql_logins as
-- missing source code
go

create view sys.sql_modules as
-- missing source code
go

create view sys.stats as
-- missing source code
go

create view sys.stats_columns as
-- missing source code
go

create view sys.symmetric_keys as
-- missing source code
go

create view sys.synonyms as
-- missing source code
go

create view sys.sysaltfiles as
-- missing source code
go

create view sys.syscacheobjects as
-- missing source code
go

create view sys.syscharsets as
-- missing source code
go

create view sys.syscolumns as
-- missing source code
go

create view sys.syscomments as
-- missing source code
go

create view sys.sysconfigures as
-- missing source code
go

create view sys.sysconstraints as
-- missing source code
go

create view sys.syscurconfigs as
-- missing source code
go

create view sys.syscursorcolumns as
-- missing source code
go

create view sys.syscursorrefs as
-- missing source code
go

create view sys.syscursors as
-- missing source code
go

create view sys.syscursortables as
-- missing source code
go

create view sys.sysdatabases as
-- missing source code
go

create view sys.sysdepends as
-- missing source code
go

create view sys.sysdevices as
-- missing source code
go

create view sys.sysfilegroups as
-- missing source code
go

create view sys.sysfiles as
-- missing source code
go

create view sys.sysforeignkeys as
-- missing source code
go

create view sys.sysfulltextcatalogs as
-- missing source code
go

create view sys.sysindexes as
-- missing source code
go

create view sys.sysindexkeys as
-- missing source code
go

create view sys.syslanguages as
-- missing source code
go

create view sys.syslockinfo as
-- missing source code
go

create view sys.syslogins as
-- missing source code
go

create view sys.sysmembers as
-- missing source code
go

create view sys.sysmessages as
-- missing source code
go

create view sys.sysobjects as
-- missing source code
go

create view sys.sysoledbusers as
-- missing source code
go

create view sys.sysopentapes as
-- missing source code
go

create view sys.sysperfinfo as
-- missing source code
go

create view sys.syspermissions as
-- missing source code
go

create view sys.sysprocesses as
-- missing source code
go

create view sys.sysprotects as
-- missing source code
go

create view sys.sysreferences as
-- missing source code
go

create view sys.sysremotelogins as
-- missing source code
go

create view sys.sysservers as
-- missing source code
go

create view sys.system_columns as
-- missing source code
go

create view sys.system_components_surface_area_configuration as
-- missing source code
go

create view sys.system_internals_allocation_units as
-- missing source code
go

create view sys.system_internals_partition_columns as
-- missing source code
go

create view sys.system_internals_partitions as
-- missing source code
go

create view sys.system_objects as
-- missing source code
go

create view sys.system_parameters as
-- missing source code
go

create view sys.system_sql_modules as
-- missing source code
go

create view sys.system_views as
-- missing source code
go

create view sys.systypes as
-- missing source code
go

create view sys.sysusers as
-- missing source code
go

create view sys.table_types as
-- missing source code
go

create view sys.tables as
-- missing source code
go

create view sys.tcp_endpoints as
-- missing source code
go

create view sys.trace_categories as
-- missing source code
go

create view sys.trace_columns as
-- missing source code
go

create view sys.trace_event_bindings as
-- missing source code
go

create view sys.trace_events as
-- missing source code
go

create view sys.trace_subclass_values as
-- missing source code
go

create view sys.traces as
-- missing source code
go

create view sys.transmission_queue as
-- missing source code
go

create view sys.trigger_event_types as
-- missing source code
go

create view sys.trigger_events as
-- missing source code
go

create view sys.triggers as
-- missing source code
go

create view sys.type_assembly_usages as
-- missing source code
go

create view sys.types as
-- missing source code
go

create view sys.user_token as
-- missing source code
go

create view sys.via_endpoints as
-- missing source code
go

create view sys.views as
-- missing source code
go

create view sys.xml_indexes as
-- missing source code
go

create view sys.xml_schema_attributes as
-- missing source code
go

create view sys.xml_schema_collections as
-- missing source code
go

create view sys.xml_schema_component_placements as
-- missing source code
go

create view sys.xml_schema_components as
-- missing source code
go

create view sys.xml_schema_elements as
-- missing source code
go

create view sys.xml_schema_facets as
-- missing source code
go

create view sys.xml_schema_model_groups as
-- missing source code
go

create view sys.xml_schema_namespaces as
-- missing source code
go

create view sys.xml_schema_types as
-- missing source code
go

create view sys.xml_schema_wildcard_namespaces as
-- missing source code
go

create view sys.xml_schema_wildcards as
-- missing source code
go

create function sys.dm_cryptographic_provider_algorithms(@ProviderId unknown) returns table as
-- missing source code
go

create function sys.dm_cryptographic_provider_keys(@ProviderId unknown) returns table as
-- missing source code
go

create function sys.dm_cryptographic_provider_sessions(@all unknown) returns table as
-- missing source code
go

create function sys.dm_db_database_page_allocations(@DatabaseId unknown, @TableId unknown, @IndexId unknown,
                                                    @PartitionId unknown, @Mode unknown) returns table as
-- missing source code
go

create function sys.dm_db_index_operational_stats(@DatabaseId unknown, @TableId unknown, @IndexId unknown,
                                                  @PartitionNumber unknown) returns table as
-- missing source code
go

create function sys.dm_db_index_physical_stats(@DatabaseId unknown, @ObjectId unknown, @IndexId unknown,
                                               @PartitionNumber unknown, @Mode unknown) returns table as
-- missing source code
go

create function sys.dm_db_missing_index_columns(@handle unknown) returns table as
-- missing source code
go

create function sys.dm_db_objects_disabled_on_compatibility_level_change(@compatibility_level unknown) returns table as
-- missing source code
go

create function sys.dm_db_stats_properties(@object_id unknown, @stats_id unknown) returns table as
-- missing source code
go

create function sys.dm_exec_cached_plan_dependent_objects(@planhandle unknown) returns table as
-- missing source code
go

create function sys.dm_exec_cursors(@spid unknown) returns table as
-- missing source code
go

create function sys.dm_exec_describe_first_result_set(@tsql unknown, @params unknown, @browse_information_mode unknown) returns table as
-- missing source code
go

create function sys.dm_exec_describe_first_result_set_for_object(@object_id unknown, @browse_information_mode unknown) returns table as
-- missing source code
go

create function sys.dm_exec_plan_attributes(@handle unknown) returns table as
-- missing source code
go

create function sys.dm_exec_query_plan(@handle unknown) returns table as
-- missing source code
go

create function sys.dm_exec_sql_text(@handle unknown) returns table as
-- missing source code
go

create function sys.dm_exec_text_query_plan(@handle unknown, @stmt_start_offset unknown, @stmt_end_offset unknown) returns table as
-- missing source code
go

create function sys.dm_exec_xml_handles(@spid unknown) returns table as
-- missing source code
go

create function sys.dm_fts_index_keywords(@dbid unknown, @objid unknown) returns table as
-- missing source code
go

create function sys.dm_fts_index_keywords_by_document(@dbid unknown, @objid unknown) returns table as
-- missing source code
go

create function sys.dm_fts_index_keywords_by_property(@dbid unknown, @objid unknown) returns table as
-- missing source code
go

create function sys.dm_fts_index_keywords_position_by_document(@dbid unknown, @objid unknown) returns table as
-- missing source code
go

create function sys.dm_fts_parser(@querystring unknown, @lcid unknown, @stoplistid unknown,
                                  @accentsensitive unknown) returns table as
-- missing source code
go

create function sys.dm_io_virtual_file_stats(@DatabaseId unknown, @FileId unknown) returns table as
-- missing source code
go

create function sys.dm_logconsumer_cachebufferrefs(@DatabaseId unknown, @ConsumerId unknown) returns table as
-- missing source code
go

create function sys.dm_logconsumer_privatecachebuffers(@DatabaseId unknown, @ConsumerId unknown) returns table as
-- missing source code
go

create function sys.dm_logpool_consumers(@DatabaseId unknown) returns table as
-- missing source code
go

create function sys.dm_logpool_sharedcachebuffers(@DatabaseId unknown) returns table as
-- missing source code
go

create function sys.dm_logpoolmgr_freepools(@DatabaseId unknown) returns table as
-- missing source code
go

create function sys.dm_logpoolmgr_respoolsize(@DatabaseId unknown) returns table as
-- missing source code
go

create function sys.dm_logpoolmgr_stats(@DatabaseId unknown) returns table as
-- missing source code
go

create function sys.dm_os_volume_stats(@DatabaseId unknown, @FileId unknown) returns table as
-- missing source code
go

create function sys.dm_sql_referenced_entities(@name unknown, @referencing_class unknown) returns table as
-- missing source code
go

create function sys.dm_sql_referencing_entities(@name unknown, @referenced_class unknown) returns table as
-- missing source code
go

create function sys.fn_EnumCurrentPrincipals() returns table as
-- missing source code
go

create function sys.fn_GetCurrentPrincipal(@db_name unknown) returns unknown as
-- missing source code
go

create function sys.fn_GetRowsetIdFromRowDump(@rowdump unknown) returns unknown as
-- missing source code
go

create function sys.fn_IsBitSetInBitmask(@bitmask unknown, @colid unknown) returns unknown as
-- missing source code
go

create function sys.fn_MSdayasnumber(@day unknown) returns unknown as
-- missing source code
go

create function sys.fn_MSgeneration_downloadonly(@generation unknown, @tablenick unknown) returns unknown as
-- missing source code
go

create function sys.fn_MSget_dynamic_filter_login(@publication_number unknown, @partition_id unknown) returns unknown as
-- missing source code
go

create function sys.fn_MSorbitmaps(@bm1 unknown, @bm2 unknown) returns unknown as
-- missing source code
go

create function sys.fn_MSrepl_map_resolver_clsid(@compatibility_level unknown, @article_resolver unknown,
                                                 @resolver_clsid unknown) returns unknown as
-- missing source code
go

create function sys.fn_MStestbit(@bitmap unknown, @colidx unknown) returns unknown as
-- missing source code
go

create function sys.fn_MSvector_downloadonly(@vector unknown, @tablenick unknown) returns unknown as
-- missing source code
go

create function sys.fn_MSxe_read_event_stream(@source unknown, @source_opt unknown) returns table as
-- missing source code
go

create function sys.fn_MapSchemaType(@schematype unknown, @schemasubtype unknown) returns unknown as
-- missing source code
go

create function sys.fn_PhysLocCracker(@physical_locator unknown) returns table as
-- missing source code
go

create function sys.fn_PhysLocFormatter(@physical_locator unknown) returns unknown as
-- missing source code
go

create function sys.fn_RowDumpCracker(@rowdump unknown) returns table as
-- missing source code
go

create function sys.fn_builtin_permissions(@level unknown) returns table as
-- missing source code
go

create function sys.fn_cColvEntries_80(@pubid unknown, @artnick unknown) returns unknown as
-- missing source code
go

create function sys.fn_cdc_check_parameters(@capture_instance unknown, @from_lsn unknown, @to_lsn unknown,
                                            @row_filter_option unknown, @net_changes unknown) returns unknown as
-- missing source code
go

create function sys.fn_cdc_get_column_ordinal(@capture_instance unknown, @column_name unknown) returns unknown as
-- missing source code
go

create function sys.fn_cdc_get_max_lsn() returns unknown as
-- missing source code
go

create function sys.fn_cdc_get_min_lsn(@capture_instance unknown) returns unknown as
-- missing source code
go

create function sys.fn_cdc_has_column_changed(@capture_instance unknown, @column_name unknown, @update_mask unknown) returns unknown as
-- missing source code
go

create function sys.fn_cdc_hexstrtobin(@hexstr unknown) returns unknown as
-- missing source code
go

create function sys.fn_cdc_map_lsn_to_time(@lsn unknown) returns unknown as
-- missing source code
go

create function sys.fn_cdc_map_time_to_lsn(@relational_operator unknown, @tracking_time unknown) returns unknown as
-- missing source code
go

create function sys.fn_check_object_signatures(@class unknown, @thumbprint unknown) returns table as
-- missing source code
go

create function sys.fn_dblog(@start unknown, @end unknown) returns table as
-- missing source code
go

create function sys.fn_dump_dblog(@start unknown, @end unknown, @devtype unknown, @seqnum unknown, @fname1 unknown,
                                  @fname2 unknown, @fname3 unknown, @fname4 unknown, @fname5 unknown, @fname6 unknown,
                                  @fname7 unknown, @fname8 unknown, @fname9 unknown, @fname10 unknown, @fname11 unknown,
                                  @fname12 unknown, @fname13 unknown, @fname14 unknown, @fname15 unknown,
                                  @fname16 unknown, @fname17 unknown, @fname18 unknown, @fname19 unknown,
                                  @fname20 unknown, @fname21 unknown, @fname22 unknown, @fname23 unknown,
                                  @fname24 unknown, @fname25 unknown, @fname26 unknown, @fname27 unknown,
                                  @fname28 unknown, @fname29 unknown, @fname30 unknown, @fname31 unknown,
                                  @fname32 unknown, @fname33 unknown, @fname34 unknown, @fname35 unknown,
                                  @fname36 unknown, @fname37 unknown, @fname38 unknown, @fname39 unknown,
                                  @fname40 unknown, @fname41 unknown, @fname42 unknown, @fname43 unknown,
                                  @fname44 unknown, @fname45 unknown, @fname46 unknown, @fname47 unknown,
                                  @fname48 unknown, @fname49 unknown, @fname50 unknown, @fname51 unknown,
                                  @fname52 unknown, @fname53 unknown, @fname54 unknown, @fname55 unknown,
                                  @fname56 unknown, @fname57 unknown, @fname58 unknown, @fname59 unknown,
                                  @fname60 unknown, @fname61 unknown, @fname62 unknown, @fname63 unknown,
                                  @fname64 unknown) returns table as
-- missing source code
go

create function sys.fn_fIsColTracked(@artnick unknown) returns unknown as
-- missing source code
go

create function sys.fn_get_audit_file(@file_pattern unknown, @initial_file_name unknown,
                                      @audit_record_offset unknown) returns table as
-- missing source code
go

create function sys.fn_get_sql(@handle unknown) returns table as
-- missing source code
go

create function sys.fn_hadr_backup_is_preferred_replica(@database_name unknown) returns unknown as
-- missing source code
go

create function sys.fn_helpcollations() returns table as
-- missing source code
go

create function sys.fn_helpdatatypemap(@source_dbms unknown, @source_version unknown, @source_type unknown,
                                       @destination_dbms unknown, @destination_version unknown,
                                       @destination_type unknown, @defaults_only unknown) returns table as
-- missing source code
go

create function sys.fn_isrolemember(@mode unknown, @login unknown, @tranpubid unknown) returns unknown as
-- missing source code
go

create function sys.fn_listextendedproperty(@name unknown, @level0type unknown, @level0name unknown,
                                            @level1type unknown, @level1name unknown, @level2type unknown,
                                            @level2name unknown) returns table as
-- missing source code
go

create function sys.fn_my_permissions(@entity unknown, @class unknown) returns table as
-- missing source code
go

create function sys.fn_numberOf1InBinaryAfterLoc(@byte unknown, @loc unknown) returns unknown as
-- missing source code
go

create function sys.fn_numberOf1InVarBinary(@bm unknown) returns unknown as
-- missing source code
go

create function sys.fn_repladjustcolumnmap(@objid unknown, @total_col unknown, @inmap unknown) returns unknown as
-- missing source code
go

create function sys.fn_repldecryptver4(@password unknown) returns unknown as
-- missing source code
go

create function sys.fn_replformatdatetime(@datetime unknown) returns unknown as
-- missing source code
go

create function sys.fn_replgetcolidfrombitmap(@columns unknown) returns table as
-- missing source code
go

create function sys.fn_replgetparsedddlcmd(@ddlcmd unknown, @FirstToken unknown, @objectType unknown, @dbname unknown,
                                           @owner unknown, @objname unknown, @targetobject unknown) returns unknown as
-- missing source code
go

create function sys.fn_replp2pversiontotranid(@varbin unknown) returns unknown as
-- missing source code
go

create function sys.fn_replreplacesinglequote(@pstrin unknown) returns unknown as
-- missing source code
go

create function sys.fn_replreplacesinglequoteplusprotectstring(@pstrin unknown) returns unknown as
-- missing source code
go

create function sys.fn_repluniquename(@guid unknown, @prefix1 unknown, @prefix2 unknown, @prefix3 unknown,
                                      @prefix4 unknown) returns unknown as
-- missing source code
go

create function sys.fn_replvarbintoint(@varbin unknown) returns unknown as
-- missing source code
go

create function sys.fn_servershareddrives() returns table as
-- missing source code
go

create function sys.fn_sqlvarbasetostr(@ssvar unknown) returns unknown as
-- missing source code
go

create function sys.fn_trace_geteventinfo(@handle unknown) returns table as
-- missing source code
go

create function sys.fn_trace_getfilterinfo(@handle unknown) returns table as
-- missing source code
go

create function sys.fn_trace_getinfo(@handle unknown) returns table as
-- missing source code
go

create function sys.fn_trace_gettable(@filename unknown, @numfiles unknown) returns table as
-- missing source code
go

create function sys.fn_translate_permissions(@level unknown, @perms unknown) returns table as
-- missing source code
go

create function sys.fn_validate_plan_guide(@plan_guide_id unknown) returns table as
-- missing source code
go

create function sys.fn_varbintohexstr(@pbinin unknown) returns unknown as
-- missing source code
go

create function sys.fn_varbintohexsubstring(@fsetprefix unknown, @pbinin unknown, @startoffset unknown,
                                            @cbytesin unknown) returns unknown as
-- missing source code
go

create function sys.fn_virtualfilestats(@DatabaseId unknown, @FileId unknown) returns table as
-- missing source code
go

create function sys.fn_virtualservernodes() returns table as
-- missing source code
go

create function sys.fn_xe_file_target_read_file(@path unknown, @mdpath unknown, @initial_file_name unknown,
                                                @initial_offset unknown) returns table as
-- missing source code
go

create function sys.fn_yukonsecuritymodelrequired(@username unknown) returns unknown as
-- missing source code
go

create procedure sys.sp_AddFunctionalUnitToComponent() as
-- missing source code
go

create procedure sys.sp_FuzzyLookupTableMaintenanceInstall(@etiTableName unknown) as
-- missing source code
go

create procedure sys.sp_FuzzyLookupTableMaintenanceInvoke(@etiTableName unknown) as
-- missing source code
go

create procedure sys.sp_FuzzyLookupTableMaintenanceUninstall(@etiTableName unknown) as
-- missing source code
go

create procedure sys.sp_IHScriptIdxFile(@article_id unknown) as
-- missing source code
go

create procedure sys.sp_IHScriptSchFile(@article_id unknown) as
-- missing source code
go

create procedure sys.sp_IHValidateRowFilter(@publisher unknown, @owner unknown, @table unknown, @columnmask unknown,
                                            @rowfilter unknown) as
-- missing source code
go

create procedure sys.sp_IHXactSetJob(@publisher unknown, @enabled unknown, @interval unknown, @threshold unknown,
                                     @LRinterval unknown, @LRthreshold unknown) as
-- missing source code
go

create procedure sys.sp_IH_LR_GetCacheData(@publisher unknown) as
-- missing source code
go

create procedure sys.sp_IHadd_sync_command(@publisher_id unknown, @publisher_db unknown, @xact_id unknown,
                                           @xact_seqno unknown, @originator unknown, @originator_db unknown,
                                           @article_id unknown, @command_id unknown, @type unknown,
                                           @partial_command unknown, @command unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_IHarticlecolumn(@publication unknown, @article unknown, @column unknown, @operation unknown,
                                        @refresh_synctran_procs unknown, @ignore_distributor unknown,
                                        @change_active unknown, @force_invalidate_snapshot unknown,
                                        @force_reinit_subscription unknown, @publisher unknown, @publisher_type unknown,
                                        @publisher_dbms unknown, @publisher_version unknown) as
-- missing source code
go

create procedure sys.sp_IHget_loopback_detection(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                 @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MSCleanupForPullReinit(@publication unknown, @publisher_db unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_MSFixSubColumnBitmaps(@artid unknown, @bm unknown) as
-- missing source code
go

create procedure sys.sp_MSGetCurrentPrincipal(@db_name unknown, @current_principal unknown) as
-- missing source code
go

create procedure sys.sp_MSGetServerProperties() as
-- missing source code
go

create procedure sys.sp_MSIfExistsSubscription(@publisher unknown, @publisher_db unknown, @publication unknown,
                                               @type unknown) as
-- missing source code
go

create procedure sys.sp_MSNonSQLDDL(@qual_source_object unknown, @pubid unknown, @columnName unknown,
                                    @schemasubtype unknown) as
-- missing source code
go

create procedure sys.sp_MSNonSQLDDLForSchemaDDL(@artid unknown, @pubid unknown, @ddlcmd unknown) as
-- missing source code
go

create procedure sys.sp_MSSQLDMO70_version() as
-- missing source code
go

create procedure sys.sp_MSSQLDMO80_version() as
-- missing source code
go

create procedure sys.sp_MSSQLDMO90_version() as
-- missing source code
go

create procedure sys.sp_MSSQLOLE65_version() as
-- missing source code
go

create procedure sys.sp_MSSQLOLE_version() as
-- missing source code
go

create procedure sys.sp_MSSetServerProperties(@auto_start unknown) as
-- missing source code
go

create procedure sys.sp_MSSharedFixedDisk() as
-- missing source code
go

create procedure sys.sp_MS_marksystemobject(@objname unknown, @namespace unknown) as
-- missing source code
go

create procedure sys.sp_MS_replication_installed() as
-- missing source code
go

create procedure sys.sp_MSacquireHeadofQueueLock(@process_name unknown, @queue_timeout unknown, @no_result unknown,
                                                 @return_immediately unknown, @DbPrincipal unknown) as
-- missing source code
go

create procedure sys.sp_MSacquireSlotLock(@process_name unknown, @concurrent_max unknown, @queue_timeout unknown,
                                          @return_immediately unknown, @DbPrincipal unknown) as
-- missing source code
go

create procedure sys.sp_MSacquireserverresourcefordynamicsnapshot(@publication unknown, @max_concurrent_dynamic_snapshots unknown) as
-- missing source code
go

create procedure sys.sp_MSacquiresnapshotdeliverysessionlock() as
-- missing source code
go

create procedure sys.sp_MSactivate_auto_sub(@publication unknown, @article unknown, @status unknown,
                                            @skipobjectactivation unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_MSactivatelogbasedarticleobject(@qualified_logbased_object_name unknown) as
-- missing source code
go

create procedure sys.sp_MSactivateprocedureexecutionarticleobject(@qualified_procedure_execution_object_name unknown,
                                                                  @is_repl_serializable_only unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_anonymous_agent(@publisher_id unknown, @publisher_db unknown, @publication unknown,
                                              @subscriber_db unknown, @subscriber_name unknown,
                                              @anonymous_subid unknown, @agent_id unknown, @reinitanon unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_article(@publisher unknown, @publisher_db unknown, @publication unknown, @article unknown,
                                      @article_id unknown, @destination_object unknown, @source_object unknown,
                                      @description unknown, @source_owner unknown, @destination_owner unknown,
                                      @internal unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_compensating_cmd(@orig_srv unknown, @orig_db unknown, @command unknown,
                                               @article_id unknown, @publication_id unknown, @cmdstate unknown,
                                               @mode unknown, @setprefix unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_distribution_agent(@name unknown, @publisher_id unknown, @publisher_db unknown,
                                                 @publication unknown, @subscriber_id unknown, @subscriber_db unknown,
                                                 @subscription_type unknown, @local_job unknown,
                                                 @frequency_type unknown, @frequency_interval unknown,
                                                 @frequency_relative_interval unknown,
                                                 @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                                 @frequency_subday_interval unknown, @active_start_time_of_day unknown,
                                                 @active_end_time_of_day unknown, @active_start_date unknown,
                                                 @active_end_date unknown, @retryattempts unknown, @retrydelay unknown,
                                                 @command unknown, @agent_id unknown, @distribution_jobid unknown,
                                                 @update_mode unknown, @offloadagent unknown, @offloadserver unknown,
                                                 @dts_package_name unknown, @dts_package_password unknown,
                                                 @dts_package_location unknown, @subscriber_security_mode unknown,
                                                 @subscriber_login unknown, @subscriber_password unknown,
                                                 @job_login unknown, @job_password unknown, @internal unknown,
                                                 @subscriber_provider unknown, @subscriber_datasrc unknown,
                                                 @subscriber_location unknown, @subscriber_provider_string unknown,
                                                 @subscriber_catalog unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_distribution_history(@agent_id unknown, @runstatus unknown, @comments unknown,
                                                   @xact_seqno unknown, @delivered_transactions unknown,
                                                   @delivered_commands unknown, @delivery_rate unknown,
                                                   @log_error unknown, @perfmon_increment unknown, @xactseq unknown,
                                                   @command_id unknown, @update_existing_row unknown,
                                                   @updateable_row unknown, @do_raiserror unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_dynamic_snapshot_location(@publication unknown, @partition_id unknown,
                                                        @dynsnap_location unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_filteringcolumn(@pubid unknown, @tablenick unknown, @column_name unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_log_shipping_error_detail(@agent_id unknown, @agent_type unknown, @session_id unknown,
                                                        @database unknown, @sequence_number unknown, @message unknown,
                                                        @source unknown, @help_url unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_log_shipping_history_detail(@agent_id unknown, @agent_type unknown, @session_id unknown,
                                                          @session_status unknown, @database unknown,
                                                          @last_processed_file_name unknown, @message unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_logreader_agent(@name unknown, @publisher unknown, @publisher_db unknown,
                                              @publication unknown, @local_job unknown, @job_existing unknown,
                                              @job_id unknown, @publisher_security_mode unknown,
                                              @publisher_login unknown, @publisher_password unknown, @job_login unknown,
                                              @job_password unknown, @publisher_type unknown, @internal unknown,
                                              @publisher_engine_edition unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_logreader_history(@agent_id unknown, @runstatus unknown, @comments unknown,
                                                @xact_seqno unknown, @delivery_time unknown,
                                                @delivered_transactions unknown, @delivered_commands unknown,
                                                @delivery_latency unknown, @log_error unknown,
                                                @perfmon_increment unknown, @update_existing_row unknown,
                                                @do_raiserror unknown, @updateable_row unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_merge_agent(@name unknown, @publisher unknown, @publisher_db unknown,
                                          @publication unknown, @subscriber unknown, @subscriber_db unknown,
                                          @local_job unknown, @frequency_type unknown, @frequency_interval unknown,
                                          @frequency_relative_interval unknown, @frequency_recurrence_factor unknown,
                                          @frequency_subday unknown, @frequency_subday_interval unknown,
                                          @active_start_time_of_day unknown, @active_end_time_of_day unknown,
                                          @active_start_date unknown, @active_end_date unknown,
                                          @optional_command_line unknown, @merge_jobid unknown, @offloadagent unknown,
                                          @offloadserver unknown, @subscription_type unknown, @hostname unknown,
                                          @subscriber_security_mode unknown, @subscriber_login unknown,
                                          @subscriber_password unknown, @publisher_security_mode unknown,
                                          @publisher_login unknown, @publisher_password unknown, @job_login unknown,
                                          @job_password unknown, @internal unknown,
                                          @publisher_engine_edition unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_merge_anonymous_agent(@publisher_id unknown, @publisher_db unknown, @publication unknown,
                                                    @subscriber_db unknown, @subscriber_name unknown, @subid unknown,
                                                    @first_anonymous unknown, @subscriber_version unknown,
                                                    @publisher_engine_edition unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_merge_history(@agent_id unknown, @runstatus unknown, @comments unknown,
                                            @delivery_time unknown, @download_inserts unknown,
                                            @download_updates unknown, @download_deletes unknown,
                                            @download_conflicts unknown, @upload_inserts unknown,
                                            @upload_updates unknown, @upload_deletes unknown, @upload_conflicts unknown,
                                            @log_error unknown, @perfmon_increment unknown,
                                            @update_existing_row unknown, @updateable_row unknown,
                                            @do_raiserror unknown,
                                            @called_by_nonlogged_shutdown_detection_agent unknown,
                                            @session_id_override unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_merge_history90(@session_id unknown, @agent_id unknown, @runstatus unknown,
                                              @comments unknown, @update_existing_row unknown, @updateable_row unknown,
                                              @log_error unknown, @update_stats unknown, @phase_id unknown,
                                              @article_name unknown, @article_inserts unknown, @article_updates unknown,
                                              @article_deletes unknown, @article_conflicts unknown,
                                              @article_rows_retried unknown, @article_percent_complete unknown,
                                              @article_estimated_changes unknown, @article_relative_cost unknown,
                                              @session_duration unknown, @delivery_time unknown, @upload_time unknown,
                                              @download_time unknown, @schema_change_time unknown,
                                              @prepare_snapshot_time unknown, @delivery_rate unknown,
                                              @time_remaining unknown, @session_percent_complete unknown,
                                              @session_upload_inserts unknown, @session_upload_updates unknown,
                                              @session_upload_deletes unknown, @session_upload_conflicts unknown,
                                              @session_upload_rows_retried unknown, @session_download_inserts unknown,
                                              @session_download_updates unknown, @session_download_deletes unknown,
                                              @session_download_conflicts unknown,
                                              @session_download_rows_retried unknown, @session_schema_changes unknown,
                                              @session_bulk_inserts unknown, @session_metadata_rows_cleanedup unknown,
                                              @session_estimated_upload_changes unknown,
                                              @session_estimated_download_changes unknown, @connection_type unknown,
                                              @subid unknown, @info_filter unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_merge_subscription(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                 @subscriber unknown, @subscriber_db unknown,
                                                 @subscription_type unknown, @sync_type unknown, @status unknown,
                                                 @frequency_type unknown, @frequency_interval unknown,
                                                 @frequency_relative_interval unknown,
                                                 @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                                 @frequency_subday_interval unknown, @active_start_time_of_day unknown,
                                                 @active_end_time_of_day unknown, @active_start_date unknown,
                                                 @active_end_date unknown, @optional_command_line unknown,
                                                 @agent_name unknown, @merge_jobid unknown, @offloadagent unknown,
                                                 @offloadserver unknown, @hostname unknown, @description unknown,
                                                 @subid unknown, @internal unknown,
                                                 @publisher_engine_edition unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_mergereplcommand(@publication unknown, @article unknown, @schematype unknown,
                                               @schematext unknown, @tablename unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_mergesubentry_indistdb(@publisher_id unknown, @publisher unknown, @publisher_db unknown,
                                                     @publication unknown, @subscriber unknown, @subscriber_db unknown,
                                                     @subscription_type unknown, @sync_type unknown, @status unknown,
                                                     @description unknown, @subid unknown,
                                                     @subscriber_version unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_publication(@publisher unknown, @publisher_db unknown, @publication unknown,
                                          @publication_id unknown, @publication_type unknown,
                                          @independent_agent unknown, @immediate_sync unknown, @allow_push unknown,
                                          @allow_pull unknown, @allow_anonymous unknown, @snapshot_agent unknown,
                                          @logreader_agent unknown, @description unknown, @retention unknown,
                                          @vendor_name unknown, @sync_method unknown, @allow_subscription_copy unknown,
                                          @thirdparty_options unknown, @allow_queued_tran unknown, @queue_type unknown,
                                          @publisher_type unknown, @options unknown, @retention_period_unit unknown,
                                          @publisher_engine_edition unknown, @allow_initialize_from_backup unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_qreader_agent(@name unknown, @agent_id unknown, @agent_jobid unknown, @job_login unknown,
                                            @job_password unknown, @internal unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_qreader_history(@agent_id unknown, @pubid unknown, @runstatus unknown, @comments unknown,
                                              @transaction_id unknown, @transaction_status unknown,
                                              @transactions_processed unknown, @commands_processed unknown,
                                              @seconds_elapsed unknown, @subscriber unknown, @subscriberdb unknown,
                                              @perfmon_increment unknown, @log_error unknown,
                                              @update_existing_row unknown, @do_raiserror unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_repl_alert(@agent_type unknown, @agent_id unknown, @error_id unknown,
                                         @alert_error_code unknown, @xact_seqno unknown, @command_id unknown,
                                         @publisher unknown, @publisher_db unknown, @subscriber unknown,
                                         @subscriber_db unknown, @alert_error_text unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_repl_command(@publisher_id unknown, @publisher_db unknown, @xact_id unknown,
                                           @xact_seqno unknown, @originator unknown, @originator_db unknown,
                                           @article_id unknown, @command_id unknown, @type unknown,
                                           @partial_command unknown, @command unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_repl_commands27hp(@publisher_id unknown, @publisher_db unknown, @data unknown,
                                                @1data unknown, @2data unknown, @3data unknown, @4data unknown,
                                                @5data unknown, @6data unknown, @7data unknown, @8data unknown,
                                                @9data unknown, @10data unknown, @11data unknown, @12data unknown,
                                                @13data unknown, @14data unknown, @15data unknown, @16data unknown,
                                                @17data unknown, @18data unknown, @19data unknown, @20data unknown,
                                                @21data unknown, @22data unknown, @23data unknown, @24data unknown,
                                                @25data unknown, @26data unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_repl_error(@id unknown, @error_type_id unknown, @source_type_id unknown,
                                         @source_name unknown, @error_code unknown, @error_text unknown,
                                         @session_id unknown, @add_event_log unknown, @event_log_context unknown,
                                         @map_source_type unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_replcmds_mcit(@publisher_database_id unknown, @publisher_id unknown,
                                            @publisher_db unknown, @data unknown, @1data unknown, @2data unknown,
                                            @3data unknown, @4data unknown, @5data unknown, @6data unknown,
                                            @7data unknown, @8data unknown, @9data unknown, @10data unknown,
                                            @11data unknown, @12data unknown, @13data unknown, @14data unknown,
                                            @15data unknown, @16data unknown, @17data unknown, @18data unknown,
                                            @19data unknown, @20data unknown, @21data unknown, @22data unknown,
                                            @23data unknown, @24data unknown, @25data unknown, @26data unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_replmergealert(@agent_type unknown, @agent_id unknown, @error_id unknown,
                                             @alert_error_code unknown, @publisher unknown, @publisher_db unknown,
                                             @publication unknown, @publication_type unknown, @subscriber unknown,
                                             @subscriber_db unknown, @article unknown, @destination_object unknown,
                                             @source_object unknown, @alert_error_text unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_snapshot_agent(@name unknown, @publisher unknown, @publisher_db unknown,
                                             @publication unknown, @publication_type unknown, @local_job unknown,
                                             @freqtype unknown, @freqinterval unknown, @freqsubtype unknown,
                                             @freqsubinterval unknown, @freqrelativeinterval unknown,
                                             @freqrecurrencefactor unknown, @activestartdate unknown,
                                             @activeenddate unknown, @activestarttimeofday unknown,
                                             @activeendtimeofday unknown, @command unknown, @job_existing unknown,
                                             @snapshot_jobid unknown, @publisher_security_mode unknown,
                                             @publisher_login unknown, @publisher_password unknown, @job_login unknown,
                                             @job_password unknown, @publisher_type unknown, @internal unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_snapshot_history(@agent_id unknown, @runstatus unknown, @comments unknown,
                                               @delivered_transactions unknown, @delivered_commands unknown,
                                               @log_error unknown, @perfmon_increment unknown,
                                               @update_existing_row unknown, @do_raiserror unknown,
                                               @start_time_string unknown, @duration unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_subscriber_info(@publisher unknown, @subscriber unknown, @type unknown, @login unknown,
                                              @password unknown, @commit_batch_size unknown, @status_batch_size unknown,
                                              @flush_frequency unknown, @frequency_type unknown,
                                              @frequency_interval unknown, @frequency_relative_interval unknown,
                                              @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                              @frequency_subday_interval unknown, @active_start_time_of_day unknown,
                                              @active_end_time_of_day unknown, @active_start_date unknown,
                                              @active_end_date unknown, @retryattempts unknown, @retrydelay unknown,
                                              @description unknown, @security_mode unknown, @encrypted_password unknown,
                                              @internal unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_subscriber_schedule(@publisher unknown, @subscriber unknown, @agent_type unknown,
                                                  @frequency_type unknown, @frequency_interval unknown,
                                                  @frequency_relative_interval unknown,
                                                  @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                                  @frequency_subday_interval unknown, @active_start_time_of_day unknown,
                                                  @active_end_time_of_day unknown, @active_start_date unknown,
                                                  @active_end_date unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_subscription(@publisher unknown, @publisher_db unknown, @subscriber unknown,
                                           @article_id unknown, @subscriber_db unknown, @status unknown,
                                           @subscription_seqno unknown, @publication unknown, @article unknown,
                                           @subscription_type unknown, @sync_type unknown, @snapshot_seqno_flag unknown,
                                           @frequency_type unknown, @frequency_interval unknown,
                                           @frequency_relative_interval unknown, @frequency_recurrence_factor unknown,
                                           @frequency_subday unknown, @frequency_subday_interval unknown,
                                           @active_start_time_of_day unknown, @active_end_time_of_day unknown,
                                           @active_start_date unknown, @active_end_date unknown,
                                           @optional_command_line unknown, @update_mode unknown,
                                           @loopback_detection unknown, @distribution_jobid unknown,
                                           @offloadagent unknown, @offloadserver unknown, @dts_package_name unknown,
                                           @dts_package_password unknown, @dts_package_location unknown,
                                           @distribution_job_name unknown, @internal unknown,
                                           @publisher_engine_edition unknown, @nosync_type unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_subscription_3rd(@publisher unknown, @publisher_db unknown, @publication unknown,
                                               @subscriber unknown, @subscriber_db unknown, @status unknown,
                                               @subscription_type unknown, @sync_type unknown, @frequency_type unknown,
                                               @frequency_interval unknown, @frequency_relative_interval unknown,
                                               @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                               @frequency_subday_interval unknown, @active_start_time_of_day unknown,
                                               @active_end_time_of_day unknown, @active_start_date unknown,
                                               @active_end_date unknown, @distribution_jobid unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_tracer_history(@tracer_id unknown) as
-- missing source code
go

create procedure sys.sp_MSadd_tracer_token(@publisher unknown, @publisher_db unknown, @publication unknown,
                                           @tracer_id unknown, @subscribers_found unknown) as
-- missing source code
go

create procedure sys.sp_MSaddanonymousreplica(@publication unknown, @publisher unknown, @publisherDB unknown,
                                              @anonymous unknown, @sync_type unknown, @preexists unknown) as
-- missing source code
go

create procedure sys.sp_MSadddynamicsnapshotjobatdistributor(@regular_snapshot_jobid unknown,
                                                             @dynamic_filter_login unknown,
                                                             @dynamic_filter_hostname unknown,
                                                             @dynamic_snapshot_location unknown,
                                                             @dynamic_snapshot_jobname unknown,
                                                             @dynamic_snapshot_jobid unknown,
                                                             @dynamic_snapshot_job_step_uid unknown, @freqtype unknown,
                                                             @freqinterval unknown, @freqsubtype unknown,
                                                             @freqsubinterval unknown, @freqrelativeinterval unknown,
                                                             @freqrecurrencefactor unknown, @activestartdate unknown,
                                                             @activeenddate unknown, @activestarttimeofday unknown,
                                                             @activeendtimeofday unknown,
                                                             @dynamic_snapshot_agent_id unknown,
                                                             @partition_id unknown) as
-- missing source code
go

create procedure sys.sp_MSaddguidcolumn(@source_owner unknown, @source_table unknown) as
-- missing source code
go

create procedure sys.sp_MSaddguidindex(@publication unknown, @source_owner unknown, @source_table unknown) as
-- missing source code
go

create procedure sys.sp_MSaddinitialarticle(@article unknown, @artid unknown, @pubid unknown, @nickname unknown,
                                            @column_tracking unknown, @status unknown, @pre_creation_command unknown,
                                            @resolver_clsid unknown, @insert_proc unknown, @update_proc unknown,
                                            @select_proc unknown, @destination_object unknown, @missing_count unknown,
                                            @missing_cols unknown, @article_resolver unknown, @resolver_info unknown,
                                            @filter_clause unknown, @excluded_count unknown, @excluded_cols unknown,
                                            @destination_owner unknown, @identity_support unknown,
                                            @verify_resolver_signature unknown, @fast_multicol_updateproc unknown,
                                            @published_in_tran_pub unknown,
                                            @logical_record_level_conflict_detection unknown,
                                            @logical_record_level_conflict_resolution unknown,
                                            @partition_options unknown, @processing_order unknown,
                                            @upload_options unknown, @delete_tracking unknown,
                                            @compensate_for_errors unknown, @pub_identity_range unknown,
                                            @identity_range unknown, @threshold unknown, @stream_blob_columns unknown,
                                            @preserve_rowguidcol unknown) as
-- missing source code
go

create procedure sys.sp_MSaddinitialpublication(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                @description unknown, @pubid unknown, @retention unknown,
                                                @sync_mode unknown, @allow_push unknown, @allow_pull unknown,
                                                @allow_anonymous unknown, @conflict_logging unknown, @status unknown,
                                                @snapshot_ready unknown, @enabled_for_internet unknown,
                                                @publication_type unknown, @conflict_retention unknown,
                                                @allow_subscription_copy unknown, @allow_synctoalternate unknown,
                                                @backward_comp_level unknown, @replicate_ddl unknown,
                                                @retention_period_unit unknown, @replnickname unknown,
                                                @generation_leveling_threshold unknown,
                                                @automatic_reinitialization_policy unknown) as
-- missing source code
go

create procedure sys.sp_MSaddinitialschemaarticle(@name unknown, @destination_object unknown,
                                                  @destination_owner unknown, @artid unknown, @pubid unknown,
                                                  @pre_creation_command unknown, @status unknown, @type unknown) as
-- missing source code
go

create procedure sys.sp_MSaddinitialsubscription(@pubid unknown, @subid unknown, @replicastate unknown,
                                                 @subscriber unknown, @subscriber_db unknown,
                                                 @subscriber_priority unknown, @subscriber_type unknown,
                                                 @subscription_type unknown, @sync_type unknown, @publication unknown,
                                                 @distributor unknown, @replica_version unknown) as
-- missing source code
go

create procedure sys.sp_MSaddlightweightmergearticle(@pubid unknown, @article_name unknown, @artid unknown,
                                                     @tablenick unknown, @destination_owner unknown,
                                                     @identity_support unknown, @destination_object unknown,
                                                     @column_tracking unknown, @upload_options unknown,
                                                     @well_partitioned unknown, @status unknown,
                                                     @processing_order unknown, @delete_tracking unknown,
                                                     @compensate_for_errors unknown, @stream_blob_columns unknown) as
-- missing source code
go

create procedure sys.sp_MSaddmergedynamicsnapshotjob(@publication unknown, @dynamic_filter_login unknown,
                                                     @dynamic_filter_hostname unknown,
                                                     @dynamic_snapshot_location unknown,
                                                     @dynamic_snapshot_jobname unknown, @dynamic_snapshot_jobid unknown,
                                                     @dynamic_job_step_uid unknown, @frequency_type unknown,
                                                     @frequency_interval unknown, @frequency_subday unknown,
                                                     @frequency_subday_interval unknown,
                                                     @frequency_relative_interval unknown,
                                                     @frequency_recurrence_factor unknown, @active_start_date unknown,
                                                     @active_end_date unknown, @active_start_time_of_day unknown,
                                                     @active_end_time_of_day unknown, @dynamic_snapshot_agentid unknown,
                                                     @ignore_select unknown) as
-- missing source code
go

create procedure sys.sp_MSaddmergetriggers(@source_table unknown, @table_owner unknown, @column_tracking unknown,
                                           @recreate_repl_views unknown) as
-- missing source code
go

create procedure sys.sp_MSaddmergetriggers_from_template(@tablenickstr unknown, @source_table unknown,
                                                         @table_owner unknown, @rgcol unknown, @column_tracking unknown,
                                                         @trigger_type unknown, @viewname unknown, @tsview unknown,
                                                         @trigname unknown, @genhistory_viewname unknown,
                                                         @replnick unknown, @max_colv_size_in_bytes_str unknown) as
-- missing source code
go

create procedure sys.sp_MSaddmergetriggers_internal(@source_table unknown, @table_owner unknown,
                                                    @column_tracking unknown, @trigger_type unknown, @viewname unknown,
                                                    @tsview unknown, @trigname unknown,
                                                    @current_mappings_viewname unknown, @past_mappings_viewname unknown,
                                                    @genhistory_viewname unknown) as
-- missing source code
go

create procedure sys.sp_MSaddpeerlsn(@originator unknown, @originator_db unknown, @originator_publication unknown,
                                     @originator_publication_id unknown, @originator_db_version unknown,
                                     @originator_lsn unknown, @originator_version unknown, @originator_id unknown) as
-- missing source code
go

create procedure sys.sp_MSaddsubscriptionarticles(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                  @artid unknown, @article unknown, @dest_table unknown,
                                                  @dest_owner unknown) as
-- missing source code
go

create procedure sys.sp_MSadjust_pub_identity(@publisher unknown, @publisher_db unknown, @tablename unknown,
                                              @current_max unknown, @threshold unknown, @range unknown,
                                              @next_seed unknown, @pub_range unknown) as
-- missing source code
go

create procedure sys.sp_MSagent_retry_stethoscope() as
-- missing source code
go

create procedure sys.sp_MSagent_stethoscope(@heartbeat_interval unknown) as
-- missing source code
go

create procedure sys.sp_MSallocate_new_identity_range(@subid unknown, @artid unknown, @range_type unknown,
                                                      @ranges_needed unknown, @range_begin unknown, @range_end unknown,
                                                      @next_range_begin unknown, @next_range_end unknown,
                                                      @publication unknown, @subscriber unknown,
                                                      @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MSalreadyhavegeneration(@genguid unknown, @subscribernick unknown, @compatlevel unknown) as
-- missing source code
go

create procedure sys.sp_MSanonymous_status(@agent_id unknown, @no_init_sync unknown, @last_xact_seqno unknown) as
-- missing source code
go

create procedure sys.sp_MSarticlecleanup(@pubid unknown, @artid unknown, @ignore_merge_metadata unknown,
                                         @force_preserve_rowguidcol unknown) as
-- missing source code
go

create procedure sys.sp_MSbrowsesnapshotfolder(@publisher unknown, @publisher_db unknown, @article_id unknown,
                                               @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MScache_agent_parameter(@profile_name unknown, @parameter_name unknown,
                                                @parameter_value unknown) as
-- missing source code
go

create procedure sys.sp_MScdc_capture_job() as
-- missing source code
go

create procedure sys.sp_MScdc_cleanup_job() as
-- missing source code
go

create procedure sys.sp_MScdc_db_ddl_event(@EventData unknown) as
-- missing source code
go

create procedure sys.sp_MScdc_ddl_event(@EventData unknown) as
-- missing source code
go

create procedure sys.sp_MScdc_logddl(@source_object_id unknown, @ddl_command unknown, @ddl_lsn unknown,
                                     @ddl_time unknown, @commit_lsn unknown, @source_column_id unknown,
                                     @fis_alter_column unknown, @fis_drop_table unknown) as
-- missing source code
go

create procedure sys.sp_MSchange_article(@publisher unknown, @publisher_db unknown, @publication unknown,
                                         @article unknown, @article_id unknown, @property unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_MSchange_distribution_agent_properties(@publisher unknown, @publisher_db unknown,
                                                               @publication unknown, @subscriber unknown,
                                                               @subscriber_db unknown, @property unknown,
                                                               @value unknown) as
-- missing source code
go

create procedure sys.sp_MSchange_logreader_agent_properties(@publisher unknown, @publisher_db unknown,
                                                            @publisher_security_mode unknown, @publisher_login unknown,
                                                            @publisher_password unknown, @job_login unknown,
                                                            @job_password unknown, @publisher_type unknown) as
-- missing source code
go

create procedure sys.sp_MSchange_merge_agent_properties(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                        @subscriber unknown, @subscriber_db unknown, @property unknown,
                                                        @value unknown) as
-- missing source code
go

create procedure sys.sp_MSchange_mergearticle(@pubid unknown, @artid unknown, @property unknown, @value unknown,
                                              @value_numeric unknown) as
-- missing source code
go

create procedure sys.sp_MSchange_mergepublication(@pubid unknown, @property unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_MSchange_originatorid(@originator_node unknown, @originator_db unknown,
                                              @originator_publication unknown, @originator_publication_id unknown,
                                              @originator_db_version unknown, @originator_id unknown,
                                              @originator_version unknown) as
-- missing source code
go

create procedure sys.sp_MSchange_priority(@subid unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_MSchange_publication(@publisher unknown, @publisher_db unknown, @publication unknown,
                                             @property unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_MSchange_retention(@pubid unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_MSchange_retention_period_unit(@pubid unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_MSchange_snapshot_agent_properties(@publisher unknown, @publisher_db unknown,
                                                           @publication unknown, @frequency_type unknown,
                                                           @frequency_interval unknown, @frequency_subday unknown,
                                                           @frequency_subday_interval unknown,
                                                           @frequency_relative_interval unknown,
                                                           @frequency_recurrence_factor unknown,
                                                           @active_start_date unknown, @active_end_date unknown,
                                                           @active_start_time_of_day unknown,
                                                           @active_end_time_of_day unknown, @snapshot_job_name unknown,
                                                           @publisher_security_mode unknown, @publisher_login unknown,
                                                           @publisher_password unknown, @job_login unknown,
                                                           @job_password unknown, @publisher_type unknown) as
-- missing source code
go

create procedure sys.sp_MSchange_subscription_dts_info(@job_id unknown, @dts_package_name unknown,
                                                       @dts_package_password unknown, @dts_package_location unknown,
                                                       @change_password unknown) as
-- missing source code
go

create procedure sys.sp_MSchangearticleresolver(@article_resolver unknown, @resolver_clsid unknown, @artid unknown,
                                                @resolver_info unknown) as
-- missing source code
go

create procedure sys.sp_MSchangedynamicsnapshotjobatdistributor(@publisher unknown, @publisher_db unknown,
                                                                @publication unknown, @dynamic_filter_login unknown,
                                                                @dynamic_filter_hostname unknown,
                                                                @frequency_type unknown, @frequency_interval unknown,
                                                                @frequency_subday unknown,
                                                                @frequency_subday_interval unknown,
                                                                @frequency_relative_interval unknown,
                                                                @frequency_recurrence_factor unknown,
                                                                @active_start_date unknown, @active_end_date unknown,
                                                                @active_start_time_of_day unknown,
                                                                @active_end_time_of_day unknown, @job_login unknown,
                                                                @job_password unknown) as
-- missing source code
go

create procedure sys.sp_MSchangedynsnaplocationatdistributor(@publisher unknown, @publisher_db unknown,
                                                             @publication unknown, @dynamic_filter_login unknown,
                                                             @dynamic_filter_hostname unknown,
                                                             @dynamic_snapshot_location unknown) as
-- missing source code
go

create procedure sys.sp_MSchangeobjectowner(@tablename unknown, @dest_owner unknown) as
-- missing source code
go

create procedure sys.sp_MScheckIsPubOfSub(@pubid unknown, @subid unknown, @pubOfSub unknown) as
-- missing source code
go

create procedure sys.sp_MScheck_Jet_Subscriber(@subscriber unknown, @is_jet unknown, @Jet_datasource_path unknown) as
-- missing source code
go

create procedure sys.sp_MScheck_agent_instance(@application_name unknown, @agent_type unknown) as
-- missing source code
go

create procedure sys.sp_MScheck_logicalrecord_metadatamatch(@metadata_type unknown, @parent_nickname unknown,
                                                            @parent_rowguid unknown, @logical_record_lineage unknown,
                                                            @pubid unknown) as
-- missing source code
go

create procedure sys.sp_MScheck_merge_subscription_count(@publisher unknown, @publisher_engine_edition unknown,
                                                         @about_to_insert_new_subscription unknown) as
-- missing source code
go

create procedure sys.sp_MScheck_pub_identity(@publisher unknown, @publisher_db unknown, @tablename unknown,
                                             @current_max unknown, @pub_range unknown, @threshold unknown,
                                             @range unknown, @next_seed unknown, @max_identity unknown) as
-- missing source code
go

create procedure sys.sp_MScheck_pull_access(@agent_id unknown, @agent_type unknown, @publication_id unknown,
                                            @raise_fatal_error unknown) as
-- missing source code
go

create procedure sys.sp_MScheck_snapshot_agent(@publisher unknown, @publisher_db unknown, @publication unknown,
                                               @valid_agent_exists unknown) as
-- missing source code
go

create procedure sys.sp_MScheck_subscription(@publication unknown, @pub_type unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_MScheck_subscription_expiry(@pubid unknown, @subscriber unknown, @subscriber_db unknown,
                                                    @expired unknown) as
-- missing source code
go

create procedure sys.sp_MScheck_subscription_partition(@pubid unknown, @subid unknown, @subscriber unknown,
                                                       @subscriber_db unknown, @valid unknown,
                                                       @force_delete_other unknown, @subscriber_deleted unknown,
                                                       @subscriberdb_deleted unknown) as
-- missing source code
go

create procedure sys.sp_MScheck_tran_retention(@xact_seqno unknown, @agent_id unknown) as
-- missing source code
go

create procedure sys.sp_MScheckexistsgeneration(@genguid unknown, @gen unknown, @pubid unknown) as
-- missing source code
go

create procedure sys.sp_MScheckexistsrecguid(@recguid unknown, @exists unknown) as
-- missing source code
go

create procedure sys.sp_MScheckfailedprevioussync(@pubid unknown, @last_sync_failed unknown) as
-- missing source code
go

create procedure sys.sp_MScheckidentityrange(@pubid unknown, @artname unknown, @next_seed unknown, @range unknown,
                                             @threshold unknown, @checkonly unknown) as
-- missing source code
go

create procedure sys.sp_MSchecksharedagentforpublication(@publisher_id unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_MSchecksnapshotstatus(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MScleanup_agent_entry() as
-- missing source code
go

create procedure sys.sp_MScleanup_conflict(@pubid unknown, @conflict_retention unknown) as
-- missing source code
go

create procedure sys.sp_MScleanup_publication_ADinfo(@name unknown, @database unknown) as
-- missing source code
go

create procedure sys.sp_MScleanup_subscription_distside_entry(@publisher unknown, @publisher_db unknown,
                                                              @publication unknown, @subscriber unknown,
                                                              @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MScleanupdynamicsnapshotfolder(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                       @dynamic_filter_login unknown, @dynamic_filter_hostname unknown,
                                                       @dynamic_snapshot_location unknown, @partition_id unknown) as
-- missing source code
go

create procedure sys.sp_MScleanupdynsnapshotvws() as
-- missing source code
go

create procedure sys.sp_MScleanupmergepublisher_internal() as
-- missing source code
go

create procedure sys.sp_MSclear_dynamic_snapshot_location(@publication unknown, @partition_id unknown, @deletefolder unknown) as
-- missing source code
go

create procedure sys.sp_MSclearresetpartialsnapshotprogressbit(@agent_id unknown) as
-- missing source code
go

create procedure sys.sp_MScomputelastsentgen(@repid unknown) as
-- missing source code
go

create procedure sys.sp_MScomputemergearticlescreationorder(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MScomputemergeunresolvedrefs(@publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_MSconflicttableexists(@pubid unknown, @artid unknown, @exists unknown) as
-- missing source code
go

create procedure sys.sp_MScreate_all_article_repl_views(@snapshot_application_finished unknown) as
-- missing source code
go

create procedure sys.sp_MScreate_article_repl_views(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MScreate_dist_tables() as
-- missing source code
go

create procedure sys.sp_MScreate_logical_record_views(@pubid unknown) as
-- missing source code
go

create procedure sys.sp_MScreate_sub_tables(@tran_sub_table unknown, @property_table unknown, @sqlqueue_table unknown,
                                            @subscription_articles_table unknown, @p2p_table unknown) as
-- missing source code
go

create procedure sys.sp_MScreate_tempgenhistorytable(@pubid unknown) as
-- missing source code
go

create procedure sys.sp_MScreatedisabledmltrigger(@source_object unknown, @source_owner unknown) as
-- missing source code
go

create procedure sys.sp_MScreatedummygeneration(@pubid unknown, @maxgen_whenadded unknown) as
-- missing source code
go

create procedure sys.sp_MScreateglobalreplica(@pubid unknown, @subid unknown, @replicastate unknown,
                                              @replica_server unknown, @replica_db unknown, @replica_priority unknown,
                                              @subscriber_type unknown, @subscription_type unknown,
                                              @datasource_type unknown, @datasource_path unknown, @replnick unknown,
                                              @status unknown, @sync_type unknown, @publication unknown,
                                              @distributor unknown, @replica_version unknown, @compatlevel unknown) as
-- missing source code
go

create procedure sys.sp_MScreatelightweightinsertproc(@pubid unknown, @artid unknown) as
-- missing source code
go

create procedure sys.sp_MScreatelightweightmultipurposeproc(@pubid unknown, @artid unknown) as
-- missing source code
go

create procedure sys.sp_MScreatelightweightprocstriggersconstraints(@pubid unknown, @artid unknown, @next_seed unknown,
                                                                    @range unknown, @threshold unknown) as
-- missing source code
go

create procedure sys.sp_MScreatelightweightupdateproc(@pubid unknown, @artid unknown) as
-- missing source code
go

create procedure sys.sp_MScreatemergedynamicsnapshot(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MScreateretry() as
-- missing source code
go

create procedure sys.sp_MSdbuseraccess(@mode unknown, @qual unknown) as
-- missing source code
go

create procedure sys.sp_MSdbuserpriv(@mode unknown) as
-- missing source code
go

create procedure sys.sp_MSdefer_check(@objname unknown, @objowner unknown) as
-- missing source code
go

create procedure sys.sp_MSdelete_tracer_history(@tracer_id unknown, @cutoff_date unknown, @num_records_removed unknown,
                                                @publication unknown, @publisher unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_MSdeletefoldercontents(@folder unknown) as
-- missing source code
go

create procedure sys.sp_MSdeletemetadataactionrequest(@pubid unknown, @tablenick unknown, @rowguid1 unknown,
                                                      @rowguid2 unknown, @rowguid3 unknown, @rowguid4 unknown,
                                                      @rowguid5 unknown, @rowguid6 unknown, @rowguid7 unknown,
                                                      @rowguid8 unknown, @rowguid9 unknown, @rowguid10 unknown,
                                                      @rowguid11 unknown, @rowguid12 unknown, @rowguid13 unknown,
                                                      @rowguid14 unknown, @rowguid15 unknown, @rowguid16 unknown,
                                                      @rowguid17 unknown, @rowguid18 unknown, @rowguid19 unknown,
                                                      @rowguid20 unknown, @rowguid21 unknown, @rowguid22 unknown,
                                                      @rowguid23 unknown, @rowguid24 unknown, @rowguid25 unknown,
                                                      @rowguid26 unknown, @rowguid27 unknown, @rowguid28 unknown,
                                                      @rowguid29 unknown, @rowguid30 unknown, @rowguid31 unknown,
                                                      @rowguid32 unknown, @rowguid33 unknown, @rowguid34 unknown,
                                                      @rowguid35 unknown, @rowguid36 unknown, @rowguid37 unknown,
                                                      @rowguid38 unknown, @rowguid39 unknown, @rowguid40 unknown,
                                                      @rowguid41 unknown, @rowguid42 unknown, @rowguid43 unknown,
                                                      @rowguid44 unknown, @rowguid45 unknown, @rowguid46 unknown,
                                                      @rowguid47 unknown, @rowguid48 unknown, @rowguid49 unknown,
                                                      @rowguid50 unknown, @rowguid51 unknown, @rowguid52 unknown,
                                                      @rowguid53 unknown, @rowguid54 unknown, @rowguid55 unknown,
                                                      @rowguid56 unknown, @rowguid57 unknown, @rowguid58 unknown,
                                                      @rowguid59 unknown, @rowguid60 unknown, @rowguid61 unknown,
                                                      @rowguid62 unknown, @rowguid63 unknown, @rowguid64 unknown,
                                                      @rowguid65 unknown, @rowguid66 unknown, @rowguid67 unknown,
                                                      @rowguid68 unknown, @rowguid69 unknown, @rowguid70 unknown,
                                                      @rowguid71 unknown, @rowguid72 unknown, @rowguid73 unknown,
                                                      @rowguid74 unknown, @rowguid75 unknown, @rowguid76 unknown,
                                                      @rowguid77 unknown, @rowguid78 unknown, @rowguid79 unknown,
                                                      @rowguid80 unknown, @rowguid81 unknown, @rowguid82 unknown,
                                                      @rowguid83 unknown, @rowguid84 unknown, @rowguid85 unknown,
                                                      @rowguid86 unknown, @rowguid87 unknown, @rowguid88 unknown,
                                                      @rowguid89 unknown, @rowguid90 unknown, @rowguid91 unknown,
                                                      @rowguid92 unknown, @rowguid93 unknown, @rowguid94 unknown,
                                                      @rowguid95 unknown, @rowguid96 unknown, @rowguid97 unknown,
                                                      @rowguid98 unknown, @rowguid99 unknown, @rowguid100 unknown) as
-- missing source code
go

create procedure sys.sp_MSdeletepeerconflictrow(@originator_id unknown, @origin_datasource unknown, @tran_id unknown,
                                                @row_id unknown, @conflict_table unknown) as
-- missing source code
go

create procedure sys.sp_MSdeleteretry(@temptable unknown, @tablenick unknown, @rowguid unknown) as
-- missing source code
go

create procedure sys.sp_MSdeletetranconflictrow(@tran_id unknown, @row_id unknown, @conflict_table unknown) as
-- missing source code
go

create procedure sys.sp_MSdelgenzero() as
-- missing source code
go

create procedure sys.sp_MSdelrow(@rowguid unknown, @tablenick unknown, @metadata_type unknown, @lineage_old unknown,
                                 @generation unknown, @lineage_new unknown, @pubid unknown, @check_permission unknown,
                                 @compatlevel unknown, @articleisupdateable unknown, @publication_number unknown,
                                 @partition_id unknown) as
-- missing source code
go

create procedure sys.sp_MSdelrowsbatch(@pubid unknown, @tablenick unknown, @check_permission unknown,
                                       @rows_tobe_deleted unknown, @partition_id unknown, @rowguid1 unknown,
                                       @metadata_type1 unknown, @generation1 unknown, @lineage_old1 unknown,
                                       @lineage_new1 unknown, @rowguid2 unknown, @metadata_type2 unknown,
                                       @generation2 unknown, @lineage_old2 unknown, @lineage_new2 unknown,
                                       @rowguid3 unknown, @metadata_type3 unknown, @generation3 unknown,
                                       @lineage_old3 unknown, @lineage_new3 unknown, @rowguid4 unknown,
                                       @metadata_type4 unknown, @generation4 unknown, @lineage_old4 unknown,
                                       @lineage_new4 unknown, @rowguid5 unknown, @metadata_type5 unknown,
                                       @generation5 unknown, @lineage_old5 unknown, @lineage_new5 unknown,
                                       @rowguid6 unknown, @metadata_type6 unknown, @generation6 unknown,
                                       @lineage_old6 unknown, @lineage_new6 unknown, @rowguid7 unknown,
                                       @metadata_type7 unknown, @generation7 unknown, @lineage_old7 unknown,
                                       @lineage_new7 unknown, @rowguid8 unknown, @metadata_type8 unknown,
                                       @generation8 unknown, @lineage_old8 unknown, @lineage_new8 unknown,
                                       @rowguid9 unknown, @metadata_type9 unknown, @generation9 unknown,
                                       @lineage_old9 unknown, @lineage_new9 unknown, @rowguid10 unknown,
                                       @metadata_type10 unknown, @generation10 unknown, @lineage_old10 unknown,
                                       @lineage_new10 unknown, @rowguid11 unknown, @metadata_type11 unknown,
                                       @generation11 unknown, @lineage_old11 unknown, @lineage_new11 unknown,
                                       @rowguid12 unknown, @metadata_type12 unknown, @generation12 unknown,
                                       @lineage_old12 unknown, @lineage_new12 unknown, @rowguid13 unknown,
                                       @metadata_type13 unknown, @generation13 unknown, @lineage_old13 unknown,
                                       @lineage_new13 unknown, @rowguid14 unknown, @metadata_type14 unknown,
                                       @generation14 unknown, @lineage_old14 unknown, @lineage_new14 unknown,
                                       @rowguid15 unknown, @metadata_type15 unknown, @generation15 unknown,
                                       @lineage_old15 unknown, @lineage_new15 unknown, @rowguid16 unknown,
                                       @metadata_type16 unknown, @generation16 unknown, @lineage_old16 unknown,
                                       @lineage_new16 unknown, @rowguid17 unknown, @metadata_type17 unknown,
                                       @generation17 unknown, @lineage_old17 unknown, @lineage_new17 unknown,
                                       @rowguid18 unknown, @metadata_type18 unknown, @generation18 unknown,
                                       @lineage_old18 unknown, @lineage_new18 unknown, @rowguid19 unknown,
                                       @metadata_type19 unknown, @generation19 unknown, @lineage_old19 unknown,
                                       @lineage_new19 unknown, @rowguid20 unknown, @metadata_type20 unknown,
                                       @generation20 unknown, @lineage_old20 unknown, @lineage_new20 unknown,
                                       @rowguid21 unknown, @metadata_type21 unknown, @generation21 unknown,
                                       @lineage_old21 unknown, @lineage_new21 unknown, @rowguid22 unknown,
                                       @metadata_type22 unknown, @generation22 unknown, @lineage_old22 unknown,
                                       @lineage_new22 unknown, @rowguid23 unknown, @metadata_type23 unknown,
                                       @generation23 unknown, @lineage_old23 unknown, @lineage_new23 unknown,
                                       @rowguid24 unknown, @metadata_type24 unknown, @generation24 unknown,
                                       @lineage_old24 unknown, @lineage_new24 unknown, @rowguid25 unknown,
                                       @metadata_type25 unknown, @generation25 unknown, @lineage_old25 unknown,
                                       @lineage_new25 unknown, @rowguid26 unknown, @metadata_type26 unknown,
                                       @generation26 unknown, @lineage_old26 unknown, @lineage_new26 unknown,
                                       @rowguid27 unknown, @metadata_type27 unknown, @generation27 unknown,
                                       @lineage_old27 unknown, @lineage_new27 unknown, @rowguid28 unknown,
                                       @metadata_type28 unknown, @generation28 unknown, @lineage_old28 unknown,
                                       @lineage_new28 unknown, @rowguid29 unknown, @metadata_type29 unknown,
                                       @generation29 unknown, @lineage_old29 unknown, @lineage_new29 unknown,
                                       @rowguid30 unknown, @metadata_type30 unknown, @generation30 unknown,
                                       @lineage_old30 unknown, @lineage_new30 unknown, @rowguid31 unknown,
                                       @metadata_type31 unknown, @generation31 unknown, @lineage_old31 unknown,
                                       @lineage_new31 unknown, @rowguid32 unknown, @metadata_type32 unknown,
                                       @generation32 unknown, @lineage_old32 unknown, @lineage_new32 unknown,
                                       @rowguid33 unknown, @metadata_type33 unknown, @generation33 unknown,
                                       @lineage_old33 unknown, @lineage_new33 unknown, @rowguid34 unknown,
                                       @metadata_type34 unknown, @generation34 unknown, @lineage_old34 unknown,
                                       @lineage_new34 unknown, @rowguid35 unknown, @metadata_type35 unknown,
                                       @generation35 unknown, @lineage_old35 unknown, @lineage_new35 unknown,
                                       @rowguid36 unknown, @metadata_type36 unknown, @generation36 unknown,
                                       @lineage_old36 unknown, @lineage_new36 unknown, @rowguid37 unknown,
                                       @metadata_type37 unknown, @generation37 unknown, @lineage_old37 unknown,
                                       @lineage_new37 unknown, @rowguid38 unknown, @metadata_type38 unknown,
                                       @generation38 unknown, @lineage_old38 unknown, @lineage_new38 unknown,
                                       @rowguid39 unknown, @metadata_type39 unknown, @generation39 unknown,
                                       @lineage_old39 unknown, @lineage_new39 unknown, @rowguid40 unknown,
                                       @metadata_type40 unknown, @generation40 unknown, @lineage_old40 unknown,
                                       @lineage_new40 unknown, @rowguid41 unknown, @metadata_type41 unknown,
                                       @generation41 unknown, @lineage_old41 unknown, @lineage_new41 unknown,
                                       @rowguid42 unknown, @metadata_type42 unknown, @generation42 unknown,
                                       @lineage_old42 unknown, @lineage_new42 unknown, @rowguid43 unknown,
                                       @metadata_type43 unknown, @generation43 unknown, @lineage_old43 unknown,
                                       @lineage_new43 unknown, @rowguid44 unknown, @metadata_type44 unknown,
                                       @generation44 unknown, @lineage_old44 unknown, @lineage_new44 unknown,
                                       @rowguid45 unknown, @metadata_type45 unknown, @generation45 unknown,
                                       @lineage_old45 unknown, @lineage_new45 unknown, @rowguid46 unknown,
                                       @metadata_type46 unknown, @generation46 unknown, @lineage_old46 unknown,
                                       @lineage_new46 unknown, @rowguid47 unknown, @metadata_type47 unknown,
                                       @generation47 unknown, @lineage_old47 unknown, @lineage_new47 unknown,
                                       @rowguid48 unknown, @metadata_type48 unknown, @generation48 unknown,
                                       @lineage_old48 unknown, @lineage_new48 unknown, @rowguid49 unknown,
                                       @metadata_type49 unknown, @generation49 unknown, @lineage_old49 unknown,
                                       @lineage_new49 unknown, @rowguid50 unknown, @metadata_type50 unknown,
                                       @generation50 unknown, @lineage_old50 unknown, @lineage_new50 unknown,
                                       @rowguid51 unknown, @metadata_type51 unknown, @generation51 unknown,
                                       @lineage_old51 unknown, @lineage_new51 unknown, @rowguid52 unknown,
                                       @metadata_type52 unknown, @generation52 unknown, @lineage_old52 unknown,
                                       @lineage_new52 unknown, @rowguid53 unknown, @metadata_type53 unknown,
                                       @generation53 unknown, @lineage_old53 unknown, @lineage_new53 unknown,
                                       @rowguid54 unknown, @metadata_type54 unknown, @generation54 unknown,
                                       @lineage_old54 unknown, @lineage_new54 unknown, @rowguid55 unknown,
                                       @metadata_type55 unknown, @generation55 unknown, @lineage_old55 unknown,
                                       @lineage_new55 unknown, @rowguid56 unknown, @metadata_type56 unknown,
                                       @generation56 unknown, @lineage_old56 unknown, @lineage_new56 unknown,
                                       @rowguid57 unknown, @metadata_type57 unknown, @generation57 unknown,
                                       @lineage_old57 unknown, @lineage_new57 unknown, @rowguid58 unknown,
                                       @metadata_type58 unknown, @generation58 unknown, @lineage_old58 unknown,
                                       @lineage_new58 unknown, @rowguid59 unknown, @metadata_type59 unknown,
                                       @generation59 unknown, @lineage_old59 unknown, @lineage_new59 unknown,
                                       @rowguid60 unknown, @metadata_type60 unknown, @generation60 unknown,
                                       @lineage_old60 unknown, @lineage_new60 unknown, @rowguid61 unknown,
                                       @metadata_type61 unknown, @generation61 unknown, @lineage_old61 unknown,
                                       @lineage_new61 unknown, @rowguid62 unknown, @metadata_type62 unknown,
                                       @generation62 unknown, @lineage_old62 unknown, @lineage_new62 unknown,
                                       @rowguid63 unknown, @metadata_type63 unknown, @generation63 unknown,
                                       @lineage_old63 unknown, @lineage_new63 unknown, @rowguid64 unknown,
                                       @metadata_type64 unknown, @generation64 unknown, @lineage_old64 unknown,
                                       @lineage_new64 unknown, @rowguid65 unknown, @metadata_type65 unknown,
                                       @generation65 unknown, @lineage_old65 unknown, @lineage_new65 unknown,
                                       @rowguid66 unknown, @metadata_type66 unknown, @generation66 unknown,
                                       @lineage_old66 unknown, @lineage_new66 unknown, @rowguid67 unknown,
                                       @metadata_type67 unknown, @generation67 unknown, @lineage_old67 unknown,
                                       @lineage_new67 unknown, @rowguid68 unknown, @metadata_type68 unknown,
                                       @generation68 unknown, @lineage_old68 unknown, @lineage_new68 unknown,
                                       @rowguid69 unknown, @metadata_type69 unknown, @generation69 unknown,
                                       @lineage_old69 unknown, @lineage_new69 unknown, @rowguid70 unknown,
                                       @metadata_type70 unknown, @generation70 unknown, @lineage_old70 unknown,
                                       @lineage_new70 unknown, @rowguid71 unknown, @metadata_type71 unknown,
                                       @generation71 unknown, @lineage_old71 unknown, @lineage_new71 unknown,
                                       @rowguid72 unknown, @metadata_type72 unknown, @generation72 unknown,
                                       @lineage_old72 unknown, @lineage_new72 unknown, @rowguid73 unknown,
                                       @metadata_type73 unknown, @generation73 unknown, @lineage_old73 unknown,
                                       @lineage_new73 unknown, @rowguid74 unknown, @metadata_type74 unknown,
                                       @generation74 unknown, @lineage_old74 unknown, @lineage_new74 unknown,
                                       @rowguid75 unknown, @metadata_type75 unknown, @generation75 unknown,
                                       @lineage_old75 unknown, @lineage_new75 unknown, @rowguid76 unknown,
                                       @metadata_type76 unknown, @generation76 unknown, @lineage_old76 unknown,
                                       @lineage_new76 unknown, @rowguid77 unknown, @metadata_type77 unknown,
                                       @generation77 unknown, @lineage_old77 unknown, @lineage_new77 unknown,
                                       @rowguid78 unknown, @metadata_type78 unknown, @generation78 unknown,
                                       @lineage_old78 unknown, @lineage_new78 unknown, @rowguid79 unknown,
                                       @metadata_type79 unknown, @generation79 unknown, @lineage_old79 unknown,
                                       @lineage_new79 unknown, @rowguid80 unknown, @metadata_type80 unknown,
                                       @generation80 unknown, @lineage_old80 unknown, @lineage_new80 unknown,
                                       @rowguid81 unknown, @metadata_type81 unknown, @generation81 unknown,
                                       @lineage_old81 unknown, @lineage_new81 unknown, @rowguid82 unknown,
                                       @metadata_type82 unknown, @generation82 unknown, @lineage_old82 unknown,
                                       @lineage_new82 unknown, @rowguid83 unknown, @metadata_type83 unknown,
                                       @generation83 unknown, @lineage_old83 unknown, @lineage_new83 unknown,
                                       @rowguid84 unknown, @metadata_type84 unknown, @generation84 unknown,
                                       @lineage_old84 unknown, @lineage_new84 unknown, @rowguid85 unknown,
                                       @metadata_type85 unknown, @generation85 unknown, @lineage_old85 unknown,
                                       @lineage_new85 unknown, @rowguid86 unknown, @metadata_type86 unknown,
                                       @generation86 unknown, @lineage_old86 unknown, @lineage_new86 unknown,
                                       @rowguid87 unknown, @metadata_type87 unknown, @generation87 unknown,
                                       @lineage_old87 unknown, @lineage_new87 unknown, @rowguid88 unknown,
                                       @metadata_type88 unknown, @generation88 unknown, @lineage_old88 unknown,
                                       @lineage_new88 unknown, @rowguid89 unknown, @metadata_type89 unknown,
                                       @generation89 unknown, @lineage_old89 unknown, @lineage_new89 unknown,
                                       @rowguid90 unknown, @metadata_type90 unknown, @generation90 unknown,
                                       @lineage_old90 unknown, @lineage_new90 unknown, @rowguid91 unknown,
                                       @metadata_type91 unknown, @generation91 unknown, @lineage_old91 unknown,
                                       @lineage_new91 unknown, @rowguid92 unknown, @metadata_type92 unknown,
                                       @generation92 unknown, @lineage_old92 unknown, @lineage_new92 unknown,
                                       @rowguid93 unknown, @metadata_type93 unknown, @generation93 unknown,
                                       @lineage_old93 unknown, @lineage_new93 unknown, @rowguid94 unknown,
                                       @metadata_type94 unknown, @generation94 unknown, @lineage_old94 unknown,
                                       @lineage_new94 unknown, @rowguid95 unknown, @metadata_type95 unknown,
                                       @generation95 unknown, @lineage_old95 unknown, @lineage_new95 unknown,
                                       @rowguid96 unknown, @metadata_type96 unknown, @generation96 unknown,
                                       @lineage_old96 unknown, @lineage_new96 unknown, @rowguid97 unknown,
                                       @metadata_type97 unknown, @generation97 unknown, @lineage_old97 unknown,
                                       @lineage_new97 unknown, @rowguid98 unknown, @metadata_type98 unknown,
                                       @generation98 unknown, @lineage_old98 unknown, @lineage_new98 unknown,
                                       @rowguid99 unknown, @metadata_type99 unknown, @generation99 unknown,
                                       @lineage_old99 unknown, @lineage_new99 unknown, @rowguid100 unknown,
                                       @metadata_type100 unknown, @generation100 unknown, @lineage_old100 unknown,
                                       @lineage_new100 unknown) as
-- missing source code
go

create procedure sys.sp_MSdelrowsbatch_downloadonly(@pubid unknown, @tablenick unknown, @check_permission unknown,
                                                    @rows_tobe_deleted unknown, @rowguid1 unknown, @rowguid2 unknown,
                                                    @rowguid3 unknown, @rowguid4 unknown, @rowguid5 unknown,
                                                    @rowguid6 unknown, @rowguid7 unknown, @rowguid8 unknown,
                                                    @rowguid9 unknown, @rowguid10 unknown, @rowguid11 unknown,
                                                    @rowguid12 unknown, @rowguid13 unknown, @rowguid14 unknown,
                                                    @rowguid15 unknown, @rowguid16 unknown, @rowguid17 unknown,
                                                    @rowguid18 unknown, @rowguid19 unknown, @rowguid20 unknown,
                                                    @rowguid21 unknown, @rowguid22 unknown, @rowguid23 unknown,
                                                    @rowguid24 unknown, @rowguid25 unknown, @rowguid26 unknown,
                                                    @rowguid27 unknown, @rowguid28 unknown, @rowguid29 unknown,
                                                    @rowguid30 unknown, @rowguid31 unknown, @rowguid32 unknown,
                                                    @rowguid33 unknown, @rowguid34 unknown, @rowguid35 unknown,
                                                    @rowguid36 unknown, @rowguid37 unknown, @rowguid38 unknown,
                                                    @rowguid39 unknown, @rowguid40 unknown, @rowguid41 unknown,
                                                    @rowguid42 unknown, @rowguid43 unknown, @rowguid44 unknown,
                                                    @rowguid45 unknown, @rowguid46 unknown, @rowguid47 unknown,
                                                    @rowguid48 unknown, @rowguid49 unknown, @rowguid50 unknown,
                                                    @rowguid51 unknown, @rowguid52 unknown, @rowguid53 unknown,
                                                    @rowguid54 unknown, @rowguid55 unknown, @rowguid56 unknown,
                                                    @rowguid57 unknown, @rowguid58 unknown, @rowguid59 unknown,
                                                    @rowguid60 unknown, @rowguid61 unknown, @rowguid62 unknown,
                                                    @rowguid63 unknown, @rowguid64 unknown, @rowguid65 unknown,
                                                    @rowguid66 unknown, @rowguid67 unknown, @rowguid68 unknown,
                                                    @rowguid69 unknown, @rowguid70 unknown, @rowguid71 unknown,
                                                    @rowguid72 unknown, @rowguid73 unknown, @rowguid74 unknown,
                                                    @rowguid75 unknown, @rowguid76 unknown, @rowguid77 unknown,
                                                    @rowguid78 unknown, @rowguid79 unknown, @rowguid80 unknown,
                                                    @rowguid81 unknown, @rowguid82 unknown, @rowguid83 unknown,
                                                    @rowguid84 unknown, @rowguid85 unknown, @rowguid86 unknown,
                                                    @rowguid87 unknown, @rowguid88 unknown, @rowguid89 unknown,
                                                    @rowguid90 unknown, @rowguid91 unknown, @rowguid92 unknown,
                                                    @rowguid93 unknown, @rowguid94 unknown, @rowguid95 unknown,
                                                    @rowguid96 unknown, @rowguid97 unknown, @rowguid98 unknown,
                                                    @rowguid99 unknown, @rowguid100 unknown) as
-- missing source code
go

create procedure sys.sp_MSdelsubrows(@rowguid unknown, @tablenick unknown, @metadata_type unknown, @lineage_old unknown,
                                     @generation unknown, @lineage_new unknown, @pubid unknown, @rowsdeleted unknown,
                                     @compatlevel unknown, @allarticlesareupdateable unknown) as
-- missing source code
go

create procedure sys.sp_MSdelsubrowsbatch(@tablenick unknown, @rowguid_array unknown, @metadatatype_array unknown,
                                          @oldlineage_len_array unknown, @oldlineage_array unknown,
                                          @generation_array unknown, @newlineage_len_array unknown,
                                          @newlineage_array unknown, @pubid unknown, @rowsdeleted unknown,
                                          @allarticlesareupdateable unknown) as
-- missing source code
go

create procedure sys.sp_MSdependencies(@objname unknown, @objtype unknown, @flags unknown, @objlist unknown,
                                       @intrans unknown) as
-- missing source code
go

create procedure sys.sp_MSdetect_nonlogged_shutdown(@subsystem unknown, @agent_id unknown) as
-- missing source code
go

create procedure sys.sp_MSdetectinvalidpeerconfiguration(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_MSdetectinvalidpeersubscription(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                        @dest_table unknown, @dest_owner unknown, @article unknown,
                                                        @type unknown) as
-- missing source code
go

create procedure sys.sp_MSdist_activate_auto_sub(@publisher_id unknown, @publisher_db unknown, @article_id unknown) as
-- missing source code
go

create procedure sys.sp_MSdist_adjust_identity(@agent_id unknown, @tablename unknown) as
-- missing source code
go

create procedure sys.sp_MSdistpublisher_cleanup(@publisher unknown) as
-- missing source code
go

create procedure sys.sp_MSdistribution_counters(@publisher unknown) as
-- missing source code
go

create procedure sys.sp_MSdistributoravailable() as
-- missing source code
go

create procedure sys.sp_MSdodatabasesnapshotinitiation(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MSdopartialdatabasesnapshotinitiation(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_6x_publication(@job_id unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_6x_replication_agent(@job_id unknown, @category_id unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_anonymous_entry(@subid unknown, @login unknown, @type unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_article(@publisher unknown, @publisher_db unknown, @publication unknown,
                                       @article unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_distribution_agent(@publisher_id unknown, @publisher_db unknown, @publication unknown,
                                                  @subscriber_id unknown, @subscriber_db unknown,
                                                  @subscription_type unknown, @keep_for_last_run unknown,
                                                  @job_only unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_distribution_agentid_dbowner_proxy(@agent_id unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_dynamic_snapshot_agent(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                      @agent_id unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_logreader_agent(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_merge_agent(@publisher unknown, @publisher_db unknown, @publication unknown,
                                           @subscriber unknown, @subscriber_db unknown, @keep_for_last_run unknown,
                                           @job_only unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_merge_subscription(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                  @subscriber unknown, @subscriber_db unknown,
                                                  @subscription_type unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_publication(@publisher unknown, @publisher_db unknown, @publication unknown,
                                           @alt_snapshot_folder unknown, @cleanup_orphans unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_qreader_history(@publication_id unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_snapshot_agent(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_snapshot_dirs() as
-- missing source code
go

create procedure sys.sp_MSdrop_subscriber_info(@publisher unknown, @subscriber unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_subscription(@publisher unknown, @publisher_db unknown, @subscriber unknown,
                                            @article_id unknown, @subscriber_db unknown, @publication unknown,
                                            @article unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_subscription_3rd(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MSdrop_tempgenhistorytable(@pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSdroparticleconstraints(@destination_object unknown, @destination_owner unknown) as
-- missing source code
go

create procedure sys.sp_MSdroparticletombstones(@artid unknown, @pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSdropconstraints(@table unknown, @owner unknown) as
-- missing source code
go

create procedure sys.sp_MSdropdynsnapshotvws(@dynamic_snapshot_views_table unknown) as
-- missing source code
go

create procedure sys.sp_MSdropfkreferencingarticle(@destination_object_name unknown, @destination_owner_name unknown) as
-- missing source code
go

create procedure sys.sp_MSdropmergearticle(@pubid unknown, @artid unknown, @ignore_merge_metadata unknown) as
-- missing source code
go

create procedure sys.sp_MSdropmergedynamicsnapshotjob(@publication unknown, @dynamic_snapshot_jobname unknown,
                                                      @dynamic_snapshot_jobid unknown, @ignore_distributor unknown) as
-- missing source code
go

create procedure sys.sp_MSdropretry(@tname unknown, @pname unknown) as
-- missing source code
go

create procedure sys.sp_MSdroptemptable(@tname unknown) as
-- missing source code
go

create procedure sys.sp_MSdummyupdate(@rowguid unknown, @tablenick unknown, @metatype unknown, @pubid unknown,
                                      @uplineage unknown, @inlineage unknown, @incolv unknown) as
-- missing source code
go

create procedure sys.sp_MSdummyupdate90(@rowguid unknown, @tablenick unknown, @metatype unknown, @pubid unknown,
                                        @inlineage unknown, @incolv unknown, @logical_record_parent_rowguid unknown) as
-- missing source code
go

create procedure sys.sp_MSdummyupdate_logicalrecord(@parent_rowguid unknown, @parent_nickname unknown,
                                                    @dest_common_gen unknown) as
-- missing source code
go

create procedure sys.sp_MSdummyupdatelightweight(@tablenick unknown, @rowguid unknown, @action unknown,
                                                 @metatype unknown, @rowvector unknown) as
-- missing source code
go

create procedure sys.sp_MSdynamicsnapshotjobexistsatdistributor(@publisher unknown, @publisher_db unknown,
                                                                @publication unknown, @dynamic_filter_login unknown,
                                                                @dynamic_filter_hostname unknown,
                                                                @dynamic_snapshot_jobid unknown) as
-- missing source code
go

create procedure sys.sp_MSenable_publication_for_het_sub(@publisher unknown, @publisher_db unknown,
                                                         @publication unknown, @sync_method unknown) as
-- missing source code
go

create procedure sys.sp_MSensure_single_instance(@application_name unknown, @agent_type unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_distribution(@name unknown, @show_distdb unknown, @exclude_anonymous unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_distribution_s(@name unknown, @hours unknown, @session_type unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_distribution_sd(@name unknown, @time unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_logicalrecord_changes(@partition_id unknown, @genlist unknown, @parent_nickname unknown,
                                                     @pubid unknown, @oldmaxgen unknown, @mingen unknown,
                                                     @maxgen unknown, @enumentirerowmetadata unknown,
                                                     @maxschemaguidforarticle unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_logreader(@name unknown, @show_distdb unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_logreader_s(@name unknown, @hours unknown, @session_type unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_logreader_sd(@name unknown, @time unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_merge(@name unknown, @show_distdb unknown, @exclude_anonymous unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_merge_agent_properties(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                      @show_security unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_merge_s(@name unknown, @hours unknown, @session_type unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_merge_sd(@name unknown, @time unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_merge_subscriptions(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                   @exclude_anonymous unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_merge_subscriptions_90_publication(@publisher unknown, @publisher_db unknown,
                                                                  @publication unknown, @topNum unknown,
                                                                  @exclude_anonymous unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_merge_subscriptions_90_publisher(@publisher unknown, @topNum unknown, @exclude_anonymous unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_metadataaction_requests(@tablenick_last unknown, @rowguid_last unknown, @pubid unknown,
                                                       @max_rows unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_qreader(@name unknown, @show_distdb unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_qreader_s(@publication_id unknown, @hours unknown, @session_type unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_qreader_sd(@publication_id unknown, @time unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_replication_agents(@type unknown, @exclude_anonymous unknown, @check_user unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_replication_job(@job_id unknown, @step_uid unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_replqueues(@curdistdb unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_replsqlqueues(@curdistdb unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_snapshot(@name unknown, @show_distdb unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_snapshot_s(@name unknown, @hours unknown, @session_type unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_snapshot_sd(@name unknown, @time unknown) as
-- missing source code
go

create procedure sys.sp_MSenum_subscriptions(@publisher unknown, @publisher_db unknown, @publication unknown,
                                             @exclude_anonymous unknown) as
-- missing source code
go

create procedure sys.sp_MSenumallpublications(@publisherdb unknown, @replication_type unknown, @agent_login unknown,
                                              @security_check unknown, @vendor_name unknown, @publication unknown,
                                              @hrepl_pub unknown, @empty_tranpub unknown) as
-- missing source code
go

create procedure sys.sp_MSenumallsubscriptions(@subscription_type unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MSenumarticleslightweight(@pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSenumchanges(@maxrows unknown, @genlist unknown, @tablenick unknown, @rowguid unknown,
                                      @pubid unknown, @oldmaxgen unknown, @mingen unknown, @maxgen unknown,
                                      @compatlevel unknown, @return_count_of_rows_initially_enumerated unknown,
                                      @enumentirerowmetadata unknown, @blob_cols_at_the_end unknown,
                                      @maxschemaguidforarticle unknown) as
-- missing source code
go

create procedure sys.sp_MSenumchanges_belongtopartition(@partition_id unknown, @maxrows unknown, @genlist unknown,
                                                        @tablenick unknown, @rowguid unknown, @pubid unknown,
                                                        @mingen unknown, @maxgen unknown,
                                                        @enumentirerowmetadata unknown, @blob_cols_at_the_end unknown,
                                                        @maxschemaguidforarticle unknown) as
-- missing source code
go

create procedure sys.sp_MSenumchanges_notbelongtopartition(@partition_id unknown, @maxrows unknown, @genlist unknown,
                                                           @tablenick unknown, @rowguid unknown, @pubid unknown,
                                                           @mingen unknown, @maxgen unknown,
                                                           @enumentirerowmetadata unknown) as
-- missing source code
go

create procedure sys.sp_MSenumchangesdirect(@maxrows unknown, @genlist unknown, @tablenick unknown, @rowguid unknown,
                                            @pubid unknown, @oldmaxgen unknown, @mingen unknown, @maxgen unknown,
                                            @compatlevel unknown, @enumentirerowmetadata unknown,
                                            @blob_cols_at_the_end unknown, @maxschemaguidforarticle unknown) as
-- missing source code
go

create procedure sys.sp_MSenumchangeslightweight(@pubid unknown, @tablenick unknown, @lastrowguid unknown,
                                                 @maxrows unknown) as
-- missing source code
go

create procedure sys.sp_MSenumcolumns(@pubid unknown, @artid unknown, @maxschemaguidforarticle unknown,
                                      @show_filtering_columns unknown) as
-- missing source code
go

create procedure sys.sp_MSenumcolumnslightweight(@pubid unknown, @artid unknown) as
-- missing source code
go

create procedure sys.sp_MSenumdeletes_forpartition(@partition_id unknown, @maxrows unknown, @genlist unknown,
                                                   @tablenick unknown, @rowguid unknown, @pubid unknown,
                                                   @mingen unknown, @maxgen unknown, @enumentirerowmetadata unknown) as
-- missing source code
go

create procedure sys.sp_MSenumdeleteslightweight(@pubid unknown, @tablenick unknown, @lastrowguid unknown,
                                                 @maxrows unknown) as
-- missing source code
go

create procedure sys.sp_MSenumdeletesmetadata(@pubid unknown, @maxrows unknown, @genlist unknown, @tablenick unknown,
                                              @rowguid unknown, @filter_partialdeletes unknown,
                                              @specified_article_only unknown, @mingen unknown, @maxgen unknown,
                                              @compatlevel unknown, @enumentirerowmetadata unknown) as
-- missing source code
go

create procedure sys.sp_MSenumdistributionagentproperties(@publisher unknown, @publisher_db unknown,
                                                          @publication unknown, @show_security unknown) as
-- missing source code
go

create procedure sys.sp_MSenumerate_PAL(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_MSenumgenerations(@genstart unknown, @pubid unknown, @return_count_of_generations unknown) as
-- missing source code
go

create procedure sys.sp_MSenumgenerations90(@genstart unknown, @pubid unknown, @partition_id unknown, @numgens unknown,
                                            @mingen_to_enumerate unknown, @maxgen_to_enumerate unknown) as
-- missing source code
go

create procedure sys.sp_MSenumpartialchanges(@maxrows unknown, @temp_cont unknown, @tablenick unknown, @rowguid unknown,
                                             @pubid unknown, @compatlevel unknown,
                                             @return_count_of_rows_initially_enumerated unknown,
                                             @enumentirerowmetadata unknown, @blob_cols_at_the_end unknown,
                                             @maxschemaguidforarticle unknown) as
-- missing source code
go

create procedure sys.sp_MSenumpartialchangesdirect(@maxrows unknown, @temp_cont unknown, @tablenick unknown,
                                                   @rowguid unknown, @pubid unknown, @compatlevel unknown,
                                                   @enumentirerowmetadata unknown, @blob_cols_at_the_end unknown,
                                                   @maxschemaguidforarticle unknown) as
-- missing source code
go

create procedure sys.sp_MSenumpartialdeletes(@maxrows unknown, @tablenick unknown, @rowguid unknown,
                                             @tablenotbelongs unknown, @bookmark unknown,
                                             @specified_article_only unknown, @compatlevel unknown, @pubid unknown,
                                             @enumentirerowmetadata unknown) as
-- missing source code
go

create procedure sys.sp_MSenumpubreferences(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MSenumreplicas(@pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSenumreplicas90() as
-- missing source code
go

create procedure sys.sp_MSenumretries(@tname unknown, @maxrows unknown, @tablenick unknown, @rowguid unknown,
                                      @pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSenumschemachange(@pubid unknown, @schemaversion unknown, @compatlevel unknown,
                                           @AlterTableOnly unknown, @invalidateupload_schemachanges_for_ssce unknown,
                                           @filter_skipped_schemachanges unknown) as
-- missing source code
go

create procedure sys.sp_MSenumsubscriptions(@subscription_type unknown, @publisher unknown, @publisher_db unknown,
                                            @reserved unknown) as
-- missing source code
go

create procedure sys.sp_MSenumthirdpartypublicationvendornames(@within_db unknown) as
-- missing source code
go

create procedure sys.sp_MSestimatemergesnapshotworkload(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MSestimatesnapshotworkload(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MSevalsubscriberinfo(@pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSevaluate_change_membership_for_all_articles_in_pubid(@pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSevaluate_change_membership_for_pubid(@pubid unknown, @partition_id unknown) as
-- missing source code
go

create procedure sys.sp_MSevaluate_change_membership_for_row(@tablenick unknown, @rowguid unknown, @marker unknown) as
-- missing source code
go

create procedure sys.sp_MSexecwithlsnoutput(@command unknown, @xact_seqno unknown) as
-- missing source code
go

create procedure sys.sp_MSfast_delete_trans() as
-- missing source code
go

create procedure sys.sp_MSfetchAdjustidentityrange(@publisher unknown, @publisher_db unknown, @tablename unknown,
                                                   @adjust_only unknown, @for_publisher unknown, @range unknown,
                                                   @next_seed unknown, @threshold unknown) as
-- missing source code
go

create procedure sys.sp_MSfetchidentityrange(@tablename unknown, @adjust_only unknown, @table_owner unknown) as
-- missing source code
go

create procedure sys.sp_MSfillupmissingcols(@publication unknown, @source_table unknown) as
-- missing source code
go

create procedure sys.sp_MSfilterclause(@publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_MSfix_6x_tasks(@publisher unknown, @publisher_engine_edition unknown) as
-- missing source code
go

create procedure sys.sp_MSfixlineageversions() as
-- missing source code
go

create procedure sys.sp_MSfixupbeforeimagetables(@pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSflush_access_cache() as
-- missing source code
go

create procedure sys.sp_MSforce_drop_distribution_jobs(@publisher unknown, @publisher_db unknown, @type unknown) as
-- missing source code
go

create procedure sys.sp_MSforcereenumeration(@tablenick unknown, @rowguid unknown) as
-- missing source code
go

create procedure sys.sp_MSforeach_worker(@command1 unknown, @replacechar unknown, @command2 unknown, @command3 unknown,
                                         @worker_type unknown) as
-- missing source code
go

create procedure sys.sp_MSforeachdb(@command1 unknown, @replacechar unknown, @command2 unknown, @command3 unknown,
                                    @precommand unknown, @postcommand unknown) as
-- missing source code
go

create procedure sys.sp_MSforeachtable(@command1 unknown, @replacechar unknown, @command2 unknown, @command3 unknown,
                                       @whereand unknown, @precommand unknown, @postcommand unknown) as
-- missing source code
go

create procedure sys.sp_MSgenerateexpandproc(@tablenick unknown, @procname unknown) as
-- missing source code
go

create procedure sys.sp_MSget_DDL_after_regular_snapshot(@publication unknown, @ddl_present unknown) as
-- missing source code
go

create procedure sys.sp_MSget_MSmerge_rowtrack_colinfo() as
-- missing source code
go

create procedure sys.sp_MSget_agent_names(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                          @publisher unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_MSget_attach_state(@publisher unknown, @publisher_db unknown, @publication unknown,
                                           @subscription_type unknown) as
-- missing source code
go

create procedure sys.sp_MSget_dynamic_snapshot_location(@pubid unknown, @partition_id unknown, @dynsnap_location unknown) as
-- missing source code
go

create procedure sys.sp_MSget_identity_range_info(@subid unknown, @artid unknown, @range_type unknown,
                                                  @ranges_needed unknown, @range_begin unknown, @range_end unknown,
                                                  @next_range_begin unknown, @next_range_end unknown) as
-- missing source code
go

create procedure sys.sp_MSget_jobstate(@job_id unknown) as
-- missing source code
go

create procedure sys.sp_MSget_last_transaction(@publisher_id unknown, @publisher_db unknown, @publisher unknown,
                                               @max_xact_seqno unknown, @for_truncate unknown) as
-- missing source code
go

create procedure sys.sp_MSget_latest_peerlsn(@originator_publication unknown, @originator unknown,
                                             @originator_db unknown, @xact_seqno unknown) as
-- missing source code
go

create procedure sys.sp_MSget_load_hint(@qualified_source_object_name unknown, @qualified_sync_object_name unknown,
                                        @primary_key_only unknown, @is_vertically_partitioned unknown) as
-- missing source code
go

create procedure sys.sp_MSget_log_shipping_new_sessionid(@agent_id unknown, @agent_type unknown, @session_id unknown) as
-- missing source code
go

create procedure sys.sp_MSget_logicalrecord_lineage(@pubid unknown, @parent_nickname unknown, @parent_rowguid unknown,
                                                    @dest_common_gen unknown) as
-- missing source code
go

create procedure sys.sp_MSget_max_used_identity(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                @article unknown, @max_used unknown) as
-- missing source code
go

create procedure sys.sp_MSget_min_seqno(@agent_id unknown, @xact_seqno unknown) as
-- missing source code
go

create procedure sys.sp_MSget_new_xact_seqno(@publisher_id unknown, @publisher_db unknown, @len unknown) as
-- missing source code
go

create procedure sys.sp_MSget_oledbinfo(@server unknown, @infotype unknown, @login unknown, @password unknown) as
-- missing source code
go

create procedure sys.sp_MSget_partitionid_eval_proc(@partition_id_eval_proc unknown, @pubid unknown,
                                                    @publication_number unknown, @column_list unknown,
                                                    @function_list unknown, @partition_id_eval_clause unknown,
                                                    @use_partition_groups unknown) as
-- missing source code
go

create procedure sys.sp_MSget_publication_from_taskname(@taskname unknown, @publisher unknown, @publisherdb unknown,
                                                        @publication unknown) as
-- missing source code
go

create procedure sys.sp_MSget_publisher_rpc(@trigger_id unknown, @connect_string unknown, @owner unknown) as
-- missing source code
go

create procedure sys.sp_MSget_repl_cmds_anonymous(@agent_id unknown, @last_xact_seqno unknown, @no_init_sync unknown,
                                                  @get_count unknown, @compatibility_level unknown) as
-- missing source code
go

create procedure sys.sp_MSget_repl_commands(@agent_id unknown, @last_xact_seqno unknown, @get_count unknown,
                                            @compatibility_level unknown, @subdb_version unknown,
                                            @read_query_size unknown) as
-- missing source code
go

create procedure sys.sp_MSget_repl_error(@id unknown) as
-- missing source code
go

create procedure sys.sp_MSget_session_statistics(@session_id unknown) as
-- missing source code
go

create procedure sys.sp_MSget_shared_agent(@server_name unknown, @database_name unknown, @agent_type unknown,
                                           @publisher unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_MSget_snapshot_history(@agent_id unknown, @timestamp unknown, @rowcount unknown) as
-- missing source code
go

create procedure sys.sp_MSget_subscriber_partition_id(@publication unknown, @partition_id unknown,
                                                      @maxgen_whenadded unknown, @host_name_override unknown,
                                                      @suser_sname_override unknown) as
-- missing source code
go

create procedure sys.sp_MSget_subscription_dts_info(@job_id unknown) as
-- missing source code
go

create procedure sys.sp_MSget_subscription_guid(@agent_id unknown) as
-- missing source code
go

create procedure sys.sp_MSget_synctran_commands(@publication unknown, @article unknown, @command_only unknown,
                                                @publisher unknown, @publisher_db unknown, @alter unknown,
                                                @trig_only unknown, @usesqlclr unknown) as
-- missing source code
go

create procedure sys.sp_MSget_type_wrapper(@tabid unknown, @colid unknown, @colname unknown, @typestring unknown) as
-- missing source code
go

create procedure sys.sp_MSgetagentoffloadinfo(@job_id unknown) as
-- missing source code
go

create procedure sys.sp_MSgetalertinfo(@includeaddresses unknown) as
-- missing source code
go

create procedure sys.sp_MSgetalternaterecgens(@repid unknown) as
-- missing source code
go

create procedure sys.sp_MSgetarticlereinitvalue(@subscriber unknown, @subscriberdb unknown, @publication unknown,
                                                @artid unknown, @reinit unknown) as
-- missing source code
go

create procedure sys.sp_MSgetchangecount(@startgen unknown, @changes unknown, @updates unknown, @deletes unknown) as
-- missing source code
go

create procedure sys.sp_MSgetconflictinsertproc(@artid unknown, @pubid unknown, @output unknown,
                                                @force_generate_proc unknown) as
-- missing source code
go

create procedure sys.sp_MSgetconflicttablename(@publication unknown, @source_object unknown, @conflict_table unknown) as
-- missing source code
go

create procedure sys.sp_MSgetdatametadatabatch(@pubid unknown, @tablenickarray unknown, @rowguidarray unknown,
                                               @all_articles_are_guaranteed_to_be_updateable_at_other_replica unknown,
                                               @logical_record_parent_rowguid unknown) as
-- missing source code
go

create procedure sys.sp_MSgetdbversion(@current_version unknown) as
-- missing source code
go

create procedure sys.sp_MSgetdynamicsnapshotapplock(@publication unknown, @partition_id unknown, @lock_acquired unknown,
                                                    @timeout unknown) as
-- missing source code
go

create procedure sys.sp_MSgetdynsnapvalidationtoken(@publication unknown, @dynamic_filter_login unknown) as
-- missing source code
go

create procedure sys.sp_MSgetgenstatus4rows(@repid unknown) as
-- missing source code
go

create procedure sys.sp_MSgetisvalidwindowsloginfromdistributor(@login unknown, @isvalid unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_MSgetlastrecgen(@repid unknown) as
-- missing source code
go

create procedure sys.sp_MSgetlastsentgen(@repid unknown) as
-- missing source code
go

create procedure sys.sp_MSgetlastsentrecgens(@repid unknown) as
-- missing source code
go

create procedure sys.sp_MSgetlastupdatedtime(@publisher unknown, @publisher_db unknown, @publication unknown,
                                             @subscription_type unknown, @publication_type unknown) as
-- missing source code
go

create procedure sys.sp_MSgetlightweightmetadatabatch(@pubid unknown, @artnickarray unknown, @rowguidarray unknown) as
-- missing source code
go

create procedure sys.sp_MSgetmakegenerationapplock(@head_of_queue unknown) as
-- missing source code
go

create procedure sys.sp_MSgetmakegenerationapplock_90(@wait_time unknown, @lock_acquired unknown) as
-- missing source code
go

create procedure sys.sp_MSgetmaxbcpgen(@max_closed_gen unknown) as
-- missing source code
go

create procedure sys.sp_MSgetmaxsnapshottimestamp(@agent_id unknown, @timestamp unknown) as
-- missing source code
go

create procedure sys.sp_MSgetmergeadminapplock(@timeout unknown, @lockmode unknown, @lock_acquired unknown,
                                               @lockowner unknown) as
-- missing source code
go

create procedure sys.sp_MSgetmetadata_changedlogicalrecordmembers(@parent_rowguid unknown, @commongen unknown, @parent_nickname unknown) as
-- missing source code
go

create procedure sys.sp_MSgetmetadatabatch(@pubid unknown, @tablenickarray unknown, @rowguidarray unknown,
                                           @compatlevel unknown, @lightweight unknown) as
-- missing source code
go

create procedure sys.sp_MSgetmetadatabatch90(@pubid unknown, @tablenickarray unknown, @rowguidarray unknown) as
-- missing source code
go

create procedure sys.sp_MSgetmetadatabatch90new(@pubid unknown, @tablenick unknown, @rowguid1 unknown,
                                                @rowguid2 unknown, @rowguid3 unknown, @rowguid4 unknown,
                                                @rowguid5 unknown, @rowguid6 unknown, @rowguid7 unknown,
                                                @rowguid8 unknown, @rowguid9 unknown, @rowguid10 unknown,
                                                @rowguid11 unknown, @rowguid12 unknown, @rowguid13 unknown,
                                                @rowguid14 unknown, @rowguid15 unknown, @rowguid16 unknown,
                                                @rowguid17 unknown, @rowguid18 unknown, @rowguid19 unknown,
                                                @rowguid20 unknown, @rowguid21 unknown, @rowguid22 unknown,
                                                @rowguid23 unknown, @rowguid24 unknown, @rowguid25 unknown,
                                                @rowguid26 unknown, @rowguid27 unknown, @rowguid28 unknown,
                                                @rowguid29 unknown, @rowguid30 unknown, @rowguid31 unknown,
                                                @rowguid32 unknown, @rowguid33 unknown, @rowguid34 unknown,
                                                @rowguid35 unknown, @rowguid36 unknown, @rowguid37 unknown,
                                                @rowguid38 unknown, @rowguid39 unknown, @rowguid40 unknown,
                                                @rowguid41 unknown, @rowguid42 unknown, @rowguid43 unknown,
                                                @rowguid44 unknown, @rowguid45 unknown, @rowguid46 unknown,
                                                @rowguid47 unknown, @rowguid48 unknown, @rowguid49 unknown,
                                                @rowguid50 unknown, @rowguid51 unknown, @rowguid52 unknown,
                                                @rowguid53 unknown, @rowguid54 unknown, @rowguid55 unknown,
                                                @rowguid56 unknown, @rowguid57 unknown, @rowguid58 unknown,
                                                @rowguid59 unknown, @rowguid60 unknown, @rowguid61 unknown,
                                                @rowguid62 unknown, @rowguid63 unknown, @rowguid64 unknown,
                                                @rowguid65 unknown, @rowguid66 unknown, @rowguid67 unknown,
                                                @rowguid68 unknown, @rowguid69 unknown, @rowguid70 unknown,
                                                @rowguid71 unknown, @rowguid72 unknown, @rowguid73 unknown,
                                                @rowguid74 unknown, @rowguid75 unknown, @rowguid76 unknown,
                                                @rowguid77 unknown, @rowguid78 unknown, @rowguid79 unknown,
                                                @rowguid80 unknown, @rowguid81 unknown, @rowguid82 unknown,
                                                @rowguid83 unknown, @rowguid84 unknown, @rowguid85 unknown,
                                                @rowguid86 unknown, @rowguid87 unknown, @rowguid88 unknown,
                                                @rowguid89 unknown, @rowguid90 unknown, @rowguid91 unknown,
                                                @rowguid92 unknown, @rowguid93 unknown, @rowguid94 unknown,
                                                @rowguid95 unknown, @rowguid96 unknown, @rowguid97 unknown,
                                                @rowguid98 unknown, @rowguid99 unknown, @rowguid100 unknown) as
-- missing source code
go

create procedure sys.sp_MSgetonerow(@tablenick unknown, @rowguid unknown, @pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSgetonerowlightweight(@tablenick unknown, @rowguid unknown, @pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSgetpeerconflictrow(@originator_id unknown, @origin_datasource unknown, @tran_id unknown,
                                             @row_id unknown, @conflict_table unknown) as
-- missing source code
go

create procedure sys.sp_MSgetpeerlsns(@publication unknown, @xlockrows unknown) as
-- missing source code
go

create procedure sys.sp_MSgetpeertopeercommands(@publication unknown, @article unknown, @snapshot_lsn unknown,
                                                @script_txt unknown) as
-- missing source code
go

create procedure sys.sp_MSgetpeerwinnerrow(@originator_id unknown, @row_id unknown, @conflict_table unknown) as
-- missing source code
go

create procedure sys.sp_MSgetpubinfo(@publication unknown, @publisher unknown, @pubdb unknown) as
-- missing source code
go

create procedure sys.sp_MSgetreplicainfo(@publisher unknown, @publisher_db unknown, @publication unknown,
                                         @datasource_type unknown, @server_name unknown, @db_name unknown,
                                         @datasource_path unknown, @compatlevel unknown) as
-- missing source code
go

create procedure sys.sp_MSgetreplicastate(@pubid unknown, @subid unknown, @replicastate unknown) as
-- missing source code
go

create procedure sys.sp_MSgetrowmetadata(@tablenick unknown, @rowguid unknown, @generation unknown, @type unknown,
                                         @lineage unknown, @colv unknown, @pubid unknown, @compatlevel unknown) as
-- missing source code
go

create procedure sys.sp_MSgetrowmetadatalightweight(@tablenick unknown, @rowguid unknown, @type unknown,
                                                    @rowvector unknown, @changedcolumns unknown,
                                                    @columns_enumeration unknown, @pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSgetsetupbelong_cost() as
-- missing source code
go

create procedure sys.sp_MSgetsubscriberinfo(@pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSgetsupportabilitysettings(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                    @server_name unknown, @db_name unknown, @web_server unknown,
                                                    @compatlevel unknown) as
-- missing source code
go

create procedure sys.sp_MSgettrancftsrcrow(@tran_id unknown, @row_id unknown, @conflict_table unknown,
                                           @is_subscriber unknown, @is_debug unknown) as
-- missing source code
go

create procedure sys.sp_MSgettranconflictrow(@tran_id unknown, @row_id unknown, @conflict_table unknown,
                                             @is_subscriber unknown) as
-- missing source code
go

create procedure sys.sp_MSgetversion() as
-- missing source code
go

create procedure sys.sp_MSgrantconnectreplication(@user_name unknown) as
-- missing source code
go

create procedure sys.sp_MShaschangeslightweight(@pubid unknown, @haschanges unknown) as
-- missing source code
go

create procedure sys.sp_MShasdbaccess() as
-- missing source code
go

create procedure sys.sp_MShelp_article(@publisher unknown, @publisher_db unknown, @publication unknown,
                                       @article unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_distdb(@publisher_name unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_distribution_agentid(@publisher_id unknown, @publisher_db unknown, @publication unknown,
                                                    @subscriber_id unknown, @subscriber_db unknown,
                                                    @subscription_type unknown, @subscriber_name unknown,
                                                    @anonymous_subid unknown, @reinitanon unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_identity_property(@tablename unknown, @ownername unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_logreader_agentid(@publisher_id unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_merge_agentid(@publisher_id unknown, @publisher_db unknown, @publication unknown,
                                             @subscriber_id unknown, @subscriber_db unknown,
                                             @subscriber_version unknown, @subscriber unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_profile(@agent_id unknown, @agent_type unknown, @profile_name unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_profilecache(@profile_name unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_publication(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_repl_agent(@publisher unknown, @publisher_db unknown, @publication unknown,
                                          @subscriber unknown, @subscriber_db unknown, @agent_type unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_replication_status(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                  @agent_type unknown, @exclude_anonymous unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_replication_table(@table_name unknown, @table_owner unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_snapshot_agent(@agent_id unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_snapshot_agentid(@publisher_id unknown, @publisher_db unknown, @publication unknown,
                                                @job_id unknown, @dynamic_snapshot_location unknown,
                                                @dynamic_filter_login unknown, @dynamic_filter_hostname unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_subscriber_info(@publisher unknown, @subscriber unknown, @found unknown,
                                               @show_password unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_subscription(@publisher unknown, @publisher_db unknown, @publication unknown,
                                            @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MShelp_subscription_status(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                   @subscriber unknown, @subscriber_db unknown, @retention unknown,
                                                   @out_of_date unknown, @independent_agent unknown) as
-- missing source code
go

create procedure sys.sp_MShelpcolumns(@tablename unknown, @flags unknown, @orderby unknown, @flags2 unknown) as
-- missing source code
go

create procedure sys.sp_MShelpconflictpublications(@publication_type unknown) as
-- missing source code
go

create procedure sys.sp_MShelpcreatebeforetable(@objid unknown, @newname unknown) as
-- missing source code
go

create procedure sys.sp_MShelpdestowner(@spname unknown) as
-- missing source code
go

create procedure sys.sp_MShelpdynamicsnapshotjobatdistributor(@publisher unknown, @publisher_db unknown,
                                                              @publication unknown, @dynamic_filter_login unknown,
                                                              @dynamic_filter_hostname unknown, @frequency_type unknown,
                                                              @frequency_interval unknown, @frequency_subday unknown,
                                                              @frequency_subday_interval unknown,
                                                              @frequency_relative_interval unknown,
                                                              @frequency_recurrence_factor unknown,
                                                              @active_start_date unknown, @active_end_date unknown,
                                                              @active_start_time_of_day unknown,
                                                              @active_end_time_of_day unknown) as
-- missing source code
go

create procedure sys.sp_MShelpfulltextindex(@tablename unknown) as
-- missing source code
go

create procedure sys.sp_MShelpfulltextscript(@tablename unknown) as
-- missing source code
go

create procedure sys.sp_MShelpindex(@tablename unknown, @indexname unknown, @flags unknown) as
-- missing source code
go

create procedure sys.sp_MShelplogreader_agent(@publisher unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_MShelpmergearticles(@publication unknown, @compatibility_level unknown, @pubidin unknown) as
-- missing source code
go

create procedure sys.sp_MShelpmergeconflictcounts(@publication_name unknown, @publisher unknown, @publisher_db unknown,
                                                  @logical_record_conflicts unknown) as
-- missing source code
go

create procedure sys.sp_MShelpmergedynamicsnapshotjob(@publication unknown, @dynamic_snapshot_jobname unknown,
                                                      @dynamic_snapshot_jobid unknown) as
-- missing source code
go

create procedure sys.sp_MShelpmergeidentity(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MShelpmergeschemaarticles(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MShelpobjectpublications(@object_name unknown) as
-- missing source code
go

create procedure sys.sp_MShelpreplicationtriggers(@object_name unknown, @object_schema unknown) as
-- missing source code
go

create procedure sys.sp_MShelpsnapshot_agent(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_MShelpsummarypublication(@oename unknown, @oetype unknown) as
-- missing source code
go

create procedure sys.sp_MShelptracertokenhistory(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                 @tracer_id unknown) as
-- missing source code
go

create procedure sys.sp_MShelptracertokens(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_MShelptranconflictcounts(@publication_name unknown, @publisher unknown, @publisher_db unknown,
                                                 @originator_id unknown) as
-- missing source code
go

create procedure sys.sp_MShelptype(@typename unknown, @flags unknown) as
-- missing source code
go

create procedure sys.sp_MShelpvalidationdate(@publication unknown, @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MSindexspace(@tablename unknown, @index_name unknown) as
-- missing source code
go

create procedure sys.sp_MSinit_publication_access(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                  @initinfo unknown, @skip unknown) as
-- missing source code
go

create procedure sys.sp_MSinit_subscription_agent(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                  @subscription_type unknown) as
-- missing source code
go

create procedure sys.sp_MSinitdynamicsubscriber(@maxrows unknown, @tablenick unknown, @rowguid unknown, @pubid unknown,
                                                @compatlevel unknown, @enumentirerowmetadata unknown,
                                                @blob_cols_at_the_end unknown) as
-- missing source code
go

create procedure sys.sp_MSinsert_identity(@publisher unknown, @publisher_db unknown, @tablename unknown,
                                          @identity_support unknown, @pub_identity_range unknown,
                                          @identity_range unknown, @threshold unknown, @next_seed unknown,
                                          @max_identity unknown) as
-- missing source code
go

create procedure sys.sp_MSinsertdeleteconflict(@tablenick unknown, @rowguid unknown, @conflict_type unknown,
                                               @reason_code unknown, @reason_text unknown, @origin_datasource unknown,
                                               @pubid unknown, @lineage unknown, @conflicts_logged unknown,
                                               @compatlevel unknown, @source_id unknown) as
-- missing source code
go

create procedure sys.sp_MSinserterrorlineage(@tablenick unknown, @rowguid unknown, @lineage unknown,
                                             @compatlevel unknown) as
-- missing source code
go

create procedure sys.sp_MSinsertgenerationschemachanges(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MSinsertgenhistory(@guidsrc unknown, @gen unknown, @pubid unknown, @pubid_ins unknown,
                                           @nicknames unknown, @artnick unknown, @compatlevel unknown) as
-- missing source code
go

create procedure sys.sp_MSinsertlightweightschemachange(@pubid unknown, @schemaversion unknown, @schemaguid unknown) as
-- missing source code
go

create procedure sys.sp_MSinsertschemachange(@pubid unknown, @artid unknown, @schemaversion unknown,
                                             @schemaguid unknown, @schematype unknown, @schematext unknown,
                                             @schemasubtype unknown, @update_schemaversion unknown) as
-- missing source code
go

create procedure sys.sp_MSinvalidate_snapshot(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_MSisnonpkukupdateinconflict(@pubid unknown, @artid unknown, @bitmap unknown) as
-- missing source code
go

create procedure sys.sp_MSispeertopeeragent(@agent_id unknown, @is_p2p unknown) as
-- missing source code
go

create procedure sys.sp_MSispkupdateinconflict(@pubid unknown, @artid unknown, @bitmap unknown) as
-- missing source code
go

create procedure sys.sp_MSispublicationqueued(@publisher unknown, @publisher_db unknown, @publication unknown,
                                              @allow_queued_tran unknown) as
-- missing source code
go

create procedure sys.sp_MSisreplmergeagent(@is_merge unknown, @at_publisher unknown) as
-- missing source code
go

create procedure sys.sp_MSissnapshotitemapplied(@snapshot_session_token unknown, @snapshot_progress_token unknown) as
-- missing source code
go

create procedure sys.sp_MSkilldb(@dbname unknown) as
-- missing source code
go

create procedure sys.sp_MSlock_auto_sub(@publisher_id unknown, @publisher_db unknown, @publication unknown,
                                        @reset unknown) as
-- missing source code
go

create procedure sys.sp_MSlock_distribution_agent(@id unknown, @mode unknown) as
-- missing source code
go

create procedure sys.sp_MSlocktable(@ownername unknown, @tablename unknown) as
-- missing source code
go

create procedure sys.sp_MSloginmappings(@loginname unknown, @flags unknown) as
-- missing source code
go

create procedure sys.sp_MSmakearticleprocs(@pubid unknown, @artid unknown, @recreate_conflict_proc unknown) as
-- missing source code
go

create procedure sys.sp_MSmakebatchinsertproc(@tablename unknown, @ownername unknown, @procname unknown, @pubid unknown,
                                              @artid unknown, @generate_subscriber_proc unknown,
                                              @destination_owner unknown) as
-- missing source code
go

create procedure sys.sp_MSmakebatchupdateproc(@tablename unknown, @ownername unknown, @procname unknown, @pubid unknown,
                                              @artid unknown, @generate_subscriber_proc unknown,
                                              @destination_owner unknown) as
-- missing source code
go

create procedure sys.sp_MSmakeconflictinsertproc(@tablename unknown, @ownername unknown, @procname unknown,
                                                 @basetableid unknown, @pubid unknown,
                                                 @generate_subscriber_proc unknown) as
-- missing source code
go

create procedure sys.sp_MSmakectsview(@publication unknown, @ctsview unknown,
                                      @dynamic_snapshot_views_table_name unknown, @create_dynamic_views unknown,
                                      @max_bcp_gen unknown) as
-- missing source code
go

create procedure sys.sp_MSmakedeleteproc(@tablename unknown, @ownername unknown, @procname unknown, @pubid unknown,
                                         @artid unknown, @generate_subscriber_proc unknown,
                                         @destination_owner unknown) as
-- missing source code
go

create procedure sys.sp_MSmakedynsnapshotvws(@publication unknown, @dynamic_filter_login unknown,
                                             @dynamic_snapshot_views_table_name unknown) as
-- missing source code
go

create procedure sys.sp_MSmakeexpandproc(@pubname unknown, @filterid unknown, @procname unknown) as
-- missing source code
go

create procedure sys.sp_MSmakegeneration(@gencheck unknown, @commongen unknown, @commongenguid unknown,
                                         @commongenvalid unknown, @compatlevel unknown) as
-- missing source code
go

create procedure sys.sp_MSmakeinsertproc(@tablename unknown, @ownername unknown, @procname unknown, @pubid unknown,
                                         @artid unknown, @generate_downlevel_procs unknown,
                                         @generate_subscriber_proc unknown, @destination_owner unknown) as
-- missing source code
go

create procedure sys.sp_MSmakemetadataselectproc(@tablename unknown, @ownername unknown, @procname unknown,
                                                 @pubid unknown, @artid unknown, @generate_subscriber_proc unknown,
                                                 @destination_owner unknown) as
-- missing source code
go

create procedure sys.sp_MSmakeselectproc(@tablename unknown, @ownername unknown, @procname unknown, @pubid unknown,
                                         @artid unknown, @generate_downlevel_procs unknown,
                                         @generate_subscriber_proc unknown, @destination_owner unknown) as
-- missing source code
go

create procedure sys.sp_MSmakesystableviews(@publication unknown, @dynamic_snapshot_views_table_name unknown,
                                            @create_dynamic_views unknown, @max_bcp_gen unknown) as
-- missing source code
go

create procedure sys.sp_MSmakeupdateproc(@tablename unknown, @ownername unknown, @procname unknown, @pubid unknown,
                                         @artid unknown, @generate_downlevel_procs unknown,
                                         @generate_subscriber_proc unknown, @destination_owner unknown) as
-- missing source code
go

create procedure sys.sp_MSmap_partitionid_to_generations(@partition_id unknown) as
-- missing source code
go

create procedure sys.sp_MSmarkreinit(@publisher unknown, @publisher_db unknown, @publication unknown,
                                     @subscriber unknown, @subscriber_db unknown, @reset_reinit unknown) as
-- missing source code
go

create procedure sys.sp_MSmatchkey(@tablename unknown, @col1 unknown, @col2 unknown, @col3 unknown, @col4 unknown,
                                   @col5 unknown, @col6 unknown, @col7 unknown, @col8 unknown, @col9 unknown,
                                   @col10 unknown, @col11 unknown, @col12 unknown, @col13 unknown, @col14 unknown,
                                   @col15 unknown, @col16 unknown) as
-- missing source code
go

create procedure sys.sp_MSmerge_alterschemaonly(@qual_object_name unknown, @objid unknown,
                                                @pass_through_scripts unknown, @objecttype unknown) as
-- missing source code
go

create procedure sys.sp_MSmerge_altertrigger(@qual_object_name unknown, @objid unknown, @pass_through_scripts unknown,
                                             @target_object_name unknown) as
-- missing source code
go

create procedure sys.sp_MSmerge_alterview(@qual_object_name unknown, @objid unknown, @pass_through_scripts unknown,
                                          @objecttype unknown) as
-- missing source code
go

create procedure sys.sp_MSmerge_ddldispatcher(@EventData unknown, @procmapid unknown) as
-- missing source code
go

create procedure sys.sp_MSmerge_getgencount(@genlist unknown, @gencount unknown) as
-- missing source code
go

create procedure sys.sp_MSmerge_getgencur_public(@tablenick unknown, @changecount unknown, @gen_cur unknown) as
-- missing source code
go

create procedure sys.sp_MSmerge_is_snapshot_required(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                     @subscriber unknown, @subscriber_db unknown,
                                                     @subscription_type unknown, @schemaversion unknown,
                                                     @run_at_subscriber unknown) as
-- missing source code
go

create procedure sys.sp_MSmerge_log_identity_range_allocations(@publisher unknown, @publisher_db unknown,
                                                               @publication unknown, @article unknown,
                                                               @subscriber unknown, @subscriber_db unknown,
                                                               @is_pub_range unknown, @ranges_allocated unknown,
                                                               @range_begin unknown, @range_end unknown,
                                                               @next_range_begin unknown, @next_range_end unknown) as
-- missing source code
go

create procedure sys.sp_MSmerge_parsegenlist(@genlist unknown, @gendeclarelist unknown, @genselectlist unknown,
                                             @genunionlist unknown) as
-- missing source code
go

create procedure sys.sp_MSmerge_upgrade_subscriber(@upgrade_metadata unknown, @upgrade_done unknown) as
-- missing source code
go

create procedure sys.sp_MSmergesubscribedb(@value unknown, @create_ddl_triggers unknown, @whattocreate unknown) as
-- missing source code
go

create procedure sys.sp_MSmergeupdatelastsyncinfo(@subid unknown, @last_sync_status unknown, @last_sync_summary unknown) as
-- missing source code
go

create procedure sys.sp_MSneedmergemetadataretentioncleanup(@replicaid unknown, @needcleanup unknown) as
-- missing source code
go

create procedure sys.sp_MSobjectprivs(@objname unknown, @mode unknown, @objid unknown, @srvpriv unknown,
                                      @prottype unknown, @grantee unknown, @flags unknown, @rollup unknown) as
-- missing source code
go

create procedure sys.sp_MSpeerapplyresponse(@request_id unknown, @originator unknown, @originator_db unknown,
                                            @response_srvr unknown, @response_db unknown) as
-- missing source code
go

create procedure sys.sp_MSpeerapplytopologyinfo(@request_id unknown, @originator unknown, @originator_db unknown,
                                                @response_srvr unknown, @response_db unknown, @connection_info unknown,
                                                @response_srvr_version unknown, @response_originator_id unknown,
                                                @response_conflict_retention unknown) as
-- missing source code
go

create procedure sys.sp_MSpeerconflictdetection_statuscollection_applyresponse(@request_id unknown, @peer_node unknown,
                                                                               @peer_db unknown,
                                                                               @peer_db_version unknown,
                                                                               @conflictdetection_enabled unknown,
                                                                               @peer_originator_id unknown,
                                                                               @peer_conflict_retention unknown,
                                                                               @peer_continue_onconflict unknown,
                                                                               @peer_histids unknown,
                                                                               @originator_node unknown,
                                                                               @originator_db unknown) as
-- missing source code
go

create procedure sys.sp_MSpeerconflictdetection_statuscollection_sendresponse(@request_id unknown, @publication unknown,
                                                                              @originator_node unknown,
                                                                              @originator_db unknown) as
-- missing source code
go

create procedure sys.sp_MSpeerconflictdetection_topology_applyresponse(@request_id unknown, @peer_node unknown,
                                                                       @peer_db unknown, @peer_version unknown,
                                                                       @peer_subscriptions unknown) as
-- missing source code
go

create procedure sys.sp_MSpeerdbinfo(@is_p2p unknown, @current_version unknown) as
-- missing source code
go

create procedure sys.sp_MSpeersendresponse(@request_id unknown, @originator unknown, @originator_db unknown,
                                           @originator_publication unknown) as
-- missing source code
go

create procedure sys.sp_MSpeersendtopologyinfo(@request_id unknown, @originator unknown, @originator_db unknown,
                                               @originator_publication unknown) as
-- missing source code
go

create procedure sys.sp_MSpeertopeerfwdingexec(@command unknown, @publication unknown, @execute unknown,
                                               @change_results_originator unknown) as
-- missing source code
go

create procedure sys.sp_MSpost_auto_proc(@pubid unknown, @artid unknown, @procmapid unknown, @pubname unknown,
                                         @artname unknown, @publisher unknown, @dbname unknown, @for_p2p_ddl unknown,
                                         @format unknown, @has_ts unknown, @has_ident unknown, @alter unknown) as
-- missing source code
go

create procedure sys.sp_MSpostapplyscript_forsubscriberprocs(@procsuffix unknown) as
-- missing source code
go

create procedure sys.sp_MSprep_exclusive(@objname unknown, @objid unknown) as
-- missing source code
go

create procedure sys.sp_MSprepare_mergearticle(@source_owner unknown, @source_table unknown, @publication unknown,
                                               @qualified_tablename unknown) as
-- missing source code
go

create procedure sys.sp_MSprofile_in_use(@tablename unknown, @profile_id unknown) as
-- missing source code
go

create procedure sys.sp_MSproxiedmetadata(@tablenick unknown, @rowguid unknown, @proxied_lineage unknown,
                                          @proxied_colv unknown, @proxy_logical_record_lineage unknown,
                                          @compatlevel unknown) as
-- missing source code
go

create procedure sys.sp_MSproxiedmetadatabatch(@tablenick unknown, @rowguid unknown, @proxied_lineage unknown,
                                               @proxied_colv unknown, @proxy_logical_record_lineage unknown,
                                               @compatlevel unknown) as
-- missing source code
go

create procedure sys.sp_MSproxiedmetadatalightweight(@tablenick unknown, @rowguid unknown, @pubid unknown,
                                                     @acknowledge_only unknown, @rowvector unknown) as
-- missing source code
go

create procedure sys.sp_MSpub_adjust_identity(@artid unknown, @max_identity unknown) as
-- missing source code
go

create procedure sys.sp_MSpublication_access(@publisher unknown, @publisher_db unknown, @publication unknown,
                                             @login unknown, @operation unknown, @has_access unknown, @skip unknown) as
-- missing source code
go

create procedure sys.sp_MSpublicationcleanup(@publication unknown, @publisher_db unknown, @publisher unknown,
                                             @ignore_merge_metadata unknown, @force_preserve_rowguidcol unknown) as
-- missing source code
go

create procedure sys.sp_MSpublicationview(@publication unknown, @force_flag unknown, @max_network_optimization unknown,
                                          @articlename unknown) as
-- missing source code
go

create procedure sys.sp_MSquery_syncstates(@publisher_id unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_MSquerysubtype(@pubid unknown, @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MSrecordsnapshotdeliveryprogress(@snapshot_session_token unknown, @snapshot_progress_token unknown) as
-- missing source code
go

create procedure sys.sp_MSreenable_check(@objname unknown, @objowner unknown) as
-- missing source code
go

create procedure sys.sp_MSrefresh_anonymous(@publication unknown, @publisher unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_MSrefresh_publisher_idrange(@qualified_object_name unknown, @subid unknown, @artid unknown,
                                                    @ranges_needed unknown, @refresh_check_constraint unknown) as
-- missing source code
go

create procedure sys.sp_MSregenerate_mergetriggersprocs(@pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSregisterdynsnapseqno(@snapshot_session_token unknown, @dynsnapseqno unknown) as
-- missing source code
go

create procedure sys.sp_MSregistermergesnappubid(@snapshot_session_token unknown, @pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSregistersubscription(@replication_type unknown, @publisher unknown, @publisher_db unknown,
                                               @publisher_security_mode unknown, @publisher_login unknown,
                                               @publisher_password unknown, @publication unknown, @subscriber unknown,
                                               @subscriber_db unknown, @subscriber_security_mode unknown,
                                               @subscriber_login unknown, @subscriber_password unknown,
                                               @distributor unknown, @distributor_security_mode unknown,
                                               @distributor_login unknown, @distributor_password unknown,
                                               @subscription_id unknown, @independent_agent unknown,
                                               @subscription_type unknown, @use_interactive_resolver unknown,
                                               @failover_mode unknown, @use_web_sync unknown, @hostname unknown) as
-- missing source code
go

create procedure sys.sp_MSreinit_failed_subscriptions(@failure_level unknown) as
-- missing source code
go

create procedure sys.sp_MSreinit_hub(@publisher unknown, @publisher_db unknown, @publication unknown,
                                     @upload_first unknown) as
-- missing source code
go

create procedure sys.sp_MSreinit_subscription(@publisher_name unknown, @publisher_db unknown, @publication unknown,
                                              @subscriber_name unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MSreinitoverlappingmergepublications(@pubid unknown, @upload_before_reinit unknown) as
-- missing source code
go

create procedure sys.sp_MSreleaseSlotLock(@process_name unknown, @DbPrincipal unknown) as
-- missing source code
go

create procedure sys.sp_MSreleasedynamicsnapshotapplock(@publication unknown, @partition_id unknown) as
-- missing source code
go

create procedure sys.sp_MSreleasemakegenerationapplock() as
-- missing source code
go

create procedure sys.sp_MSreleasemergeadminapplock(@lockowner unknown) as
-- missing source code
go

create procedure sys.sp_MSreleasesnapshotdeliverysessionlock() as
-- missing source code
go

create procedure sys.sp_MSremove_mergereplcommand(@publication unknown, @article unknown, @schematype unknown) as
-- missing source code
go

create procedure sys.sp_MSremoveoffloadparameter(@job_id unknown, @agenttype unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_FixPALRole(@pubid unknown, @role unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_IsLastPubInSharedSubscription(@subscriber unknown, @subscriber_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_IsUserInAnyPAL(@raise_error unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_PAL_rolecheck(@publication unknown, @artid unknown, @repid unknown, @pubid unknown,
                                             @objid unknown, @tablenick unknown, @partition_id unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_agentstatussummary(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                  @snap_status unknown, @snap_time unknown, @snap_comments unknown,
                                                  @snap_duration unknown, @log_status unknown, @log_time unknown,
                                                  @log_comments unknown, @log_duration unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_backup_complete() as
-- missing source code
go

create procedure sys.sp_MSrepl_backup_start() as
-- missing source code
go

create procedure sys.sp_MSrepl_check_publisher(@publisher_type unknown, @publisher unknown, @security_mode unknown,
                                               @login unknown, @password unknown, @connect_timeout unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_createdatatypemappings() as
-- missing source code
go

create procedure sys.sp_MSrepl_distributionagentstatussummary(@publisher unknown, @publisher_db unknown,
                                                              @publication unknown, @subscriber unknown,
                                                              @subscriber_db unknown, @distribution_status unknown,
                                                              @distribution_message unknown, @distribution_time unknown,
                                                              @distribution_duration unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_dropdatatypemappings() as
-- missing source code
go

create procedure sys.sp_MSrepl_enumarticlecolumninfo(@publisher unknown, @publication unknown, @article unknown,
                                                     @defaults unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_enumpublications(@reserved unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_enumpublishertables(@publisher unknown, @silent unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_enumsubscriptions(@publication unknown, @publisher unknown, @reserved unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_enumtablecolumninfo(@publisher unknown, @owner unknown, @tablename unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_getdistributorinfo(@distributor unknown, @distribdb unknown, @publisher unknown,
                                                  @local unknown, @rpcsrvname unknown, @publisher_type unknown,
                                                  @publisher_id unknown, @working_directory unknown,
                                                  @version unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_getpkfkrelation(@filtered_table unknown, @joined_table unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_gettype_mappings(@dbms_name unknown, @dbms_version unknown, @sql_type unknown,
                                                @source_prec unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_helparticlermo(@publication unknown, @article unknown, @returnfilter unknown,
                                              @publisher unknown, @found unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_init_backup_lsns() as
-- missing source code
go

create procedure sys.sp_MSrepl_isdbowner(@dbname unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_linkedservers_rowset(@srvname unknown, @agent_id unknown, @agent_type unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_mergeagentstatussummary(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                       @subscriber unknown, @subscriber_db unknown,
                                                       @merge_status unknown, @merge_message unknown,
                                                       @merge_time unknown, @merge_duration unknown,
                                                       @merge_percent_complete unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_raiserror(@agent unknown, @agent_name unknown, @status unknown, @message unknown,
                                         @subscriber unknown, @publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_schema(@pubname unknown, @artid unknown, @qual_source_object unknown, @column unknown,
                                      @operation unknown, @typetext unknown, @schema_change_script unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_setNFR(@schema unknown, @object_name unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_snapshot_helparticlecolumns(@publication unknown, @article unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_snapshot_helppublication(@publication unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_startup_internal() as
-- missing source code
go

create procedure sys.sp_MSrepl_subscription_rowset(@subscriber unknown, @agent_id unknown, @agent_type unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_testadminconnection(@distributor unknown, @password unknown) as
-- missing source code
go

create procedure sys.sp_MSrepl_testconnection(@publisher_type unknown, @publisher unknown, @security_mode unknown,
                                              @login unknown, @password unknown, @connect_timeout unknown) as
-- missing source code
go

create procedure sys.sp_MSreplagentjobexists(@type unknown, @exists unknown, @job_name unknown, @job_id unknown,
                                             @job_step_uid unknown, @proxy_id unknown, @publisher_id unknown,
                                             @subscriber_id unknown, @publisher unknown, @publisher_db unknown,
                                             @publication unknown, @subscriber unknown, @subscriber_db unknown,
                                             @independent_agent unknown, @frompublisher unknown) as
-- missing source code
go

create procedure sys.sp_MSreplcheck_permission(@objid unknown, @type unknown, @permissions unknown) as
-- missing source code
go

create procedure sys.sp_MSreplcheck_pull(@publication unknown, @raise_fatal_error unknown, @pubid unknown,
                                         @given_login unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_MSreplcheck_subscribe() as
-- missing source code
go

create procedure sys.sp_MSreplcheck_subscribe_withddladmin() as
-- missing source code
go

create procedure sys.sp_MSreplcheckoffloadserver(@offloadserver unknown) as
-- missing source code
go

create procedure sys.sp_MSreplcopyscriptfile(@directory unknown, @scriptfile unknown) as
-- missing source code
go

create procedure sys.sp_MSreplraiserror(@errorid unknown, @param1 unknown, @param2 unknown) as
-- missing source code
go

create procedure sys.sp_MSreplremoveuncdir(@dir unknown, @ignore_errors unknown) as
-- missing source code
go

create procedure sys.sp_MSreplupdateschema(@object_name unknown) as
-- missing source code
go

create procedure sys.sp_MSrequestreenumeration(@tablenick unknown, @rowguid unknown) as
-- missing source code
go

create procedure sys.sp_MSrequestreenumeration_lightweight(@tablenick unknown, @rowguid unknown) as
-- missing source code
go

create procedure sys.sp_MSreset_attach_state(@publisher unknown, @publisher_db unknown, @publication unknown,
                                             @subscription_type unknown) as
-- missing source code
go

create procedure sys.sp_MSreset_queued_reinit(@subscriber unknown, @subscriber_db unknown, @artid unknown) as
-- missing source code
go

create procedure sys.sp_MSreset_subscription(@publisher unknown, @publisher_db unknown, @publication unknown,
                                             @subscriber unknown, @subscriber_db unknown, @subscription_type unknown) as
-- missing source code
go

create procedure sys.sp_MSreset_subscription_seqno(@agent_id unknown, @get_snapshot unknown) as
-- missing source code
go

create procedure sys.sp_MSreset_synctran_bit(@owner unknown, @table unknown) as
-- missing source code
go

create procedure sys.sp_MSreset_transaction(@publisher unknown, @publisher_db unknown, @xact_seqno unknown) as
-- missing source code
go

create procedure sys.sp_MSresetsnapshotdeliveryprogress(@snapshot_session_token unknown) as
-- missing source code
go

create procedure sys.sp_MSrestoresavedforeignkeys(@program_name unknown) as
-- missing source code
go

create procedure sys.sp_MSretrieve_publication_attributes(@name unknown, @database unknown) as
-- missing source code
go

create procedure sys.sp_MSscript_article_view(@artid unknown, @view_name unknown, @include_timestamps unknown) as
-- missing source code
go

create procedure sys.sp_MSscript_dri(@publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_MSscript_pub_upd_trig(@publication unknown, @article unknown, @procname unknown,
                                              @alter unknown) as
-- missing source code
go

create procedure sys.sp_MSscript_sync_del_proc(@publication unknown, @article unknown, @procname unknown,
                                               @alter unknown) as
-- missing source code
go

create procedure sys.sp_MSscript_sync_del_trig(@objid unknown, @publisher unknown, @publisher_db unknown,
                                               @publication unknown, @trigname unknown, @procname unknown,
                                               @proc_owner unknown, @cftproc unknown, @agent_id unknown,
                                               @identity_col unknown, @ts_col unknown, @filter_clause unknown,
                                               @primary_key_bitmap unknown, @pubversion unknown, @falter unknown) as
-- missing source code
go

create procedure sys.sp_MSscript_sync_ins_proc(@publication unknown, @article unknown, @procname unknown,
                                               @alter unknown) as
-- missing source code
go

create procedure sys.sp_MSscript_sync_ins_trig(@objid unknown, @publisher unknown, @publisher_db unknown,
                                               @publication unknown, @trigname unknown, @procname unknown,
                                               @proc_owner unknown, @cftproc unknown, @agent_id unknown,
                                               @identity_col unknown, @ts_col unknown, @filter_clause unknown,
                                               @primary_key_bitmap unknown, @pubversion unknown, @falter unknown) as
-- missing source code
go

create procedure sys.sp_MSscript_sync_upd_proc(@publication unknown, @article unknown, @procname unknown,
                                               @alter unknown) as
-- missing source code
go

create procedure sys.sp_MSscript_sync_upd_trig(@objid unknown, @publisher unknown, @publisher_db unknown,
                                               @publication unknown, @trigname unknown, @procname unknown,
                                               @proc_owner unknown, @cftproc unknown, @agent_id unknown,
                                               @identity_col unknown, @ts_col unknown, @filter_clause unknown,
                                               @primary_key_bitmap unknown, @pubversion unknown, @falter unknown) as
-- missing source code
go

create procedure sys.sp_MSscriptcustomdelproc(@artid unknown, @publishertype unknown, @publisher unknown,
                                              @usesqlclr unknown, @inDDLrepl unknown) as
-- missing source code
go

create procedure sys.sp_MSscriptcustominsproc(@artid unknown, @publishertype unknown, @publisher unknown,
                                              @usesqlclr unknown, @inDDLrepl unknown) as
-- missing source code
go

create procedure sys.sp_MSscriptcustomupdproc(@artid unknown, @publishertype unknown, @publisher unknown,
                                              @usesqlclr unknown, @inDDLrepl unknown) as
-- missing source code
go

create procedure sys.sp_MSscriptdatabase(@dbname unknown) as
-- missing source code
go

create procedure sys.sp_MSscriptdb_worker() as
-- missing source code
go

create procedure sys.sp_MSscriptforeignkeyrestore(@program_name unknown, @constraint_name unknown,
                                                  @parent_schema unknown, @parent_name unknown,
                                                  @referenced_object_schema unknown, @referenced_object_name unknown,
                                                  @is_not_for_replication unknown, @is_not_trusted unknown,
                                                  @delete_referential_action unknown,
                                                  @update_referential_action unknown) as
-- missing source code
go

create procedure sys.sp_MSscriptsubscriberprocs(@publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_MSscriptviewproc(@viewname unknown, @ownername unknown, @procname unknown, @rgcol unknown,
                                         @pubid unknown, @artid unknown) as
-- missing source code
go

create procedure sys.sp_MSsendtosqlqueue(@objid unknown, @publisher unknown, @publisher_db unknown,
                                         @publication unknown, @owner unknown, @tranid unknown, @data unknown,
                                         @datalen unknown, @commandtype unknown, @cmdstate unknown) as
-- missing source code
go

create procedure sys.sp_MSset_dynamic_filter_options(@publication unknown, @dynamic_filters unknown,
                                                     @dont_raise_error unknown) as
-- missing source code
go

create procedure sys.sp_MSset_logicalrecord_metadata(@parent_nickname unknown, @parent_rowguid unknown,
                                                     @logical_record_lineage unknown) as
-- missing source code
go

create procedure sys.sp_MSset_new_identity_range(@subid unknown, @artid unknown, @range_type unknown,
                                                 @ranges_given unknown, @range_begin unknown, @range_end unknown,
                                                 @next_range_begin unknown, @next_range_end unknown) as
-- missing source code
go

create procedure sys.sp_MSset_oledb_prop(@provider_name unknown, @property_name unknown, @property_value unknown) as
-- missing source code
go

create procedure sys.sp_MSset_snapshot_xact_seqno(@publisher_id unknown, @publisher_db unknown, @article_id unknown,
                                                  @xact_seqno unknown, @reset unknown, @publication unknown,
                                                  @publisher_seqno unknown, @ss_cplt_seqno unknown) as
-- missing source code
go

create procedure sys.sp_MSset_sub_guid(@publisher unknown, @publisher_db unknown, @publication unknown,
                                       @subscription_type unknown, @subscription_guid unknown, @queue_id unknown,
                                       @queue_server unknown) as
-- missing source code
go

create procedure sys.sp_MSset_subscription_properties(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                      @subscription_type unknown, @allow_subscription_copy unknown,
                                                      @queue_id unknown, @update_mode unknown, @attach_version unknown,
                                                      @queue_server unknown) as
-- missing source code
go

create procedure sys.sp_MSsetaccesslist(@publication unknown, @publisher unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_MSsetalertinfo(@failsafeoperator unknown, @notificationmethod unknown,
                                       @forwardingserver unknown, @forwardingseverity unknown, @pagertotemplate unknown,
                                       @pagercctemplate unknown, @pagersubjecttemplate unknown,
                                       @pagersendsubjectonly unknown, @failsafeemailaddress unknown,
                                       @failsafepageraddress unknown, @failsafenetsendaddress unknown,
                                       @forwardalways unknown) as
-- missing source code
go

create procedure sys.sp_MSsetartprocs(@publication unknown, @article unknown, @force_flag unknown, @pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSsetbit(@bm unknown, @coltoadd unknown, @toset unknown) as
-- missing source code
go

create procedure sys.sp_MSsetconflictscript(@publication unknown, @article unknown, @conflict_script unknown,
                                            @login unknown, @password unknown) as
-- missing source code
go

create procedure sys.sp_MSsetconflicttable(@article unknown, @conflict_table unknown, @publisher unknown,
                                           @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_MSsetcontext_bypasswholeddleventbit(@onoff unknown) as
-- missing source code
go

create procedure sys.sp_MSsetcontext_replagent(@agent_type unknown, @is_publisher unknown) as
-- missing source code
go

create procedure sys.sp_MSsetgentozero(@tablenick unknown, @rowguid unknown, @metatype unknown) as
-- missing source code
go

create procedure sys.sp_MSsetlastrecgen(@repid unknown, @srcgen unknown, @srcguid unknown) as
-- missing source code
go

create procedure sys.sp_MSsetlastsentgen(@repid unknown, @srcgen unknown, @srcguid unknown) as
-- missing source code
go

create procedure sys.sp_MSsetreplicainfo(@publisher unknown, @publisher_db unknown, @publication unknown,
                                         @datasource_type unknown, @server_name unknown, @db_name unknown,
                                         @datasource_path unknown, @replnick unknown, @schemaversion unknown,
                                         @subid unknown, @compatlevel unknown, @partition_id unknown,
                                         @replica_version unknown, @activate_subscription unknown) as
-- missing source code
go

create procedure sys.sp_MSsetreplicaschemaversion(@subid unknown, @schemaversion unknown, @schemaguid unknown) as
-- missing source code
go

create procedure sys.sp_MSsetreplicastatus(@subid unknown, @status_value unknown) as
-- missing source code
go

create procedure sys.sp_MSsetrowmetadata(@tablenick unknown, @rowguid unknown, @generation unknown, @lineage unknown,
                                         @colv unknown, @type unknown, @was_tombstone unknown, @compatlevel unknown,
                                         @isinsert unknown, @pubid unknown, @publication_number unknown,
                                         @partition_id unknown, @partition_options unknown) as
-- missing source code
go

create procedure sys.sp_MSsetsubscriberinfo(@pubid unknown, @expr unknown) as
-- missing source code
go

create procedure sys.sp_MSsettopology(@server unknown, @X unknown, @Y unknown) as
-- missing source code
go

create procedure sys.sp_MSsetup_identity_range(@pubid unknown, @artid unknown, @range_type unknown,
                                               @ranges_needed unknown, @range_begin unknown, @range_end unknown,
                                               @next_range_begin unknown, @next_range_end unknown) as
-- missing source code
go

create procedure sys.sp_MSsetup_partition_groups(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MSsetup_use_partition_groups(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MSsetupbelongs(@publisher unknown, @publisher_db unknown, @publication unknown,
                                       @genlist unknown, @commongen unknown, @subissql unknown, @articlesoption unknown,
                                       @tablenickname unknown, @handle_null_tables unknown, @nicknamelist unknown,
                                       @mingen unknown, @maxgen unknown, @skipgenlist unknown, @belongsname unknown,
                                       @notbelongsname unknown, @compatlevel unknown, @enumentirerowmetadata unknown) as
-- missing source code
go

create procedure sys.sp_MSsetupnosyncsubwithlsnatdist(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                      @article unknown, @subscriber unknown, @destination_db unknown,
                                                      @subscriptionlsn unknown, @lsnsource unknown,
                                                      @originator_publication_id unknown,
                                                      @originator_db_version unknown, @originator_meta_data unknown,
                                                      @nosync_setup_script unknown, @next_valid_lsn unknown) as
-- missing source code
go

create procedure sys.sp_MSsetupnosyncsubwithlsnatdist_cleanup(@publisher unknown, @publisher_db unknown,
                                                              @publication unknown, @article unknown, @artid unknown,
                                                              @subscriber unknown, @destination_db unknown,
                                                              @next_valid_lsn unknown) as
-- missing source code
go

create procedure sys.sp_MSsetupnosyncsubwithlsnatdist_helper(@publisher unknown, @publisher_db unknown,
                                                             @publication unknown, @article unknown,
                                                             @subscriber unknown, @destination_db unknown,
                                                             @subscriptionlsn unknown, @lsnsource unknown,
                                                             @pubid unknown, @publisher_db_version unknown,
                                                             @script_txt unknown, @nosync_setup_script unknown,
                                                             @next_valid_lsn unknown, @artid unknown) as
-- missing source code
go

create procedure sys.sp_MSstartdistribution_agent(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                  @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MSstartmerge_agent(@publisher unknown, @publisher_db unknown, @publication unknown,
                                           @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MSstartsnapshot_agent(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_MSstopdistribution_agent(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                 @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MSstopmerge_agent(@publisher unknown, @publisher_db unknown, @publication unknown,
                                          @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MSstopsnapshot_agent(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_MSsub_check_identity(@lower_bound_id unknown) as
-- missing source code
go

create procedure sys.sp_MSsub_set_identity(@objid unknown, @threshold unknown, @range unknown, @next_seed unknown) as
-- missing source code
go

create procedure sys.sp_MSsubscription_status(@agent_id unknown) as
-- missing source code
go

create procedure sys.sp_MSsubscriptionvalidated(@subid unknown, @pubid unknown, @log_attempt unknown) as
-- missing source code
go

create procedure sys.sp_MStablechecks(@tablename unknown, @flags unknown) as
-- missing source code
go

create procedure sys.sp_MStablekeys(@tablename unknown, @colname unknown, @type unknown, @keyname unknown,
                                    @flags unknown) as
-- missing source code
go

create procedure sys.sp_MStablerefs(@tablename unknown, @type unknown, @direction unknown, @reftable unknown,
                                    @flags unknown) as
-- missing source code
go

create procedure sys.sp_MStablespace(@name unknown, @id unknown) as
-- missing source code
go

create procedure sys.sp_MStestbit(@bm unknown, @coltotest unknown) as
-- missing source code
go

create procedure sys.sp_MStran_ddlrepl(@EventData unknown, @procmapid unknown) as
-- missing source code
go

create procedure sys.sp_MStran_is_snapshot_required(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                    @subscriber unknown, @subscriber_db unknown,
                                                    @subscription_type unknown, @run_at_distributor unknown,
                                                    @last_xact_seqno unknown, @subscription_guid unknown,
                                                    @subid unknown) as
-- missing source code
go

create procedure sys.sp_MStrypurgingoldsnapshotdeliveryprogress() as
-- missing source code
go

create procedure sys.sp_MSuniquename(@seed unknown, @start unknown) as
-- missing source code
go

create procedure sys.sp_MSunmarkifneeded(@object unknown, @pubid unknown, @pre_command unknown, @publisher unknown,
                                         @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_MSunmarkreplinfo(@object unknown, @owner unknown, @type unknown) as
-- missing source code
go

create procedure sys.sp_MSunmarkschemaobject(@object unknown, @owner unknown) as
-- missing source code
go

create procedure sys.sp_MSunregistersubscription(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                 @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_MSupdate_agenttype_default(@profile_id unknown) as
-- missing source code
go

create procedure sys.sp_MSupdate_singlelogicalrecordmetadata(@logical_record_parent_nickname unknown,
                                                             @logical_record_parent_rowguid unknown, @replnick unknown,
                                                             @parent_row_inserted unknown) as
-- missing source code
go

create procedure sys.sp_MSupdate_subscriber_info(@publisher unknown, @subscriber unknown, @type unknown, @login unknown,
                                                 @password unknown, @commit_batch_size unknown,
                                                 @status_batch_size unknown, @flush_frequency unknown,
                                                 @frequency_type unknown, @frequency_interval unknown,
                                                 @frequency_relative_interval unknown,
                                                 @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                                 @frequency_subday_interval unknown, @active_start_time_of_day unknown,
                                                 @active_end_time_of_day unknown, @active_start_date unknown,
                                                 @active_end_date unknown, @retryattempts unknown, @retrydelay unknown,
                                                 @description unknown, @security_mode unknown) as
-- missing source code
go

create procedure sys.sp_MSupdate_subscriber_schedule(@publisher unknown, @subscriber unknown, @agent_type unknown,
                                                     @frequency_type unknown, @frequency_interval unknown,
                                                     @frequency_relative_interval unknown,
                                                     @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                                     @frequency_subday_interval unknown,
                                                     @active_start_time_of_day unknown, @active_end_time_of_day unknown,
                                                     @active_start_date unknown, @active_end_date unknown) as
-- missing source code
go

create procedure sys.sp_MSupdate_subscriber_tracer_history(@parent_tracer_id unknown, @agent_id unknown) as
-- missing source code
go

create procedure sys.sp_MSupdate_subscription(@publisher unknown, @publisher_db unknown, @subscriber unknown,
                                              @article_id unknown, @status unknown, @subscription_seqno unknown,
                                              @destination_db unknown) as
-- missing source code
go

create procedure sys.sp_MSupdate_tracer_history(@tracer_id unknown) as
-- missing source code
go

create procedure sys.sp_MSupdatecachedpeerlsn(@type unknown, @agent_id unknown, @originator unknown,
                                              @originator_db unknown, @originator_publication_id unknown,
                                              @originator_db_version unknown, @originator_lsn unknown) as
-- missing source code
go

create procedure sys.sp_MSupdategenerations_afterbcp(@pubid unknown) as
-- missing source code
go

create procedure sys.sp_MSupdategenhistory(@guidsrc unknown, @pubid unknown, @gen unknown, @art_nick unknown,
                                           @is_ssce_empty_sync unknown, @publication_number unknown,
                                           @partition_id unknown) as
-- missing source code
go

create procedure sys.sp_MSupdateinitiallightweightsubscription(@publisher unknown, @publisher_db unknown,
                                                               @publication_name unknown, @pubid unknown,
                                                               @allow_subscription_copy unknown, @retention unknown,
                                                               @conflict_logging unknown, @status unknown,
                                                               @allow_synctoalternate unknown, @replicate_ddl unknown,
                                                               @automatic_reinitialization_policy unknown) as
-- missing source code
go

create procedure sys.sp_MSupdatelastsyncinfo(@publisher unknown, @publisher_db unknown, @publication unknown,
                                             @subscription_type unknown, @last_sync_status unknown,
                                             @last_sync_summary unknown) as
-- missing source code
go

create procedure sys.sp_MSupdatepeerlsn(@originator unknown, @originator_db unknown, @originator_publication_id unknown,
                                        @originator_db_version unknown, @originator_lsn unknown) as
-- missing source code
go

create procedure sys.sp_MSupdaterecgen(@altrepid unknown, @altrecguid unknown, @altrecgen unknown) as
-- missing source code
go

create procedure sys.sp_MSupdatereplicastate(@pubid unknown, @subid unknown, @replicastate unknown) as
-- missing source code
go

create procedure sys.sp_MSupdatesysmergearticles(@object unknown, @artid unknown, @owner unknown, @pubid unknown,
                                                 @recreate_repl_view unknown) as
-- missing source code
go

create procedure sys.sp_MSuplineageversion(@tablenick unknown, @rowguid unknown, @version unknown) as
-- missing source code
go

create procedure sys.sp_MSuploadsupportabilitydata(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                   @server_name unknown, @db_name unknown, @file_name unknown,
                                                   @log_file_type unknown, @log_file unknown, @web_server unknown,
                                                   @compatlevel unknown) as
-- missing source code
go

create procedure sys.sp_MSuselightweightreplication(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                    @lightweight unknown) as
-- missing source code
go

create procedure sys.sp_MSvalidate_dest_recgen(@pubid unknown, @recguid unknown, @recgen unknown) as
-- missing source code
go

create procedure sys.sp_MSvalidate_subscription(@subscriber unknown, @subscriber_db unknown, @artid unknown) as
-- missing source code
go

create procedure sys.sp_MSvalidate_wellpartitioned_articles(@publication unknown) as
-- missing source code
go

create procedure sys.sp_MSvalidatearticle(@artid unknown, @pubid unknown, @expected_rowcount unknown,
                                          @expected_checksum unknown, @validation_type unknown,
                                          @full_or_fast unknown) as
-- missing source code
go

create procedure sys.sp_MSwritemergeperfcounter(@agent_id unknown, @thread_num unknown, @counter_desc unknown,
                                                @counter_value unknown) as
-- missing source code
go

create procedure sys.sp_OACreate() as
-- missing source code
go

create procedure sys.sp_OADestroy() as
-- missing source code
go

create procedure sys.sp_OAGetErrorInfo() as
-- missing source code
go

create procedure sys.sp_OAGetProperty() as
-- missing source code
go

create procedure sys.sp_OAMethod() as
-- missing source code
go

create procedure sys.sp_OASetProperty() as
-- missing source code
go

create procedure sys.sp_OAStop() as
-- missing source code
go

create procedure sys.sp_ORbitmap(@inputbitmap1 unknown, @inputbitmap2 unknown, @resultbitmap3 unknown) as
-- missing source code
go

create procedure sys.sp_PostAgentInfo() as
-- missing source code
go

create procedure sys.sp_SetAutoSAPasswordAndDisable() as
-- missing source code
go

create procedure sys.sp_SetOBDCertificate() as
-- missing source code
go

create procedure sys.sp_add_agent_parameter(@profile_id unknown, @parameter_name unknown, @parameter_value unknown) as
-- missing source code
go

create procedure sys.sp_add_agent_profile(@profile_id unknown, @profile_name unknown, @agent_type unknown,
                                          @profile_type unknown, @description unknown, @default unknown) as
-- missing source code
go

create procedure sys.sp_add_data_file_recover_suspect_db(@dbName unknown, @filegroup unknown, @name unknown,
                                                         @filename unknown, @size unknown, @maxsize unknown,
                                                         @filegrowth unknown) as
-- missing source code
go

create procedure sys.sp_add_log_file_recover_suspect_db(@dbName unknown, @name unknown, @filename unknown,
                                                        @size unknown, @maxsize unknown, @filegrowth unknown) as
-- missing source code
go

create procedure sys.sp_add_log_shipping_alert_job(@alert_job_id unknown) as
-- missing source code
go

create procedure sys.sp_add_log_shipping_primary_database(@database unknown, @backup_directory unknown,
                                                          @backup_share unknown, @backup_job_name unknown,
                                                          @backup_retention_period unknown, @monitor_server unknown,
                                                          @monitor_server_security_mode unknown,
                                                          @monitor_server_login unknown,
                                                          @monitor_server_password unknown, @backup_threshold unknown,
                                                          @threshold_alert unknown, @threshold_alert_enabled unknown,
                                                          @history_retention_period unknown, @backup_job_id unknown,
                                                          @primary_id unknown, @overwrite unknown,
                                                          @ignoreremotemonitor unknown, @backup_compression unknown) as
-- missing source code
go

create procedure sys.sp_add_log_shipping_primary_secondary(@primary_database unknown, @secondary_server unknown,
                                                           @secondary_database unknown, @overwrite unknown) as
-- missing source code
go

create procedure sys.sp_add_log_shipping_secondary_database(@secondary_database unknown, @primary_server unknown,
                                                            @primary_database unknown, @restore_delay unknown,
                                                            @restore_all unknown, @restore_mode unknown,
                                                            @disconnect_users unknown, @block_size unknown,
                                                            @buffer_count unknown, @max_transfer_size unknown,
                                                            @restore_threshold unknown, @threshold_alert unknown,
                                                            @threshold_alert_enabled unknown,
                                                            @history_retention_period unknown, @overwrite unknown,
                                                            @ignoreremotemonitor unknown) as
-- missing source code
go

create procedure sys.sp_add_log_shipping_secondary_primary(@primary_server unknown, @primary_database unknown,
                                                           @backup_source_directory unknown,
                                                           @backup_destination_directory unknown,
                                                           @copy_job_name unknown, @restore_job_name unknown,
                                                           @file_retention_period unknown, @monitor_server unknown,
                                                           @monitor_server_security_mode unknown,
                                                           @monitor_server_login unknown,
                                                           @monitor_server_password unknown, @copy_job_id unknown,
                                                           @restore_job_id unknown, @secondary_id unknown,
                                                           @overwrite unknown, @ignoreremotemonitor unknown) as
-- missing source code
go

create procedure sys.sp_addapprole(@rolename unknown, @password unknown) as
-- missing source code
go

create procedure sys.sp_addarticle(@publication unknown, @article unknown, @source_table unknown,
                                   @destination_table unknown, @vertical_partition unknown, @type unknown,
                                   @filter unknown, @sync_object unknown, @ins_cmd unknown, @del_cmd unknown,
                                   @upd_cmd unknown, @creation_script unknown, @description unknown,
                                   @pre_creation_cmd unknown, @filter_clause unknown, @schema_option unknown,
                                   @destination_owner unknown, @status unknown, @source_owner unknown,
                                   @sync_object_owner unknown, @filter_owner unknown, @source_object unknown,
                                   @artid unknown, @auto_identity_range unknown, @pub_identity_range unknown,
                                   @identity_range unknown, @threshold unknown, @force_invalidate_snapshot unknown,
                                   @use_default_datatypes unknown, @identityrangemanagementoption unknown,
                                   @publisher unknown, @fire_triggers_on_snapshot unknown) as
-- missing source code
go

create procedure sys.sp_adddatatype(@dbms unknown, @version unknown, @type unknown, @createparams unknown) as
-- missing source code
go

create procedure sys.sp_adddatatypemapping(@source_dbms unknown, @source_version unknown, @source_type unknown,
                                           @source_length_min unknown, @source_length_max unknown,
                                           @source_precision_min unknown, @source_precision_max unknown,
                                           @source_scale_min unknown, @source_scale_max unknown,
                                           @source_nullable unknown, @destination_dbms unknown,
                                           @destination_version unknown, @destination_type unknown,
                                           @destination_length unknown, @destination_precision unknown,
                                           @destination_scale unknown, @destination_nullable unknown,
                                           @destination_createparams unknown, @dataloss unknown, @is_default unknown) as
-- missing source code
go

create procedure sys.sp_adddistpublisher(@publisher unknown, @distribution_db unknown, @security_mode unknown,
                                         @login unknown, @password unknown, @working_directory unknown,
                                         @trusted unknown, @encrypted_password unknown, @thirdparty_flag unknown,
                                         @publisher_type unknown) as
-- missing source code
go

create procedure sys.sp_adddistributiondb(@database unknown, @data_folder unknown, @data_file unknown,
                                          @data_file_size unknown, @log_folder unknown, @log_file unknown,
                                          @log_file_size unknown, @min_distretention unknown,
                                          @max_distretention unknown, @history_retention unknown,
                                          @security_mode unknown, @login unknown, @password unknown,
                                          @createmode unknown, @from_scripting unknown) as
-- missing source code
go

create procedure sys.sp_adddistributor(@distributor unknown, @heartbeat_interval unknown, @password unknown,
                                       @from_scripting unknown) as
-- missing source code
go

create procedure sys.sp_adddynamicsnapshot_job(@publication unknown, @suser_sname unknown, @host_name unknown,
                                               @dynamic_snapshot_jobname unknown, @dynamic_snapshot_jobid unknown,
                                               @frequency_type unknown, @frequency_interval unknown,
                                               @frequency_subday unknown, @frequency_subday_interval unknown,
                                               @frequency_relative_interval unknown,
                                               @frequency_recurrence_factor unknown, @active_start_date unknown,
                                               @active_end_date unknown, @active_start_time_of_day unknown,
                                               @active_end_time_of_day unknown) as
-- missing source code
go

create procedure sys.sp_addextendedproc(@functname unknown, @dllname unknown) as
-- missing source code
go

create procedure sys.sp_addextendedproperty(@name unknown, @value unknown, @level0type unknown, @level0name unknown,
                                            @level1type unknown, @level1name unknown, @level2type unknown,
                                            @level2name unknown) as
-- missing source code
go

create procedure sys.sp_addlinkedserver(@server unknown, @srvproduct unknown, @provider unknown, @datasrc unknown,
                                        @location unknown, @provstr unknown, @catalog unknown) as
-- missing source code
go

create procedure sys.sp_addlinkedsrvlogin(@rmtsrvname unknown, @useself unknown, @locallogin unknown, @rmtuser unknown,
                                          @rmtpassword unknown) as
-- missing source code
go

create procedure sys.sp_addlogin(@loginame unknown, @passwd unknown, @defdb unknown, @deflanguage unknown, @sid unknown,
                                 @encryptopt unknown) as
-- missing source code
go

create procedure sys.sp_addlogreader_agent(@job_login unknown, @job_password unknown, @job_name unknown,
                                           @publisher_security_mode unknown, @publisher_login unknown,
                                           @publisher_password unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_addmergealternatepublisher(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                   @alternate_publisher unknown, @alternate_publisher_db unknown,
                                                   @alternate_publication unknown, @alternate_distributor unknown,
                                                   @friendly_name unknown, @reserved unknown) as
-- missing source code
go

create procedure sys.sp_addmergearticle(@publication unknown, @article unknown, @source_object unknown, @type unknown,
                                        @description unknown, @column_tracking unknown, @status unknown,
                                        @pre_creation_cmd unknown, @creation_script unknown, @schema_option unknown,
                                        @subset_filterclause unknown, @article_resolver unknown, @resolver_info unknown,
                                        @source_owner unknown, @destination_owner unknown, @vertical_partition unknown,
                                        @auto_identity_range unknown, @pub_identity_range unknown,
                                        @identity_range unknown, @threshold unknown, @verify_resolver_signature unknown,
                                        @destination_object unknown, @allow_interactive_resolver unknown,
                                        @fast_multicol_updateproc unknown, @check_permissions unknown,
                                        @force_invalidate_snapshot unknown, @published_in_tran_pub unknown,
                                        @force_reinit_subscription unknown,
                                        @logical_record_level_conflict_detection unknown,
                                        @logical_record_level_conflict_resolution unknown, @partition_options unknown,
                                        @processing_order unknown, @subscriber_upload_options unknown,
                                        @identityrangemanagementoption unknown, @delete_tracking unknown,
                                        @compensate_for_errors unknown, @stream_blob_columns unknown) as
-- missing source code
go

create procedure sys.sp_addmergefilter(@publication unknown, @article unknown, @filtername unknown,
                                       @join_articlename unknown, @join_filterclause unknown, @join_unique_key unknown,
                                       @force_invalidate_snapshot unknown, @force_reinit_subscription unknown,
                                       @filter_type unknown) as
-- missing source code
go

create procedure sys.sp_addmergelogsettings(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                            @support_options unknown, @web_server unknown, @log_severity unknown,
                                            @log_modules unknown, @log_file_path unknown, @log_file_name unknown,
                                            @log_file_size unknown, @no_of_log_files unknown, @upload_interval unknown,
                                            @delete_after_upload unknown, @custom_script unknown,
                                            @message_pattern unknown, @agent_xe unknown, @agent_xe_ring_buffer unknown,
                                            @sql_xe unknown) as
-- missing source code
go

create procedure sys.sp_addmergepartition(@publication unknown, @suser_sname unknown, @host_name unknown) as
-- missing source code
go

create procedure sys.sp_addmergepublication(@publication unknown, @description unknown, @retention unknown,
                                            @sync_mode unknown, @allow_push unknown, @allow_pull unknown,
                                            @allow_anonymous unknown, @enabled_for_internet unknown,
                                            @centralized_conflicts unknown, @dynamic_filters unknown,
                                            @snapshot_in_defaultfolder unknown, @alt_snapshot_folder unknown,
                                            @pre_snapshot_script unknown, @post_snapshot_script unknown,
                                            @compress_snapshot unknown, @ftp_address unknown, @ftp_port unknown,
                                            @ftp_subdirectory unknown, @ftp_login unknown, @ftp_password unknown,
                                            @conflict_retention unknown, @keep_partition_changes unknown,
                                            @allow_subscription_copy unknown, @allow_synctoalternate unknown,
                                            @validate_subscriber_info unknown, @add_to_active_directory unknown,
                                            @max_concurrent_merge unknown, @max_concurrent_dynamic_snapshots unknown,
                                            @use_partition_groups unknown, @publication_compatibility_level unknown,
                                            @replicate_ddl unknown, @allow_subscriber_initiated_snapshot unknown,
                                            @allow_web_synchronization unknown, @web_synchronization_url unknown,
                                            @allow_partition_realignment unknown, @retention_period_unit unknown,
                                            @generation_leveling_threshold unknown,
                                            @automatic_reinitialization_policy unknown, @conflict_logging unknown) as
-- missing source code
go

create procedure sys.sp_addmergepullsubscription(@publication unknown, @publisher unknown, @publisher_db unknown,
                                                 @subscriber_type unknown, @subscription_priority unknown,
                                                 @sync_type unknown, @description unknown) as
-- missing source code
go

create procedure sys.sp_addmergepullsubscription_agent(@name unknown, @publisher unknown, @publisher_db unknown,
                                                       @publication unknown, @publisher_security_mode unknown,
                                                       @publisher_login unknown, @publisher_password unknown,
                                                       @publisher_encrypted_password unknown, @subscriber unknown,
                                                       @subscriber_db unknown, @subscriber_security_mode unknown,
                                                       @subscriber_login unknown, @subscriber_password unknown,
                                                       @distributor unknown, @distributor_security_mode unknown,
                                                       @distributor_login unknown, @distributor_password unknown,
                                                       @encrypted_password unknown, @frequency_type unknown,
                                                       @frequency_interval unknown,
                                                       @frequency_relative_interval unknown,
                                                       @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                                       @frequency_subday_interval unknown,
                                                       @active_start_time_of_day unknown,
                                                       @active_end_time_of_day unknown, @active_start_date unknown,
                                                       @active_end_date unknown, @optional_command_line unknown,
                                                       @merge_jobid unknown, @enabled_for_syncmgr unknown,
                                                       @ftp_address unknown, @ftp_port unknown, @ftp_login unknown,
                                                       @ftp_password unknown, @alt_snapshot_folder unknown,
                                                       @working_directory unknown, @use_ftp unknown, @reserved unknown,
                                                       @use_interactive_resolver unknown, @offloadagent unknown,
                                                       @offloadserver unknown, @job_name unknown,
                                                       @dynamic_snapshot_location unknown, @use_web_sync unknown,
                                                       @internet_url unknown, @internet_login unknown,
                                                       @internet_password unknown, @internet_security_mode unknown,
                                                       @internet_timeout unknown, @hostname unknown, @job_login unknown,
                                                       @job_password unknown) as
-- missing source code
go

create procedure sys.sp_addmergepushsubscription_agent(@publication unknown, @subscriber unknown,
                                                       @subscriber_db unknown, @subscriber_security_mode unknown,
                                                       @subscriber_login unknown, @subscriber_password unknown,
                                                       @publisher_security_mode unknown, @publisher_login unknown,
                                                       @publisher_password unknown, @job_login unknown,
                                                       @job_password unknown, @job_name unknown,
                                                       @frequency_type unknown, @frequency_interval unknown,
                                                       @frequency_relative_interval unknown,
                                                       @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                                       @frequency_subday_interval unknown,
                                                       @active_start_time_of_day unknown,
                                                       @active_end_time_of_day unknown, @active_start_date unknown,
                                                       @active_end_date unknown, @enabled_for_syncmgr unknown) as
-- missing source code
go

create procedure sys.sp_addmergesubscription(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                             @subscription_type unknown, @subscriber_type unknown,
                                             @subscription_priority unknown, @sync_type unknown,
                                             @frequency_type unknown, @frequency_interval unknown,
                                             @frequency_relative_interval unknown, @frequency_recurrence_factor unknown,
                                             @frequency_subday unknown, @frequency_subday_interval unknown,
                                             @active_start_time_of_day unknown, @active_end_time_of_day unknown,
                                             @active_start_date unknown, @active_end_date unknown,
                                             @optional_command_line unknown, @description unknown,
                                             @enabled_for_syncmgr unknown, @offloadagent unknown,
                                             @offloadserver unknown, @use_interactive_resolver unknown,
                                             @merge_job_name unknown, @hostname unknown) as
-- missing source code
go

create procedure sys.sp_addmessage(@msgnum unknown, @severity unknown, @msgtext unknown, @lang unknown,
                                   @with_log unknown, @replace unknown) as
-- missing source code
go

create procedure sys.sp_addpublication(@publication unknown, @taskid unknown, @restricted unknown, @sync_method unknown,
                                       @repl_freq unknown, @description unknown, @status unknown,
                                       @independent_agent unknown, @immediate_sync unknown,
                                       @enabled_for_internet unknown, @allow_push unknown, @allow_pull unknown,
                                       @allow_anonymous unknown, @allow_sync_tran unknown, @autogen_sync_procs unknown,
                                       @retention unknown, @allow_queued_tran unknown,
                                       @snapshot_in_defaultfolder unknown, @alt_snapshot_folder unknown,
                                       @pre_snapshot_script unknown, @post_snapshot_script unknown,
                                       @compress_snapshot unknown, @ftp_address unknown, @ftp_port unknown,
                                       @ftp_subdirectory unknown, @ftp_login unknown, @ftp_password unknown,
                                       @allow_dts unknown, @allow_subscription_copy unknown, @conflict_policy unknown,
                                       @centralized_conflicts unknown, @conflict_retention unknown, @queue_type unknown,
                                       @add_to_active_directory unknown, @logreader_job_name unknown,
                                       @qreader_job_name unknown, @publisher unknown,
                                       @allow_initialize_from_backup unknown, @replicate_ddl unknown,
                                       @enabled_for_p2p unknown, @publish_local_changes_only unknown,
                                       @enabled_for_het_sub unknown, @p2p_conflictdetection unknown,
                                       @p2p_originator_id unknown, @p2p_continue_onconflict unknown,
                                       @allow_partition_switch unknown, @replicate_partition_switch unknown) as
-- missing source code
go

create procedure sys.sp_addpublication_snapshot(@publication unknown, @frequency_type unknown,
                                                @frequency_interval unknown, @frequency_subday unknown,
                                                @frequency_subday_interval unknown,
                                                @frequency_relative_interval unknown,
                                                @frequency_recurrence_factor unknown, @active_start_date unknown,
                                                @active_end_date unknown, @active_start_time_of_day unknown,
                                                @active_end_time_of_day unknown, @snapshot_job_name unknown,
                                                @publisher_security_mode unknown, @publisher_login unknown,
                                                @publisher_password unknown, @job_login unknown, @job_password unknown,
                                                @publisher unknown) as
-- missing source code
go

create procedure sys.sp_addpullsubscription(@publisher unknown, @publisher_db unknown, @publication unknown,
                                            @independent_agent unknown, @subscription_type unknown,
                                            @description unknown, @update_mode unknown, @immediate_sync unknown) as
-- missing source code
go

create procedure sys.sp_addpullsubscription_agent(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                  @subscriber unknown, @subscriber_db unknown,
                                                  @subscriber_security_mode unknown, @subscriber_login unknown,
                                                  @subscriber_password unknown, @distributor unknown,
                                                  @distribution_db unknown, @distributor_security_mode unknown,
                                                  @distributor_login unknown, @distributor_password unknown,
                                                  @optional_command_line unknown, @frequency_type unknown,
                                                  @frequency_interval unknown, @frequency_relative_interval unknown,
                                                  @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                                  @frequency_subday_interval unknown, @active_start_time_of_day unknown,
                                                  @active_end_time_of_day unknown, @active_start_date unknown,
                                                  @active_end_date unknown, @distribution_jobid unknown,
                                                  @encrypted_distributor_password unknown, @enabled_for_syncmgr unknown,
                                                  @ftp_address unknown, @ftp_port unknown, @ftp_login unknown,
                                                  @ftp_password unknown, @alt_snapshot_folder unknown,
                                                  @working_directory unknown, @use_ftp unknown,
                                                  @publication_type unknown, @dts_package_name unknown,
                                                  @dts_package_password unknown, @dts_package_location unknown,
                                                  @reserved unknown, @offloadagent unknown, @offloadserver unknown,
                                                  @job_name unknown, @job_login unknown, @job_password unknown) as
-- missing source code
go

create procedure sys.sp_addpushsubscription_agent(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                                  @subscriber_security_mode unknown, @subscriber_login unknown,
                                                  @subscriber_password unknown, @job_login unknown,
                                                  @job_password unknown, @job_name unknown, @frequency_type unknown,
                                                  @frequency_interval unknown, @frequency_relative_interval unknown,
                                                  @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                                  @frequency_subday_interval unknown, @active_start_time_of_day unknown,
                                                  @active_end_time_of_day unknown, @active_start_date unknown,
                                                  @active_end_date unknown, @dts_package_name unknown,
                                                  @dts_package_password unknown, @dts_package_location unknown,
                                                  @enabled_for_syncmgr unknown, @distribution_job_name unknown,
                                                  @publisher unknown, @subscriber_provider unknown,
                                                  @subscriber_datasrc unknown, @subscriber_location unknown,
                                                  @subscriber_provider_string unknown, @subscriber_catalog unknown) as
-- missing source code
go

create procedure sys.sp_addqreader_agent(@job_login unknown, @job_password unknown, @job_name unknown,
                                         @frompublisher unknown) as
-- missing source code
go

create procedure sys.sp_addqueued_artinfo(@artid unknown, @article unknown, @publisher unknown, @publisher_db unknown,
                                          @publication unknown, @dest_table unknown, @owner unknown, @cft_table unknown,
                                          @columns unknown) as
-- missing source code
go

create procedure sys.sp_addremotelogin(@remoteserver unknown, @loginame unknown, @remotename unknown) as
-- missing source code
go

create procedure sys.sp_addrole(@rolename unknown, @ownername unknown) as
-- missing source code
go

create procedure sys.sp_addrolemember(@rolename unknown, @membername unknown) as
-- missing source code
go

create procedure sys.sp_addscriptexec(@publication unknown, @scriptfile unknown, @skiperror unknown,
                                      @publisher unknown) as
-- missing source code
go

create procedure sys.sp_addserver(@server unknown, @local unknown, @duplicate_ok unknown) as
-- missing source code
go

create procedure sys.sp_addsrvrolemember(@loginame unknown, @rolename unknown) as
-- missing source code
go

create procedure sys.sp_addsubscriber(@subscriber unknown, @type unknown, @login unknown, @password unknown,
                                      @commit_batch_size unknown, @status_batch_size unknown, @flush_frequency unknown,
                                      @frequency_type unknown, @frequency_interval unknown,
                                      @frequency_relative_interval unknown, @frequency_recurrence_factor unknown,
                                      @frequency_subday unknown, @frequency_subday_interval unknown,
                                      @active_start_time_of_day unknown, @active_end_time_of_day unknown,
                                      @active_start_date unknown, @active_end_date unknown, @description unknown,
                                      @security_mode unknown, @encrypted_password unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_addsubscriber_schedule(@subscriber unknown, @agent_type unknown, @frequency_type unknown,
                                               @frequency_interval unknown, @frequency_relative_interval unknown,
                                               @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                               @frequency_subday_interval unknown, @active_start_time_of_day unknown,
                                               @active_end_time_of_day unknown, @active_start_date unknown,
                                               @active_end_date unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_addsubscription(@publication unknown, @article unknown, @subscriber unknown,
                                        @destination_db unknown, @sync_type unknown, @status unknown,
                                        @subscription_type unknown, @update_mode unknown, @loopback_detection unknown,
                                        @frequency_type unknown, @frequency_interval unknown,
                                        @frequency_relative_interval unknown, @frequency_recurrence_factor unknown,
                                        @frequency_subday unknown, @frequency_subday_interval unknown,
                                        @active_start_time_of_day unknown, @active_end_time_of_day unknown,
                                        @active_start_date unknown, @active_end_date unknown,
                                        @optional_command_line unknown, @reserved unknown, @enabled_for_syncmgr unknown,
                                        @offloadagent unknown, @offloadserver unknown, @dts_package_name unknown,
                                        @dts_package_password unknown, @dts_package_location unknown,
                                        @distribution_job_name unknown, @publisher unknown, @backupdevicetype unknown,
                                        @backupdevicename unknown, @mediapassword unknown, @password unknown,
                                        @fileidhint unknown, @unload unknown, @subscriptionlsn unknown,
                                        @subscriptionstreams unknown, @subscriber_type unknown) as
-- missing source code
go

create procedure sys.sp_addsynctriggers(@sub_table unknown, @sub_table_owner unknown, @publisher unknown,
                                        @publisher_db unknown, @publication unknown, @ins_proc unknown,
                                        @upd_proc unknown, @del_proc unknown, @cftproc unknown, @proc_owner unknown,
                                        @identity_col unknown, @ts_col unknown, @filter_clause unknown,
                                        @primary_key_bitmap unknown, @identity_support unknown,
                                        @independent_agent unknown, @distributor unknown, @pubversion unknown,
                                        @dump_cmds unknown) as
-- missing source code
go

create procedure sys.sp_addsynctriggerscore(@sub_table unknown, @sub_table_owner unknown, @publisher unknown,
                                            @publisher_db unknown, @publication unknown, @ins_proc unknown,
                                            @upd_proc unknown, @del_proc unknown, @cftproc unknown, @proc_owner unknown,
                                            @identity_col unknown, @ts_col unknown, @filter_clause unknown,
                                            @primary_key_bitmap unknown, @identity_support unknown,
                                            @independent_agent unknown, @pubversion unknown, @ins_trig unknown,
                                            @upd_trig unknown, @del_trig unknown, @alter unknown, @dump_cmds unknown) as
-- missing source code
go

create procedure sys.sp_addtabletocontents(@table_name unknown, @owner_name unknown, @filter_clause unknown) as
-- missing source code
go

create procedure sys.sp_addtype(@typename unknown, @phystype unknown, @nulltype unknown, @owner unknown) as
-- missing source code
go

create procedure sys.sp_addumpdevice(@devtype unknown, @logicalname unknown, @physicalname unknown, @cntrltype unknown,
                                     @devstatus unknown) as
-- missing source code
go

create procedure sys.sp_adduser(@loginame unknown, @name_in_db unknown, @grpname unknown) as
-- missing source code
go

create procedure sys.sp_adjustpublisheridentityrange(@publication unknown, @table_name unknown, @table_owner unknown) as
-- missing source code
go

create procedure sys.sp_altermessage(@message_id unknown, @parameter unknown, @parameter_value unknown) as
-- missing source code
go

create procedure sys.sp_approlepassword(@rolename unknown, @newpwd unknown) as
-- missing source code
go

create procedure sys.sp_article_validation(@publication unknown, @article unknown, @rowcount_only unknown,
                                           @full_or_fast unknown, @shutdown_agent unknown, @subscription_level unknown,
                                           @reserved unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_articlecolumn(@publication unknown, @article unknown, @column unknown, @operation unknown,
                                      @refresh_synctran_procs unknown, @ignore_distributor unknown,
                                      @change_active unknown, @force_invalidate_snapshot unknown,
                                      @force_reinit_subscription unknown, @publisher unknown, @internal unknown) as
-- missing source code
go

create procedure sys.sp_articlefilter(@publication unknown, @article unknown, @filter_name unknown,
                                      @filter_clause unknown, @force_invalidate_snapshot unknown,
                                      @force_reinit_subscription unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_articleview(@publication unknown, @article unknown, @view_name unknown, @filter_clause unknown,
                                    @change_active unknown, @force_invalidate_snapshot unknown,
                                    @force_reinit_subscription unknown, @publisher unknown,
                                    @refreshsynctranprocs unknown, @internal unknown) as
-- missing source code
go

create procedure sys.sp_assemblies_rowset(@assembly_name unknown, @assembly_schema unknown, @assembly_id unknown) as
-- missing source code
go

create procedure sys.sp_assemblies_rowset2(@assembly_schema unknown, @assembly_id unknown) as
-- missing source code
go

create procedure sys.sp_assemblies_rowset_rmt(@server_name unknown, @catalog_name unknown, @assembly_name unknown,
                                              @assembly_schema unknown, @assembly_id unknown) as
-- missing source code
go

create procedure sys.sp_assembly_dependencies_rowset(@assembly_id unknown, @assembly_schema unknown,
                                                     @assembly_referenced unknown) as
-- missing source code
go

create procedure sys.sp_assembly_dependencies_rowset2(@assembly_schema unknown, @assembly_referenced unknown) as
-- missing source code
go

create procedure sys.sp_assembly_dependencies_rowset_rmt(@server unknown, @catalog unknown, @assembly_id unknown,
                                                         @assembly_schema unknown, @assembly_referenced unknown) as
-- missing source code
go

create procedure sys.sp_attach_db(@dbname unknown, @filename1 unknown, @filename2 unknown, @filename3 unknown,
                                  @filename4 unknown, @filename5 unknown, @filename6 unknown, @filename7 unknown,
                                  @filename8 unknown, @filename9 unknown, @filename10 unknown, @filename11 unknown,
                                  @filename12 unknown, @filename13 unknown, @filename14 unknown, @filename15 unknown,
                                  @filename16 unknown) as
-- missing source code
go

create procedure sys.sp_attach_single_file_db(@dbname unknown, @physname unknown) as
-- missing source code
go

create procedure sys.sp_attachsubscription(@dbname unknown, @filename unknown, @subscriber_security_mode unknown,
                                           @subscriber_login unknown, @subscriber_password unknown,
                                           @distributor_security_mode unknown, @distributor_login unknown,
                                           @distributor_password unknown, @publisher_security_mode unknown,
                                           @publisher_login unknown, @publisher_password unknown, @job_login unknown,
                                           @job_password unknown, @db_master_key_password unknown) as
-- missing source code
go

create procedure sys.sp_audit_write() as
-- missing source code
go

create procedure sys.sp_autostats(@tblname unknown, @flagc unknown, @indname unknown) as
-- missing source code
go

create procedure sys.sp_availability_group_command_internal() as
-- missing source code
go

create procedure sys.sp_bcp_dbcmptlevel(@dbname unknown) as
-- missing source code
go

create procedure sys.sp_begin_parallel_nested_tran() as
-- missing source code
go

create procedure sys.sp_bindefault(@defname unknown, @objname unknown, @futureonly unknown) as
-- missing source code
go

create procedure sys.sp_bindrule(@rulename unknown, @objname unknown, @futureonly unknown) as
-- missing source code
go

create procedure sys.sp_bindsession() as
-- missing source code
go

create procedure sys.sp_browsemergesnapshotfolder(@publication unknown) as
-- missing source code
go

create procedure sys.sp_browsereplcmds(@xact_seqno_start unknown, @xact_seqno_end unknown, @originator_id unknown,
                                       @publisher_database_id unknown, @article_id unknown, @command_id unknown,
                                       @agent_id unknown, @compatibility_level unknown) as
-- missing source code
go

create procedure sys.sp_browsesnapshotfolder(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                             @publisher unknown) as
-- missing source code
go

create procedure sys.sp_can_tlog_be_applied(@backup_file_name unknown, @database_name unknown, @result unknown,
                                            @verbose unknown) as
-- missing source code
go

create procedure sys.sp_catalogs(@server_name unknown) as
-- missing source code
go

create procedure sys.sp_catalogs_rowset(@catalog_name unknown) as
-- missing source code
go

create procedure sys.sp_catalogs_rowset2() as
-- missing source code
go

create procedure sys.sp_catalogs_rowset_rmt(@server_name unknown, @catalog_name unknown) as
-- missing source code
go

create procedure sys.sp_cdc_add_job(@job_type unknown, @start_job unknown, @maxtrans unknown, @maxscans unknown,
                                    @continuous unknown, @pollinginterval unknown, @retention unknown,
                                    @threshold unknown, @check_for_logreader unknown) as
-- missing source code
go

create procedure sys.sp_cdc_change_job(@job_type unknown, @maxtrans unknown, @maxscans unknown, @continuous unknown,
                                       @pollinginterval unknown, @retention unknown, @threshold unknown) as
-- missing source code
go

create procedure sys.sp_cdc_cleanup_change_table(@capture_instance unknown, @low_water_mark unknown,
                                                 @threshold unknown) as
-- missing source code
go

create procedure sys.sp_cdc_dbsnapshotLSN(@db_snapshot unknown, @lastLSN unknown, @lastLSNstr unknown) as
-- missing source code
go

create procedure sys.sp_cdc_disable_db() as
-- missing source code
go

create procedure sys.sp_cdc_disable_table(@source_schema unknown, @source_name unknown, @capture_instance unknown) as
-- missing source code
go

create procedure sys.sp_cdc_drop_job(@job_type unknown) as
-- missing source code
go

create procedure sys.sp_cdc_enable_db() as
-- missing source code
go

create procedure sys.sp_cdc_enable_table(@source_schema unknown, @source_name unknown, @capture_instance unknown,
                                         @supports_net_changes unknown, @role_name unknown, @index_name unknown,
                                         @captured_column_list unknown, @filegroup_name unknown,
                                         @allow_partition_switch unknown) as
-- missing source code
go

create procedure sys.sp_cdc_generate_wrapper_function(@capture_instance unknown, @closed_high_end_point unknown,
                                                      @column_list unknown, @update_flag_list unknown) as
-- missing source code
go

create procedure sys.sp_cdc_get_captured_columns(@capture_instance unknown) as
-- missing source code
go

create procedure sys.sp_cdc_get_ddl_history(@capture_instance unknown) as
-- missing source code
go

create procedure sys.sp_cdc_help_change_data_capture(@source_schema unknown, @source_name unknown) as
-- missing source code
go

create procedure sys.sp_cdc_help_jobs() as
-- missing source code
go

create procedure sys.sp_cdc_restoredb(@srv_orig unknown, @db_orig unknown, @keep_cdc unknown) as
-- missing source code
go

create procedure sys.sp_cdc_scan(@maxtrans unknown, @maxscans unknown, @continuous unknown, @pollinginterval unknown,
                                 @is_from_job unknown) as
-- missing source code
go

create procedure sys.sp_cdc_start_job(@job_type unknown) as
-- missing source code
go

create procedure sys.sp_cdc_stop_job(@job_type unknown) as
-- missing source code
go

create procedure sys.sp_cdc_vupgrade() as
-- missing source code
go

create procedure sys.sp_cdc_vupgrade_databases() as
-- missing source code
go

create procedure sys.sp_certify_removable(@dbname unknown, @autofix unknown) as
-- missing source code
go

create procedure sys.sp_change_agent_parameter(@profile_id unknown, @parameter_name unknown,
                                               @parameter_value unknown) as
-- missing source code
go

create procedure sys.sp_change_agent_profile(@profile_id unknown, @property unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_change_log_shipping_primary_database(@database unknown, @backup_directory unknown,
                                                             @backup_share unknown, @backup_retention_period unknown,
                                                             @monitor_server_security_mode unknown,
                                                             @monitor_server_login unknown,
                                                             @monitor_server_password unknown,
                                                             @backup_threshold unknown, @threshold_alert unknown,
                                                             @threshold_alert_enabled unknown,
                                                             @history_retention_period unknown,
                                                             @ignoreremotemonitor unknown,
                                                             @backup_compression unknown) as
-- missing source code
go

create procedure sys.sp_change_log_shipping_secondary_database(@secondary_database unknown, @restore_delay unknown,
                                                               @restore_all unknown, @restore_mode unknown,
                                                               @disconnect_users unknown, @block_size unknown,
                                                               @buffer_count unknown, @max_transfer_size unknown,
                                                               @restore_threshold unknown, @threshold_alert unknown,
                                                               @threshold_alert_enabled unknown,
                                                               @history_retention_period unknown,
                                                               @ignoreremotemonitor unknown) as
-- missing source code
go

create procedure sys.sp_change_log_shipping_secondary_primary(@primary_server unknown, @primary_database unknown,
                                                              @backup_source_directory unknown,
                                                              @backup_destination_directory unknown,
                                                              @file_retention_period unknown,
                                                              @monitor_server_security_mode unknown,
                                                              @monitor_server_login unknown,
                                                              @monitor_server_password unknown) as
-- missing source code
go

create procedure sys.sp_change_subscription_properties(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                       @property unknown, @value unknown, @publication_type unknown) as
-- missing source code
go

create procedure sys.sp_change_tracking_waitforchanges() as
-- missing source code
go

create procedure sys.sp_change_users_login(@Action unknown, @UserNamePattern unknown, @LoginName unknown,
                                           @Password unknown) as
-- missing source code
go

create procedure sys.sp_changearticle(@publication unknown, @article unknown, @property unknown, @value unknown,
                                      @force_invalidate_snapshot unknown, @force_reinit_subscription unknown,
                                      @publisher unknown) as
-- missing source code
go

create procedure sys.sp_changearticlecolumndatatype(@publication unknown, @article unknown, @column unknown,
                                                    @mapping_id unknown, @type unknown, @length unknown,
                                                    @precision unknown, @scale unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_changedbowner(@loginame unknown, @map unknown) as
-- missing source code
go

create procedure sys.sp_changedistpublisher(@publisher unknown, @property unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_changedistributiondb(@database unknown, @property unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_changedistributor_password(@password unknown) as
-- missing source code
go

create procedure sys.sp_changedistributor_property(@property unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_changedynamicsnapshot_job(@publication unknown, @dynamic_snapshot_jobname unknown,
                                                  @dynamic_snapshot_jobid unknown, @frequency_type unknown,
                                                  @frequency_interval unknown, @frequency_subday unknown,
                                                  @frequency_subday_interval unknown,
                                                  @frequency_relative_interval unknown,
                                                  @frequency_recurrence_factor unknown, @active_start_date unknown,
                                                  @active_end_date unknown, @active_start_time_of_day unknown,
                                                  @active_end_time_of_day unknown, @job_login unknown,
                                                  @job_password unknown) as
-- missing source code
go

create procedure sys.sp_changelogreader_agent(@job_login unknown, @job_password unknown,
                                              @publisher_security_mode unknown, @publisher_login unknown,
                                              @publisher_password unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_changemergearticle(@publication unknown, @article unknown, @property unknown, @value unknown,
                                           @force_invalidate_snapshot unknown, @force_reinit_subscription unknown) as
-- missing source code
go

create procedure sys.sp_changemergefilter(@publication unknown, @article unknown, @filtername unknown,
                                          @property unknown, @value unknown, @force_invalidate_snapshot unknown,
                                          @force_reinit_subscription unknown) as
-- missing source code
go

create procedure sys.sp_changemergelogsettings(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                               @support_options unknown, @web_server unknown, @log_severity unknown,
                                               @log_modules unknown, @log_file_path unknown, @log_file_name unknown,
                                               @log_file_size unknown, @no_of_log_files unknown,
                                               @upload_interval unknown, @delete_after_upload unknown,
                                               @custom_script unknown, @message_pattern unknown, @agent_xe unknown,
                                               @agent_xe_ring_buffer unknown, @sql_xe unknown) as
-- missing source code
go

create procedure sys.sp_changemergepublication(@publication unknown, @property unknown, @value unknown,
                                               @force_invalidate_snapshot unknown,
                                               @force_reinit_subscription unknown) as
-- missing source code
go

create procedure sys.sp_changemergepullsubscription(@publication unknown, @publisher unknown, @publisher_db unknown,
                                                    @property unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_changemergesubscription(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                                @property unknown, @value unknown,
                                                @force_reinit_subscription unknown) as
-- missing source code
go

create procedure sys.sp_changeobjectowner(@objname unknown, @newowner unknown) as
-- missing source code
go

create procedure sys.sp_changepublication(@publication unknown, @property unknown, @value unknown,
                                          @force_invalidate_snapshot unknown, @force_reinit_subscription unknown,
                                          @publisher unknown) as
-- missing source code
go

create procedure sys.sp_changepublication_snapshot(@publication unknown, @frequency_type unknown,
                                                   @frequency_interval unknown, @frequency_subday unknown,
                                                   @frequency_subday_interval unknown,
                                                   @frequency_relative_interval unknown,
                                                   @frequency_recurrence_factor unknown, @active_start_date unknown,
                                                   @active_end_date unknown, @active_start_time_of_day unknown,
                                                   @active_end_time_of_day unknown, @snapshot_job_name unknown,
                                                   @publisher_security_mode unknown, @publisher_login unknown,
                                                   @publisher_password unknown, @job_login unknown,
                                                   @job_password unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_changeqreader_agent(@job_login unknown, @job_password unknown, @frompublisher unknown) as
-- missing source code
go

create procedure sys.sp_changereplicationserverpasswords(@login_type unknown, @login unknown, @password unknown,
                                                         @server unknown) as
-- missing source code
go

create procedure sys.sp_changesubscriber(@subscriber unknown, @type unknown, @login unknown, @password unknown,
                                         @commit_batch_size unknown, @status_batch_size unknown,
                                         @flush_frequency unknown, @frequency_type unknown, @frequency_interval unknown,
                                         @frequency_relative_interval unknown, @frequency_recurrence_factor unknown,
                                         @frequency_subday unknown, @frequency_subday_interval unknown,
                                         @active_start_time_of_day unknown, @active_end_time_of_day unknown,
                                         @active_start_date unknown, @active_end_date unknown, @description unknown,
                                         @security_mode unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_changesubscriber_schedule(@subscriber unknown, @agent_type unknown, @frequency_type unknown,
                                                  @frequency_interval unknown, @frequency_relative_interval unknown,
                                                  @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                                  @frequency_subday_interval unknown, @active_start_time_of_day unknown,
                                                  @active_end_time_of_day unknown, @active_start_date unknown,
                                                  @active_end_date unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_changesubscription(@publication unknown, @article unknown, @subscriber unknown,
                                           @destination_db unknown, @property unknown, @value unknown,
                                           @publisher unknown) as
-- missing source code
go

create procedure sys.sp_changesubscriptiondtsinfo(@job_id unknown, @dts_package_name unknown,
                                                  @dts_package_password unknown, @dts_package_location unknown) as
-- missing source code
go

create procedure sys.sp_changesubstatus(@publication unknown, @article unknown, @subscriber unknown, @status unknown,
                                        @previous_status unknown, @destination_db unknown, @frequency_type unknown,
                                        @frequency_interval unknown, @frequency_relative_interval unknown,
                                        @frequency_recurrence_factor unknown, @frequency_subday unknown,
                                        @frequency_subday_interval unknown, @active_start_time_of_day unknown,
                                        @active_end_time_of_day unknown, @active_start_date unknown,
                                        @active_end_date unknown, @optional_command_line unknown,
                                        @distribution_jobid unknown, @from_auto_sync unknown,
                                        @ignore_distributor unknown, @offloadagent unknown, @offloadserver unknown,
                                        @dts_package_name unknown, @dts_package_password unknown,
                                        @dts_package_location unknown, @skipobjectactivation unknown,
                                        @distribution_job_name unknown, @publisher unknown,
                                        @ignore_distributor_failure unknown) as
-- missing source code
go

create procedure sys.sp_checkOraclepackageversion(@publisher unknown, @versionsmatch unknown, @packageversion unknown) as
-- missing source code
go

create procedure sys.sp_check_constbytable_rowset(@table_name unknown, @table_schema unknown, @constraint_name unknown,
                                                  @constraint_schema unknown) as
-- missing source code
go

create procedure sys.sp_check_constbytable_rowset2(@table_schema unknown, @constraint_name unknown,
                                                   @constraint_schema unknown) as
-- missing source code
go

create procedure sys.sp_check_constraints_rowset(@constraint_name unknown, @constraint_schema unknown) as
-- missing source code
go

create procedure sys.sp_check_constraints_rowset2(@constraint_schema unknown) as
-- missing source code
go

create procedure sys.sp_check_dynamic_filters(@publication unknown) as
-- missing source code
go

create procedure sys.sp_check_for_sync_trigger(@tabid unknown, @trigger_op unknown, @fonpublisher unknown) as
-- missing source code
go

create procedure sys.sp_check_join_filter(@filtered_table unknown, @join_table unknown, @join_filterclause unknown) as
-- missing source code
go

create procedure sys.sp_check_log_shipping_monitor_alert() as
-- missing source code
go

create procedure sys.sp_check_publication_access(@publication unknown, @given_login unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_check_removable(@autofix unknown) as
-- missing source code
go

create procedure sys.sp_check_subset_filter(@filtered_table unknown, @subset_filterclause unknown,
                                            @has_dynamic_filters unknown, @dynamic_filters_function_list unknown) as
-- missing source code
go

create procedure sys.sp_check_sync_trigger(@trigger_procid unknown, @trigger_op unknown, @owner unknown) as
-- missing source code
go

create procedure sys.sp_checkinvalidivarticle(@mode unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_clean_db_file_free_space(@dbname unknown, @fileid unknown, @cleaning_delay unknown) as
-- missing source code
go

create procedure sys.sp_clean_db_free_space(@dbname unknown, @cleaning_delay unknown) as
-- missing source code
go

create procedure sys.sp_cleanmergelogfiles(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                           @publisher unknown, @publisher_db unknown, @web_server unknown,
                                           @id unknown) as
-- missing source code
go

create procedure sys.sp_cleanup_log_shipping_history(@agent_id unknown, @agent_type unknown) as
-- missing source code
go

create procedure sys.sp_cleanupdbreplication() as
-- missing source code
go

create procedure sys.sp_column_privileges(@table_name unknown, @table_owner unknown, @table_qualifier unknown,
                                          @column_name unknown) as
-- missing source code
go

create procedure sys.sp_column_privileges_ex(@table_server unknown, @table_name unknown, @table_schema unknown,
                                             @table_catalog unknown, @column_name unknown) as
-- missing source code
go

create procedure sys.sp_column_privileges_rowset(@table_name unknown, @table_schema unknown, @column_name unknown,
                                                 @grantor unknown, @grantee unknown) as
-- missing source code
go

create procedure sys.sp_column_privileges_rowset2(@table_schema unknown, @column_name unknown, @grantor unknown,
                                                  @grantee unknown) as
-- missing source code
go

create procedure sys.sp_column_privileges_rowset_rmt(@table_server unknown, @table_catalog unknown, @table_name unknown,
                                                     @table_schema unknown, @column_name unknown, @grantor unknown,
                                                     @grantee unknown) as
-- missing source code
go

create procedure sys.sp_columns(@table_name unknown, @table_owner unknown, @table_qualifier unknown,
                                @column_name unknown, @ODBCVer unknown) as
-- missing source code
go

create procedure sys.sp_columns_100(@table_name unknown, @table_owner unknown, @table_qualifier unknown,
                                    @column_name unknown, @NameScope unknown, @ODBCVer unknown, @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_columns_100_rowset(@table_name unknown, @table_schema unknown, @column_name unknown) as
-- missing source code
go

create procedure sys.sp_columns_100_rowset2(@table_schema unknown, @column_name unknown) as
-- missing source code
go

create procedure sys.sp_columns_90(@table_name unknown, @table_owner unknown, @table_qualifier unknown,
                                   @column_name unknown, @ODBCVer unknown, @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_columns_90_rowset(@table_name unknown, @table_schema unknown, @column_name unknown) as
-- missing source code
go

create procedure sys.sp_columns_90_rowset2(@table_schema unknown, @column_name unknown) as
-- missing source code
go

create procedure sys.sp_columns_90_rowset_rmt(@table_server unknown, @table_catalog unknown, @table_name unknown,
                                              @table_schema unknown, @column_name unknown) as
-- missing source code
go

create procedure sys.sp_columns_ex(@table_server unknown, @table_name unknown, @table_schema unknown,
                                   @table_catalog unknown, @column_name unknown, @ODBCVer unknown) as
-- missing source code
go

create procedure sys.sp_columns_ex_100(@table_server unknown, @table_name unknown, @table_schema unknown,
                                       @table_catalog unknown, @column_name unknown, @ODBCVer unknown,
                                       @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_columns_ex_90(@table_server unknown, @table_name unknown, @table_schema unknown,
                                      @table_catalog unknown, @column_name unknown, @ODBCVer unknown,
                                      @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_columns_managed(@Catalog unknown, @Owner unknown, @Table unknown, @Column unknown,
                                        @SchemaType unknown) as
-- missing source code
go

create procedure sys.sp_columns_rowset(@table_name unknown, @table_schema unknown, @column_name unknown) as
-- missing source code
go

create procedure sys.sp_columns_rowset2(@table_schema unknown, @column_name unknown) as
-- missing source code
go

create procedure sys.sp_columns_rowset_rmt(@table_server unknown, @table_catalog unknown, @table_name unknown,
                                           @table_schema unknown, @column_name unknown) as
-- missing source code
go

create procedure sys.sp_commit_parallel_nested_tran() as
-- missing source code
go

create procedure sys.sp_configure(@configname unknown, @configvalue unknown) as
-- missing source code
go

create procedure sys.sp_configure_peerconflictdetection(@publication unknown, @action unknown, @originator_id unknown,
                                                        @conflict_retention unknown, @continue_onconflict unknown,
                                                        @local unknown, @timeout unknown) as
-- missing source code
go

create procedure sys.sp_constr_col_usage_rowset(@table_name unknown, @table_schema unknown, @column_name unknown,
                                                @constr_catalog unknown, @constr_schema unknown,
                                                @constr_name unknown) as
-- missing source code
go

create procedure sys.sp_constr_col_usage_rowset2(@table_schema unknown, @column_name unknown, @constr_catalog unknown,
                                                 @constr_schema unknown, @constr_name unknown) as
-- missing source code
go

create procedure sys.sp_control_dbmasterkey_password() as
-- missing source code
go

create procedure sys.sp_control_plan_guide(@operation unknown, @name unknown) as
-- missing source code
go

create procedure sys.sp_copymergesnapshot(@publication unknown, @destination_folder unknown) as
-- missing source code
go

create procedure sys.sp_copysnapshot(@publication unknown, @destination_folder unknown, @subscriber unknown,
                                     @subscriber_db unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_copysubscription(@filename unknown, @temp_dir unknown, @overwrite_existing_file unknown) as
-- missing source code
go

create procedure sys.sp_create_plan_guide(@name unknown, @stmt unknown, @type unknown, @module_or_batch unknown,
                                          @params unknown, @hints unknown) as
-- missing source code
go

create procedure sys.sp_create_plan_guide_from_handle(@name unknown, @plan_handle unknown, @statement_start_offset unknown) as
-- missing source code
go

create procedure sys.sp_create_removable(@dbname unknown, @syslogical unknown, @sysphysical unknown, @syssize unknown,
                                         @loglogical unknown, @logphysical unknown, @logsize unknown,
                                         @datalogical1 unknown, @dataphysical1 unknown, @datasize1 unknown,
                                         @datalogical2 unknown, @dataphysical2 unknown, @datasize2 unknown,
                                         @datalogical3 unknown, @dataphysical3 unknown, @datasize3 unknown,
                                         @datalogical4 unknown, @dataphysical4 unknown, @datasize4 unknown,
                                         @datalogical5 unknown, @dataphysical5 unknown, @datasize5 unknown,
                                         @datalogical6 unknown, @dataphysical6 unknown, @datasize6 unknown,
                                         @datalogical7 unknown, @dataphysical7 unknown, @datasize7 unknown,
                                         @datalogical8 unknown, @dataphysical8 unknown, @datasize8 unknown,
                                         @datalogical9 unknown, @dataphysical9 unknown, @datasize9 unknown,
                                         @datalogical10 unknown, @dataphysical10 unknown, @datasize10 unknown,
                                         @datalogical11 unknown, @dataphysical11 unknown, @datasize11 unknown,
                                         @datalogical12 unknown, @dataphysical12 unknown, @datasize12 unknown,
                                         @datalogical13 unknown, @dataphysical13 unknown, @datasize13 unknown,
                                         @datalogical14 unknown, @dataphysical14 unknown, @datasize14 unknown,
                                         @datalogical15 unknown, @dataphysical15 unknown, @datasize15 unknown,
                                         @datalogical16 unknown, @dataphysical16 unknown, @datasize16 unknown) as
-- missing source code
go

create procedure sys.sp_createmergepalrole(@publication unknown) as
-- missing source code
go

create procedure sys.sp_createorphan() as
-- missing source code
go

create procedure sys.sp_createstats(@indexonly unknown, @fullscan unknown, @norecompute unknown) as
-- missing source code
go

create procedure sys.sp_createtranpalrole(@publication unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_cursor() as
-- missing source code
go

create procedure sys.sp_cursor_list(@cursor_scope unknown) returns unknown as
-- missing source code
go

create procedure sys.sp_cursorclose() as
-- missing source code
go

create procedure sys.sp_cursorexecute() as
-- missing source code
go

create procedure sys.sp_cursorfetch() as
-- missing source code
go

create procedure sys.sp_cursoropen() as
-- missing source code
go

create procedure sys.sp_cursoroption() as
-- missing source code
go

create procedure sys.sp_cursorprepare() as
-- missing source code
go

create procedure sys.sp_cursorprepexec() as
-- missing source code
go

create procedure sys.sp_cursorunprepare() as
-- missing source code
go

create procedure sys.sp_cycle_errorlog() as
-- missing source code
go

create procedure sys.sp_databases() as
-- missing source code
go

create procedure sys.sp_datatype_info(@data_type unknown, @ODBCVer unknown) as
-- missing source code
go

create procedure sys.sp_datatype_info_100(@data_type unknown, @ODBCVer unknown) as
-- missing source code
go

create procedure sys.sp_datatype_info_90(@data_type unknown, @ODBCVer unknown) as
-- missing source code
go

create procedure sys.sp_db_ebcdic277_2(@dbname unknown, @status unknown) as
-- missing source code
go

create procedure sys.sp_db_increased_partitions(@dbname unknown, @increased_partitions unknown) as
-- missing source code
go

create procedure sys.sp_db_selective_xml_index(@dbname unknown, @selective_xml_index unknown) as
-- missing source code
go

create procedure sys.sp_db_vardecimal_storage_format(@dbname unknown, @vardecimal_storage_format unknown) as
-- missing source code
go

create procedure sys.sp_dbcmptlevel(@dbname unknown, @new_cmptlevel unknown) as
-- missing source code
go

create procedure sys.sp_dbfixedrolepermission(@rolename unknown) as
-- missing source code
go

create procedure sys.sp_dbmmonitoraddmonitoring(@update_period unknown) as
-- missing source code
go

create procedure sys.sp_dbmmonitorchangealert(@database_name unknown, @alert_id unknown, @threshold unknown,
                                              @enabled unknown) as
-- missing source code
go

create procedure sys.sp_dbmmonitorchangemonitoring(@parameter_id unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_dbmmonitordropalert(@database_name unknown, @alert_id unknown) as
-- missing source code
go

create procedure sys.sp_dbmmonitordropmonitoring() as
-- missing source code
go

create procedure sys.sp_dbmmonitorhelpalert(@database_name unknown, @alert_id unknown) as
-- missing source code
go

create procedure sys.sp_dbmmonitorhelpmonitoring() as
-- missing source code
go

create procedure sys.sp_dbmmonitorresults(@database_name unknown, @mode unknown, @update_table unknown) as
-- missing source code
go

create procedure sys.sp_dbmmonitorupdate(@database_name unknown) as
-- missing source code
go

create procedure sys.sp_dbremove(@dbname unknown, @dropdev unknown) as
-- missing source code
go

create procedure sys.sp_ddopen(@handle unknown, @procname unknown, @scrollopt unknown, @ccopt unknown, @rows unknown,
                               @p1 unknown, @p2 unknown, @p3 unknown, @p4 unknown, @p5 unknown, @p6 unknown,
                               @p7 unknown, @NameScope unknown, @ODBCVer unknown, @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_defaultdb(@loginame unknown, @defdb unknown) as
-- missing source code
go

create procedure sys.sp_defaultlanguage(@loginame unknown, @language unknown) as
-- missing source code
go

create procedure sys.sp_delete_http_namespace_reservation() as
-- missing source code
go

create procedure sys.sp_delete_log_shipping_alert_job() as
-- missing source code
go

create procedure sys.sp_delete_log_shipping_primary_database(@database unknown, @ignoreremotemonitor unknown) as
-- missing source code
go

create procedure sys.sp_delete_log_shipping_primary_secondary(@primary_database unknown, @secondary_server unknown,
                                                              @secondary_database unknown) as
-- missing source code
go

create procedure sys.sp_delete_log_shipping_secondary_database(@secondary_database unknown, @ignoreremotemonitor unknown) as
-- missing source code
go

create procedure sys.sp_delete_log_shipping_secondary_primary(@primary_server unknown, @primary_database unknown) as
-- missing source code
go

create procedure sys.sp_deletemergeconflictrow(@conflict_table unknown, @source_object unknown, @rowguid unknown,
                                               @origin_datasource unknown, @drop_table_if_empty unknown) as
-- missing source code
go

create procedure sys.sp_deletepeerrequesthistory(@publication unknown, @request_id unknown, @cutoff_date unknown) as
-- missing source code
go

create procedure sys.sp_deletetracertokenhistory(@publication unknown, @tracer_id unknown, @cutoff_date unknown,
                                                 @publisher unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_denylogin(@loginame unknown) as
-- missing source code
go

create procedure sys.sp_depends(@objname unknown) as
-- missing source code
go

create procedure sys.sp_describe_cursor(@cursor_source unknown, @cursor_identity unknown) returns unknown as
-- missing source code
go

create procedure sys.sp_describe_cursor_columns(@cursor_source unknown, @cursor_identity unknown) returns unknown as
-- missing source code
go

create procedure sys.sp_describe_cursor_tables(@cursor_source unknown, @cursor_identity unknown) returns unknown as
-- missing source code
go

create procedure sys.sp_describe_first_result_set() as
-- missing source code
go

create procedure sys.sp_describe_undeclared_parameters() as
-- missing source code
go

create procedure sys.sp_detach_db(@dbname unknown, @skipchecks unknown, @keepfulltextindexfile unknown) as
-- missing source code
go

create procedure sys.sp_disableagentoffload(@job_id unknown, @offloadserver unknown, @agent_type unknown) as
-- missing source code
go

create procedure sys.sp_distcounters() as
-- missing source code
go

create procedure sys.sp_drop_agent_parameter(@profile_id unknown, @parameter_name unknown) as
-- missing source code
go

create procedure sys.sp_drop_agent_profile(@profile_id unknown) as
-- missing source code
go

create procedure sys.sp_dropalias(@loginame unknown) as
-- missing source code
go

create procedure sys.sp_dropanonymousagent(@subid unknown, @type unknown) as
-- missing source code
go

create procedure sys.sp_dropanonymoussubscription(@agent_id unknown, @type unknown) as
-- missing source code
go

create procedure sys.sp_dropapprole(@rolename unknown) as
-- missing source code
go

create procedure sys.sp_droparticle(@publication unknown, @article unknown, @ignore_distributor unknown,
                                    @force_invalidate_snapshot unknown, @publisher unknown,
                                    @from_drop_publication unknown) as
-- missing source code
go

create procedure sys.sp_dropdatatypemapping(@mapping_id unknown, @source_dbms unknown, @source_version unknown,
                                            @source_type unknown, @source_length_min unknown,
                                            @source_length_max unknown, @source_precision_min unknown,
                                            @source_precision_max unknown, @source_scale_min unknown,
                                            @source_scale_max unknown, @source_nullable unknown,
                                            @destination_dbms unknown, @destination_version unknown,
                                            @destination_type unknown, @destination_length unknown,
                                            @destination_precision unknown, @destination_scale unknown,
                                            @destination_nullable unknown) as
-- missing source code
go

create procedure sys.sp_dropdevice(@logicalname unknown, @delfile unknown) as
-- missing source code
go

create procedure sys.sp_dropdistpublisher(@publisher unknown, @no_checks unknown, @ignore_distributor unknown) as
-- missing source code
go

create procedure sys.sp_dropdistributiondb(@database unknown) as
-- missing source code
go

create procedure sys.sp_dropdistributor(@no_checks unknown, @ignore_distributor unknown) as
-- missing source code
go

create procedure sys.sp_dropdynamicsnapshot_job(@publication unknown, @dynamic_snapshot_jobname unknown,
                                                @dynamic_snapshot_jobid unknown, @ignore_distributor unknown) as
-- missing source code
go

create procedure sys.sp_dropextendedproc(@functname unknown) as
-- missing source code
go

create procedure sys.sp_dropextendedproperty(@name unknown, @level0type unknown, @level0name unknown,
                                             @level1type unknown, @level1name unknown, @level2type unknown,
                                             @level2name unknown) as
-- missing source code
go

create procedure sys.sp_droplinkedsrvlogin(@rmtsrvname unknown, @locallogin unknown) as
-- missing source code
go

create procedure sys.sp_droplogin(@loginame unknown) as
-- missing source code
go

create procedure sys.sp_dropmergealternatepublisher(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                    @alternate_publisher unknown, @alternate_publisher_db unknown,
                                                    @alternate_publication unknown) as
-- missing source code
go

create procedure sys.sp_dropmergearticle(@publication unknown, @article unknown, @ignore_distributor unknown,
                                         @reserved unknown, @force_invalidate_snapshot unknown,
                                         @force_reinit_subscription unknown, @ignore_merge_metadata unknown) as
-- missing source code
go

create procedure sys.sp_dropmergefilter(@publication unknown, @article unknown, @filtername unknown,
                                        @force_invalidate_snapshot unknown, @force_reinit_subscription unknown) as
-- missing source code
go

create procedure sys.sp_dropmergelogsettings(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                             @web_server unknown) as
-- missing source code
go

create procedure sys.sp_dropmergepartition(@publication unknown, @suser_sname unknown, @host_name unknown) as
-- missing source code
go

create procedure sys.sp_dropmergepublication(@publication unknown, @ignore_distributor unknown, @reserved unknown,
                                             @ignore_merge_metadata unknown) as
-- missing source code
go

create procedure sys.sp_dropmergepullsubscription(@publication unknown, @publisher unknown, @publisher_db unknown,
                                                  @reserved unknown) as
-- missing source code
go

create procedure sys.sp_dropmergesubscription(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                              @subscription_type unknown, @ignore_distributor unknown,
                                              @reserved unknown) as
-- missing source code
go

create procedure sys.sp_dropmessage(@msgnum unknown, @lang unknown) as
-- missing source code
go

create procedure sys.sp_droporphans() as
-- missing source code
go

create procedure sys.sp_droppublication(@publication unknown, @ignore_distributor unknown, @publisher unknown,
                                        @from_backup unknown) as
-- missing source code
go

create procedure sys.sp_droppublisher(@publisher unknown, @type unknown) as
-- missing source code
go

create procedure sys.sp_droppullsubscription(@publisher unknown, @publisher_db unknown, @publication unknown,
                                             @reserved unknown, @from_backup unknown) as
-- missing source code
go

create procedure sys.sp_dropremotelogin(@remoteserver unknown, @loginame unknown, @remotename unknown) as
-- missing source code
go

create procedure sys.sp_dropreplsymmetrickey(@check_replication unknown, @throw_error unknown) as
-- missing source code
go

create procedure sys.sp_droprole(@rolename unknown) as
-- missing source code
go

create procedure sys.sp_droprolemember(@rolename unknown, @membername unknown) as
-- missing source code
go

create procedure sys.sp_dropserver(@server unknown, @droplogins unknown) as
-- missing source code
go

create procedure sys.sp_dropsrvrolemember(@loginame unknown, @rolename unknown) as
-- missing source code
go

create procedure sys.sp_dropsubscriber(@subscriber unknown, @reserved unknown, @ignore_distributor unknown,
                                       @publisher unknown) as
-- missing source code
go

create procedure sys.sp_dropsubscription(@publication unknown, @article unknown, @subscriber unknown,
                                         @destination_db unknown, @ignore_distributor unknown, @reserved unknown,
                                         @publisher unknown) as
-- missing source code
go

create procedure sys.sp_droptype(@typename unknown) as
-- missing source code
go

create procedure sys.sp_dropuser(@name_in_db unknown) as
-- missing source code
go

create procedure sys.sp_dsninfo(@dsn unknown, @infotype unknown, @login unknown, @password unknown,
                                @dso_type unknown) as
-- missing source code
go

create procedure sys.sp_enable_heterogeneous_subscription(@publication unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_enable_sql_debug() as
-- missing source code
go

create procedure sys.sp_enableagentoffload(@job_id unknown, @offloadserver unknown, @agent_type unknown) as
-- missing source code
go

create procedure sys.sp_enum_oledb_providers() as
-- missing source code
go

create procedure sys.sp_enumcustomresolvers(@distributor unknown) as
-- missing source code
go

create procedure sys.sp_enumdsn() as
-- missing source code
go

create procedure sys.sp_enumeratependingschemachanges(@publication unknown, @starting_schemaversion unknown) as
-- missing source code
go

create procedure sys.sp_enumerrorlogs(@p1 unknown) as
-- missing source code
go

create procedure sys.sp_enumfullsubscribers(@publication unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_enumoledbdatasources() as
-- missing source code
go

create procedure sys.sp_estimate_data_compression_savings(@schema_name unknown, @object_name unknown, @index_id unknown,
                                                          @partition_number unknown, @data_compression unknown) as
-- missing source code
go

create procedure sys.sp_estimated_rowsize_reduction_for_vardecimal(@table_name unknown) as
-- missing source code
go

create procedure sys.sp_execute() as
-- missing source code
go

create procedure sys.sp_executesql() as
-- missing source code
go

create procedure sys.sp_expired_subscription_cleanup(@publisher unknown) as
-- missing source code
go

create procedure sys.sp_filestream_force_garbage_collection(@dbname unknown, @filename unknown) as
-- missing source code
go

create procedure sys.sp_filestream_recalculate_container_size(@dbname unknown, @filename unknown) as
-- missing source code
go

create procedure sys.sp_firstonly_bitmap(@inputbitmap1 unknown, @inputbitmap2 unknown, @resultbitmap3 unknown) as
-- missing source code
go

create procedure sys.sp_fkeys(@pktable_name unknown, @pktable_owner unknown, @pktable_qualifier unknown,
                              @fktable_name unknown, @fktable_owner unknown, @fktable_qualifier unknown) as
-- missing source code
go

create procedure sys.sp_flush_commit_table(@flush_ts unknown, @cleanup_version unknown, @rowcount unknown,
                                           @date_cleanedup unknown) as
-- missing source code
go

create procedure sys.sp_flush_commit_table_on_demand(@numrows unknown) as
-- missing source code
go

create procedure sys.sp_foreign_keys_rowset(@pk_table_name unknown, @pk_table_schema unknown,
                                            @foreignkey_tab_name unknown, @foreignkey_tab_schema unknown,
                                            @foreignkey_tab_catalog unknown) as
-- missing source code
go

create procedure sys.sp_foreign_keys_rowset2(@foreignkey_tab_name unknown, @foreignkey_tab_schema unknown,
                                             @pk_table_name unknown, @pk_table_schema unknown,
                                             @pk_table_catalog unknown) as
-- missing source code
go

create procedure sys.sp_foreign_keys_rowset3(@pk_table_schema unknown, @pk_table_catalog unknown,
                                             @foreignkey_tab_schema unknown, @foreignkey_tab_catalog unknown) as
-- missing source code
go

create procedure sys.sp_foreign_keys_rowset_rmt(@server_name unknown, @pk_table_name unknown, @pk_table_schema unknown,
                                                @pk_table_catalog unknown, @foreignkey_tab_name unknown,
                                                @foreignkey_tab_schema unknown, @foreignkey_tab_catalog unknown) as
-- missing source code
go

create procedure sys.sp_foreignkeys(@table_server unknown, @pktab_name unknown, @pktab_schema unknown,
                                    @pktab_catalog unknown, @fktab_name unknown, @fktab_schema unknown,
                                    @fktab_catalog unknown) as
-- missing source code
go

create procedure sys.sp_fulltext_catalog(@ftcat unknown, @action unknown, @path unknown) as
-- missing source code
go

create procedure sys.sp_fulltext_column(@tabname unknown, @colname unknown, @action unknown, @language unknown,
                                        @type_colname unknown) as
-- missing source code
go

create procedure sys.sp_fulltext_database(@action unknown) as
-- missing source code
go

create procedure sys.sp_fulltext_getdata() as
-- missing source code
go

create procedure sys.sp_fulltext_keymappings() as
-- missing source code
go

create procedure sys.sp_fulltext_load_thesaurus_file(@lcid unknown, @loadOnlyIfNotLoaded unknown) as
-- missing source code
go

create procedure sys.sp_fulltext_pendingchanges() as
-- missing source code
go

create procedure sys.sp_fulltext_recycle_crawl_log(@ftcat unknown) as
-- missing source code
go

create procedure sys.sp_fulltext_semantic_register_language_statistics_db(@dbname unknown) as
-- missing source code
go

create procedure sys.sp_fulltext_semantic_unregister_language_statistics_db() as
-- missing source code
go

create procedure sys.sp_fulltext_service(@action unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_fulltext_table(@tabname unknown, @action unknown, @ftcat unknown, @keyname unknown) as
-- missing source code
go

create procedure sys.sp_generate_agent_parameter(@profile_id unknown, @real_profile_id unknown) as
-- missing source code
go

create procedure sys.sp_generatefilters(@publication unknown) as
-- missing source code
go

create procedure sys.sp_getProcessorUsage() as
-- missing source code
go

create procedure sys.sp_getVolumeFreeSpace(@database_name unknown, @file_id unknown) as
-- missing source code
go

create procedure sys.sp_get_Oracle_publisher_metadata(@database_name unknown) as
-- missing source code
go

create procedure sys.sp_get_distributor() as
-- missing source code
go

create procedure sys.sp_get_job_status_mergesubscription_agent(@publisher unknown, @publisher_db unknown,
                                                               @publication unknown, @agent_name unknown) as
-- missing source code
go

create procedure sys.sp_get_mergepublishedarticleproperties(@source_object unknown, @source_owner unknown) as
-- missing source code
go

create procedure sys.sp_get_query_template() as
-- missing source code
go

create procedure sys.sp_get_redirected_publisher(@original_publisher unknown, @publisher_db unknown,
                                                 @bypass_publisher_validation unknown) as
-- missing source code
go

create procedure sys.sp_getagentparameterlist(@agent_type unknown) as
-- missing source code
go

create procedure sys.sp_getapplock(@Resource unknown, @LockMode unknown, @LockOwner unknown, @LockTimeout unknown,
                                   @DbPrincipal unknown) as
-- missing source code
go

create procedure sys.sp_getbindtoken() as
-- missing source code
go

create procedure sys.sp_getdefaultdatatypemapping(@source_dbms unknown, @source_version unknown, @source_type unknown,
                                                  @source_length unknown, @source_precision unknown,
                                                  @source_scale unknown, @source_nullable unknown,
                                                  @destination_dbms unknown, @destination_version unknown,
                                                  @destination_type unknown, @destination_length unknown,
                                                  @destination_precision unknown, @destination_scale unknown,
                                                  @destination_nullable unknown, @dataloss unknown) as
-- missing source code
go

create procedure sys.sp_getmergedeletetype(@source_object unknown, @rowguid unknown, @delete_type unknown) as
-- missing source code
go

create procedure sys.sp_getpublisherlink(@trigger_id unknown, @connect_string unknown, @islocalpublisher unknown) as
-- missing source code
go

create procedure sys.sp_getqueuedarticlesynctraninfo(@publication unknown, @artid unknown) as
-- missing source code
go

create procedure sys.sp_getqueuedrows(@tablename unknown, @owner unknown, @tranid unknown) as
-- missing source code
go

create procedure sys.sp_getschemalock() as
-- missing source code
go

create procedure sys.sp_getsqlqueueversion(@publisher unknown, @publisher_db unknown, @publication unknown,
                                           @version unknown) as
-- missing source code
go

create procedure sys.sp_getsubscription_status_hsnapshot(@publication unknown, @article unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_getsubscriptiondtspackagename(@publication unknown, @subscriber unknown) as
-- missing source code
go

create procedure sys.sp_gettopologyinfo(@request_id unknown) as
-- missing source code
go

create procedure sys.sp_grant_publication_access(@publication unknown, @login unknown, @reserved unknown,
                                                 @publisher unknown) as
-- missing source code
go

create procedure sys.sp_grantdbaccess(@loginame unknown, @name_in_db unknown) as
-- missing source code
go

create procedure sys.sp_grantlogin(@loginame unknown) as
-- missing source code
go

create procedure sys.sp_help(@objname unknown) as
-- missing source code
go

create procedure sys.sp_help_agent_default(@profile_id unknown, @agent_type unknown) as
-- missing source code
go

create procedure sys.sp_help_agent_parameter(@profile_id unknown) as
-- missing source code
go

create procedure sys.sp_help_agent_profile(@agent_type unknown, @profile_id unknown) as
-- missing source code
go

create procedure sys.sp_help_datatype_mapping(@dbms_name unknown, @dbms_version unknown, @sql_type unknown,
                                              @source_prec unknown) as
-- missing source code
go

create procedure sys.sp_help_fulltext_catalog_components() as
-- missing source code
go

create procedure sys.sp_help_fulltext_catalogs(@fulltext_catalog_name unknown) as
-- missing source code
go

create procedure sys.sp_help_fulltext_catalogs_cursor(@fulltext_catalog_name unknown) returns unknown as
-- missing source code
go

create procedure sys.sp_help_fulltext_columns(@table_name unknown, @column_name unknown) as
-- missing source code
go

create procedure sys.sp_help_fulltext_columns_cursor(@table_name unknown, @column_name unknown) returns unknown as
-- missing source code
go

create procedure sys.sp_help_fulltext_system_components(@component_type unknown, @param unknown) as
-- missing source code
go

create procedure sys.sp_help_fulltext_tables(@fulltext_catalog_name unknown, @table_name unknown) as
-- missing source code
go

create procedure sys.sp_help_fulltext_tables_cursor(@fulltext_catalog_name unknown, @table_name unknown) returns unknown as
-- missing source code
go

create procedure sys.sp_help_log_shipping_alert_job() as
-- missing source code
go

create procedure sys.sp_help_log_shipping_monitor(@verbose unknown) as
-- missing source code
go

create procedure sys.sp_help_log_shipping_monitor_primary(@primary_server unknown, @primary_database unknown) as
-- missing source code
go

create procedure sys.sp_help_log_shipping_monitor_secondary(@secondary_server unknown, @secondary_database unknown) as
-- missing source code
go

create procedure sys.sp_help_log_shipping_primary_database(@database unknown, @primary_id unknown) as
-- missing source code
go

create procedure sys.sp_help_log_shipping_primary_secondary(@primary_database unknown) as
-- missing source code
go

create procedure sys.sp_help_log_shipping_secondary_database(@secondary_database unknown, @secondary_id unknown) as
-- missing source code
go

create procedure sys.sp_help_log_shipping_secondary_primary(@primary_server unknown, @primary_database unknown) as
-- missing source code
go

create procedure sys.sp_help_peerconflictdetection(@publication unknown, @timeout unknown) as
-- missing source code
go

create procedure sys.sp_help_publication_access(@publication unknown, @return_granted unknown, @login unknown,
                                                @initial_list unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_help_spatial_geography_histogram(@tabname unknown, @colname unknown, @resolution unknown,
                                                         @sample unknown) as
-- missing source code
go

create procedure sys.sp_help_spatial_geography_index(@tabname unknown, @indexname unknown, @verboseoutput unknown,
                                                     @query_sample unknown) as
-- missing source code
go

create procedure sys.sp_help_spatial_geography_index_xml(@tabname unknown, @indexname unknown, @verboseoutput unknown,
                                                         @query_sample unknown, @xml_output unknown) as
-- missing source code
go

create procedure sys.sp_help_spatial_geometry_histogram(@tabname unknown, @colname unknown, @resolution unknown,
                                                        @xmin unknown, @ymin unknown, @xmax unknown, @ymax unknown,
                                                        @sample unknown) as
-- missing source code
go

create procedure sys.sp_help_spatial_geometry_index(@tabname unknown, @indexname unknown, @verboseoutput unknown,
                                                    @query_sample unknown) as
-- missing source code
go

create procedure sys.sp_help_spatial_geometry_index_xml(@tabname unknown, @indexname unknown, @verboseoutput unknown,
                                                        @query_sample unknown, @xml_output unknown) as
-- missing source code
go

create procedure sys.sp_helpallowmerge_publication() as
-- missing source code
go

create procedure sys.sp_helparticle(@publication unknown, @article unknown, @returnfilter unknown, @publisher unknown,
                                    @found unknown) as
-- missing source code
go

create procedure sys.sp_helparticlecolumns(@publication unknown, @article unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_helparticledts(@publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_helpconstraint(@objname unknown, @nomsg unknown) as
-- missing source code
go

create procedure sys.sp_helpdatatypemap(@source_dbms unknown, @source_version unknown, @source_type unknown,
                                        @destination_dbms unknown, @destination_version unknown,
                                        @destination_type unknown, @defaults_only unknown) as
-- missing source code
go

create procedure sys.sp_helpdb(@dbname unknown) as
-- missing source code
go

create procedure sys.sp_helpdbfixedrole(@rolename unknown) as
-- missing source code
go

create procedure sys.sp_helpdevice(@devname unknown) as
-- missing source code
go

create procedure sys.sp_helpdistpublisher(@publisher unknown, @check_user unknown) as
-- missing source code
go

create procedure sys.sp_helpdistributiondb(@database unknown) as
-- missing source code
go

create procedure sys.sp_helpdistributor(@distributor unknown, @distribdb unknown, @directory unknown, @account unknown,
                                        @min_distretention unknown, @max_distretention unknown,
                                        @history_retention unknown, @history_cleanupagent unknown,
                                        @distrib_cleanupagent unknown, @publisher unknown, @local unknown,
                                        @rpcsrvname unknown, @publisher_type unknown) as
-- missing source code
go

create procedure sys.sp_helpdistributor_properties() as
-- missing source code
go

create procedure sys.sp_helpdynamicsnapshot_job(@publication unknown, @dynamic_snapshot_jobname unknown,
                                                @dynamic_snapshot_jobid unknown) as
-- missing source code
go

create procedure sys.sp_helpextendedproc(@funcname unknown) as
-- missing source code
go

create procedure sys.sp_helpfile(@filename unknown) as
-- missing source code
go

create procedure sys.sp_helpfilegroup(@filegroupname unknown) as
-- missing source code
go

create procedure sys.sp_helpindex(@objname unknown) as
-- missing source code
go

create procedure sys.sp_helplanguage(@language unknown) as
-- missing source code
go

create procedure sys.sp_helplinkedsrvlogin(@rmtsrvname unknown, @locallogin unknown) as
-- missing source code
go

create procedure sys.sp_helplogins(@LoginNamePattern unknown) as
-- missing source code
go

create procedure sys.sp_helplogreader_agent(@publisher unknown) as
-- missing source code
go

create procedure sys.sp_helpmergealternatepublisher(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_helpmergearticle(@publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_helpmergearticlecolumn(@publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_helpmergearticleconflicts(@publication unknown, @publisher unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_helpmergeconflictrows(@publication unknown, @conflict_table unknown, @publisher unknown,
                                              @publisher_db unknown, @logical_record_conflicts unknown) as
-- missing source code
go

create procedure sys.sp_helpmergedeleteconflictrows(@publication unknown, @source_object unknown, @publisher unknown,
                                                    @publisher_db unknown, @logical_record_conflicts unknown) as
-- missing source code
go

create procedure sys.sp_helpmergefilter(@publication unknown, @article unknown, @filtername unknown,
                                        @filter_type_bm unknown) as
-- missing source code
go

create procedure sys.sp_helpmergelogfiles(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                          @publisher unknown, @publisher_db unknown, @web_server unknown) as
-- missing source code
go

create procedure sys.sp_helpmergelogfileswithdata(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                                  @publisher unknown, @publisher_db unknown, @web_server unknown,
                                                  @id unknown) as
-- missing source code
go

create procedure sys.sp_helpmergelogsettings(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                             @publisher unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_helpmergepartition(@publication unknown, @suser_sname unknown, @host_name unknown) as
-- missing source code
go

create procedure sys.sp_helpmergepublication(@publication unknown, @found unknown, @publication_id unknown,
                                             @reserved unknown, @publisher unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_helpmergepullsubscription(@publication unknown, @publisher unknown, @publisher_db unknown,
                                                  @subscription_type unknown) as
-- missing source code
go

create procedure sys.sp_helpmergesubscription(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                              @publisher unknown, @publisher_db unknown, @subscription_type unknown,
                                              @found unknown) as
-- missing source code
go

create procedure sys.sp_helpntgroup(@ntname unknown) as
-- missing source code
go

create procedure sys.sp_helppeerrequests(@publication unknown, @description unknown) as
-- missing source code
go

create procedure sys.sp_helppeerresponses(@request_id unknown) as
-- missing source code
go

create procedure sys.sp_helppublication(@publication unknown, @found unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_helppublication_snapshot(@publication unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_helppublicationsync(@publication unknown) as
-- missing source code
go

create procedure sys.sp_helppullsubscription(@publisher unknown, @publisher_db unknown, @publication unknown,
                                             @show_push unknown) as
-- missing source code
go

create procedure sys.sp_helpqreader_agent(@frompublisher unknown) as
-- missing source code
go

create procedure sys.sp_helpremotelogin(@remoteserver unknown, @remotename unknown) as
-- missing source code
go

create procedure sys.sp_helpreplfailovermode(@publisher unknown, @publisher_db unknown, @publication unknown,
                                             @failover_mode_id unknown, @failover_mode unknown) as
-- missing source code
go

create procedure sys.sp_helpreplicationdb(@dbname unknown, @type unknown) as
-- missing source code
go

create procedure sys.sp_helpreplicationdboption(@dbname unknown, @type unknown, @reserved unknown) as
-- missing source code
go

create procedure sys.sp_helpreplicationoption(@optname unknown) as
-- missing source code
go

create procedure sys.sp_helprole(@rolename unknown) as
-- missing source code
go

create procedure sys.sp_helprolemember(@rolename unknown) as
-- missing source code
go

create procedure sys.sp_helprotect(@name unknown, @username unknown, @grantorname unknown, @permissionarea unknown) as
-- missing source code
go

create procedure sys.sp_helpserver(@server unknown, @optname unknown, @show_topology unknown) as
-- missing source code
go

create procedure sys.sp_helpsort() as
-- missing source code
go

create procedure sys.sp_helpsrvrole(@srvrolename unknown) as
-- missing source code
go

create procedure sys.sp_helpsrvrolemember(@srvrolename unknown) as
-- missing source code
go

create procedure sys.sp_helpstats(@objname unknown, @results unknown) as
-- missing source code
go

create procedure sys.sp_helpsubscriberinfo(@subscriber unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_helpsubscription(@publication unknown, @article unknown, @subscriber unknown,
                                         @destination_db unknown, @found unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_helpsubscription_properties(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                    @publication_type unknown) as
-- missing source code
go

create procedure sys.sp_helpsubscriptionerrors(@publisher unknown, @publisher_db unknown, @publication unknown,
                                               @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_helptext(@objname unknown, @columnname unknown) as
-- missing source code
go

create procedure sys.sp_helptracertokenhistory(@publication unknown, @tracer_id unknown, @publisher unknown,
                                               @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_helptracertokens(@publication unknown, @publisher unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_helptrigger(@tabname unknown, @triggertype unknown) as
-- missing source code
go

create procedure sys.sp_helpuser(@name_in_db unknown) as
-- missing source code
go

create procedure sys.sp_helpxactsetjob(@publisher unknown) as
-- missing source code
go

create procedure sys.sp_http_generate_wsdl_complex() as
-- missing source code
go

create procedure sys.sp_http_generate_wsdl_defaultcomplexorsimple(@EndpointID unknown, @IsSSL unknown, @Host unknown,
                                                                  @QueryString unknown, @UserAgent unknown) as
-- missing source code
go

create procedure sys.sp_http_generate_wsdl_defaultsimpleorcomplex(@EndpointID unknown, @IsSSL unknown, @Host unknown,
                                                                  @QueryString unknown, @UserAgent unknown) as
-- missing source code
go

create procedure sys.sp_http_generate_wsdl_simple() as
-- missing source code
go

create procedure sys.sp_identitycolumnforreplication(@object_id unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_indexcolumns_managed(@Catalog unknown, @Owner unknown, @Table unknown, @ConstraintName unknown,
                                             @Column unknown) as
-- missing source code
go

create procedure sys.sp_indexes(@table_server unknown, @table_name unknown, @table_schema unknown,
                                @table_catalog unknown, @index_name unknown, @is_unique unknown) as
-- missing source code
go

create procedure sys.sp_indexes_100_rowset(@table_name unknown, @index_name unknown, @table_schema unknown) as
-- missing source code
go

create procedure sys.sp_indexes_100_rowset2(@index_name unknown, @table_schema unknown) as
-- missing source code
go

create procedure sys.sp_indexes_90_rowset(@table_name unknown, @index_name unknown, @table_schema unknown) as
-- missing source code
go

create procedure sys.sp_indexes_90_rowset2(@index_name unknown, @table_schema unknown) as
-- missing source code
go

create procedure sys.sp_indexes_90_rowset_rmt(@table_server unknown, @table_catalog unknown, @table_name unknown,
                                              @index_name unknown, @table_schema unknown) as
-- missing source code
go

create procedure sys.sp_indexes_managed(@Catalog unknown, @Owner unknown, @Table unknown, @Name unknown) as
-- missing source code
go

create procedure sys.sp_indexes_rowset(@table_name unknown, @index_name unknown, @table_schema unknown) as
-- missing source code
go

create procedure sys.sp_indexes_rowset2(@index_name unknown, @table_schema unknown) as
-- missing source code
go

create procedure sys.sp_indexes_rowset_rmt(@table_server unknown, @table_catalog unknown, @table_name unknown,
                                           @index_name unknown, @table_schema unknown) as
-- missing source code
go

create procedure sys.sp_indexoption(@IndexNamePattern unknown, @OptionName unknown, @OptionValue unknown) as
-- missing source code
go

create procedure sys.sp_invalidate_textptr(@TextPtrValue unknown) as
-- missing source code
go

create procedure sys.sp_is_makegeneration_needed(@wait unknown, @needed unknown) as
-- missing source code
go

create procedure sys.sp_ivindexhasnullcols(@viewname unknown, @fhasnullcols unknown) as
-- missing source code
go

create procedure sys.sp_kill_filestream_non_transacted_handles(@table_name unknown, @handle_id unknown) as
-- missing source code
go

create procedure sys.sp_lightweightmergemetadataretentioncleanup(@num_rowtrack_rows unknown) as
-- missing source code
go

create procedure sys.sp_link_publication(@publisher unknown, @publisher_db unknown, @publication unknown,
                                         @security_mode unknown, @login unknown, @password unknown,
                                         @distributor unknown) as
-- missing source code
go

create procedure sys.sp_linkedservers() as
-- missing source code
go

create procedure sys.sp_linkedservers_rowset(@srvname unknown) as
-- missing source code
go

create procedure sys.sp_linkedservers_rowset2() as
-- missing source code
go

create procedure sys.sp_lock(@spid1 unknown, @spid2 unknown) as
-- missing source code
go

create procedure sys.sp_logshippinginstallmetadata() as
-- missing source code
go

create procedure sys.sp_lookupcustomresolver(@article_resolver unknown, @resolver_clsid unknown,
                                             @is_dotnet_assembly unknown, @dotnet_assembly_name unknown,
                                             @dotnet_class_name unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_mapdown_bitmap(@mapdownbm unknown, @bm unknown) as
-- missing source code
go

create procedure sys.sp_markpendingschemachange(@publication unknown, @schemaversion unknown, @status unknown) as
-- missing source code
go

create procedure sys.sp_marksubscriptionvalidation(@publication unknown, @subscriber unknown, @destination_db unknown,
                                                   @publisher unknown) as
-- missing source code
go

create procedure sys.sp_mergearticlecolumn(@publication unknown, @article unknown, @column unknown, @operation unknown,
                                           @schema_replication unknown, @force_invalidate_snapshot unknown,
                                           @force_reinit_subscription unknown) as
-- missing source code
go

create procedure sys.sp_mergecleanupmetadata(@publication unknown, @reinitialize_subscriber unknown) as
-- missing source code
go

create procedure sys.sp_mergedummyupdate(@source_object unknown, @rowguid unknown) as
-- missing source code
go

create procedure sys.sp_mergemetadataretentioncleanup(@num_genhistory_rows unknown, @num_contents_rows unknown,
                                                      @num_tombstone_rows unknown, @aggressive_cleanup_only unknown) as
-- missing source code
go

create procedure sys.sp_mergesubscription_cleanup(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_mergesubscriptionsummary(@publication unknown, @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_migrate_user_to_contained() as
-- missing source code
go

create procedure sys.sp_monitor() as
-- missing source code
go

create procedure sys.sp_new_parallel_nested_tran_id() as
-- missing source code
go

create procedure sys.sp_objectfilegroup(@objid unknown) as
-- missing source code
go

create procedure sys.sp_oledb_database() as
-- missing source code
go

create procedure sys.sp_oledb_defdb() as
-- missing source code
go

create procedure sys.sp_oledb_deflang() as
-- missing source code
go

create procedure sys.sp_oledb_language() as
-- missing source code
go

create procedure sys.sp_oledb_ro_usrname() as
-- missing source code
go

create procedure sys.sp_oledbinfo(@server unknown, @infotype unknown, @login unknown, @password unknown) as
-- missing source code
go

create procedure sys.sp_password(@old unknown, @new unknown, @loginame unknown) as
-- missing source code
go

create procedure sys.sp_peerconflictdetection_tableaug(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                       @enabling unknown, @originator_id unknown, @artlist unknown) as
-- missing source code
go

create procedure sys.sp_pkeys(@table_name unknown, @table_owner unknown, @table_qualifier unknown) as
-- missing source code
go

create procedure sys.sp_posttracertoken(@publication unknown, @tracer_token_id unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_prepare() as
-- missing source code
go

create procedure sys.sp_prepexec() as
-- missing source code
go

create procedure sys.sp_prepexecrpc() as
-- missing source code
go

create procedure sys.sp_primary_keys_rowset(@table_name unknown, @table_schema unknown) as
-- missing source code
go

create procedure sys.sp_primary_keys_rowset2(@table_schema unknown) as
-- missing source code
go

create procedure sys.sp_primary_keys_rowset_rmt(@table_server unknown, @table_catalog unknown, @table_name unknown,
                                                @table_schema unknown) as
-- missing source code
go

create procedure sys.sp_primarykeys(@table_server unknown, @table_name unknown, @table_schema unknown,
                                    @table_catalog unknown) as
-- missing source code
go

create procedure sys.sp_procedure_params_100_managed(@procedure_name unknown, @group_number unknown,
                                                     @procedure_schema unknown, @parameter_name unknown) as
-- missing source code
go

create procedure sys.sp_procedure_params_100_rowset(@procedure_name unknown, @group_number unknown,
                                                    @procedure_schema unknown, @parameter_name unknown) as
-- missing source code
go

create procedure sys.sp_procedure_params_100_rowset2(@procedure_schema unknown, @parameter_name unknown) as
-- missing source code
go

create procedure sys.sp_procedure_params_90_rowset(@procedure_name unknown, @group_number unknown,
                                                   @procedure_schema unknown, @parameter_name unknown) as
-- missing source code
go

create procedure sys.sp_procedure_params_90_rowset2(@procedure_schema unknown, @parameter_name unknown) as
-- missing source code
go

create procedure sys.sp_procedure_params_managed(@procedure_name unknown, @group_number unknown,
                                                 @procedure_schema unknown, @parameter_name unknown) as
-- missing source code
go

create procedure sys.sp_procedure_params_rowset(@procedure_name unknown, @group_number unknown,
                                                @procedure_schema unknown, @parameter_name unknown) as
-- missing source code
go

create procedure sys.sp_procedure_params_rowset2(@procedure_schema unknown, @parameter_name unknown) as
-- missing source code
go

create procedure sys.sp_procedures_rowset(@procedure_name unknown, @group_number unknown, @procedure_schema unknown) as
-- missing source code
go

create procedure sys.sp_procedures_rowset2(@procedure_schema unknown) as
-- missing source code
go

create procedure sys.sp_processlogshippingmonitorhistory(@mode unknown, @agent_id unknown, @agent_type unknown,
                                                         @session_id unknown, @session_status unknown,
                                                         @monitor_server unknown, @monitor_server_security_mode unknown,
                                                         @database unknown, @log_time unknown, @log_time_utc unknown,
                                                         @message unknown) as
-- missing source code
go

create procedure sys.sp_processlogshippingmonitorprimary(@mode unknown, @primary_id unknown, @primary_server unknown,
                                                         @monitor_server unknown, @monitor_server_security_mode unknown,
                                                         @primary_database unknown, @backup_threshold unknown,
                                                         @threshold_alert unknown, @threshold_alert_enabled unknown,
                                                         @last_backup_file unknown, @last_backup_date unknown,
                                                         @last_backup_date_utc unknown,
                                                         @history_retention_period unknown) as
-- missing source code
go

create procedure sys.sp_processlogshippingmonitorsecondary(@mode unknown, @secondary_server unknown,
                                                           @secondary_database unknown, @secondary_id unknown,
                                                           @primary_server unknown, @monitor_server unknown,
                                                           @monitor_server_security_mode unknown,
                                                           @primary_database unknown, @restore_threshold unknown,
                                                           @threshold_alert unknown, @threshold_alert_enabled unknown,
                                                           @last_copied_file unknown, @last_copied_date unknown,
                                                           @last_copied_date_utc unknown, @last_restored_file unknown,
                                                           @last_restored_date unknown, @last_restored_date_utc unknown,
                                                           @last_restored_latency unknown,
                                                           @history_retention_period unknown) as
-- missing source code
go

create procedure sys.sp_processlogshippingretentioncleanup(@agent_id unknown, @agent_type unknown,
                                                           @monitor_server unknown,
                                                           @monitor_server_security_mode unknown,
                                                           @history_retention_period unknown, @curdate_utc unknown) as
-- missing source code
go

create procedure sys.sp_procoption(@ProcName unknown, @OptionName unknown, @OptionValue unknown) as
-- missing source code
go

create procedure sys.sp_prop_oledb_provider(@p1 unknown) as
-- missing source code
go

create procedure sys.sp_provider_types_100_rowset(@data_type unknown, @best_match unknown) as
-- missing source code
go

create procedure sys.sp_provider_types_90_rowset(@data_type unknown, @best_match unknown) as
-- missing source code
go

create procedure sys.sp_provider_types_rowset(@data_type unknown, @best_match unknown) as
-- missing source code
go

create procedure sys.sp_publication_validation(@publication unknown, @rowcount_only unknown, @full_or_fast unknown,
                                               @shutdown_agent unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_publicationsummary(@publication unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_publishdb(@dbname unknown, @value unknown) as
-- missing source code
go

create procedure sys.sp_publisherproperty(@publisher unknown, @propertyname unknown, @propertyvalue unknown) as
-- missing source code
go

create procedure sys.sp_readerrorlog(@p1 unknown, @p2 unknown, @p3 unknown, @p4 unknown) as
-- missing source code
go

create procedure sys.sp_recompile(@objname unknown) as
-- missing source code
go

create procedure sys.sp_redirect_publisher(@original_publisher unknown, @publisher_db unknown,
                                           @redirected_publisher unknown) as
-- missing source code
go

create procedure sys.sp_refresh_heterogeneous_publisher(@publisher unknown) as
-- missing source code
go

create procedure sys.sp_refresh_log_shipping_monitor(@agent_id unknown, @agent_type unknown, @database unknown,
                                                     @mode unknown) as
-- missing source code
go

create procedure sys.sp_refreshsqlmodule(@name unknown, @namespace unknown) as
-- missing source code
go

create procedure sys.sp_refreshsubscriptions(@publication unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_refreshview(@viewname unknown) as
-- missing source code
go

create procedure sys.sp_register_custom_scripting(@type unknown, @value unknown, @publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_registercustomresolver(@article_resolver unknown, @resolver_clsid unknown,
                                               @is_dotnet_assembly unknown, @dotnet_assembly_name unknown,
                                               @dotnet_class_name unknown) as
-- missing source code
go

create procedure sys.sp_reinitmergepullsubscription(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                    @upload_first unknown) as
-- missing source code
go

create procedure sys.sp_reinitmergesubscription(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                                @upload_first unknown) as
-- missing source code
go

create procedure sys.sp_reinitpullsubscription(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_reinitsubscription(@publication unknown, @article unknown, @subscriber unknown,
                                           @destination_db unknown, @for_schema_change unknown, @publisher unknown,
                                           @ignore_distributor_failure unknown, @invalidate_snapshot unknown) as
-- missing source code
go

create procedure sys.sp_releaseapplock(@Resource unknown, @LockOwner unknown, @DbPrincipal unknown) as
-- missing source code
go

create procedure sys.sp_releaseschemalock() as
-- missing source code
go

create procedure sys.sp_remoteoption(@remoteserver unknown, @loginame unknown, @remotename unknown, @optname unknown,
                                     @optvalue unknown) as
-- missing source code
go

create procedure sys.sp_removedbreplication(@dbname unknown, @type unknown) as
-- missing source code
go

create procedure sys.sp_removedistpublisherdbreplication(@publisher unknown, @publisher_db unknown) as
-- missing source code
go

create procedure sys.sp_removesrvreplication() as
-- missing source code
go

create procedure sys.sp_rename(@objname unknown, @newname unknown, @objtype unknown) as
-- missing source code
go

create procedure sys.sp_renamedb(@dbname unknown, @newname unknown) as
-- missing source code
go

create procedure sys.sp_repl_generateevent() as
-- missing source code
go

create procedure sys.sp_repladdcolumn(@source_object unknown, @column unknown, @typetext unknown,
                                      @publication_to_add unknown, @from_agent unknown, @schema_change_script unknown,
                                      @force_invalidate_snapshot unknown, @force_reinit_subscription unknown) as
-- missing source code
go

create procedure sys.sp_replcleanupccsprocs(@publication unknown) as
-- missing source code
go

create procedure sys.sp_replcmds() as
-- missing source code
go

create procedure sys.sp_replcounters() as
-- missing source code
go

create procedure sys.sp_replddlparser() as
-- missing source code
go

create procedure sys.sp_repldeletequeuedtran(@publisher unknown, @publisher_db unknown, @publication unknown,
                                             @tranid unknown, @orderkeylow unknown, @orderkeyhigh unknown) as
-- missing source code
go

create procedure sys.sp_repldone() as
-- missing source code
go

create procedure sys.sp_repldropcolumn(@source_object unknown, @column unknown, @from_agent unknown,
                                       @schema_change_script unknown, @force_invalidate_snapshot unknown,
                                       @force_reinit_subscription unknown) as
-- missing source code
go

create procedure sys.sp_replflush() as
-- missing source code
go

create procedure sys.sp_replgetparsedddlcmd(@ddlcmd unknown, @FirstToken unknown, @objectType unknown, @dbname unknown,
                                            @owner unknown, @objname unknown, @targetobject unknown) as
-- missing source code
go

create procedure sys.sp_replhelp() as
-- missing source code
go

create procedure sys.sp_replica(@tabname unknown, @replicated unknown) as
-- missing source code
go

create procedure sys.sp_replication_agent_checkup(@heartbeat_interval unknown) as
-- missing source code
go

create procedure sys.sp_replicationdboption(@dbname unknown, @optname unknown, @value unknown,
                                            @ignore_distributor unknown, @from_scripting unknown) as
-- missing source code
go

create procedure sys.sp_replincrementlsn(@xact_seqno unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_replmonitorchangepublicationthreshold(@publisher unknown, @publisher_db unknown,
                                                              @publication unknown, @publication_type unknown,
                                                              @metric_id unknown, @thresholdmetricname unknown,
                                                              @value unknown, @shouldalert unknown, @mode unknown) as
-- missing source code
go

create procedure sys.sp_replmonitorhelpmergesession(@agent_name unknown, @hours unknown, @session_type unknown,
                                                    @publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_replmonitorhelpmergesessiondetail(@session_id unknown) as
-- missing source code
go

create procedure sys.sp_replmonitorhelpmergesubscriptionmoreinfo(@publisher unknown, @publisher_db unknown,
                                                                 @publication unknown, @subscriber unknown,
                                                                 @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_replmonitorhelppublication(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                   @publication_type unknown, @refreshpolicy unknown) as
-- missing source code
go

create procedure sys.sp_replmonitorhelppublicationthresholds(@publisher unknown, @publisher_db unknown,
                                                             @publication unknown, @publication_type unknown,
                                                             @thresholdmetricname unknown) as
-- missing source code
go

create procedure sys.sp_replmonitorhelppublisher(@publisher unknown, @refreshpolicy unknown) as
-- missing source code
go

create procedure sys.sp_replmonitorhelpsubscription(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                    @publication_type unknown, @mode unknown, @topnum unknown,
                                                    @exclude_anonymous unknown, @refreshpolicy unknown) as
-- missing source code
go

create procedure sys.sp_replmonitorrefreshjob(@iterations unknown, @profile unknown) as
-- missing source code
go

create procedure sys.sp_replmonitorsubscriptionpendingcmds(@publisher unknown, @publisher_db unknown,
                                                           @publication unknown, @subscriber unknown,
                                                           @subscriber_db unknown, @subscription_type unknown) as
-- missing source code
go

create procedure sys.sp_replpostsyncstatus(@pubid unknown, @artid unknown, @syncstat unknown, @xact_seqno unknown) as
-- missing source code
go

create procedure sys.sp_replqueuemonitor(@publisher unknown, @publisherdb unknown, @publication unknown,
                                         @tranid unknown, @queuetype unknown) as
-- missing source code
go

create procedure sys.sp_replrestart() as
-- missing source code
go

create procedure sys.sp_replrethrow() as
-- missing source code
go

create procedure sys.sp_replsendtoqueue() as
-- missing source code
go

create procedure sys.sp_replsetoriginator(@originator_srv unknown, @originator_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_replsetsyncstatus() as
-- missing source code
go

create procedure sys.sp_replshowcmds(@maxtrans unknown) as
-- missing source code
go

create procedure sys.sp_replsqlqgetrows(@publisher unknown, @publisherdb unknown, @publication unknown,
                                        @batchsize unknown) as
-- missing source code
go

create procedure sys.sp_replsync(@publisher unknown, @publisher_db unknown, @publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_repltrans() as
-- missing source code
go

create procedure sys.sp_replwritetovarbin() as
-- missing source code
go

create procedure sys.sp_requestpeerresponse(@publication unknown, @description unknown, @request_id unknown) as
-- missing source code
go

create procedure sys.sp_requestpeertopologyinfo(@publication unknown, @request_id unknown) as
-- missing source code
go

create procedure sys.sp_reserve_http_namespace() as
-- missing source code
go

create procedure sys.sp_reset_connection() as
-- missing source code
go

create procedure sys.sp_resetsnapshotdeliveryprogress(@verbose_level unknown, @drop_table unknown) as
-- missing source code
go

create procedure sys.sp_resetstatus(@DBName unknown) as
-- missing source code
go

create procedure sys.sp_resign_database(@keytype unknown, @fn unknown, @pwd unknown) as
-- missing source code
go

create procedure sys.sp_resolve_logins(@dest_db unknown, @dest_path unknown, @filename unknown) as
-- missing source code
go

create procedure sys.sp_restoredbreplication(@srv_orig unknown, @db_orig unknown, @keep_replication unknown,
                                             @perform_upgrade unknown, @recoveryforklsn unknown) as
-- missing source code
go

create procedure sys.sp_restoremergeidentityrange(@publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_resyncexecute() as
-- missing source code
go

create procedure sys.sp_resyncexecutesql() as
-- missing source code
go

create procedure sys.sp_resyncmergesubscription(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                @subscriber unknown, @subscriber_db unknown, @resync_type unknown,
                                                @resync_date_str unknown) as
-- missing source code
go

create procedure sys.sp_resyncprepare() as
-- missing source code
go

create procedure sys.sp_resyncuniquetable() as
-- missing source code
go

create procedure sys.sp_revoke_publication_access(@publication unknown, @login unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_revokedbaccess(@name_in_db unknown) as
-- missing source code
go

create procedure sys.sp_revokelogin(@loginame unknown) as
-- missing source code
go

create procedure sys.sp_rollback_parallel_nested_tran() as
-- missing source code
go

create procedure sys.sp_schemafilter(@publisher unknown, @schema unknown, @operation unknown) as
-- missing source code
go

create procedure sys.sp_schemata_rowset(@schema_name unknown, @schema_owner unknown) as
-- missing source code
go

create procedure sys.sp_script_reconciliation_delproc(@artid unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_script_reconciliation_insproc(@artid unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_script_reconciliation_sinsproc(@artid unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_script_reconciliation_vdelproc(@artid unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_script_reconciliation_xdelproc(@artid unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_script_synctran_commands(@publication unknown, @article unknown, @trig_only unknown,
                                                 @usesqlclr unknown) as
-- missing source code
go

create procedure sys.sp_scriptdelproc(@artid unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_scriptdynamicupdproc(@artid unknown) as
-- missing source code
go

create procedure sys.sp_scriptinsproc(@artid unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_scriptmappedupdproc(@artid unknown, @mode unknown, @publishertype unknown,
                                            @publisher unknown) as
-- missing source code
go

create procedure sys.sp_scriptpublicationcustomprocs(@publication unknown, @publisher unknown, @usesqlclr unknown) as
-- missing source code
go

create procedure sys.sp_scriptsinsproc(@artid unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_scriptsubconflicttable(@publication unknown, @article unknown, @alter unknown,
                                               @usesqlclr unknown) as
-- missing source code
go

create procedure sys.sp_scriptsupdproc(@artid unknown, @mode unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_scriptupdproc(@artid unknown, @mode unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_scriptvdelproc(@artid unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_scriptvupdproc(@artid unknown, @mode unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_scriptxdelproc(@artid unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_scriptxupdproc(@artid unknown, @mode unknown, @publishertype unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_sequence_get_range(@sequence_name unknown, @range_size unknown, @range_first_value unknown,
                                           @range_last_value unknown, @range_cycle_count unknown,
                                           @sequence_increment unknown, @sequence_min_value unknown,
                                           @sequence_max_value unknown) as
-- missing source code
go

create procedure sys.sp_server_diagnostics() as
-- missing source code
go

create procedure sys.sp_server_info(@attribute_id unknown) as
-- missing source code
go

create procedure sys.sp_serveroption(@server unknown, @optname unknown, @optvalue unknown) as
-- missing source code
go

create procedure sys.sp_setOraclepackageversion(@publisher unknown) as
-- missing source code
go

create procedure sys.sp_setapprole(@rolename unknown, @password unknown, @encrypt unknown, @fCreateCookie unknown,
                                   @cookie unknown) as
-- missing source code
go

create procedure sys.sp_setdefaultdatatypemapping(@mapping_id unknown, @source_dbms unknown, @source_version unknown,
                                                  @source_type unknown, @source_length_min unknown,
                                                  @source_length_max unknown, @source_precision_min unknown,
                                                  @source_precision_max unknown, @source_scale_min unknown,
                                                  @source_scale_max unknown, @source_nullable unknown,
                                                  @destination_dbms unknown, @destination_version unknown,
                                                  @destination_type unknown, @destination_length unknown,
                                                  @destination_precision unknown, @destination_scale unknown,
                                                  @destination_nullable unknown) as
-- missing source code
go

create procedure sys.sp_setnetname(@server unknown, @netname unknown) as
-- missing source code
go

create procedure sys.sp_setreplfailovermode(@publisher unknown, @publisher_db unknown, @publication unknown,
                                            @failover_mode unknown, @override unknown) as
-- missing source code
go

create procedure sys.sp_setsubscriptionxactseqno(@publisher unknown, @publisher_db unknown, @publication unknown,
                                                 @xact_seqno unknown) as
-- missing source code
go

create procedure sys.sp_settriggerorder(@triggername unknown, @order unknown, @stmttype unknown, @namespace unknown) as
-- missing source code
go

create procedure sys.sp_setuserbylogin() as
-- missing source code
go

create procedure sys.sp_showcolv(@colv unknown) as
-- missing source code
go

create procedure sys.sp_showlineage(@lineage unknown) as
-- missing source code
go

create procedure sys.sp_showmemo_xml() as
-- missing source code
go

create procedure sys.sp_showpendingchanges(@destination_server unknown, @publication unknown, @article unknown,
                                           @show_rows unknown) as
-- missing source code
go

create procedure sys.sp_showrowreplicainfo(@ownername unknown, @tablename unknown, @rowguid unknown, @show unknown) as
-- missing source code
go

create procedure sys.sp_spaceused(@objname unknown, @updateusage unknown) as
-- missing source code
go

create procedure sys.sp_sparse_columns_100_rowset(@table_name unknown, @table_schema unknown, @column_name unknown,
                                                  @schema_type unknown) as
-- missing source code
go

create procedure sys.sp_special_columns(@table_name unknown, @table_owner unknown, @table_qualifier unknown,
                                        @col_type unknown, @scope unknown, @nullable unknown, @ODBCVer unknown) as
-- missing source code
go

create procedure sys.sp_special_columns_100(@table_name unknown, @table_owner unknown, @table_qualifier unknown,
                                            @col_type unknown, @scope unknown, @nullable unknown, @ODBCVer unknown) as
-- missing source code
go

create procedure sys.sp_special_columns_90(@table_name unknown, @table_owner unknown, @table_qualifier unknown,
                                           @col_type unknown, @scope unknown, @nullable unknown, @ODBCVer unknown) as
-- missing source code
go

create procedure sys.sp_sproc_columns(@procedure_name unknown, @procedure_owner unknown, @procedure_qualifier unknown,
                                      @column_name unknown, @ODBCVer unknown, @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_sproc_columns_100(@procedure_name unknown, @procedure_owner unknown,
                                          @procedure_qualifier unknown, @column_name unknown, @ODBCVer unknown,
                                          @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_sproc_columns_90(@procedure_name unknown, @procedure_owner unknown,
                                         @procedure_qualifier unknown, @column_name unknown, @ODBCVer unknown,
                                         @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_sqlexec(@p1 unknown) as
-- missing source code
go

create procedure sys.sp_srvrolepermission(@srvrolename unknown) as
-- missing source code
go

create procedure sys.sp_start_user_instance() as
-- missing source code
go

create procedure sys.sp_startmergepullsubscription_agent(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_startmergepushsubscription_agent(@publication unknown, @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_startpublication_snapshot(@publication unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_startpullsubscription_agent(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_startpushsubscription_agent(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                                    @publisher unknown) as
-- missing source code
go

create procedure sys.sp_statistics(@table_name unknown, @table_owner unknown, @table_qualifier unknown,
                                   @index_name unknown, @is_unique unknown, @accuracy unknown) as
-- missing source code
go

create procedure sys.sp_statistics_100(@table_name unknown, @table_owner unknown, @table_qualifier unknown,
                                       @index_name unknown, @is_unique unknown, @accuracy unknown) as
-- missing source code
go

create procedure sys.sp_statistics_rowset(@table_name unknown, @table_schema unknown) as
-- missing source code
go

create procedure sys.sp_statistics_rowset2(@table_schema unknown) as
-- missing source code
go

create procedure sys.sp_stopmergepullsubscription_agent(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_stopmergepushsubscription_agent(@publication unknown, @subscriber unknown, @subscriber_db unknown) as
-- missing source code
go

create procedure sys.sp_stoppublication_snapshot(@publication unknown, @publisher unknown) as
-- missing source code
go

create procedure sys.sp_stoppullsubscription_agent(@publisher unknown, @publisher_db unknown, @publication unknown) as
-- missing source code
go

create procedure sys.sp_stoppushsubscription_agent(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                                   @publisher unknown) as
-- missing source code
go

create procedure sys.sp_stored_procedures(@sp_name unknown, @sp_owner unknown, @sp_qualifier unknown,
                                          @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_subscribe(@publication unknown, @article unknown, @destination_db unknown, @sync_type unknown,
                                  @loopback_detection unknown) as
-- missing source code
go

create procedure sys.sp_subscription_cleanup(@publisher unknown, @publisher_db unknown, @publication unknown,
                                             @reserved unknown, @from_backup unknown) as
-- missing source code
go

create procedure sys.sp_subscriptionsummary(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                            @publisher unknown) as
-- missing source code
go

create procedure sys.sp_syspolicy_execute_policy(@policy_name unknown, @event_data unknown, @synchronous unknown) as
-- missing source code
go

create procedure sys.sp_syspolicy_subscribe_to_policy_category(@policy_category unknown) as
-- missing source code
go

create procedure sys.sp_syspolicy_unsubscribe_from_policy_category(@policy_category unknown) as
-- missing source code
go

create procedure sys.sp_syspolicy_update_ddl_trigger() as
-- missing source code
go

create procedure sys.sp_syspolicy_update_event_notification() as
-- missing source code
go

create procedure sys.sp_table_constraints_rowset(@table_name unknown, @table_schema unknown, @table_catalog unknown,
                                                 @constraint_name unknown, @constraint_schema unknown,
                                                 @constraint_catalog unknown, @constraint_type unknown) as
-- missing source code
go

create procedure sys.sp_table_constraints_rowset2(@table_schema unknown, @table_catalog unknown,
                                                  @constraint_name unknown, @constraint_schema unknown,
                                                  @constraint_catalog unknown, @constraint_type unknown) as
-- missing source code
go

create procedure sys.sp_table_privileges(@table_name unknown, @table_owner unknown, @table_qualifier unknown,
                                         @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_table_privileges_ex(@table_server unknown, @table_name unknown, @table_schema unknown,
                                            @table_catalog unknown, @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_table_privileges_rowset(@table_name unknown, @table_schema unknown, @grantor unknown,
                                                @grantee unknown) as
-- missing source code
go

create procedure sys.sp_table_privileges_rowset2(@table_schema unknown, @grantor unknown, @grantee unknown) as
-- missing source code
go

create procedure sys.sp_table_privileges_rowset_rmt(@table_server unknown, @table_catalog unknown, @table_name unknown,
                                                    @table_schema unknown, @grantor unknown, @grantee unknown) as
-- missing source code
go

create procedure sys.sp_table_statistics2_rowset(@table_name unknown, @table_schema unknown, @table_catalog unknown,
                                                 @stat_name unknown, @stat_schema unknown, @stat_catalog unknown) as
-- missing source code
go

create procedure sys.sp_table_statistics_rowset(@table_name_dummy unknown) as
-- missing source code
go

create procedure sys.sp_table_type_columns_100(@table_name unknown, @table_owner unknown, @table_qualifier unknown,
                                               @column_name unknown, @ODBCVer unknown, @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_table_type_columns_100_rowset(@table_name unknown, @table_schema unknown, @column_name unknown) as
-- missing source code
go

create procedure sys.sp_table_type_pkeys(@table_name unknown, @table_owner unknown, @table_qualifier unknown) as
-- missing source code
go

create procedure sys.sp_table_type_primary_keys_rowset(@table_name unknown, @table_schema unknown) as
-- missing source code
go

create procedure sys.sp_table_types(@table_name unknown, @table_owner unknown, @table_qualifier unknown,
                                    @table_type unknown, @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_table_types_rowset(@table_name unknown, @table_schema unknown) as
-- missing source code
go

create procedure sys.sp_table_validation(@table unknown, @expected_rowcount unknown, @expected_checksum unknown,
                                         @rowcount_only unknown, @owner unknown, @full_or_fast unknown,
                                         @shutdown_agent unknown, @table_name unknown, @column_list unknown) as
-- missing source code
go

create procedure sys.sp_tablecollations(@object unknown) as
-- missing source code
go

create procedure sys.sp_tablecollations_100(@object unknown) as
-- missing source code
go

create procedure sys.sp_tablecollations_90(@object unknown) as
-- missing source code
go

create procedure sys.sp_tableoption(@TableNamePattern unknown, @OptionName unknown, @OptionValue unknown) as
-- missing source code
go

create procedure sys.sp_tables(@table_name unknown, @table_owner unknown, @table_qualifier unknown, @table_type unknown,
                               @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_tables_ex(@table_server unknown, @table_name unknown, @table_schema unknown,
                                  @table_catalog unknown, @table_type unknown, @fUsePattern unknown) as
-- missing source code
go

create procedure sys.sp_tables_info_90_rowset(@table_name unknown, @table_schema unknown, @table_type unknown) as
-- missing source code
go

create procedure sys.sp_tables_info_90_rowset2(@table_schema unknown, @table_type unknown) as
-- missing source code
go

create procedure sys.sp_tables_info_90_rowset2_64(@table_schema unknown, @table_type unknown) as
-- missing source code
go

create procedure sys.sp_tables_info_90_rowset_64(@table_name unknown, @table_schema unknown, @table_type unknown) as
-- missing source code
go

create procedure sys.sp_tables_info_rowset(@table_name unknown, @table_schema unknown, @table_type unknown) as
-- missing source code
go

create procedure sys.sp_tables_info_rowset2(@table_schema unknown, @table_type unknown) as
-- missing source code
go

create procedure sys.sp_tables_info_rowset2_64(@table_schema unknown, @table_type unknown) as
-- missing source code
go

create procedure sys.sp_tables_info_rowset_64(@table_name unknown, @table_schema unknown, @table_type unknown) as
-- missing source code
go

create procedure sys.sp_tables_rowset(@table_name unknown, @table_schema unknown, @table_type unknown) as
-- missing source code
go

create procedure sys.sp_tables_rowset2(@table_schema unknown, @table_type unknown) as
-- missing source code
go

create procedure sys.sp_tables_rowset_rmt(@table_server unknown, @table_catalog unknown, @table_name unknown,
                                          @table_schema unknown, @table_type unknown) as
-- missing source code
go

create procedure sys.sp_tableswc(@table_name unknown, @table_owner unknown, @table_qualifier unknown,
                                 @table_type unknown, @fUsePattern unknown, @fTableCreated unknown) as
-- missing source code
go

create procedure sys.sp_testlinkedserver() as
-- missing source code
go

create procedure sys.sp_trace_create() as
-- missing source code
go

create procedure sys.sp_trace_generateevent() as
-- missing source code
go

create procedure sys.sp_trace_getdata(@traceid unknown, @records unknown) as
-- missing source code
go

create procedure sys.sp_trace_setevent() as
-- missing source code
go

create procedure sys.sp_trace_setfilter() as
-- missing source code
go

create procedure sys.sp_trace_setstatus() as
-- missing source code
go

create procedure sys.sp_unbindefault(@objname unknown, @futureonly unknown) as
-- missing source code
go

create procedure sys.sp_unbindrule(@objname unknown, @futureonly unknown) as
-- missing source code
go

create procedure sys.sp_unprepare() as
-- missing source code
go

create procedure sys.sp_unregister_custom_scripting(@type unknown, @publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_unregistercustomresolver(@article_resolver unknown) as
-- missing source code
go

create procedure sys.sp_unsetapprole(@cookie unknown) as
-- missing source code
go

create procedure sys.sp_unsubscribe(@publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_update_agent_profile(@agent_type unknown, @agent_id unknown, @profile_id unknown) as
-- missing source code
go

create procedure sys.sp_update_user_instance() as
-- missing source code
go

create procedure sys.sp_updateextendedproperty(@name unknown, @value unknown, @level0type unknown, @level0name unknown,
                                               @level1type unknown, @level1name unknown, @level2type unknown,
                                               @level2name unknown) as
-- missing source code
go

create procedure sys.sp_updatestats(@resample unknown) as
-- missing source code
go

create procedure sys.sp_upgrade_log_shipping() as
-- missing source code
go

create procedure sys.sp_user_counter1(@newvalue unknown) as
-- missing source code
go

create procedure sys.sp_user_counter10(@newvalue unknown) as
-- missing source code
go

create procedure sys.sp_user_counter2(@newvalue unknown) as
-- missing source code
go

create procedure sys.sp_user_counter3(@newvalue unknown) as
-- missing source code
go

create procedure sys.sp_user_counter4(@newvalue unknown) as
-- missing source code
go

create procedure sys.sp_user_counter5(@newvalue unknown) as
-- missing source code
go

create procedure sys.sp_user_counter6(@newvalue unknown) as
-- missing source code
go

create procedure sys.sp_user_counter7(@newvalue unknown) as
-- missing source code
go

create procedure sys.sp_user_counter8(@newvalue unknown) as
-- missing source code
go

create procedure sys.sp_user_counter9(@newvalue unknown) as
-- missing source code
go

create procedure sys.sp_usertypes_rowset(@type_name unknown, @type_schema unknown) as
-- missing source code
go

create procedure sys.sp_usertypes_rowset2(@type_schema unknown) as
-- missing source code
go

create procedure sys.sp_usertypes_rowset_rmt(@type_server unknown, @type_catalog unknown, @type_name unknown,
                                             @type_schema unknown, @assembly_id unknown) as
-- missing source code
go

create procedure sys.sp_validate_redirected_publisher(@original_publisher unknown, @publisher_db unknown,
                                                      @redirected_publisher unknown) as
-- missing source code
go

create procedure sys.sp_validate_replica_hosts_as_publishers(@original_publisher unknown, @publisher_db unknown,
                                                             @redirected_publisher unknown) as
-- missing source code
go

create procedure sys.sp_validatecache(@publisher unknown, @publication unknown, @article unknown) as
-- missing source code
go

create procedure sys.sp_validatelogins() as
-- missing source code
go

create procedure sys.sp_validatemergepublication(@publication unknown, @level unknown) as
-- missing source code
go

create procedure sys.sp_validatemergepullsubscription(@publication unknown, @publisher unknown, @publisher_db unknown,
                                                      @level unknown) as
-- missing source code
go

create procedure sys.sp_validatemergesubscription(@publication unknown, @subscriber unknown, @subscriber_db unknown,
                                                  @level unknown) as
-- missing source code
go

create procedure sys.sp_validlang(@name unknown) as
-- missing source code
go

create procedure sys.sp_validname(@name unknown, @raise_error unknown) as
-- missing source code
go

create procedure sys.sp_verifypublisher(@publisher unknown) as
-- missing source code
go

create procedure sys.sp_views_rowset(@view_name unknown, @view_schema unknown) as
-- missing source code
go

create procedure sys.sp_views_rowset2(@view_schema unknown) as
-- missing source code
go

create procedure sys.sp_vupgrade_mergeobjects(@login unknown, @password unknown, @security_mode unknown) as
-- missing source code
go

create procedure sys.sp_vupgrade_mergetables(@remove_repl unknown) as
-- missing source code
go

create procedure sys.sp_vupgrade_replication(@login unknown, @password unknown, @ver_old unknown, @force_remove unknown,
                                             @security_mode unknown) as
-- missing source code
go

create procedure sys.sp_vupgrade_replsecurity_metadata() as
-- missing source code
go

create procedure sys.sp_who(@loginame unknown) as
-- missing source code
go

create procedure sys.sp_who2(@loginame unknown) as
-- missing source code
go

create procedure sys.sp_xml_preparedocument() as
-- missing source code
go

create procedure sys.sp_xml_removedocument() as
-- missing source code
go

create procedure sys.sp_xml_schema_rowset(@collection_name unknown, @schema_name unknown, @target_namespace unknown) as
-- missing source code
go

create procedure sys.sp_xml_schema_rowset2(@schema_name unknown, @target_namespace unknown) as
-- missing source code
go

create procedure sys.sp_xp_cmdshell_proxy_account() as
-- missing source code
go

create procedure sys.xp_availablemedia() as
-- missing source code
go

create procedure sys.xp_cmdshell() as
-- missing source code
go

create procedure sys.xp_create_subdir() as
-- missing source code
go

create procedure sys.xp_delete_file() as
-- missing source code
go

create procedure sys.xp_dirtree() as
-- missing source code
go

create procedure sys.xp_enum_oledb_providers() as
-- missing source code
go

create procedure sys.xp_enumerrorlogs() as
-- missing source code
go

create procedure sys.xp_enumgroups() as
-- missing source code
go

create procedure sys.xp_fileexist() as
-- missing source code
go

create procedure sys.xp_fixeddrives() as
-- missing source code
go

create procedure sys.xp_get_script() as
-- missing source code
go

create procedure sys.xp_get_tape_devices() as
-- missing source code
go

create procedure sys.xp_getnetname() as
-- missing source code
go

create procedure sys.xp_grantlogin(@loginame unknown, @logintype unknown) as
-- missing source code
go

create procedure sys.xp_instance_regaddmultistring() as
-- missing source code
go

create procedure sys.xp_instance_regdeletekey() as
-- missing source code
go

create procedure sys.xp_instance_regdeletevalue() as
-- missing source code
go

create procedure sys.xp_instance_regenumkeys() as
-- missing source code
go

create procedure sys.xp_instance_regenumvalues() as
-- missing source code
go

create procedure sys.xp_instance_regread() as
-- missing source code
go

create procedure sys.xp_instance_regremovemultistring() as
-- missing source code
go

create procedure sys.xp_instance_regwrite() as
-- missing source code
go

create procedure sys.xp_logevent() as
-- missing source code
go

create procedure sys.xp_loginconfig() as
-- missing source code
go

create procedure sys.xp_logininfo(@acctname unknown, @option unknown, @privilege unknown) as
-- missing source code
go

create procedure sys.xp_msver() as
-- missing source code
go

create procedure sys.xp_msx_enlist() as
-- missing source code
go

create procedure sys.xp_passAgentInfo() as
-- missing source code
go

create procedure sys.xp_prop_oledb_provider() as
-- missing source code
go

create procedure sys.xp_qv() as
-- missing source code
go

create procedure sys.xp_readerrorlog() as
-- missing source code
go

create procedure sys.xp_regaddmultistring() as
-- missing source code
go

create procedure sys.xp_regdeletekey() as
-- missing source code
go

create procedure sys.xp_regdeletevalue() as
-- missing source code
go

create procedure sys.xp_regenumkeys() as
-- missing source code
go

create procedure sys.xp_regenumvalues() as
-- missing source code
go

create procedure sys.xp_regread() as
-- missing source code
go

create procedure sys.xp_regremovemultistring() as
-- missing source code
go

create procedure sys.xp_regwrite() as
-- missing source code
go

create procedure sys.xp_repl_convert_encrypt_sysadmin_wrapper(@password unknown) as
-- missing source code
go

create procedure sys.xp_replposteor() as
-- missing source code
go

create procedure sys.xp_revokelogin(@loginame unknown) as
-- missing source code
go

create procedure sys.xp_servicecontrol() as
-- missing source code
go

create procedure sys.xp_sprintf() as
-- missing source code
go

create procedure sys.xp_sqlagent_enum_jobs() as
-- missing source code
go

create procedure sys.xp_sqlagent_is_starting() as
-- missing source code
go

create procedure sys.xp_sqlagent_monitor() as
-- missing source code
go

create procedure sys.xp_sqlagent_notify() as
-- missing source code
go

create procedure sys.xp_sqlagent_param() as
-- missing source code
go

create procedure sys.xp_sqlmaint() as
-- missing source code
go

create procedure sys.xp_sscanf() as
-- missing source code
go

create procedure sys.xp_subdirs() as
-- missing source code
go

create procedure sys.xp_sysmail_activate() as
-- missing source code
go

create procedure sys.xp_sysmail_attachment_load() as
-- missing source code
go

create procedure sys.xp_sysmail_format_query() as
-- missing source code
go

