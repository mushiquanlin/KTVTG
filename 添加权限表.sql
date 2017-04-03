
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
   'ϵͳ����Ա',3,'1,2,3','������߹���Ȩ�޵��û�'
),
(
   '��ͨ�û�',18,'1,2,3','����ָ��Ȩ�޵��û�'
),
(
   '��ʱ�û�',50,'1,2,3','��ʱ���Ե��û�'
)
go


SELECT * FROM [dbo].[ZJHL_Permission]