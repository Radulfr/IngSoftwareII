from osv import osv, fields


class cliente(osv.osv):
	_name = "clientesbugginv2.cliente"
	_rec_name = 'email'
	_description = "Clientes"
	_columns = {
		'nombre':fields.char('Nombre',size=64),
        	'apellidos':fields.char('Apellidos',size=64),
        	'email':fields.char('Correo electronico',size=64),
        	'telefono':fields.char('Telefono', size=20),
        	'domicilio':fields.char('Domicilio', size=64),
        	'localidad':fields.char('Localidad', size=64),
        	'provincia':fields.many2one('res.country.state', 'Provincia', ondelete='set null'),
        	'pais': fields.many2one('res.country', 'Pais', ondelete='set null', select=True)	
		}


cliente()


class ventas(osv.osv):
	_name = "clientesbugginv2.ventas"
	_description = "Gestion de ventas"
	_columns = {
		'fecha':fields.date('Fecha de recepcion',size=64),	
		'cliente':fields.many2one('clientesbugginv2.cliente', 'cliente', ondelete='cascade', select=True),
		'precio': fields.float('Precio', required=True, digits=(14,4))
		}


ventas()
