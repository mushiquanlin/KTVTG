/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
    config.language = 'zh-cn';//加载中文语言
    // config.uiColor = '#AADC6E';
    config.filebrowserUploadUrl = '/Ajax/data.aspx?action=fileupload';//图像上传后台地址（阿里云）
    //config.filebrowserUploadUrl = '/Ajax/data.aspx?action=fileupload';//图像上传后台地址
    config.toolbarCanCollapse = true;//启用工具栏收缩功能
};
