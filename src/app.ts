import { Hono } from 'hono'
import vehiclesRoutes from './modules/vehicles/presentation/routes/vehicles.routes'

const app = new Hono()
const basePath = '/api';

app.route(basePath, vehiclesRoutes)

export default app