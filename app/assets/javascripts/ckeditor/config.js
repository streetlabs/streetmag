/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/


CKEDITOR.addStylesSet( 'streetmag_styles',
[
    // Block Styles
    { name : 'Regular' , element : 'p' },
    { name : 'Title' , element : 'h1', attributes : { 'class' : 'title' } },
    { name : 'Author' , element : 'h2', attributes : { 'class' : 'author' } },
    { name : 'Abstract' , element : 'p', attributes : { 'class' : 'abstract' } },
    { name : 'Heading' , element : 'h2', attributes : { 'class' : 'heading' } },
    { name : 'Subheading' , element : 'h3', attributes : { 'class' : 'subheading' } },
    { name : 'Epigraph' , element : 'p', attributes : { 'class' : 'epigraph' } },

	
    { name : 'Caption' , element : 'p', attributes : { 'class' : 'caption' } },
    { name : 'Stanza' , element : 'p', attributes : { 'class' : 'stanza' } },
    { name : 'Note' , element : 'p', attributes : { 'class' : 'note' } },
    { name : 'Endnotes' , element : 'p', attributes : { 'class' : 'endnotes' } },
    { name : 'Citation' , element : 'p', attributes : { 'class' : 'citation' } },
    { name : 'Bio' , element : 'p', attributes : { 'class' : 'bio' } },

    // Inline Styles
    { name : 'Affiliation' , element : 'span', attributes : { 'class' : 'affiliation' } },
    { name : 'Definition' , element : 'span', attributes : { 'class' : 'definition' } },
    { name : 'Important', element : 'span', attributes : { 'class' : 'important' } },
    { name : 'Emphasize', element : 'span', attributes : { 'class' : 'emphasize' } },
    { name : 'Highlight: Yellow', element : 'span', styles : { 'background-color' : 'Yellow' } }
]);

CKEDITOR.editorConfig = function( config )
{
  config.PreserveSessionOnFileBrowser = true;
  // Define changes to default configuration here. For example:
  config.language = 'en';
  // config.uiColor = '#AADC6E';

  //config.ContextMenu = ['Generic','Anchor','Flash','Select','Textarea','Checkbox','Radio','TextField','HiddenField','ImageButton','Button','BulletedList','NumberedList','Table','Form'] ; 
  
  config.height = '400px';
  config.width = '100px';
  
  //config.resize_enabled = false;
  //config.resize_maxHeight = 2000;
  //config.resize_maxWidth = 750;
  
  //config.startupFocus = true;
  
  // works only with en, ru, uk languages
  config.extraPlugins = "embed,attachment";
  
  config.toolbar = 'Easy';
  
  config.toolbar_Easy =
    [
        ['Source','-','Preview','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord',],
        ['Maximize','-','About'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['Styles','Format'],
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript', 'TextColor'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
        ['Image','Embed','Flash','Attachment','Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
    ];

	config.toolbar = 'Admin';

//	config.toolbar_Admin =
	config.toolbar_Article =
	
	[
    	['Styles','Format','-','Link','Unlink','Anchor','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','Find','Replace','-','PasteText','PasteFromWord'],
		['RemoveFormat','-','Bold','Italic','Strike','-','Subscript','Superscript','SpecialChar'],
	    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
	    ['Table','-','ShowBlocks','-','Source','-','Maximize'],
	];
	
	config.toolbar = 'Article';

//	config.toolbar_Article =
	config.toolbar_Admin =
	[
    	['Styles','Format','-','Link','Unlink','Anchor','-','Find','Replace','-','PasteText','PasteFromWord','-','ShowBlocks'],
		['RemoveFormat','-','Bold','Italic','Strike','-','Subscript','Superscript','SpecialChar'],
	    ['NumberedList','BulletedList','-','Blockquote'],
	    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	    ['Table','-','Maximize'],
	];
	
	config.stylesCombo_stylesSet = 'streetmag_styles';
	
};

