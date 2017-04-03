
CREATE TABLE [dbo].[ZJHL_Permission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Count] [int] NULL,
	[UserList] [nvarchar](max) NULL,
	[Remark] [nvarchar](150) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


INSERT into [dbo].[ZJHL_Permission]
(Name,Count,UserList,Remark
)
VALUES
(
   '系统管理员',3,'1,2,3','具有最高管理权限的用户'
),
(
   '普通用户',18,'1,2,3','具有指定权限的用户'
),
(
   '临时用户',50,'1,2,3','临时测试的用户'
)
go


SELECT * FROM [dbo].[ZJHL_Permission]