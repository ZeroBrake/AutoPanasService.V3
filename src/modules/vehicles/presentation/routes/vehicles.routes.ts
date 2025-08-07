import { Hono } from 'hono'
import { getVehicle, createVehicle } from '../controllers/vehicles.controller.ts'

const vehiclesRoutes = new Hono()

vehiclesRoutes.get('/vehicles/:id', getVehicle)
vehiclesRoutes.post('/vehicles', createVehicle)

export default vehiclesRoutes
