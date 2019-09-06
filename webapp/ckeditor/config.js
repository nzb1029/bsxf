/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	//  config.language = 'zh-cn';
	// config.uiColor = '#AADC6E';
 config.filebrowserBrowseUrl = 		ctx+'/ckfinder/ckfinder.html',
 config.filebrowserImageBrowseUrl = ctx+'/ckfinder/ckfinder.html?type=Images',
 config.filebrowserFlashBrowseUrl = ctx+'/ckfinder/ckfinder.html?type=Flash',
 config.filebrowserUploadUrl = 		ctx+'/ckfinder/core/connector/java/connector.java?command=FileUpload&type=Files',
 config.filebrowserImageUploadUrl = ctx+'/ckfinder/core/connector/java/connector.java?command=FileUpload&type=Images',
 config.filebrowserFlashUploadUrl = ctx+'/ckfinder/core/connector/java/connector.java?command=FileUpload&type=Flash',
 config.filebrowserWindowWidth = 	'1000',
 config.filebrowserWindowHeight = 	'700',
 config.font_names='宋体/宋体;黑体/黑体;仿宋/仿宋_GB2312;楷体/楷体_GB2312;隶书/隶书;幼圆/幼圆;微软雅黑/微软雅黑;'+ config.font_names;
 
};
