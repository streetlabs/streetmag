/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/


CKEDITOR.addStylesSet( 'streetmag_styles',
[
    // Block Styles
	
    { name : 'Regular' , element : 'p' },
    { name : 'Title' , element : 'div', attributes : { 'class' : 'title' } },
    { name : 'Author' , element : 'div', attributes : { 'class' : 'author' } },
    { name : 'Affiliation' , element : 'div', attributes : { 'class' : 'affiliation' } },
    { name : 'Abstract' , element : 'div', attributes : { 'class' : 'abstract' } },
    { name : 'Heading' , element : 'h3', attributes : { 'class' : 'heading' } },
    { name : 'Subheading' , element : 'h4', attributes : { 'class' : 'subheading' } },
    { name : 'Epigraph' , element : 'p', attributes : { 'class' : 'epigraph' } },

	
    { name : 'Caption' , element : 'div', attributes : { 'class' : 'caption' } },
    { name : 'Stanza' , element : 'div', attributes : { 'class' : 'stanza' } },
    { name : 'Note' , element : 'div', attributes : { 'class' : 'note' } },
    { name : 'Definition' , element : 'div', attributes : { 'class' : 'definition' } },

	
    { name : 'Endnotes' , element : 'div', attributes : { 'class' : 'endnotes' } },
    { name : 'Citation' , element : 'div', attributes : { 'class' : 'citation' } },
    { name : 'Bio' , element : 'div', attributes : { 'class' : 'bio' } },

    // Inline Styles
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

	config.toolbar = 'Article';

	config.toolbar_Article =
	[
	
    	['Styles','Format'],
		['RemoveFormat'],
	    ['Link','Unlink','Anchor'],
		['Find','Replace'],
	    ['PasteText','PasteFromWord'],
	    ['ShowBlocks','Maximize'],
	    '/',
	    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
	    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
	    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	    ['Table','SpecialChar']
	];
	
	config.stylesCombo_stylesSet = 'streetmag_styles';
	
};

