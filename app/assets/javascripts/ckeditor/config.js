/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/


CKEDITOR.config.toolbar = [
    
    { name: 'basicstyles', items: [ 'Bold', 'Italic', "Underline", "Strike", "Subscript", "Superscript", "RemoveFormat" ] },
    { name: 'links', items:[ 'NumberedList', 'BulletedList', 'Outdent', 'Indent', 'Blockquote']},
    { name: 'aligns', items: [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
    { name: 'insert', items: [ 'Link', 'Unlink', 'Anchor', 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar'] },
    '/',
    { name: 'styles', items: [ 'InsertPre' ,'Styles', 'Format' ]},
    { name: 'fonts', items:[ 'Font', 'FontSize', 'TextColor', 'BGColor','UIColor', 'Maximize', 'ShowBlocks']},
    { name: 'document', items: [ 'Source' ] }
];