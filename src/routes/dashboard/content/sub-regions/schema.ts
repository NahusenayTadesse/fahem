import { z } from 'zod/v4';
import { sortOrderField } from '$lib/server/crud';

export const addSchema = z.object({
	farmId: z.coerce.number('Required'),
	name: z.string('Required').min(1, 'Required').max(255),
	altitude: z.string().max(255).optional(),
	notes: z.string().optional(),
	sortOrder: sortOrderField
});

export const editSchema = addSchema.extend({
	id: z.coerce.number()
});
