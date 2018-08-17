/*! jQuery UI styling wrapper for Select
 * ©2018 SpryMedia Ltd - DataTables-1.10.18.net/license
 */

(function( factory ){
	if ( typeof define === 'function' && define.amd ) {
		// AMD
		define( ['jquery', 'DataTables-1.10.18.net-jqui', 'DataTables-1.10.18.net-select'], function ( $ ) {
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
				$ = require('DataTables-1.10.18.net-jqui')(root, $).$;
			}

			if ( ! $.fn.dataTable.select ) {
				require('DataTables-1.10.18.net-select')(root, $);
			}

			return factory( $, root, root.document );
		};
	}
	else {
		// Browser
		factory( jQuery, window, document );
	}
}(function( $, window, document, undefined ) {

return $.fn.dataTable;

}));