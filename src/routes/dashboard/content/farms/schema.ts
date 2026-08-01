import { z } from 'zod/v4';
import { sortOrderField } from '$lib/server/crud';

export const addSchema = z.object({
	name: z.string('Required').min(1, 'Required').max(255),
	location: z.string().max(255).optional(),
	image: z.file().max(10_000_000).optional(),
	description: z.string().optional(),
	altitude: z.string().max(255).optional(),
	grade: z.string().max(255).optional(),
	stats: z.string().optional(),
	sortOrder: sortOrderField
});

export const editSchema = addSchema.extend({
	id: z.coerce.number()
});
