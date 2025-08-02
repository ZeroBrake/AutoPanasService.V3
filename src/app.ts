import { Hono } from 'hono'
import tasksRoutes from './routes/tasks'

const app = new Hono()

app.route('/tasks', tasksRoutes)

export default app