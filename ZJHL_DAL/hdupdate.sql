
UPDATE [dbo].[user]
SET Password = '123456.!',
    Phone = '13168128477',
	MailBox = '1028658349@qq.com',
	QQ = '1028658349',
	WeiXin = '18218429396',
	CreateDate = GETDATE()
	WHERE Name = 'admin'

	SELECT * FROM dbo.[user]