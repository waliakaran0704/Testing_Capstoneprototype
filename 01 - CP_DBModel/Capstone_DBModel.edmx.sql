
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/12/2018 16:34:37
-- Generated from EDMX file: C:\Users\Fenny\source\repos\Capstone_Prototype\01 - CP_DBModel\Capstone_DBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CapstoneDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Admins'
CREATE TABLE [dbo].[Admins] (
    [PKAmin_ID] int IDENTITY(1,1) NOT NULL,
    [LoginLogin_ID] int  NOT NULL
);
GO

-- Creating table 'Logins'
CREATE TABLE [dbo].[Logins] (
    [Login_ID] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CastingDirectors'
CREATE TABLE [dbo].[CastingDirectors] (
    [PKCD_ID] int IDENTITY(1,1) NOT NULL,
    [AdminPKAmin_ID] int  NOT NULL,
    [LoginLogin_ID] int  NOT NULL
);
GO

-- Creating table 'Talents'
CREATE TABLE [dbo].[Talents] (
    [PKTalent_ID] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [HomePhoneNum] nvarchar(max)  NOT NULL,
    [CellPhoneNum] nvarchar(max)  NOT NULL,
    [BirthDate] nvarchar(max)  NOT NULL,
    [Gender] nvarchar(max)  NOT NULL,
    [Weight] nvarchar(max)  NOT NULL,
    [Height] nvarchar(max)  NOT NULL,
    [EyeColor] nvarchar(max)  NOT NULL,
    [HairColor] nvarchar(max)  NOT NULL,
    [UnionStatus] nvarchar(max)  NOT NULL,
    [SIN] nvarchar(max)  NOT NULL,
    [AdminPKAmin_ID] int  NOT NULL,
    [EthinicOriginPK_EO_ID] int  NOT NULL,
    [LoginLogin_ID] int  NOT NULL,
    [NumOfRequest] nvarchar(max)  NOT NULL,
    [NumOfHired] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [PKAddress_ID] int IDENTITY(1,1) NOT NULL,
    [MailingAddress] nvarchar(max)  NOT NULL,
    [HomeAddress] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EthinicOrigins'
CREATE TABLE [dbo].[EthinicOrigins] (
    [PK_EO_ID] int IDENTITY(1,1) NOT NULL,
    [EthinicName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Cars'
CREATE TABLE [dbo].[Cars] (
    [PKCar_ID] int IDENTITY(1,1) NOT NULL,
    [Make] nvarchar(max)  NOT NULL,
    [Model] nvarchar(max)  NOT NULL,
    [Year] nvarchar(max)  NOT NULL,
    [Color] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'FamilyMembers'
CREATE TABLE [dbo].[FamilyMembers] (
    [PK_FM_ID] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [HomePhoneNum] nvarchar(max)  NOT NULL,
    [CellPhoneNum] nvarchar(max)  NOT NULL,
    [BirthDate] nvarchar(max)  NOT NULL,
    [Gender] nvarchar(max)  NOT NULL,
    [Weight] nvarchar(max)  NOT NULL,
    [Height] nvarchar(max)  NOT NULL,
    [EyeColor] nvarchar(max)  NOT NULL,
    [HairColor] nvarchar(max)  NOT NULL,
    [UnionStatus] nvarchar(max)  NOT NULL,
    [SIN] nvarchar(max)  NOT NULL,
    [EthinicOriginPK_EO_ID] int  NOT NULL
);
GO

-- Creating table 'Skills'
CREATE TABLE [dbo].[Skills] (
    [PK_SKILL_ID] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'TalentAddress'
CREATE TABLE [dbo].[TalentAddress] (
    [Talents_PKTalent_ID] int  NOT NULL,
    [Addresses_PKAddress_ID] int  NOT NULL
);
GO

-- Creating table 'FamilyMemberAddress'
CREATE TABLE [dbo].[FamilyMemberAddress] (
    [FamilyMembers_PK_FM_ID] int  NOT NULL,
    [Addresses_PKAddress_ID] int  NOT NULL
);
GO

-- Creating table 'TalentCar'
CREATE TABLE [dbo].[TalentCar] (
    [Talents_PKTalent_ID] int  NOT NULL,
    [Cars_PKCar_ID] int  NOT NULL
);
GO

-- Creating table 'TalentSkill'
CREATE TABLE [dbo].[TalentSkill] (
    [Talents_PKTalent_ID] int  NOT NULL,
    [Skills_PK_SKILL_ID] int  NOT NULL
);
GO

-- Creating table 'FamilyMemberSkill'
CREATE TABLE [dbo].[FamilyMemberSkill] (
    [FamilyMembers_PK_FM_ID] int  NOT NULL,
    [Skills_PK_SKILL_ID] int  NOT NULL
);
GO

-- Creating table 'FamilyMemberCar'
CREATE TABLE [dbo].[FamilyMemberCar] (
    [FamilyMembers_PK_FM_ID] int  NOT NULL,
    [Cars_PKCar_ID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [PKAmin_ID] in table 'Admins'
ALTER TABLE [dbo].[Admins]
ADD CONSTRAINT [PK_Admins]
    PRIMARY KEY CLUSTERED ([PKAmin_ID] ASC);
GO

-- Creating primary key on [Login_ID] in table 'Logins'
ALTER TABLE [dbo].[Logins]
ADD CONSTRAINT [PK_Logins]
    PRIMARY KEY CLUSTERED ([Login_ID] ASC);
GO

-- Creating primary key on [PKCD_ID] in table 'CastingDirectors'
ALTER TABLE [dbo].[CastingDirectors]
ADD CONSTRAINT [PK_CastingDirectors]
    PRIMARY KEY CLUSTERED ([PKCD_ID] ASC);
GO

-- Creating primary key on [PKTalent_ID] in table 'Talents'
ALTER TABLE [dbo].[Talents]
ADD CONSTRAINT [PK_Talents]
    PRIMARY KEY CLUSTERED ([PKTalent_ID] ASC);
GO

-- Creating primary key on [PKAddress_ID] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([PKAddress_ID] ASC);
GO

-- Creating primary key on [PK_EO_ID] in table 'EthinicOrigins'
ALTER TABLE [dbo].[EthinicOrigins]
ADD CONSTRAINT [PK_EthinicOrigins]
    PRIMARY KEY CLUSTERED ([PK_EO_ID] ASC);
GO

-- Creating primary key on [PKCar_ID] in table 'Cars'
ALTER TABLE [dbo].[Cars]
ADD CONSTRAINT [PK_Cars]
    PRIMARY KEY CLUSTERED ([PKCar_ID] ASC);
GO

-- Creating primary key on [PK_FM_ID] in table 'FamilyMembers'
ALTER TABLE [dbo].[FamilyMembers]
ADD CONSTRAINT [PK_FamilyMembers]
    PRIMARY KEY CLUSTERED ([PK_FM_ID] ASC);
GO

-- Creating primary key on [PK_SKILL_ID] in table 'Skills'
ALTER TABLE [dbo].[Skills]
ADD CONSTRAINT [PK_Skills]
    PRIMARY KEY CLUSTERED ([PK_SKILL_ID] ASC);
GO

-- Creating primary key on [Talents_PKTalent_ID], [Addresses_PKAddress_ID] in table 'TalentAddress'
ALTER TABLE [dbo].[TalentAddress]
ADD CONSTRAINT [PK_TalentAddress]
    PRIMARY KEY CLUSTERED ([Talents_PKTalent_ID], [Addresses_PKAddress_ID] ASC);
GO

-- Creating primary key on [FamilyMembers_PK_FM_ID], [Addresses_PKAddress_ID] in table 'FamilyMemberAddress'
ALTER TABLE [dbo].[FamilyMemberAddress]
ADD CONSTRAINT [PK_FamilyMemberAddress]
    PRIMARY KEY CLUSTERED ([FamilyMembers_PK_FM_ID], [Addresses_PKAddress_ID] ASC);
GO

-- Creating primary key on [Talents_PKTalent_ID], [Cars_PKCar_ID] in table 'TalentCar'
ALTER TABLE [dbo].[TalentCar]
ADD CONSTRAINT [PK_TalentCar]
    PRIMARY KEY CLUSTERED ([Talents_PKTalent_ID], [Cars_PKCar_ID] ASC);
GO

-- Creating primary key on [Talents_PKTalent_ID], [Skills_PK_SKILL_ID] in table 'TalentSkill'
ALTER TABLE [dbo].[TalentSkill]
ADD CONSTRAINT [PK_TalentSkill]
    PRIMARY KEY CLUSTERED ([Talents_PKTalent_ID], [Skills_PK_SKILL_ID] ASC);
GO

-- Creating primary key on [FamilyMembers_PK_FM_ID], [Skills_PK_SKILL_ID] in table 'FamilyMemberSkill'
ALTER TABLE [dbo].[FamilyMemberSkill]
ADD CONSTRAINT [PK_FamilyMemberSkill]
    PRIMARY KEY CLUSTERED ([FamilyMembers_PK_FM_ID], [Skills_PK_SKILL_ID] ASC);
GO

-- Creating primary key on [FamilyMembers_PK_FM_ID], [Cars_PKCar_ID] in table 'FamilyMemberCar'
ALTER TABLE [dbo].[FamilyMemberCar]
ADD CONSTRAINT [PK_FamilyMemberCar]
    PRIMARY KEY CLUSTERED ([FamilyMembers_PK_FM_ID], [Cars_PKCar_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AdminPKAmin_ID] in table 'CastingDirectors'
ALTER TABLE [dbo].[CastingDirectors]
ADD CONSTRAINT [FK_AdminCastingDirector]
    FOREIGN KEY ([AdminPKAmin_ID])
    REFERENCES [dbo].[Admins]
        ([PKAmin_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdminCastingDirector'
CREATE INDEX [IX_FK_AdminCastingDirector]
ON [dbo].[CastingDirectors]
    ([AdminPKAmin_ID]);
GO

-- Creating foreign key on [AdminPKAmin_ID] in table 'Talents'
ALTER TABLE [dbo].[Talents]
ADD CONSTRAINT [FK_AdminTalent]
    FOREIGN KEY ([AdminPKAmin_ID])
    REFERENCES [dbo].[Admins]
        ([PKAmin_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdminTalent'
CREATE INDEX [IX_FK_AdminTalent]
ON [dbo].[Talents]
    ([AdminPKAmin_ID]);
GO

-- Creating foreign key on [Talents_PKTalent_ID] in table 'TalentAddress'
ALTER TABLE [dbo].[TalentAddress]
ADD CONSTRAINT [FK_TalentAddress_Talent]
    FOREIGN KEY ([Talents_PKTalent_ID])
    REFERENCES [dbo].[Talents]
        ([PKTalent_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Addresses_PKAddress_ID] in table 'TalentAddress'
ALTER TABLE [dbo].[TalentAddress]
ADD CONSTRAINT [FK_TalentAddress_Address]
    FOREIGN KEY ([Addresses_PKAddress_ID])
    REFERENCES [dbo].[Addresses]
        ([PKAddress_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TalentAddress_Address'
CREATE INDEX [IX_FK_TalentAddress_Address]
ON [dbo].[TalentAddress]
    ([Addresses_PKAddress_ID]);
GO

-- Creating foreign key on [FamilyMembers_PK_FM_ID] in table 'FamilyMemberAddress'
ALTER TABLE [dbo].[FamilyMemberAddress]
ADD CONSTRAINT [FK_FamilyMemberAddress_FamilyMember]
    FOREIGN KEY ([FamilyMembers_PK_FM_ID])
    REFERENCES [dbo].[FamilyMembers]
        ([PK_FM_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Addresses_PKAddress_ID] in table 'FamilyMemberAddress'
ALTER TABLE [dbo].[FamilyMemberAddress]
ADD CONSTRAINT [FK_FamilyMemberAddress_Address]
    FOREIGN KEY ([Addresses_PKAddress_ID])
    REFERENCES [dbo].[Addresses]
        ([PKAddress_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FamilyMemberAddress_Address'
CREATE INDEX [IX_FK_FamilyMemberAddress_Address]
ON [dbo].[FamilyMemberAddress]
    ([Addresses_PKAddress_ID]);
GO

-- Creating foreign key on [EthinicOriginPK_EO_ID] in table 'Talents'
ALTER TABLE [dbo].[Talents]
ADD CONSTRAINT [FK_EthinicOriginTalent]
    FOREIGN KEY ([EthinicOriginPK_EO_ID])
    REFERENCES [dbo].[EthinicOrigins]
        ([PK_EO_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EthinicOriginTalent'
CREATE INDEX [IX_FK_EthinicOriginTalent]
ON [dbo].[Talents]
    ([EthinicOriginPK_EO_ID]);
GO

-- Creating foreign key on [EthinicOriginPK_EO_ID] in table 'FamilyMembers'
ALTER TABLE [dbo].[FamilyMembers]
ADD CONSTRAINT [FK_EthinicOriginFamilyMember]
    FOREIGN KEY ([EthinicOriginPK_EO_ID])
    REFERENCES [dbo].[EthinicOrigins]
        ([PK_EO_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EthinicOriginFamilyMember'
CREATE INDEX [IX_FK_EthinicOriginFamilyMember]
ON [dbo].[FamilyMembers]
    ([EthinicOriginPK_EO_ID]);
GO

-- Creating foreign key on [LoginLogin_ID] in table 'CastingDirectors'
ALTER TABLE [dbo].[CastingDirectors]
ADD CONSTRAINT [FK_LoginCastingDirector]
    FOREIGN KEY ([LoginLogin_ID])
    REFERENCES [dbo].[Logins]
        ([Login_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LoginCastingDirector'
CREATE INDEX [IX_FK_LoginCastingDirector]
ON [dbo].[CastingDirectors]
    ([LoginLogin_ID]);
GO

-- Creating foreign key on [LoginLogin_ID] in table 'Talents'
ALTER TABLE [dbo].[Talents]
ADD CONSTRAINT [FK_LoginTalent]
    FOREIGN KEY ([LoginLogin_ID])
    REFERENCES [dbo].[Logins]
        ([Login_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LoginTalent'
CREATE INDEX [IX_FK_LoginTalent]
ON [dbo].[Talents]
    ([LoginLogin_ID]);
GO

-- Creating foreign key on [LoginLogin_ID] in table 'Admins'
ALTER TABLE [dbo].[Admins]
ADD CONSTRAINT [FK_LoginAdmin]
    FOREIGN KEY ([LoginLogin_ID])
    REFERENCES [dbo].[Logins]
        ([Login_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LoginAdmin'
CREATE INDEX [IX_FK_LoginAdmin]
ON [dbo].[Admins]
    ([LoginLogin_ID]);
GO

-- Creating foreign key on [Talents_PKTalent_ID] in table 'TalentCar'
ALTER TABLE [dbo].[TalentCar]
ADD CONSTRAINT [FK_TalentCar_Talent]
    FOREIGN KEY ([Talents_PKTalent_ID])
    REFERENCES [dbo].[Talents]
        ([PKTalent_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Cars_PKCar_ID] in table 'TalentCar'
ALTER TABLE [dbo].[TalentCar]
ADD CONSTRAINT [FK_TalentCar_Car]
    FOREIGN KEY ([Cars_PKCar_ID])
    REFERENCES [dbo].[Cars]
        ([PKCar_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TalentCar_Car'
CREATE INDEX [IX_FK_TalentCar_Car]
ON [dbo].[TalentCar]
    ([Cars_PKCar_ID]);
GO

-- Creating foreign key on [Talents_PKTalent_ID] in table 'TalentSkill'
ALTER TABLE [dbo].[TalentSkill]
ADD CONSTRAINT [FK_TalentSkill_Talent]
    FOREIGN KEY ([Talents_PKTalent_ID])
    REFERENCES [dbo].[Talents]
        ([PKTalent_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Skills_PK_SKILL_ID] in table 'TalentSkill'
ALTER TABLE [dbo].[TalentSkill]
ADD CONSTRAINT [FK_TalentSkill_Skill]
    FOREIGN KEY ([Skills_PK_SKILL_ID])
    REFERENCES [dbo].[Skills]
        ([PK_SKILL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TalentSkill_Skill'
CREATE INDEX [IX_FK_TalentSkill_Skill]
ON [dbo].[TalentSkill]
    ([Skills_PK_SKILL_ID]);
GO

-- Creating foreign key on [FamilyMembers_PK_FM_ID] in table 'FamilyMemberSkill'
ALTER TABLE [dbo].[FamilyMemberSkill]
ADD CONSTRAINT [FK_FamilyMemberSkill_FamilyMember]
    FOREIGN KEY ([FamilyMembers_PK_FM_ID])
    REFERENCES [dbo].[FamilyMembers]
        ([PK_FM_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Skills_PK_SKILL_ID] in table 'FamilyMemberSkill'
ALTER TABLE [dbo].[FamilyMemberSkill]
ADD CONSTRAINT [FK_FamilyMemberSkill_Skill]
    FOREIGN KEY ([Skills_PK_SKILL_ID])
    REFERENCES [dbo].[Skills]
        ([PK_SKILL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FamilyMemberSkill_Skill'
CREATE INDEX [IX_FK_FamilyMemberSkill_Skill]
ON [dbo].[FamilyMemberSkill]
    ([Skills_PK_SKILL_ID]);
GO

-- Creating foreign key on [FamilyMembers_PK_FM_ID] in table 'FamilyMemberCar'
ALTER TABLE [dbo].[FamilyMemberCar]
ADD CONSTRAINT [FK_FamilyMemberCar_FamilyMember]
    FOREIGN KEY ([FamilyMembers_PK_FM_ID])
    REFERENCES [dbo].[FamilyMembers]
        ([PK_FM_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Cars_PKCar_ID] in table 'FamilyMemberCar'
ALTER TABLE [dbo].[FamilyMemberCar]
ADD CONSTRAINT [FK_FamilyMemberCar_Car]
    FOREIGN KEY ([Cars_PKCar_ID])
    REFERENCES [dbo].[Cars]
        ([PKCar_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FamilyMemberCar_Car'
CREATE INDEX [IX_FK_FamilyMemberCar_Car]
ON [dbo].[FamilyMemberCar]
    ([Cars_PKCar_ID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------