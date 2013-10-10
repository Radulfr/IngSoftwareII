from osv import osv, fields

class gastosingresos(osv.osv):
	_name = "bugginv5.gastosingresos"
	_description = "Gestion de gastos e ingresos de la mejor empresa del mundo"
	_columns = {
		'mes': fields.char('Mes',size=256,required=True),
		'gasto_salarios': fields.float('Gasto en salarios', required=True, digits=(14,4)),
		'gasto_licencias': fields.float('Gasto en licencias', required=True, digits=(14,4)),
		'gasto_extra': fields.float('Gasto no esperado', required=True, digits=(14,4)),
		'ingreso_cuota': fields.float('Ingreso en cuotas', required=True, digits=(14,4)),
		'ingreso_publicidad': fields.float('Ingreso en publicidad', required=True, digits=(14,4)),
		'responsable':fields.char('Responsable datos', required=True, size=256)
		}


gastosingresos()
