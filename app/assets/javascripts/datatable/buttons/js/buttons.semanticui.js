/*! Bootstrap integration for DataTables' Buttons
 * ©2016 SpryMedia Ltd - DataTables-1.10.18.net/license
 */

(function( factory ){
	if ( typeof define === 'function' && define.amd ) {
		// AMD
		define( ['jquery', 'DataTables-1.10.18.net-se', 'DataTables-1.10.18.net-buttons'], function ( $ ) {
			return factory( $, window, document );
		} );
	}
	else if ( typeof exports === 'object' ) {
		// CommonJS
		module.exports = function (root, $) {
			if ( ! root ) {
				root = window;
			}

			if ( ! $ || ! $.fn.dataTable ) {
				$ = require('DataTables-1.10.18.net-se')(root, $).$;
			}

			if ( ! $.fn.dataTable.Buttons ) {
				require('DataTables-1.10.18.net-buttons')(root, $);
			}

			return factory( $, root, root.document );
		};
	}
	else {
		// Browser
		factory( jQuery, window, document );
	}
}(function( $, window, document, undefined ) {
'use strict';
var DataTable = $.fn.dataTable;


$.extend( true, DataTable.Buttons.defaults, {
	dom: {
		container: {
			className: 'dt-buttons ui basic buttons'
		},
		button: {
			tag: 'button',
			className: 'ui button'
		},
		collection: {
			tag: 'div',
			className: 'dt-button-collection ui basic vertical buttons'
		}
	}
} );


return DataTable.Buttons;
}));
