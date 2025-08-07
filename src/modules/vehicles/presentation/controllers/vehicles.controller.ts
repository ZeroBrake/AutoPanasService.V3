import type {Context} from 'hono'

export const getVehicle = (c: Context) => {
    const userId = c.req.param('id')
    return c.json({ message: `Vehicle ID is ${userId}` })
}

export const createVehicle = async (c: Context) => {
    const body = await c.req.json()
    // Aquí podrías hacer validaciones o guardar en la DB
    return c.json({ message: 'Vehicle created', data: body }, 201)
}
