/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
    config.language = 'zh-cn';//������������
    // config.uiColor = '#AADC6E';
    config.filebrowserUploadUrl = '/Ajax/data.aspx?action=fileupload';//ͼ���ϴ���̨��ַ�������ƣ�
    //config.filebrowserUploadUrl = '/Ajax/data.aspx?action=fileupload';//ͼ���ϴ���̨��ַ
    config.toolbarCanCollapse = true;//���ù�������������
};